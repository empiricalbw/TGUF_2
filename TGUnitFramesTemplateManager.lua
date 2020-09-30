--[[
    A "template" is a collection of elements that can be used to
    construct an actual unitframe.  The template manager takes care
    of registering templates and allowing construction/destruction
    of these templates into real unitframes.
]]
local TGUF_TEMPLATES = {}
local TGUF_COLLECTIONS = {}
local TGUF_COLLECTIONS_INDEX = {}
local TGUF_TEMPLATES_REVERSE_INDEX = {}
TGUF_USER_COLLECTIONS = {}
TGUF_TEMPLATES_USER_TEMPLATES = {}  -- Legacy

local   USER_COLLECTION = "Old User Templates";
local   BUILT_IN_COLLECTION = "Built-in";

local TGUF_MAX_VECTOR_WIDTH = 4;

local TGUF_MAX_ATTRIBUTES = 11;

function TGUnitFrameTemplateManager_OnAddonLoaded()
    -- Insert the legacy saved user templates
    for k,v in pairs(TGUF_TEMPLATES_USER_TEMPLATES) do
        TGUnitFrames_RegisterUnitFrameTemplate(v,k,false,USER_COLLECTION);
    end
    
    -- And now do it with the collections
    for k,v in pairs(TGUF_USER_COLLECTIONS) do
        -- We are iterating over the collections
        --TGUFDebug("Adding collection "..k)
        TGUF_COLLECTIONS[k] = {};
        table.insert(TGUF_COLLECTIONS_INDEX,{name=k});
        for k1,v1 in pairs(v) do
            -- We are iterating over templates
            --TGUFDebug("Adding template "..k1)
            v1.collection = k;
            TGUF_COLLECTIONS[k][k1] = v1;
            table.insert(TGUnitFrames_GetUnitFrameList(k),k1);
        end
        TGUnitFramesTemplateManager_SelectDefaultTemplate();
    end
end

function TGUnitFrames_RegisterUnitFrameTemplate(template,templateName,builtIn,collection)
    --TGUnitFrames_SetUnitFrameTemplateParent(template,nil);
    if (builtIn) then
        collection = BUILT_IN_COLLECTION;
    end
    if (TGUF_COLLECTIONS[collection] == nil) then
        TGUF_COLLECTIONS[collection] = {};
        table.insert(TGUF_COLLECTIONS_INDEX,{name=collection});
    end
    if (TGUF_USER_COLLECTIONS[collection] == nil) then
        TGUF_USER_COLLECTIONS[collection] = {};
    end
    if (TGUF_COLLECTIONS[collection][templateName] == nil) then
        TGUF_COLLECTIONS[collection][templateName] = template;
        TGUF_USER_COLLECTIONS[collection][templateName] = template;
        table.insert(TGUnitFrames_GetUnitFrameList(collection),templateName);
    end
    TGUnitFramesTemplateManager_SelectDefaultTemplate();
end

function TGUnitFrames_GetCollectionIndexIndex(collection)
    for k,v in ipairs(TGUF_COLLECTIONS_INDEX) do
        if (v.name == collection) then
            return k;
        end
    end
    return nil;
end

function TGUnitFrames_GetCollectionList()
    local   list = {};
    for k,v in ipairs(TGUF_COLLECTIONS_INDEX) do
        table.insert(list,v.name);
    end
    return list;
end

function TGUnitFrames_GetUnitFrameList(collection)
    for k,v in ipairs(TGUF_COLLECTIONS_INDEX) do
        if (v.name == collection) then
            return v;
        end
    end
    return nil;
end

function TGUnitFrames_CloneUnitFrameTemplate(collection,templateName,newCollection,newTemplateName)
    local   sourceTemplate = TGUF_COLLECTIONS[collection][templateName];
    if (sourceTemplate ~= nil) then
        local   clonedTemplate = {};
        TGUF_tcopy(clonedTemplate,sourceTemplate);
        TGUnitFrames_RegisterUnitFrameTemplate(clonedTemplate,newTemplateName,false,newCollection);
    end
end

function TGUnitFrames_SetUnitFrameTemplateParent(template,parent)
    template.parent = parent;
    if (template.children) then
        for k,v in pairs(template.children) do
            TGUnitFrames_SetUnitFrameTemplateParent(v,template);
        end
    end
end

-- TGUF_tcopy: recursively copy contents of one table to another
function TGUF_tcopy(to, from)
    for k,v in pairs(from) do
        if (k ~= "anchorFrame") then
            if(type(v)=="table") then
                to[k] = {}
                TGUF_tcopy(to[k], v);
            else
                to[k] = v;
            end
        end
    end
end

function TGUnitFrames_AllocateUnitFrameTemplate(unitName,collection,templateName,parentFrame,anchors,anchorFrames)
    local   returnFrame = nil;
    --TGUFDebug("AllocateUnitFrameTemplate: collection "..collection);
    --TGUFDebug("AllocateUnitFrameTemplate: templateName "..templateName);
    if (TGUF_COLLECTIONS[collection][templateName] ~= nil) then
        returnFrame = TGUnitFrames_AllocateFromTemplate(unitName,TGUF_COLLECTIONS[collection][templateName],parentFrame,anchors,anchorFrames);
    end
    if (returnFrame == nil) then
        TGUFMsg("No template named "..templateName.." in collection "..collection..".");
    end
    returnFrame:SetFrameStrata("BACKGROUND");
    return returnFrame;
end

function TGUnitFrames_AllocateFromTemplate(unitName,template,parentFrame,anchors,anchorFrames)
    local   unit = TGUnitComponent_NewUnit(unitName);
    local   listener = TGUnitComponent_NewListener();
    template.anchors = anchors;
    local   frame = TGUnitFrames_AllocateFromTemplateRecurse(unit,template,parentFrame,anchorFrames,listener);
    TGUnitComponent_RegisterUnitListener(listener,unit);
    return frame;
end

function TGUnitFrames_AllocateFromTemplateRecurse(unit,v,parentFrame,anchorFrames,listener)
    -- Create this frame
    local   frame = TGUnitFrames_AllocateObject(v.type,parentFrame,v,anchorFrames,listener);
    frame.tgufParent = parentFrame;
    frame.tgufChildren = {};
    
    if (frame ~= nil) then
        -- Create the child frames
        if (v.children ~= nil) then
            local   childTable = {};
            for k0,v0 in ipairs(v.children) do
                if (v0.type ~= nil) then
                    -- Set up the anchors
                    local   anchorFrames = {};
                    for k1,v1 in ipairs(v0.anchors) do
                        local   anchorIndex = v1.anchor;
                        if (v1.anchor < 0) then
                            anchorIndex = k0+v1.anchor;
                        end
                        if (anchorIndex > 0) then
                            --v1.anchorFrame = childTable[anchorIndex];
                            anchorFrames[k1] = childTable[anchorIndex];
                        else
                            --v1.anchorFrame = frame;
                            anchorFrames[k1] = frame;
                        end
                    end
        
                    -- Make the frame
                    childTable[k0] = TGUnitFrames_AllocateFromTemplateRecurse(unit,v0,frame,anchorFrames,listener);
                end
            end
            frame.tgufChildren = childTable;
        end
    else
        TGUFMsg("Unable to create frame of type \""..v.type.."\", aborting.");
    end
    
    return frame;
end

-- Register the TGUnitFrameTemplateManager component
local TGUnitFrameTemplateManagerComponent = {
    ["onAddonLoaded"] = TGUnitFrameTemplateManager_OnAddonLoaded,
    };
TGUnitFrames_RegisterComponent(TGUnitFrameTemplateManagerComponent);

--[[ ************************************ TEMPLATE EDITOR STARTS HERE **************************************]]
local   selectedCollection = nil;
local   selectedCollectionName = nil;
local   selectedTemplate = nil;
local   selectedTemplateName = nil;
local   templateIndex = nil;
local   selectedIndex = nil;
local   rootFrame = nil;
local   scrollState = "normal";
local   selectedFrame = nil;
local   savedR,savedG,savedB,savedA;

function TGUnitFramesTemplateManagerCollectionDropDown_OnShow(frame)
    UIDropDownMenu_Initialize(frame,TGUnitFramesTemplateManagerCollectionDropDown_Initialize);
    UIDropDownMenu_SetWidth(frame,148);
    if (selectedCollectionName) then
        UIDropDownMenu_SetSelectedName(frame,selectedCollectionName);
    else
        UIDropDownMenu_SetSelectedID(frame,1);
    end
end

function TGUnitFramesTemplateManagerCollectionDropDown_Initialize()
    for k,v in ipairs(TGUF_COLLECTIONS_INDEX) do
        local info = {text=v.name,func=TGUnitFramesTemplateManagerCollectionDropDown_OnClick,arg1=k,checked=false};
        UIDropDownMenu_AddButton(info);
    end
end

