local debuffPriorities = {  ["PALADIN"] = {"Magic","Disease","Poison"},
                            ["DRUID"] = {"Poison","Curse"},
                            ["PRIEST"] = {"Magic","Disease"},
                            ["MAGE"] = {"Curse"}
                        };
local playerPriorities;

function TGUnitStatusBorder_NewTGUnitStatusBorder(frame,parentFrame,attributes)
    -- Create a new TGStatusBorder
    local   _,playerClass = UnitClass("player");
    frame.unitChanged = TGUnitStatusBorder_UnitChanged;
    frame.normalColor = attributes.normalColor;
    if (frame.normalColor == nil) then
        frame.normalColor = {r=1,g=1,b=1,a=1};
    end
    frame.magicColor = attributes.magicColor;
    frame.diseaseColor = attributes.diseaseColor;
    frame.poisonColor = attributes.poisonColor;
    frame.curseColor = attributes.curseColor;
    frame.afflictedBackdrop = { edgeFile = attributes.edgeFile, edgeSize = attributes.edgeSize };
    if (attributes.normalFile ~= nil) then
        frame.normalBackdrop = { edgeFile = attributes.normalFile, edgeSize = attributes.normalSize };
    else
        frame.normalBackdrop = frame.afflictedBackdrop;
    end
    
    -- Check if we need to do status frames for our player class
    playerPriorities = debuffPriorities[playerClass];
    if (playerPriorities ~= nil) then
        -- Set up listeners
        frame.debuffCountsUnitUpdate = TGUnitStatusBorderTemplate_DebuffCountsUpdate;
        table.insert(frame.listener.debuffCounts,frame);
    end
    
    -- Display as necessary
    if (frame.normalBackdrop.edgeFile ~= nil and frame.normalBackdrop.edgeFile ~= "") then
        frame:SetBackdrop(frame.normalBackdrop);
        if (frame.normalColor ~= nil) then
            frame:SetBackdropBorderColor(frame.normalColor.r,frame.normalColor.g,frame.normalColor.b,frame.normalColor.a);
        end
    else
        frame:SetBackdrop(nil);
    end
    frame:Show();
    
    return frame;
end

function TGUnitStatusBorder_DestroyTGUnitStatusBorder(frame)
    if (playerPriorities ~= nil) then
        for k,v in pairs(frame.listener.debuffCounts) do
            if (v == frame) then
                table.remove(frame.listener.debuffCounts,k);
                return;
            end
        end
    end
end

function TGUnitStatusBorder_UnitChanged(frame)
    -- Update if we are doing them for this player class
    if (playerPriorities ~= nil) then
        TGUnitStatusBorderTemplate_DebuffCountsUpdate(frame.listener.unit,frame);
    end
end

local   foundColorMap = { ["Magic"] = "magicColor", ["Curse"] = "curseColor", ["Disease"] = "diseaseColor", ["Poison"] = "poisonColor" };
function TGUnitStatusBorderTemplate_DebuffCountsUpdate(unit,frame)
    --TGUFMsg("TGUnitStatusBorderTemplate_DebuffCountsUpdate "..unit.unit.." ("..frame.listener.unit.unit..")");
    --[[
    for k,v in pairs(unit.debuffCounts) do
        TGUFMsg(k.."="..tostring(v));
    end
    ]]
    local   color = frame.normalColor;
    local   backdrop = frame.normalBackdrop;
    
    for k,v in ipairs(playerPriorities) do
        if (unit.debuffCounts[v] > 0) then
            local newColor = frame[foundColorMap[v]];
            if (newColor ~= nil) then
                color = newColor;
                backdrop = frame.afflictedBackdrop;
                break;
            end
        end
    end
    
    frame:SetBackdrop(backdrop)
    frame:SetBackdropBorderColor(color.r,color.g,color.b,color.a);
end

local TGUnitStatusBorderTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitStatusBorder",
    template = "TGUnitStatusBorderTemplate",
    constructor = TGUnitStatusBorder_NewTGUnitStatusBorder,
    destructor = TGUnitStatusBorder_DestroyTGUnitStatusBorder,
    index = 0,
    pool = {},
    attributes =
    {
        {name = "normalFile", type = "string", newValue = "", required = false},
        {name = "normalSize", type = "integer", newValue = 16, required = false},
        {name = "normalColor", type = "color", newValue = {r=1,g=1,b=1,a=1}, required = false},
        {name = "edgeFile", type = "string", newValue = "", required = false},
        {name = "edgeSize", type = "integer", newValue = 16, required = false},
        {name = "magicColor", type = "color", newValue = {r=0.2,g=0.6,b=1,a=1}, required = false},
        {name = "curseColor", type = "color", newValue = {r=0.6,g=0,b=1,a=1}, required = false},
        {name = "diseaseColor", type = "color", newValue = {r=0.6,g=0.4,b=0,a=1}, required = false},
        {name = "poisonColor", type = "color", newValue = {r=0,g=0.6,b=0,a=1}, required = false}
    }
}
TGUnitFrames_RegisterObject(TGUnitStatusBorderTemplate_ObjectInfo);
