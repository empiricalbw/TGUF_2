function TGUnitComboTexture_NewTGUnitComboTexture(frame,parentFrame,attributes)
    -- Create a new TGUnitTexture
    frame.unitChanged = TGUnitComboTexture_UnitChanged;
    frame.comboIndex = attributes.comboIndex;
    frame.texture = attributes.texture;
    frame.color = attributes.color;
    frame.comboPointsUnitUpdate = TGUnitComboTexture_ComboUpdate;
    table.insert(frame.listener.comboPoints,frame);
    
    -- Display as necessary
    local   texture = _G[frame:GetName().."Texture"];
    texture:SetTexture(frame.texture);
    texture:SetVertexColor(frame.color.r,frame.color.g,frame.color.b,frame.color.a);
    texture:Show();
    
    return frame;
end

function TGUnitComboTexture_DestroyTGUnitComboTexture(frame)
    for k,v in pairs(frame.listener.comboPoints) do
        if (v == frame) then
            table.remove(frame.listener.comboPoints,k);
            return;
        end
    end
end

function TGUnitComboTexture_UnitChanged(frame)
    TGUnitComboTexture_ComboUpdate(frame.listener.unit,frame);
end

function TGUnitComboTexture_ComboUpdate(unit,frame)
    --TGUFDebug("TGUnitComboTexture_ComboUpdate");
    local   comboPoints = unit.comboPoints;
    local   texture  = _G[frame:GetName().."Texture"];
    
    if (comboPoints ~= nil and frame.comboIndex <= comboPoints) then
        frame:Show();
    else
        frame:Hide();
    end
end

local TGUnitComboTextureTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitComboTexture",
    template = "TGUnitComboTextureTemplate",
    constructor = TGUnitComboTexture_NewTGUnitComboTexture,
    destructor = TGUnitComboTexture_DestroyTGUnitComboTexture,
    index = 0,
    pool = {},
    attributes =
    {
        {name = "comboIndex", type = "integer", default = 1, newValue = 1, required = true},
        {name = "texture", type = "string", default = "", newValue = "", required = true},
        {name = "color", type = "color", default = {r=0,g=0,b=0,a=1}, newValue = {r=0,g=0,b=0,a=1}, required = false}
    }
}
TGUnitFrames_RegisterObject(TGUnitComboTextureTemplate_ObjectInfo);