function TGUnitFramesTemplateManagerCollectionDropDown_OnClick(button,arg1)
    --[[
    local   oldSelectedTemplateName = selectedTemplateName;
    local   oldSelectedCollectionName = selectedCollectionName;
    selectedTemplateName = TGUF_COLLECTIONS_INDEX[arg1][1];
    selectedCollectionName = TGUF_COLLECTIONS_INDEX[arg1].name;
    TGUnitFramesTemplateManagerDropDown_OnShow(TGUnitFramesTemplateManagerFrameDropDown);
    selectedTemplateName = oldSelectedTemplateName;
    selectedCollectionName = oldSelectedCollectionName;
    ]]
    TGUFDebug("CollectionDropDown_OnClick: "..arg1)
    TGUnitFramesTemplateManager_SelectTemplate(TGUF_COLLECTIONS_INDEX[arg1].name,TGUF_COLLECTIONS_INDEX[arg1][1],true);
end

function TGUnitFramesTemplateManagerDropDown_OnLoad(frame)
    UIDropDownMenu_Initialize(frame,TGUnitFramesTemplateManagerDropDown_Initialize);
    UIDropDownMenu_SetWidth(frame,148);
    if (selectedTemplateName) then
        UIDropDownMenu_SetSelectedName(frame,selectedTemplateName);
    else
        UIDropDownMenu_SetSelectedID(frame,1);
    end
end

function TGUnitFramesTemplateManagerDropDown_OnShow(frame)
    UIDropDownMenu_Initialize(frame,TGUnitFramesTemplateManagerDropDown_Initialize);
    UIDropDownMenu_SetWidth(frame,148);
    if (selectedTemplateName) then
        UIDropDownMenu_SetSelectedName(frame,selectedTemplateName);
    else
        UIDropDownMenu_SetSelectedID(frame,1);
    end
end

function TGUnitFramesTemplateManagerDropDown_Initialize()
    local   indexTable = TGUnitFrames_GetUnitFrameList(selectedCollectionName)
    for k,v in ipairs(indexTable) do
        local info = {text=v,func=TGUnitFramesTemplateManagerDropDown_OnClick,arg1=v,checked=false};
        UIDropDownMenu_AddButton(info);
    end
end

function TGUnitFramesTemplateManagerDropDown_OnClick(button,arg1)
    TGUnitFramesTemplateManager_SelectTemplate(selectedCollectionName,arg1);
end

function TGUnitFramesTemplateManagerAnchorEnabled_OnClick(buttonFrame)
    local   anchorFrame = buttonFrame:GetParent();
    local   disabled;
    if (selectedTemplate ~= nil) then
        -- See if we are disabling or not
        if (buttonFrame:GetChecked()) then
            disabled = false;
            TGUFDebug("We are now enabled.");
        else
            disabled = true;
            TGUFDebug("We are now disabled.");
        end
        
        -- Update the anchor
        local   templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.template.anchors[anchorFrame.anchorIndex] ~= nil) then
            -- The anchor already exists, so just set it's disabled property
            templateIndexElem.template.anchors[anchorFrame.anchorIndex].disabled = disabled;
            TGUFDebug("Anchor exists, setting anchor "..anchorFrame.anchorIndex.." disabled to "..tostring(disabled));
        else
            -- The anchor doesn't exist
            local   anchorDropDownFrame = _G[anchorFrame:GetName().."AnchorDropDown"];
            local   toAnchorDropDownFrame = _G[anchorFrame:GetName().."ToAnchorDropDown"];
            local   anchor =
            {
                myPoint=(UIDropDownMenu_GetSelectedName(anchorDropDownFrame) or "TOPLEFT"),
                anchor=0,
                anchorPoint=(UIDropDownMenu_GetSelectedName(toAnchorDropDownFrame) or "TOPLEFT"),
                dX=0,
                dY=0,
                disabled=disabled
            };
            templateIndexElem.template.anchors[anchorFrame.anchorIndex] = anchor;
        end
        TGUnitFramesTemplateManager_RedrawTemplate();
        TGUnitFramesTemplateManagerFrame.updateYourself = true;
    end
end

function TGUnitFramesTemplateManagerAnchorDropDown_OnLoad(frame)
    local   anchorFrame = frame:GetParent();
    UIDropDownMenu_Initialize(frame,TGUnitFramesTemplateManagerAnchorDropDown_GetInitialize(anchorFrame));
    UIDropDownMenu_SetWidth(frame,100);
end

local anchorNames = {"TOPLEFT","TOPRIGHT","BOTTOMLEFT","BOTTOMRIGHT","TOP","BOTTOM","LEFT","RIGHT","CENTER"};
function TGUnitFramesTemplateManagerAnchorDropDown_GetInitialize(anchorFrame)
    return function()
        for k,v in ipairs(anchorNames) do
            local   info = {text=v,func=TGUnitFramesTemplateManagerAnchorDropDown_OnClick,arg1=anchorFrame,arg2=v,checked=false};
            UIDropDownMenu_AddButton(info);
        end
    end
end

function TGUnitFramesTemplateManagerAnchorDropDown_OnClick(button,arg1,arg2)
    local   anchorFrame = arg1;
    local   text = arg2;
    local   dropDownFrame = _G[anchorFrame:GetName().."AnchorDropDown"];
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.template.anchors[anchorFrame.anchorIndex] ~= nil) then
            templateIndexElem.template.anchors[anchorFrame.anchorIndex].myPoint = text;
            UIDropDownMenu_SetSelectedName(dropDownFrame,text);
            TGUnitFramesTemplateManager_RedrawTemplate();
        end
    end
end

function TGUnitFramesTemplateManagerToEditBox_OnEscapePressed(frame)
    local   anchorFrame = frame:GetParent();
    local   newText = "";
    
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        local   anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
        if (anchor ~= nil) then
            newText = ""..anchor.anchor;
        end
    end
    frame:SetText(newText);
    frame:ClearFocus();
    TGUF_ScrollLeft(frame);
end

function TGUnitFramesTemplateManagerToEditBox_OnEnterPressed(frame)
    local   anchorFrame = frame:GetParent();
    local   text = frame:GetText();
    local   newAnchor = tonumber(text);
    
    if (newAnchor) then
        if (selectedTemplate ~= nil) then
            local   templateIndexElem = templateIndex[selectedIndex];
            local   anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
            if (anchor ~= nil) then
                if (newAnchor == 0 or (newAnchor < 0 and templateIndexElem.index + newAnchor >= 0) or (newAnchor > 0 and newAnchor < templateIndexElem.index)) then
                    anchor.anchor = newAnchor;
                    TGUnitFramesTemplateManager_RedrawTemplate();
                else
                    frame:SetText(anchor.anchor);
                end
            end
        end
    end
end

function TGUnitFramesTemplateManagerToEditBox_OnFocusGained(frame)
    TGUnitFramesTemplateManager_SetScrollState("select-anchor");
    TGUnitFramesTemplateManagerFrame.updateYourself = true;
end

function TGUnitFramesTemplateManagerToEditBox_OnFocusLost(frame)
    TGUnitFramesTemplateManager_SetScrollState("normal");
    TGUnitFramesTemplateManagerFrame.updateYourself = true;
end

function TGUnitFramesTemplateManagerDXEditBox_OnEscapePressed(frame)
    local   anchorFrame = frame:GetParent();
    local   newText = "";
    
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        local   anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
        if (anchor ~= nil) then
            newText = ""..anchor.dX;
        end
    end
    frame:SetText(newText);
    frame:ClearFocus();
    TGUF_ScrollLeft(frame);
end

function TGUnitFramesTemplateManagerDXEditBox_OnEnterPressed(frame)
    local   anchorFrame = frame:GetParent();
    local   text = frame:GetText();
    local   newDX = tonumber(text);
    
    if (newDX) then
        if (selectedTemplate ~= nil) then
            local   templateIndexElem = templateIndex[selectedIndex];
            local   anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
            if (anchor ~= nil) then
                anchor.dX = newDX;
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesTemplateManagerAnchor_Nudge(anchorFrame,dX,dY)
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        local   anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
        if (anchor ~= nil) then
            anchor.dX = anchor.dX + dX;
            anchor.dY = anchor.dY + dY;
            TGUnitFramesTemplateManager_RedrawTemplate();
            TGUnitFramesTemplateManagerFrame.updateYourself = true;
        end
    end
end

function TGUnitFramesTemplateManagerDYEditBox_OnEscapePressed(frame)
    local   anchorFrame = frame:GetParent();
    local   newText = "";
    
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        local   anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
        if (anchor ~= nil) then
            newText = ""..anchor.dY;
        end
    end
    frame:SetText(newText);
    frame:ClearFocus();
    TGUF_ScrollLeft(frame);
end

function TGUnitFramesTemplateManagerDYEditBox_OnEnterPressed(frame)
    local   anchorFrame = frame:GetParent();
    local   text = frame:GetText();
    local   newDY = tonumber(text);
    
    if (newDY) then
        if (selectedTemplate ~= nil) then
            local   templateIndexElem = templateIndex[selectedIndex];
            local   anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
            if (anchor ~= nil) then
                anchor.dY = newDY;
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesTemplateManagerToAnchorDropDown_OnLoad(frame)
    local   anchorFrame = frame:GetParent();
    UIDropDownMenu_Initialize(frame,TGUnitFramesTemplateManagerToAnchorDropDown_GetInitialize(anchorFrame));
    UIDropDownMenu_SetWidth(frame,100);
