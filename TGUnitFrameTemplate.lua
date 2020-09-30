local togglingFrame = nil;
local playerClass;
local healingClasses = { ["PRIEST"] = 1,
                         ["DRUID"] = 1,
                         ["SHAMAN"] = 1,
                         ["PALADIN"] = 1
                        };
local autoFindName = nil;
local autoFindFrame = nil;

function TGUnitFrame_NewTGUnitFrame(frame,parentFrame,attributes)
    -- Create a new TGUnitFrame
    frame.unitChanged          = TGUnitFrame_UnitChanged;
    frame.highlightIfTargetted = attributes.highlightIfTargetted;
    frame.backgroundColor      = attributes.backgroundColor;
    frame.trackHealingRange    = attributes.trackHealingRange;
    frame.trackVisibleRange    = attributes.trackVisibleRange;
    
    -- Listen for isPlayerTarget notifications
    frame.isPlayerTargetUnitUpdate = TGUnitFrame_IsPlayerTargetUnitUpdate;
    table.insert(frame.listener.isPlayerTarget,frame);
    
    -- Determine whether or not we should listen to inHealingRange notifications
    _,playerClass = UnitClass("player");
    if (frame.trackHealingRange == true and healingClasses[playerClass]) then
        frame.inHealingRangeUnitUpdate = TGUnitFrame_TrackRangeUnitUpdate;
        table.insert(frame.listener.inHealingRange,frame);
    else
        frame.trackHealingRange = nil;
    end
    
    -- Determine whether or not we should listen to isVisible notifications
    if (frame.trackVisibleRange == true) then
        frame.isVisibleUnitUpdate = TGUnitFrame_TrackRangeUnitUpdate;
        table.insert(frame.listener.isVisible,frame);
    end
    
    -- Determine whether or not we should listen to reaction notifications
    if (frame.trackHealingRange == true or frame.trackVisibleRange == true) then
        frame.reactionUnitUpdate = TGUnitFrame_TrackRangeUnitUpdate;
        table.insert(frame.listener.reaction,frame);
    end
    
    -- Display as necessary
    local   backgroundTexture = _G[frame:GetName().."Background"];
    backgroundTexture:SetTexture(frame.backgroundColor.r,frame.backgroundColor.g,frame.backgroundColor.b,frame.backgroundColor.a);
    
    -- Done.
    return frame;
end

function TGUnitFrame_DestroyTGUnitFrame(frame)
    UnregisterUnitWatch(frame);
    frame.registeredForUnitWatching = nil;
    for k,v in pairs(frame.listener.isPlayerTarget) do
        if (v == frame) then
            table.remove(frame.listener.isPlayerTarget,k);
            break;
        end
    end
    for k,v in pairs(frame.listener.inHealingRange) do
        if (v == frame) then
            table.remove(frame.listener.inHealingRange,k);
            break;
        end
    end
    for k,v in pairs(frame.listener.isVisible) do
        if (v == frame) then
            table.remove(frame.listener.isVisible,k);
            break;
        end
    end
    for k,v in pairs(frame.listener.reaction) do
        if (v == frame) then
            table.remove(frame.listener.reaction,k);
            break;
        end
    end
end

function TGUnitFrame_UnitChanged(frame)
    if (frame.listener.unit.unit == "autotarget") then
        AutoTarget_SetFrame(frame);
    end
    
    if (frame.listener.unit.unit ~= "template") then
        -- Set up the dropdown frame
        local   ddFrame = _G[frame:GetName().."DropDown"];
        TGUnitFrameTemplateDropDown_SetUp(ddFrame);
        frame:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        frame.registeredForUnitWatching = true;
        RegisterUnitWatch(frame);
        local   menufunc = function()
            togglingFrame = frame;
            ToggleDropDownMenu(1, nil, ddFrame, "cursor", 20, 0);
        end;
        if (frame.listener.unit.unit ~= "autotarget") then
            SecureUnitButton_OnLoad(frame,frame.listener.unit.unit,menufunc);
        else
            SecureUnitButton_OnLoad(frame,"",menufunc);
        end
    else
        UnregisterUnitWatch(frame);
        frame:Show();
    end
    
    TGUnitFrame_IsPlayerTargetUnitUpdate(frame.listener.unit,frame);
    if (frame.trackHealingRange == true or frame.trackVisibleRange == true) then
        TGUnitFrame_TrackRangeUnitUpdate(frame.listener.unit,frame);
    end
end

