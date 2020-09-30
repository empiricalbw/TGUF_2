TGUF_MANA_BORDER_CASTING = "Interface\\CastingBar\\UI-CastingBar-Border-Small";

local unknownPowerColor = {r=1, g=1, b=1, a=1}

function TGUnitManaBar_NewTGUnitManaBar(frame,parentFrame,attributes)
    -- Set the unit info
    frame.unitChanged = TGUnitManaBar_UnitChaged;
    frame.manaUnitUpdate = TGUnitManaBar_ManaUnitUpdate;
    table.insert(frame.listener.mana,frame);
    
    -- Set up the display
    frame.manaColor = attributes.manaColor;
    frame.rageColor = attributes.rageColor;
    frame.focusColor = attributes.focusColor;
    frame.energyColor = attributes.energyColor;
    frame.happinessColor = attributes.happinessColor;
    TGUnitManaBar_AdjustBorder(frame,attributes);
    frame:SetStatusBarTexture(attributes.texture);
    frame:Show();
    
    -- Return the frame
    return frame;
end

function TGUnitManaBar_DestroyTGUnitManaBar(frame)
    for k,v in pairs(frame.listener.mana) do
        if (v == frame) then
            table.remove(frame.listener.mana,k);
            return;
        end
    end
end

function TGUnitManaBar_UnitChaged(frame)
    TGUnitManaBar_ManaUnitUpdate(frame.listener.unit,frame);
end

function TGUnitManaBar_AdjustBorder(frame,attributes)
    local frameBorder = _G[frame:GetName().."Border"];
    if (attributes.border == TGUF_MANA_BORDER_CASTING) then
        frameBorder:SetWidth(197*frame:GetWidth()/150);
        frameBorder:SetHeight(49*frame:GetHeight()/10);
        frameBorder:ClearAllPoints();
        frameBorder:SetPoint("TOP", frame, "TOP", 0, 20*frame:GetHeight()/10);
    else
        --TGUFDebug("Unrecognized healthbar border.");
    end
    if (attributes.border ~= nil) then
        frameBorder:SetTexture(attributes.border);
        frameBorder:Show();
    else
        frameBorder:Hide();
    end
end

local TGUF_MANATYPE_TO_KEY = {  [0]="manaColor",
                                [1]="rageColor",
                                [2]="focusColor",
                                [3]="energyColor",
                                [4]="happinessColor"
                            };
function TGUnitManaBar_ManaUnitUpdate(unit,frame)
    if (unit.exists) then
        --TGUFDebug("TGUnitManaBar_ManaUnitUpdate");
        local   max = unit.mana.max;
        local   curr = unit.mana.current;
        local   power = frame[TGUF_MANATYPE_TO_KEY[unit.mana.type]];
        if (power == nil) then
            power = PowerBarColor[unit.mana.type];
        end
        frame:SetStatusBarColor(power.r,power.g,power.b);
        frame:SetMinMaxValues(0,max);
        frame:SetValue(curr);
    end
end

local TGUnitManaBarTemplate_ObjectInfo =
{
    type = "StatusBar",
    name = "TGUnitManaBar",
    template = "TGUnitManaBarTemplate",
    constructor = TGUnitManaBar_NewTGUnitManaBar,
    destructor = TGUnitManaBar_DestroyTGUnitManaBar,
    index = 0,
    pool = {},
    attributes =
    {
        {name = "texture", type = "string", default = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg", newValue = "", required = false},
        {name = "border", type = "string", default = "Interface\\CastingBar\\UI-CastingBar-Border-Small", newValue = "", required = false},
        {name = "manaColor", type = "color", default = {r=0, g=0, b=1, a=1}, newValue = {r=0, g=0, b=1, a=1}, required = false},
        {name = "rageColor", type = "color", default = {r=1, g=0, b=0, a=1}, newValue = {r=1, g=0, b=0, a=1}, required = false},
        {name = "focusColor", type = "color", default = {r=1, g=0.5, b=0.25, a=1}, newValue = {r=1, g=0.5, b=0.25, a=1}, required = false},
        {name = "energyColor", type = "color", default = {r=1, g=1, b=0, a=1}, newValue = {r=1, g=1, b=0, a=1}, required = false},
        {name = "happinessColor", type = "color", default = {r=0, g=1, b=1, a=1}, newValue = {r=0, g=1, b=1, a=1}, required = false}
    }
}
TGUnitFrames_RegisterObject(TGUnitManaBarTemplate_ObjectInfo);