end

function TGUnitFramesTemplateManagerToAnchorDropDown_GetInitialize(anchorFrame)
    return function()
        for k,v in ipairs(anchorNames) do
            local   info = {text=v,func=TGUnitFramesTemplateManagerToAnchorDropDown_OnClick,arg1=anchorFrame,arg2=v,checked=false};
            UIDropDownMenu_AddButton(info);
        end
    end
end

function TGUnitFramesTemplateManagerToAnchorDropDown_OnClick(button,arg1,arg2)
    local   anchorFrame = arg1;
    local   text = arg2;
    local   toDropDownFrame = _G[anchorFrame:GetName().."ToAnchorDropDown"];
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.template.anchors[anchorFrame.anchorIndex] ~= nil) then
            templateIndexElem.template.anchors[anchorFrame.anchorIndex].anchorPoint = text;
            UIDropDownMenu_SetSelectedName(toDropDownFrame,text);
            TGUnitFramesTemplateManager_RedrawTemplate();
        end
    end
end

function TGUnitFramesAttributeTemplate_OnPresentCheckClick(attributeFrame)
    local   attribute = attributeFrame.tgufAttribute;
    local   template;
    local   checkBox = _G[attributeFrame:GetName().."PresentCheck"];
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        template = templateIndexElem.template;
    end
    
    if (checkBox:GetChecked()) then
        -- We need to add the attribute
        if (template[attribute.name.."_oldValue"]) then
            template[attribute.name] = template[attribute.name.."_oldValue"];
        else
            if type(attribute.newValue) == "table" then
                template[attribute.name] = {};
                for k,v in pairs(attribute.newValue) do
                    template[attribute.name][k] = v;
                end
            else
                template[attribute.name] = attribute.newValue;
            end
        end
    else
        -- We need to remove the attribute
        template[attribute.name.."_oldValue"] = template[attribute.name];
        template[attribute.name] = nil;
    end
    
    TGUnitFramesTemplateManager_RedrawTemplate();
    TGUnitFramesTemplateManagerFrame.updateYourself = true;
end

function TGUnitFramesTemplateManagerAttributes_UpdateAttributes()
    for i=1,TGUF_MAX_ATTRIBUTES do
        local   attributeFrame = _G["TGUnitFramesTemplateManagerFrameAttribute"..i];
        TGUnitFramesTemplateManagerAttributes_UpdateAttribute(attributeFrame);
    end
end

function TGUnitFramesTemplateManagerAttributes_UpdateAttribute(attributeFrame)
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
            end
        end
    end
    
    attributeFrame.tgufAttribute = attribute;
    local   attributeName = _G[attributeFrame:GetName().."PresentCheckAttributeName"];
    local   presentCheck = _G[attributeFrame:GetName().."PresentCheck"];
    local   integerFrame = _G[attributeFrame:GetName().."Integer"];
    local   integerEditBox = _G[integerFrame:GetName().."EditBox"];
    local   stringFrame = _G[attributeFrame:GetName().."String"];
    local   stringEditBox = _G[stringFrame:GetName().."EditBox"];
    local   restrictedValueFrame = _G[attributeFrame:GetName().."RestrictedValue"];
    local   restrictedValueDropDown = _G[restrictedValueFrame:GetName().."DropDown"];
    local   multiValueFrame = _G[attributeFrame:GetName().."MultiValue"];
    local   multiValueDropDown = _G[multiValueFrame:GetName().."DropDown"];
    local   booleanFrame = _G[attributeFrame:GetName().."Boolean"];
    local   booleanDropDown = _G[booleanFrame:GetName().."DropDown"];
    local   colorFrame = _G[attributeFrame:GetName().."Color"];
    local   colorSwatch = _G[colorFrame:GetName().."ColorSwatchTexture"];
    local   colorRedEditBox = _G[colorFrame:GetName().."RedEditBox"];
    local   colorGreenEditBox = _G[colorFrame:GetName().."GreenEditBox"];
    local   colorBlueEditBox = _G[colorFrame:GetName().."BlueEditBox"];
    local   colorAlphaEditBox = _G[colorFrame:GetName().."AlphaEditBox"];
    local   vectorFrame = _G[attributeFrame:GetName().."Vector"];
    local   vectorEditBox = {};
    for i=1,TGUF_MAX_VECTOR_WIDTH do
        vectorEditBox[i] = _G[vectorFrame:GetName()..i.."EditBox"];
    end
    local   insetsFrame = _G[attributeFrame:GetName().."Insets"];
    local   insetsLeftEditBox = _G[insetsFrame:GetName().."LeftEditBox"];
    local   insetsTopEditBox = _G[insetsFrame:GetName().."TopEditBox"];
    local   insetsRightEditBox = _G[insetsFrame:GetName().."RightEditBox"];
    local   insetsBottomEditBox = _G[insetsFrame:GetName().."BottomEditBox"];
    if (attribute ~= nil) then
        -- Set up the general stuff
        local   present = false;
        attributeFrame:Show();
        attributeName:SetText(attribute.name.." : "..attribute.type);
        if (attribute.required) then
            presentCheck:SetChecked(true);
            presentCheck:Disable();
            if (template[attribute.name] == nil) then
                TGUFDebug("Frame "..template.name.." was missing required attribute "..attribute.name.."!");
            else
                present = true;
            end
        else
            if (template[attribute.name] ~= nil) then
                presentCheck:SetChecked(true);
                present = true;
            else
                presentCheck:SetChecked(false);
            end
            presentCheck:Enable();
        end
        
        -- Do the specific stuff
        integerFrame:Hide();
        stringFrame:Hide();
        restrictedValueFrame:Hide();
        multiValueFrame:Hide();
        booleanFrame:Hide();
        colorFrame:Hide();
        vectorFrame:Hide();
        insetsFrame:Hide();
        if (attribute.type == "integer") then
            integerFrame:Show();
            if (present) then
                integerEditBox:SetText(""..template[attribute.name]);
                integerEditBox:EnableMouse(true);
                integerEditBox:SetAlpha(1);
            else
                integerEditBox:SetText("");
                integerEditBox:EnableMouse(false);
                integerEditBox:SetAlpha(0.3);
                integerEditBox:ClearFocus();
            end
            TGUF_ScrollLeft(integerEditBox);
        elseif (attribute.type == "string") then
            stringFrame:Show();
            if (present) then
                stringEditBox:SetText(template[attribute.name]);
                stringEditBox:EnableMouse(true);
                stringEditBox:SetAlpha(1);
            else
                stringEditBox:SetText("");
                stringEditBox:EnableMouse(false);
                stringEditBox:SetAlpha(0.3);
                stringEditBox:ClearFocus();
            end
            TGUF_ScrollLeft(stringEditBox);
        elseif (attribute.type == "restricted-value") then
            restrictedValueFrame:Show();
            UIDropDownMenu_Initialize(restrictedValueDropDown,TGUnitFramesTemplateManagerRestrictedValue_GetInitialize(attributeFrame));
            if (present) then
                UIDropDownMenu_SetSelectedName(restrictedValueDropDown,template[attribute.name]);
                UIDropDownMenu_EnableDropDown(restrictedValueDropDown);
            else
                UIDropDownMenu_SetText(restrictedValueDropDown,"");
                UIDropDownMenu_DisableDropDown(restrictedValueDropDown);
            end
        elseif (attribute.type == "multi-value") then
            multiValueFrame:Show();
            UIDropDownMenu_Initialize(multiValueDropDown,TGUnitFramesTemplateManagerMultiValue_GetInitialize(attributeFrame));
            UIDropDownMenu_SetText(multiValueDropDown,"Values");
            if (present) then
                UIDropDownMenu_EnableDropDown(restrictedValueDropDown);
            else
                UIDropDownMenu_DisableDropDown(restrictedValueDropDown);
            end
        elseif (attribute.type == "boolean") then
            booleanFrame:Show();
            UIDropDownMenu_Initialize(booleanDropDown,TGUnitFramesTemplateManagerBoolean_GetInitialize(attributeFrame));
            if (present) then
                if (template[attribute.name]) then
                    UIDropDownMenu_SetSelectedName(booleanDropDown,"TRUE");
                else
                    UIDropDownMenu_SetSelectedName(booleanDropDown,"FALSE");
                end
                UIDropDownMenu_EnableDropDown(booleanDropDown);
            else
                UIDropDownMenu_SetText(booleanDropDown,"");
                UIDropDownMenu_DisableDropDown(booleanDropDown);
            end
        elseif (attribute.type == "color") then
            colorFrame:Show();
            if (present) then
                colorRedEditBox:SetText(template[attribute.name].r);
                colorRedEditBox:EnableMouse(true);
                colorRedEditBox:SetAlpha(1);
                colorGreenEditBox:SetText(template[attribute.name].g);
                colorGreenEditBox:EnableMouse(true);
                colorGreenEditBox:SetAlpha(1);
                colorBlueEditBox:SetText(template[attribute.name].b);
                colorBlueEditBox:EnableMouse(true);
                colorBlueEditBox:SetAlpha(1);
                colorAlphaEditBox:SetText(template[attribute.name].a);
                colorAlphaEditBox:EnableMouse(true);
                colorAlphaEditBox:SetAlpha(1);
                colorSwatch:SetVertexColor(template[attribute.name].r,template[attribute.name].g,template[attribute.name].b,template[attribute.name].a);
            else
                colorRedEditBox:SetText("");
                colorRedEditBox:EnableMouse(false);
                colorRedEditBox:SetAlpha(0.3);
                colorRedEditBox:ClearFocus();
                colorGreenEditBox:SetText("");
                colorGreenEditBox:EnableMouse(false);
                colorGreenEditBox:SetAlpha(0.3);
                colorGreenEditBox:ClearFocus();
                colorBlueEditBox:SetText("");
                colorBlueEditBox:EnableMouse(false);
                colorBlueEditBox:SetAlpha(0.3);
                colorBlueEditBox:ClearFocus();
                colorAlphaEditBox:SetText("");
                colorAlphaEditBox:EnableMouse(false);
                colorAlphaEditBox:SetAlpha(0.3);
                colorAlphaEditBox:ClearFocus();
                colorSwatch:SetVertexColor(1,1,1,0.3);
            end
        elseif (attribute.type == "vector") then
            vectorFrame:Show();
            if (present) then
                for i=1,#attribute.indices do
                    vectorEditBox[i]:SetText(template[attribute.name][attribute.indices[i]]);
                    vectorEditBox[i]:EnableMouse(true);
                    vectorEditBox[i]:SetAlpha(1);
                    vectorEditBox[i]:Show();
                    vectorEditBox[i].index = attribute.indices[i];
                end
                for i=#attribute.indices+1,TGUF_MAX_VECTOR_WIDTH do
                    vectorEditBox[i]:SetText("");
                    vectorEditBox[i]:EnableMouse(false);
                    vectorEditBox[i]:SetAlpha(0.3);
                    vectorEditBox[i]:ClearFocus();
                    vectorEditBox[i]:Hide();
                    vectorEditBox[i].index = nil;
                end
            else
                for i=1,TGUF_MAX_VECTOR_WIDTH do
                    vectorEditBox[i]:SetText("");
                    vectorEditBox[i]:EnableMouse(false);
                    vectorEditBox[i]:SetAlpha(0.3);
                    vectorEditBox[i]:ClearFocus();
                    vectorEditBox[i].index = nil;
                    if (i > #attribute.indices) then
                        vectorEditBox[i]:Hide();
                    else
                        vectorEditBox[i]:Show();
                    end
                end
            end
        elseif (attribute.type == "insets") then
            insetsFrame:Show();
            if (present) then
                insetsLeftEditBox:SetText(template[attribute.name].left);
                insetsLeftEditBox:EnableMouse(true);
                insetsLeftEditBox:SetAlpha(1);
                insetsTopEditBox:SetText(template[attribute.name].top);
                insetsTopEditBox:EnableMouse(true);
                insetsTopEditBox:SetAlpha(1);
                insetsRightEditBox:SetText(template[attribute.name].right);
                insetsRightEditBox:EnableMouse(true);
                insetsRightEditBox:SetAlpha(1);
                insetsBottomEditBox:SetText(template[attribute.name].bottom);
                insetsBottomEditBox:EnableMouse(true);
                insetsBottomEditBox:SetAlpha(1);
            else
                insetsLeftEditBox:SetText("");
                insetsLeftEditBox:EnableMouse(false);
                insetsLeftEditBox:SetAlpha(0.3);
                insetsLeftEditBox:ClearFocus();
                insetsTopEditBox:SetText("");
                insetsTopEditBox:EnableMouse(false);
                insetsTopEditBox:SetAlpha(0.3);
                insetsTopEditBox:ClearFocus();
                insetsRightEditBox:SetText("");
                insetsRightEditBox:EnableMouse(false);
                insetsRightEditBox:SetAlpha(0.3);
                insetsRightEditBox:ClearFocus();
                insetsBottomEditBox:SetText("");
                insetsBottomEditBox:EnableMouse(false);
                insetsBottomEditBox:SetAlpha(0.3);
                insetsBottomEditBox:ClearFocus();
            end
        end
    else
        -- No attribute
        attributeFrame:Hide();
    end
end

function TGUnitFramesTemplateManagerRestrictedValue_GetInitialize(attributeFrame)
    return function()
        for k,v in ipairs(attributeFrame.tgufAttribute.values) do
            local   info = {text=v,func=TGUnitFramesTemplateManagerRestrictedValue_OnClick,arg1=attributeFrame,arg2=v,checked=false};
            UIDropDownMenu_AddButton(info);
        end
    end
end

function TGUnitFramesTemplateManagerRestrictedValue_OnClick(button,arg1,arg2)
    local   attributeFrame = arg1;
    local   dropDownFrame = _G[attributeFrame:GetName().."RestrictedValueDropDown"];
    local   text = arg2;
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name] = text;
                UIDropDownMenu_SetSelectedName(dropDownFrame,text);
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesTemplateManagerMultiValue_GetInitialize(attributeFrame)
    return function()
        for k,v in ipairs(attributeFrame.tgufAttribute.values) do
            local   checked = false;
            if (selectedTemplate ~= nil) then
                local   template = templateIndex[selectedIndex].template;
                local   currValues = template[attributeFrame.tgufAttribute.name];
                if (currValues ~= nil) then
                    for k1,v1 in ipairs(currValues) do
                        if (v1 == v) then
                            checked = true;
                        end
                    end
                end
            end
            local   info = {text=v,func=TGUnitFramesTemplateManagerMultiValue_OnClick,arg1=attributeFrame,arg2=v,checked=checked,keepShownOnClick=1};
            UIDropDownMenu_AddButton(info);
        end
    end