function TGUnitFrameTemplateDropDown_SetUp(frame)
    togglingFrame = frame:GetParent();
    UIDropDownMenu_Initialize(frame, TGUnitFrameTemplateDropDown_Initialize, "MENU");
    togglingFrame = nil;
end

function TGUnitFrameTemplateDropDown_Initialize()
    local   frame = togglingFrame;
    --TGUFDebug("Inited frame name is \""..frame:GetName().."\".");
    local   ddFrame = _G[frame:GetName().."DropDown"];
    local   unit = frame.listener.unit.unit;
    local   menu;
    local   name;
    local   id = nil;
    if (UnitIsUnit(unit,"player")) then
        menu = "SELF";
    elseif (UnitIsUnit(unit,"pet")) then
        menu = "PET";
    elseif (UnitIsPlayer(unit)) then
        id = UnitInRaid(unit);
        if (id) then
            menu = "RAID_PLAYER";
        elseif (UnitInParty(unit)) then
            menu = "PARTY";
        else
            menu = "PLAYER";
        end
    else
        menu = "RAID_TARGET_ICON";
        name = RAID_TARGET_ICON;
    end
    if (menu) then
        -- Stupid hack to work around raid frame noise
        --local oldPlaySound = PlaySound;
        --PlaySound = function(x) end;
        UnitPopup_ShowMenu(ddFrame,menu,unit,name,id);
        --PlaySound = oldPlaySound;
    end
end

function TGUnitFrame_IsPlayerTargetUnitUpdate(unit,frame)
    --TGUFDebug("TGUnitFrame_IsPlayerTargetUnitUpdate");
    local   highlightFrame = _G[frame:GetName().."Highlight"];
    if (frame.highlightIfTargetted and unit.isPlayerTarget == true) then
        highlightFrame:Show();
    else
        highlightFrame:Hide();
    end
end

function TGUnitFrame_TrackRangeUnitUpdate(unit,frame)
    if (unit.reaction == TGUF_REACTION_FRIENDLY) then
        if (frame.trackVisibleRange and frame.trackHealingRange) then
            if (unit.inHealingRange == 1) then
                frame:SetAlpha(1);
            elseif (unit.isVisible == 1) then
                frame:SetAlpha(0.30);
            else
                frame:SetAlpha(0.065);
            end
        elseif (frame.trackVisibleRange) then
            if (unit.isVisible == 1) then
                frame:SetAlpha(1);
            else
                frame:SetAlpha(0.125);
            end
        elseif (frame.trackHealingRange) then
            if (unit.inHealingRange == 1) then
                frame:SetAlpha(1);
            else
                frame:SetAlpha(0.125);
            end
        end
    else
        frame:SetAlpha(1);
    end
end

function TGUnitFrameTemplate_OnEnter(frame)
    if (frame.listener.unit.unit ~= "template") then
        GameTooltip_SetDefaultAnchor(GameTooltip, frame);
        GameTooltip:SetUnit(frame.listener.unit.unit);
        local r,g,b = GameTooltip_UnitColor(frame.listener.unit.unit);
        GameTooltipTextLeft1:SetTextColor(r,g,b);
    end
end

function TGUnitFrameTemplate_OnLeave(frame)
    if (frame.listener.unit.unit ~= "template") then
        GameTooltip:FadeOut();
    end
end

function TGUnitFrameTemplate_OnShow(frame)
    if (frame.listener.unit.unit == "autotarget") then
        AutoTarget_TargetFound();
    end
end

function TGUnitFrameTemplate_OnHide(frame)
    if (frame.listener.unit.unit == "autotarget") then
        AutoTarget_TargetLost();
    end
end

local TGUnitFrameTemplate_ObjectInfo =
{
    type = "Button",
    name = "TGUnitFrame",
    template = "TGUnitFrameTemplate",
    constructor = TGUnitFrame_NewTGUnitFrame,
    destructor = TGUnitFrame_DestroyTGUnitFrame,
    index = 0,
    pool = {},
    attributes =
    {
        {name = "backgroundColor", type = "color", default = {r=0,g=0,b=0,a=0.5}, newValue = {r=0,g=0,b=0,a=0.5}, required = true},
        {name = "highlightIfTargetted", type = "boolean", default = false, newValue = false, required = true},
        {name = "trackVisibleRange", type = "boolean", default = false, newValue = false, required = false},
        {name = "trackHealingRange", type = "boolean", default = false, newValue = false, required = false}
    }
}
TGUnitFrames_RegisterObject(TGUnitFrameTemplate_ObjectInfo);