end

function TGUnitFramesTemplateManagerMultiValue_OnClick(button,arg1,arg2)
    local   attributeFrame = arg1;
    local   dropDownFrame = _G[attributeFrame:GetName().."RestrictedValueDropDown"];
    local   text = arg2;
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                if (template[attribute.name] ~= nil) then
                    for k,v in ipairs(template[attribute.name]) do
                        if (v == text) then
                            table.remove(template[attribute.name],k);
                            break;
                        end
                    end
                else
                    template[attribute.name] = {};
                end
                if (not UIDropDownMenuButton_GetChecked()) then
                    table.insert(template[attribute.name],text);
                end
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesTemplateManagerBoolean_GetInitialize(attributeFrame)
    return function()
        local   info = {text="TRUE",func=TGUnitFramesTemplateManagerBoolean_OnClick,arg1=attributeFrame,arg2=true,checked=false};
        UIDropDownMenu_AddButton(info);
        
        info = {text="FALSE",func=TGUnitFramesTemplateManagerBoolean_OnClick,arg1=attributeFrame,arg2=false,checked=false};
        UIDropDownMenu_AddButton(info);
    end
end

function TGUnitFramesTemplateManagerBoolean_OnClick(button,arg1,arg2)
    local   attributeFrame = arg1;
    local   dropDownFrame = _G[attributeFrame:GetName().."BooleanDropDown"];
    local   value = arg2;
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        local   templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name] = value;
                UIDropDownMenu_SetSelectedName(dropDownFrame,text);
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesAttributeInteger_OnEnterPressed(attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."IntegerEditBox"];
    local   theInteger = tonumber(editBox:GetText());
    local   attribute;
    local   template;
    
    if (theInteger ~= nil and selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name] = math.floor(theInteger);
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesAttributeInteger_OnEscapePressed(attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."IntegerEditBox"];
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                editBox:SetText(""..template[attribute.name]);
            end
        end
    end
    editBox:ClearFocus();
end

function TGUnitFramesAttributeString_OnEnterPressed(attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."StringEditBox"];
    local   theString = editBox:GetText();
    local   attribute;
    local   template;
    
    if (theString ~= nil and selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name] = theString;
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesAttributeString_OnEscapePressed(attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."StringEditBox"];
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                editBox:SetText(""..template[attribute.name]);
            end
        end
    end
    editBox:ClearFocus();
end

local TGUF_COLOR_TO_KEY = {Red="r",Green="g",Blue="b",Alpha="a"};
function TGUnitFramesColor_OnEnterPressed(color,attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."Color"..color.."EditBox"];
    local   theString = editBox:GetText();
    local   attribute;
    local   template;
    
    if (theString ~= nil and selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name][TGUF_COLOR_TO_KEY[color]] = theString;
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesColor_OnEscapePressed(color,attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."Color"..color.."EditBox"];
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                editBox:SetText(""..template[attribute.name][TGUF_COLOR_TO_KEY[color]]);
            end
        end
    end
    editBox:ClearFocus();
end

function TGUnitFramesColor_OnSwatchClick(attributeFrame)
    if (ColorPickerFrame:IsVisible()) then
        ColorPickerFrame:Hide();
    else
        local attribute;
        local template;
        local color;
        if (selectedTemplate ~= nil) then
            templateIndexElem = templateIndex[selectedIndex];
            if (templateIndexElem.objectInfo.attributes ~= nil) then
                if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                    attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                    template = templateIndexElem.template;
                    color = template[attribute.name];
                end
            end
        end
        ColorPickerFrame.func = function()
            local r,g,b = ColorPickerFrame:GetColorRGB();
            color.r = math.floor(r*1000 + 0.5)/1000;
            color.g = math.floor(g*1000 + 0.5)/1000;
            color.b = math.floor(b*1000 + 0.5)/1000;
            TGUnitFramesTemplateManager_RedrawTemplate();
        end
        ColorPickerFrame.opacityFunc = function()
            local a = OpacitySliderFrame:GetValue();
            color.a = math.floor(a*1000 + 0.5)/1000;
            TGUnitFramesTemplateManager_RedrawTemplate();
        end
        ColorPickerFrame.cancelFunc = function(p)
            color.r = p.r;
            color.g = p.g;
            color.b = p.b;
            color.a = p.a;
            TGUnitFramesTemplateManager_RedrawTemplate();
        end
        ColorPickerFrame.previousValues = {r=color.r,g=color.g,b=color.b,a=color.a};
        ColorPickerFrame.hasOpacity = true;
        ColorPickerFrame.opacity = color.a;
        ColorSwatch:SetTexture(color.r,color.g,color.b);
        ColorPickerFrame:SetColorRGB(color.r,color.g,color.b);
        ColorPickerFrame:Show();
    end
end

function TGUnitFramesVector_OnEnterPressed(editBox,attributeFrame)
    local   theString = editBox:GetText();
    local   attribute;
    local   template;
    
    if (theString ~= nil and selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name][editBox.index] = tonumber(theString);
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesVector_OnEscapePressed(editBox,attributeFrame)
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                editBox:SetText(""..template[attribute.name][editBox.index]);
            end
        end
    end
    editBox:ClearFocus();
end

local TGUF_INSETS_TO_KEY = {Top="top",Left="left",Bottom="bottom",Right="right"};
function TGUnitFramesInsets_OnEnterPressed(coord,attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."Insets"..coord.."EditBox"];
    local   theString = editBox:GetText();
    local   attribute;
    local   template;
    
    if (theString ~= nil and selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name][TGUF_INSETS_TO_KEY[coord]] = tonumber(theString);
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesInsets_OnEscapePressed(coord,attributeFrame)
    local   editBox = _G[attributeFrame:GetName().."Insets"..coord.."EditBox"];
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                editBox:SetText(""..template[attribute.name][TGUF_INSETS_TO_KEY[coord]]);
            end
        end
    end
    editBox:ClearFocus();
end

function TGUnitFramesGeneric_OnEnterPressed(attributeFrame,editBoxName,attributeField)
    local   editBox = _G[attributeFrame:GetName()..editBoxName];
    local   theString = editBox:GetText();
    local   attribute;
    local   template;
    
    if (theString ~= nil and selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                template[attribute.name][attributeField] = tonumber(theString);
                TGUnitFramesTemplateManager_RedrawTemplate();
            end
        end
    end
end

function TGUnitFramesGeneric_OnEscapePressed(attributeFrame,editBoxName,attributeField)
    local   editBox = _G[attributeFrame:GetName()..editBoxName];
    local   attribute;
    local   template;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.objectInfo.attributes ~= nil) then
            if (templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex] ~= nil) then
                attribute = templateIndexElem.objectInfo.attributes[attributeFrame.attributeIndex];
                template = templateIndexElem.template;
                editBox:SetText(""..template[attribute.name][attributeField]);
            end
        end
    end
    editBox:ClearFocus();
end

function TGUnitFramesTemplateManagerAnchor_UpdateAnchors()
    for i=1,4 do
        local   anchorFrame = _G["TGUnitFramesTemplateManagerFrameAnchor"..i];
        TGUnitFramesTemplateManagerAnchor_UpdateAnchor(anchorFrame);
    end
end

function TGUnitFramesTemplateManagerAnchor_UpdateAnchor(anchorFrame)
    local   rootDisabled = false;
    local   disabled = true;
    local   templateIndexElem;
    local   anchor;
    if (selectedTemplate ~= nil) then
        if (selectedIndex == 1) then
            rootDisabled = true;
        else
            templateIndexElem = templateIndex[selectedIndex];
            if (templateIndexElem.template.anchors ~= nil) then
                anchor = templateIndexElem.template.anchors[anchorFrame.anchorIndex];
                if (anchor ~= nil) then
                    if (anchor.disabled) then
                        disabled = true;
                    else
                        disabled = false;
                    end
                end
            end
        end
    end
    
    local   enabledFrame = _G[anchorFrame:GetName().."EnabledCheck"];
    local   myLabel = _G[anchorFrame:GetName().."MyLabel"];
    local   dropDownFrame = _G[anchorFrame:GetName().."AnchorDropDown"];
    local   toLabel = _G[anchorFrame:GetName().."ToLabel"];
    local   toEditBox = _G[anchorFrame:GetName().."ToEditBox"];
    local   toDropDownFrame = _G[anchorFrame:GetName().."ToAnchorDropDown"];
    local   nudgeLeftFrame = _G[anchorFrame:GetName().."NudgeLeft"];
    local   nudgeUpFrame = _G[anchorFrame:GetName().."NudgeUp"];
    local   nudgeDownFrame = _G[anchorFrame:GetName().."NudgeDown"];
    local   nudgeRightFrame = _G[anchorFrame:GetName().."NudgeRight"];
    local   dxFrame = _G[anchorFrame:GetName().."DXEditBox"];
    local   dyFrame = _G[anchorFrame:GetName().."DYEditBox"];
    local   r,g,b = myLabel:GetTextColor();
    if (disabled) then
        enabledFrame:SetChecked(false);
        UIDropDownMenu_SetText(dropDownFrame,"");
        UIDropDownMenu_DisableDropDown(dropDownFrame);
        UIDropDownMenu_SetText(toDropDownFrame,"");
        UIDropDownMenu_DisableDropDown(toDropDownFrame);
        if (rootDisabled) then
            enabledFrame:Disable();
        else
            enabledFrame:Enable();
        end
        myLabel:SetTextColor(r,g,b,0.3);
        toLabel:SetTextColor(r,g,b,0.3);
        toEditBox:SetAlpha(0.3);
        toEditBox:EnableMouse(false);
        toEditBox:ClearFocus();
        toEditBox:SetText("");
        nudgeLeftFrame:Disable();
        nudgeUpFrame:Disable();
        nudgeDownFrame:Disable();
        nudgeRightFrame:Disable();
        dxFrame:SetAlpha(0.3);
        dxFrame:EnableMouse(false);
        dxFrame:ClearFocus();
        dxFrame:SetText("");
        dyFrame:SetAlpha(0.3);
        dyFrame:EnableMouse(false);
        dyFrame:ClearFocus();
        dyFrame:SetText("");
    else
        enabledFrame:SetChecked(true);
        enabledFrame:Enable();
        
        UIDropDownMenu_Initialize(dropDownFrame,TGUnitFramesTemplateManagerAnchorDropDown_GetInitialize(anchorFrame));
        UIDropDownMenu_SetSelectedName(dropDownFrame,anchor.myPoint);
        --UIDropDownMenu_SetText(dropDownFrame,anchor.myPoint);
        UIDropDownMenu_EnableDropDown(dropDownFrame);
        
        UIDropDownMenu_Initialize(toDropDownFrame,TGUnitFramesTemplateManagerToAnchorDropDown_GetInitialize(anchorFrame));
        UIDropDownMenu_SetSelectedName(toDropDownFrame,anchor.anchorPoint);
        --UIDropDownMenu_SetText(dropDownFrame,anchor.anchorPoint);
        UIDropDownMenu_EnableDropDown(toDropDownFrame);
        
        myLabel:SetTextColor(r,g,b,1);
        toLabel:SetTextColor(r,g,b,1);
        toEditBox:SetAlpha(1);
        toEditBox:EnableMouse(true);
        toEditBox:SetText(anchor.anchor);
        nudgeLeftFrame:Enable();
        nudgeUpFrame:Enable();
        nudgeDownFrame:Enable();
        nudgeRightFrame:Enable();
        dxFrame:SetAlpha(1);
        dxFrame:EnableMouse(true);
        dxFrame:SetText(""..anchor.dX);
        dyFrame:SetAlpha(1);
        dyFrame:EnableMouse(true);
        dyFrame:SetText(""..anchor.dY);
    end
end

function TGUnitFramesTemplateManager_UpdateSize(frame)
    local   templateIndexElem;
    local   size;
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        size = templateIndexElem.template.size;
    end
    
    local   widthCheckFrame = _G[frame:GetName().."WidthCheck"];
    local   widthFrame = _G[frame:GetName().."Width"];
    local   widthTextFrame = _G[frame:GetName().."WidthLabel"];
    local   heightCheckFrame = _G[frame:GetName().."HeightCheck"];
    local   heightFrame = _G[frame:GetName().."Height"];
    local   heightTextFrame = _G[frame:GetName().."HeightLabel"];
    local   heightEnabled = false;
    local   widthEnabled = false;
    local   r,g,b = widthTextFrame:GetTextColor();
    
    if (size and size.width ~= nil) then
        widthEnabled = true;
    end
    if (size and size.height ~= nil) then
        heightEnabled = true;
    end
    
    widthCheckFrame:SetChecked(widthEnabled);
    if (widthEnabled) then
        widthFrame:SetAlpha(1);
        widthFrame:EnableMouse(true);
        widthFrame:SetText(""..size.width);
    else
        widthFrame:SetAlpha(0.3);
        widthFrame:EnableMouse(false);
        widthFrame:ClearFocus();
        widthFrame:SetText("");
    end
    
    heightCheckFrame:SetChecked(heightEnabled);
    if (heightEnabled) then
        heightFrame:SetAlpha(1);
        heightFrame:EnableMouse(true);
        heightFrame:SetText(""..size.height);
    else
        heightFrame:SetAlpha(0.3);
        heightFrame:EnableMouse(false);
        heightFrame:ClearFocus();
        heightFrame:SetText("");
    end
end

function TGUnitFramesTemplateManagerSizeCheck_OnClick(checkFrame,field)
    TGUnitFramesTemplateManager_SizeChange(checkFrame:GetParent(),false,field);
end

function TGUnitFramesTemplateManager_NameChange(frame)
    local   templateIndexElem;
    local   nameEditBox = _G[frame:GetName().."Name"];
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        templateIndexElem.template.name = nameEditBox:GetText();
        TGUnitFramesTemplateManagerFrame.updateYourself = true;
    end
end

function TGUnitFramesTemplateManagerNameEditBox_OnEscapePressed(nameEditBox)
    local   templateIndexElem;
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.template.name ~= nil) then
            nameEditBox:SetText(templateIndexElem.template.name);
        else
            nameEditBox:SetText("");
        end
    end
    nameEditBox:ClearFocus();
end

function TGUnitFramesTemplateManagerSizeEditBox_OnEscapePressed(sizeEditBox,field)
    local   templateIndexElem;
    local   value = 10;
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.template.size ~= nil) then
            if (templateIndexElem.template.size[field] ~= nil) then
                value = templateIndexElem.template.size[field];
            end
        end
    end
    sizeEditBox:SetText(""..value);
    sizeEditBox:ClearFocus();
end

function TGUnitFramesTemplateManager_SizeChange(frame,useValue,field)
    local   templateIndexElem;
    local   size;
    local   value;
    local   editBox;
    local   checkFrame;
    local   valueChanged = false;
    
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
        if (templateIndexElem.template.size == nil) then
            templateIndexElem.template.size = {};
        end
        size = templateIndexElem.template.size;
    end
    
    if (size ~= nil) then
        if (field == "width") then
            checkFrame = _G[frame:GetName().."WidthCheck"];
            editBox = _G[frame:GetName().."Width"];
        elseif (field == "height") then
            checkFrame = _G[frame:GetName().."HeightCheck"];
            editBox = _G[frame:GetName().."Height"];
        else
            TGUFDebug("Bad field!");
        end
        
        if (checkFrame:GetChecked()) then
            if (useValue) then
                value = tonumber(editBox:GetText());
            else
                value = 10;
            end
            if (value) then
                size[field] = value;
                valueChanged = true;
            end
        else
            size[field] = nil;
            valueChanged = true;
        end
        
        -- If both are nil, lose the field
        if (size.height == nil and size.width == nil) then
            templateIndexElem.template.size = nil;
        end
        if (valueChanged) then
            TGUnitFramesTemplateManager_RedrawTemplate();
        end
    end
end

function TGUnitFramesTemplateManager_SelectDefaultTemplate()
    if (selectedFrame ~= nil) then
        return;
    end
    
    -- Select the first template
    if (#TGUF_COLLECTIONS_INDEX > 0) then
        TGUnitFramesTemplateManager_SelectTemplate(TGUF_COLLECTIONS_INDEX[1].name,TGUF_COLLECTIONS_INDEX[1][1]);
    else
        TGUFMsg("No template to select.");
    end
end

function TGUnitFramesTemplateManager_SelectTemplate(collection,templateName,updateDropDown)
    -- Destroy the old unitframe
    if (selectedFrame ~= nil) then
        selectedFrame:SetAlpha(1);
    end
    TGUnitFrames_DestroyObject(rootFrame);
    
    -- Create the new unit frame
    local   anchors = {{myPoint="CENTER",anchorPoint="CENTER",dX=0,dY=0}};
    local   anchorFrames = {TGUnitFramesTemplateManagerFrameWorkspace};
    rootFrame = TGUnitFrames_AllocateUnitFrameTemplate("template",collection,templateName,TGUnitFramesTemplateManagerFrameWorkspace,anchors,anchorFrames);
    rootFrame:SetFrameStrata("DIALOG");
    rootFrame:Show();
    
    -- Set up our variables
    selectedCollection = TGUF_COLLECTIONS[collection];
    selectedCollectionName = collection;
    selectedTemplate = TGUF_COLLECTIONS[collection][templateName];
    selectedTemplateName = templateName;
    if (selectedTemplate == nil) then
        --TGUFMsg("TGUF_COLLECTIONS[collection][templateName] == nil!");
    end
    templateIndex = {};
    selectedFrame = rootFrame;
    selectedIndex = nil;
    TGUnitFramesTemplateManager_IndexTemplate(selectedTemplate,nil,0,1,rootFrame);
    TGUnitFramesTemplateManager_SelectFrame(1);
    TGUnitFramesTemplateManagerFrameCollectionDropDown:Hide();
    TGUnitFramesTemplateManagerFrameCollectionDropDown:Show();
    --if (updateDropDown) then
        TGUnitFramesTemplateManagerDropDown_OnShow(TGUnitFramesTemplateManagerFrameDropDown);
    --end
    TGUnitFramesTemplateManagerFrameDropDown:Hide();
    TGUnitFramesTemplateManagerFrameDropDown:Show();
    TGUnitFramesTemplateManager_SetScrollState(scrollState);
    TGUnitFramesTemplateManagerFrame.updateYourself = true;
    
    -- Update the scrollbar list
    FauxScrollFrame_SetOffset(TGUnitFramesTemplateManagerFrameScrollFrame,0);
    TGUnitFramesTemplateManagerFrameScrollFrameScrollBar:SetValue(0);
end

function TGUnitFramesTemplateManager_RedrawTemplate()
    local   anchors = {{myPoint="CENTER",anchorPoint="CENTER",dX=0,dY=0}};
    local   anchorFrames = {TGUnitFramesTemplateManagerFrameWorkspace};
    if (selectedFrame ~= nil) then
        selectedFrame:SetAlpha(1);
    end
    TGUnitFrames_DestroyObject(rootFrame);
    rootFrame = TGUnitFrames_AllocateUnitFrameTemplate("template",selectedCollectionName,selectedTemplateName,TGUnitFramesTemplateManagerFrameWorkspace,anchors,anchorFrames);
    rootFrame:SetFrameStrata("DIALOG");
    rootFrame:Show();
    templateIndex = {};
    TGUnitFramesTemplateManager_IndexTemplate(selectedTemplate,nil,0,1,rootFrame);
    TGUnitFramesTemplateManager_SetScrollState(scrollState);
    selectedFrame = templateIndex[selectedIndex].realFrame;
    TGUnitFramesTemplateManagerFrame.updateYourself = true;
end

function TGUnitFramesTemplateManager_IndexTemplate(template,parent,level,index,realFrame)
    local   myElem = {template=template,level=level,parent=parent,index=index,realFrame=realFrame,objectInfo=realFrame.objectInfo}
    table.insert(templateIndex,myElem);
    if (template.children ~= nil) then
        for k,v in ipairs(template.children) do
            TGUnitFramesTemplateManager_IndexTemplate(v,myElem,level+1,k,realFrame.tgufChildren[k]);
        end
    end
end

function TGUnitFramesTemplateManager_EnableAll()
    for k,v in ipairs(templateIndex) do
        v.enabled = true;
    end
end

function TGUnitFramesTemplateManager_EnableAnchors()
    for k,v in ipairs(templateIndex) do
        if (v == templateIndex[selectedIndex].parent or (v.parent == templateIndex[selectedIndex].parent and v.index < templateIndex[selectedIndex].index)) then
            v.enabled = true;
        else
            v.enabled = false;
        end
    end
end

function TGUnitFramesTemplateManager_EnableSwaps()
    for k,v in ipairs(templateIndex) do
        if (v.parent == templateIndex[selectedIndex].parent) then
            v.enabled = true;
        else
            v.enabled = false;
        end
    end
end

function TGUnitFramesTemplateManager_SetScrollState(state)
    if (state == "normal") then
        TGUnitFramesTemplateManager_EnableAll();
    elseif (state == "select-anchor") then
        TGUnitFramesTemplateManager_EnableAnchors();
    elseif (state == "select-swap") then
        TGUnitFramesTemplateManager_EnableSwaps();
    end
    scrollState = state;
end

function TGUnitFramesTemplateManagerFrame_ScrollUpdate()
    FauxScrollFrame_Update(TGUnitFramesTemplateManagerFrameScrollFrame,table.getn(templateIndex),10,16);
    TGUnitFramesTemplateManagerFrame.updateYourself = true;
end

function TGUnitFramesTemplateManagerFrame_OnLoad(frame)
    frame.updateYourself = true;
end

function TGUnitFramesTemplateManager_OnIndexClick(self,button,id)
    local   topIndex = FauxScrollFrame_GetOffset(TGUnitFramesTemplateManagerFrameScrollFrame);
    local   listIndex = topIndex + id;
    
    -- If this was a right-click, also display the menu
    if (button == nil) then
        TGUFDebug("OnIndexClick with nil button")
    else
        TGUFDebug("OnIndexClick: "..self:GetName().." "..button.." "..id)
    end
    if (button == "RightButton") then
        local   dropDown = _G[self:GetName().."DropDown"];
        TGUFDebug("Got right-click on dropdown "..dropDown:GetName()..", index "..listIndex);
        UIDropDownMenu_Initialize(dropDown,TGUnitFramesTemplateManagerIndexEntry_GetInitialize(self),"MENU");
        ToggleDropDownMenu(1, nil, dropDown, self:GetName(), 0, 0);
    else
        -- Select the frame
        TGUnitFramesTemplateManager_SelectFrame(listIndex);
        TGUnitFramesTemplateManager_SetScrollState(scrollState);
        TGUnitFramesTemplateManagerFrame.updateYourself = true;
    
        CloseDropDownMenus();
    end
end

function TGUnitFramesTemplateManager_SelectFrame(index)
    local   prevFrame;
    local   newFrame;
    
    if (selectedTemplate ~= nil and selectedIndex ~= nil) then
        prevFrame = templateIndex[selectedIndex].realFrame;
    end
    
    selectedIndex = index;
    
    if (selectedTemplate ~= nil) then
        newFrame = templateIndex[selectedIndex].realFrame;
    end
    
    if (prevFrame) then
        prevFrame:SetAlpha(savedA);
    end
    if (newFrame) then
        savedA = newFrame:GetAlpha();
    end
    selectedFrame = newFrame;
    selectedTime0 = GetTime();
end

function TGUnitFramesTemplateManagerFrame_OnUpdate(frame)
    if (selectedFrame and selectedFrame ~= rootFrame and not ColorPickerFrame:IsVisible()) then
        local   theTime = math.fmod(GetTime()-selectedTime0+1,2);
        local   alpha;
        if (theTime < 1) then
            alpha = theTime;
        else
            alpha = (2-theTime);
        end
        selectedFrame:SetAlpha(alpha);
    end
    
    if (not frame.updateYourself) then
        return;
    end
    
    local indexFrame;
    local indexFrameText;
    local indexFrameHighlight;
    local alpha;
    
    for i=1,10 do
        indexFrame = _G["TGUnitFramesTemplateManagerFrameIndex"..i];
        indexFrame:Hide();
    end
    
    local topIndex = FauxScrollFrame_GetOffset(TGUnitFramesTemplateManagerFrameScrollFrame) + 1;
    for k,v in ipairs(templateIndex) do
        if (topIndex <= k and k < topIndex + 10) then
            local   string = "";
            indexFrame = _G["TGUnitFramesTemplateManagerFrameIndex"..(k-topIndex+1)];
            indexFrameText = _G["TGUnitFramesTemplateManagerFrameIndex"..(k-topIndex+1).."Text"];
            indexFrameHighlight = _G["TGUnitFramesTemplateManagerFrameIndex"..(k-topIndex+1).."Highlight2"];
            for i=1,v.level do
                string = string.."    ";
            end
            string = string..v.index..": ";
            if (v.template.name) then
                string = string..v.template.name.." ";
            end
            string = string.."("..v.template.type..")";
            indexFrameText:SetText(string);
            if (v.enabled) then
                alpha = 1;
            else
                alpha = 0.3;
            end
            local   r,g,b = indexFrameText:GetTextColor();
            indexFrameText:SetTextColor(r,g,b,alpha);
            if (k == selectedIndex) then
                indexFrameHighlight:Show();
            else
                indexFrameHighlight:Hide();
            end
            indexFrame.listIndex = k;
            indexFrame:Show();
        end
    end
    
    TGUnitFramesTemplateManagerAnchor_UpdateAnchors();
    TGUnitFramesTemplateManagerAttributes_UpdateAttributes();
    TGUnitFramesTemplateManager_UpdateSize(frame);
    
    local   templateIndexElem;
    if (selectedTemplate ~= nil) then
        templateIndexElem = templateIndex[selectedIndex];
    end
    local   nameEditBox = _G[frame:GetName().."Name"];
    
    if (templateIndexElem ~= nil and templateIndexElem.template.name ~= nil) then
        nameEditBox:SetText(templateIndexElem.template.name);
    else
        nameEditBox:SetText("");
    end
    --TGUF_ScrollLeft(nameEditBox);
    
    FauxScrollFrame_Update(TGUnitFramesTemplateManagerFrameScrollFrame,table.getn(templateIndex),10,16);
    
    frame.updateYourself = false;
end

function TGUnitFramesTemplateManagerIndexEntry_GetInitialize(indexFrame)
    return function()
        -- Get our index
        local   listIndex = indexFrame.listIndex;
        local   info;
        
        if (UIDROPDOWNMENU_MENU_LEVEL == 2) then
            for k,v in ipairs(TGUF_OBJECTS_INDEX) do
                info = UIDropDownMenu_CreateInfo();
                info.text = v;
                info.arg1 = UIDROPDOWNMENU_MENU_VALUE;
                info.arg2 = {listIndex=listIndex,name=v};
                info.func = TGUnitFramesTemplateManagerIndexEntry_AddNewFrame;
                info.notCheckable = 1;
                UIDropDownMenu_AddButton(info,UIDROPDOWNMENU_MENU_LEVEL);
            end
        else
            -- Add a child frame to this frame
            info = UIDropDownMenu_CreateInfo();
            info.text = "Add Child Frame";
            info.hasArrow = 1;
            info.func = nil;
            info.notCheckable = 1;
            UIDropDownMenu_AddButton(info);
            
            -- Insert a sibling frame before this frame
            info = UIDropDownMenu_CreateInfo();
            info.text = "Insert Frame";
            info.hasArrow = 1;
            info.func = nil;
            info.notCheckable = 1;
            if (listIndex == 1) then
                -- Can't insert a frame before the root frame!
                info.disabled = 1;
            end
            UIDropDownMenu_AddButton(info);
            
            -- Insert a frame as this one's parent
            info = UIDropDownMenu_CreateInfo();
            info.text = "Insert New Parent";
            info.hasArrow = 1;
            info.func = nil;
            info.notCheckable = 1;
            if (listIndex == 1) then
                -- Can't insert a parent frame before the root frame!
                info.disabled = 1;
            end
            UIDropDownMenu_AddButton(info);
            
            -- Delete this frame
            info = UIDropDownMenu_CreateInfo();
            info.text = "Delete Frame";
            info.arg1 = listIndex;
            info.func = TGUnitFramesTemplateManagerIndexEntry_DeleteFrame;
            info.notCheckable = 1;
            if (listIndex == 1) then
                -- Can't delete the root frame!
                info.disabled = 1;
            end
            UIDropDownMenu_AddButton(info);
            
            -- Delete this frame but reparent the children
            info = UIDropDownMenu_CreateInfo();
            info.text = "Delete Frame and Reparent Children";
            info.arg1 = listIndex;
            info.func = TGUnitFramesTemplateManagerIndexEntry_DeleteFrameReparenting;
            info.notCheckable = 1;
            if (listIndex == 1) then
                -- Can't delete the root frame!
                info.disabled = 1;
            end
            UIDropDownMenu_AddButton(info);
            
            -- Reparent this frame
            info = UIDropDownMenu_CreateInfo();
            info.text = "Make Frame Child of Selected Frame";
            info.arg1 = listIndex;
            info.func = TGUnitFramesTemplateManagerIndexEntry_ReparentToSelection;
            info.notCheckable = 1;
            if (selectedTemplate == nil) then
                -- No selected template
                info.disabled = 1;
            else
                -- Make sure the selected template isn't a child of this one
                if (TGUnitFramesTemplateManager_FrameIsChild(templateIndex[listIndex].template,templateIndex[selectedIndex].template)) then
                    info.disabled = 1;
                end
            end
            if (listIndex == 1) then
                -- Can't reparent root
                info.disabled = 1;
            end
            UIDropDownMenu_AddButton(info);
        end
    end
end

function TGUnitFramesTemplateManager_FrameIsChild(parentTemplate,childTemplate)
    -- Test our children frames
    if (parentTemplate.children ~= nil) then
        for k,v in pairs(parentTemplate.children) do
            if (v == childTemplate or TGUnitFramesTemplateManager_FrameIsChild(v,childTemplate)) then
                return true;
            end
        end
    end
    return false;
end

function TGUnitFramesTemplateManagerIndexEntry_AddNewFrame(self,arg1,arg2)
    local   command = arg1;
    local   listIndex = arg2.listIndex;
    local   name = arg2.name;
    local   template = templateIndex[listIndex];
    local   newObject = TGUF_OBJECTS[name];
    local   parentList;
    local   parentIndex;
    local   newElem;
    
    if (arg1 == "Add Child Frame") then
        parentList = template.template.children;
        if (parentList == nil) then
            parentList = {};
            template.template.children = parentList;
        end
        TGUFDebug("Adding new child frame of type "..name.." to frame index "..listIndex);
    elseif (arg1 == "Insert Frame") then
        parentList = template.parent.template.children;
        for k,v in ipairs(parentList) do
            if (v == template.template) then
                parentIndex = k;
                break;
            end
        end
        TGUFDebug("Inserting new child frame of type "..name.." before frame index "..parentIndex);
    elseif (arg1 == "Insert New Parent") then
        parentList = template.parent.template.children;
        for k,v in ipairs(parentList) do
            if (v == template.template) then
                parentIndex = k;
                break;
            end
        end
    else
        TGUFDebug("Got funky stuff trying to add new frame!");
    end
    
    -- Create the new object
    newElem = {};
    newElem.type = newObject.name;
    newElem.name = "?";
    newElem.anchors = { {myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=0,dY=0} };
    for k,v in ipairs(newObject.attributes) do
        if (v.default ~= nil) then
            if type(v.default) == "table" then
                newElem[v.name] = {};
                for k1,v1 in pairs(v.default) do
                    newElem[v.name][k1] = v1;
                end
            else
                newElem[v.name] = v.default;
            end
        end
    end
    if (parentIndex ~= nil) then
        table.insert(parentList,parentIndex,newElem);
    else
        table.insert(parentList,newElem);
    end
    
    -- If we are reparenting, then we need to set the child list
    if (arg1 == "Insert New Parent") then
        newElem.children = {template.template};
        table.remove(template.parent.template.children,parentIndex+1);
    end
    
    -- Redraw the template
    TGUnitFramesTemplateManager_RedrawTemplate();
    TGUnitFramesTemplateManagerFrame.updateYourself = true;
    CloseDropDownMenus();
end

function TGUnitFramesTemplateManagerIndexEntry_DeleteFrame(self,arg1)
    local   listIndex = arg1;
    local   template = templateIndex[listIndex];
    if (template.parent) then
        local   childIndex;
        for k,v in ipairs(template.parent.template.children) do
            if (v == template.template) then
                childIndex = k;
                break;
            end
        end
        for k,v in ipairs(template.parent.template.children) do
            if (v ~= template.template and v.anchors ~= nil) then
                for _,a in pairs(v.anchors) do
                    if (a.anchor < 0 and k > childIndex and k + a.anchor <= childIndex) then
                        a.anchor = 0;
                    end
                end
            end
        end
        if (selectedIndex == #templateIndex) then
            selectedIndex = selectedIndex - 1;
        end
        table.remove(template.parent.template.children,childIndex);
        TGUnitFramesTemplateManager_RedrawTemplate();
        TGUnitFramesTemplateManagerFrame.updateYourself = true;
    end
    CloseDropDownMenus();
end

function TGUnitFramesTemplateManagerIndexEntry_DeleteFrameReparenting(self,arg1)
    local   listIndex = arg1;
    local   template = templateIndex[listIndex];
    local   myChildren = template.template.children;
    template.template.children = nil;
    if (myChildren) then
        for k,v in ipairs(myChildren) do
            table.insert(template.parent.template.children,v);
        end
    end
    TGUnitFramesTemplateManagerIndexEntry_DeleteFrame(self,arg1);
end

function TGUnitFramesTemplateManagerIndexEntry_ReparentToSelection(self,arg1)
    local   listIndex = arg1;
    local   template = templateIndex[listIndex];
    if (template.parent) then
        local   childIndex;
        for k,v in ipairs(template.parent.template.children) do
            if (v == template.template) then
                childIndex = k;
                break;
            end
        end
        for k,v in ipairs(template.parent.template.children) do
            if (v ~= template.template and v.anchors ~= nil) then
                for _,a in pairs(v.anchors) do
                    if (a.anchor < 0 and k > childIndex and k + a.anchor <= childIndex) then
                        a.anchor = 0;
                    end
                end
            end
        end
        if (selectedTemplate ~= nil) then
            local   templateIndexElem = templateIndex[selectedIndex];
            if (templateIndexElem.template.children == nil) then
                templateIndexElem.template.children = {}
            end
            table.insert(templateIndexElem.template.children,template.template);
            table.remove(template.parent.template.children,childIndex);
            TGUnitFramesTemplateManager_RedrawTemplate();
            TGUnitFramesTemplateManagerFrame.updateYourself = true;
        end
    end
    CloseDropDownMenus();
end

StaticPopupDialogs["TGUF_CLONE_NAME"] = {
    text = "Enter new frame name:",
    button1 = "Okay",
    button2 = "Cancel",
    hasEditBox = 1,
    maxLetters = 128,
    OnAccept = function(self)
        local text = self.editBox:GetText()
        TGUnitFrames_CloneUnitFrameTemplate(selectedCollectionName,selectedTemplateName,selectedCollectionName,text)
    end,
    OnShow = function(self)
        self.editBox:SetText("")
        self.editBox:SetFocus()
    end,
    OnHide = function(self)
        self.editBox:SetText("")
    end,
    EditBoxOnEnterPressed = function(self)
        local editBox = _G[self:GetParent():GetName().."EditBox"];
        TGUnitFrames_CloneUnitFrameTemplate(selectedCollectionName,selectedTemplateName,selectedCollectionName,editBox:GetText())
        self:GetParent():Hide();
    end,
    EditBoxOnEscapePressed = function(self)
        self:GetParent():Hide();
    end,
    timeout = 0,
    exclusive = 1,
    whileDead = 1,
    hideOnEscape = 1
};

function TGUnitFramesTemplateManager_OnCloneClick()
    if (selectedTemplateName ~= nil) then
        StaticPopupDialogs["TGUF_CLONE_NAME"].text = "Enter name of \""..selectedTemplateName.."\" clone:";
        StaticPopup_Show("TGUF_CLONE_NAME");
    end
end

StaticPopupDialogs["TGUF_NEW_FRAME_NAME"] = {
    text = "Enter new frame name:",
    button1 = "Okay",
    button2 = "Cancel",
    hasEditBox = 1,
    maxLetters = 128,
    OnAccept = function(self)
        local text = self.editBox:GetText()
        TGUnitFrames_CloneUnitFrameTemplate(BUILT_IN_COLLECTION,"New Unit Frame",selectedCollectionName,text)
    end,
    OnShow = function(self)
        self.editBox:SetText("")
        self.editBox:SetFocus();
    end,
    OnHide = function(self)
        _G[self:GetName().."EditBox"]:SetText("");
    end,
    EditBoxOnEnterPressed = function(self)
        local editBox = _G[self:GetParent():GetName().."EditBox"];
        TGUnitFrames_CloneUnitFrameTemplate(BUILT_IN_COLLECTION,"New Unit Frame",selectedCollectionName,editBox:GetText())
        self:GetParent():Hide();
    end,
    EditBoxOnEscapePressed = function(self)
        self:GetParent():Hide();
    end,
    timeout = 0,
    exclusive = 1,
    whileDead = 1,
    hideOnEscape = 1
};

function TGUnitFramesTemplateManager_OnNewFrameClick()
    StaticPopup_Show("TGUF_NEW_FRAME_NAME");
end

StaticPopupDialogs["TGUF_NEW_COLLECTION_NAME"] = {
    text = "Enter new collection name:",
    button1 = "Okay",
    button2 = "Cancel",
    hasEditBox = 1,
    maxLetters = 128,
    OnAccept = function(self)
        local text = self.editBox:GetText()
        TGUnitFrames_CloneUnitFrameTemplate(BUILT_IN_COLLECTION,"New Unit Frame",text,"New Frame")
    end,
    OnShow = function(self)
        self.editBox:SetText("")
        self.editBox:SetFocus()
    end,
    OnHide = function(self)
        self.editBox:SetText("")
    end,
    EditBoxOnEnterPressed = function(self)
        local editBox = _G[self:GetParent():GetName().."EditBox"];
        TGUnitFrames_CloneUnitFrameTemplate(BUILT_IN_COLLECTION,"New Unit Frame",editBox:GetText(),"New Frame")
        self:GetParent():Hide();
    end,
    EditBoxOnEscapePressed = function()
        self:GetParent():Hide();
    end,
    timeout = 0,
    exclusive = 1,
    whileDead = 1,
    hideOnEscape = 1
};

function TGUnitFramesTemplateManager_OnNewCollectionClick()
    StaticPopup_Show("TGUF_NEW_COLLECTION_NAME");
end

function TGUnitFramesTemplateManager_Slash()
    if (TGUnitFramesTemplateManagerFrame:IsVisible()) then
        TGUnitFramesTemplateManagerFrame:Hide();
    else
        TGUnitFramesTemplateManagerFrame:Show();
    end
end

function TGUF_ScrollLeft(editBox)
    editBox:SetScript("OnUpdate", TGUF_UglyScrollLeft);
end
function TGUF_UglyScrollLeft(self)
    self:HighlightText(0,1);
    self:Insert(" "..strsub(self:GetText(),1,1));
    self:HighlightText(0,1);
    self:Insert("");
    self:SetScript("OnUpdate", nil);
end
