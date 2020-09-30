--[[
    Creates a new TGUnitBuffTemplate.  A positive index indicates an
    index into the unit's buffs, a negative index indicates an index
    into the unit's debuffs.
]]
function TGUnitBuff_NewTGUnitBuff(frame,parentFrame,attributes)
    -- Create a new TGUnitBuff
    frame.unitChanged = TGUnitBuff_UnitChanged;
    frame.buffIndex = attributes.buffIndex;
    frame.buffTooltipAnchor = attributes.buffTooltipAnchor;
    if (attributes.buffIndex > 0) then
        table.insert(frame.listener.buffs[attributes.buffIndex],frame);
        frame.buffsUnitUpdate = TGUnitBuff_BuffUnitUpdate;
    elseif (attributes.buffIndex < 0) then
        table.insert(frame.listener.debuffs[-attributes.buffIndex],frame);
        frame.debuffsUnitUpdate = TGUnitBuff_BuffUnitUpdate;
    end
    
    -- Set up the frame
    local   countFrame = _G[frame:GetName().."Count"];
    local   showNumber = true;
    if (attributes.displayNumber ~= nil) then
        showNumber = attributes.displayNumber;
    end
    frame.displayNumber = showNumber;
    if (showNumber) then
        local   font = "Fonts\\ARIALN.TTF";
        --local fontSize = 11*(countFrame:GetTop() - countFrame:GetBottom())/16;
        local   fontFlags = nil;
        local   fontSize = 11*(countFrame:GetHeight())/16;
        local   alignH = "RIGHT";
        local   alignV = "BOTTOM";
        if (attributes.numberFont ~= nil) then
            font = attributes.numberFont;
        end
        if (attributes.numberSize ~= nil) then
            fontSize = attributes.numberSize;
        end
        if (attributes.fontFlags ~= nil and #attributes.fontFlags > 0) then
            fontFlags = "";
            for k,v in ipairs(attributes.fontFlags) do
                if (fontFlags ~= "") then
                    fontFlags = fontFlags..", "..v;
                else
                    fontFlags = v;
                end
            end
        end
        if (attributes.numberAlignH ~= nil) then
            alignH = attributes.numberAlignH;
        end
        if (attributes.numberAlignV ~= nil) then
            alignV = attributes.numberAlignV;
        end
        countFrame:SetFont(font,fontSize,fontFlags);
        countFrame:SetJustifyH(alignH);
        countFrame:SetJustifyV(alignV);
        if (attributes.shadowColor ~= nil) then
            countFrame:SetShadowColor(attributes.shadowColor.r,attributes.shadowColor.g,attributes.shadowColor.b,attributes.shadowColor.a);
            if (attributes.shadowOffset ~= nil) then
                countFrame:SetShadowOffset(attributes.shadowOffset.x,attributes.shadowOffset.y);
            end
        else
            countFrame:SetShadowColor(nil);
            countFrame:SetShadowOffset(0,0);
        end
        countFrame:Show();
    else
        countFrame:Hide();
    end
    
    -- Update the frame
    frame:Show();
    return frame;
end

function TGUnitBuff_UnitChanged(frame)
    TGUnitBuff_BuffUnitUpdate(frame.listener.unit,frame)
end

function TGUnitBuff_DestroyTGUnitBuff(frame)
    local   listener = nil;
    if (frame.buffIndex > 0) then
        listener = frame.listener.buffs[frame.buffIndex];
    elseif (frame.buffIndex < 0) then
        listener = frame.listener.debuffs[-frame.buffIndex];
    end
    for k,v in pairs(listener) do
        if (v == frame) then
            table.remove(listener,k);
            return;
        end
    end
end

function TGUnitBuffTemplate_OnEnter(frame)
    local   dX = 0;
    local   dY = 0;
    if (frame.buffTooltipAnchor == "ANCHOR_BOTTOMRIGHT") then
        dX = 15;
        dY = -25;
    end
    GameTooltip:SetOwner(frame, frame.buffTooltipAnchor, dX, dY);
    if (frame.buffIndex > 0) then
        if (frame.listener.unit.unit == "template") then
            GameTooltip:SetText("Buff index "..frame.buffIndex);
        else
            GameTooltip:SetUnitBuff(frame.listener.unit.unit, frame.buffIndex);
        end
    else
        if (frame.listener.unit.unit == "template") then
            GameTooltip:SetText("Debuff index "..frame.buffIndex);
        else
            GameTooltip:SetUnitDebuff(frame.listener.unit.unit, -frame.buffIndex);
        end
    end
end

function TGUnitBuffTemplate_OnLeave(frame)
    GameTooltip:Hide();
end

function TGUnitBuff_BuffUnitUpdate(unit,frame)
    --TGUFDebug("TGUnitBuff_BuffUnitUpdate");
    local   texture = _G[frame:GetName().."Icon"];
    local   count = _G[frame:GetName().."Count"];
    local   buff;
    if (frame.buffIndex > 0) then
        buff = unit.buffs.buff[frame.buffIndex];
    else
        buff = unit.debuffs.debuff[-frame.buffIndex];
    end
    if (buff.texture == nil) then
        frame:Hide();
    else
        local   cooldown = _G[frame:GetName().."Cooldown"];
        texture:SetTexture(buff.texture);
        --TGUFMsg("Texture: "..buff.texture);
        if (frame.displayNumber) then
            if (buff.applications > 1) then
                count:SetText(buff.applications);
                count:Show();
            else
                count:Hide();
            end
        end
        
        -- expirationTime is the game time when the buff expires
        -- duration is the buff duration in seconds
        local   duration = buff.duration;
        local   start = buff.expirationTime - duration;
        --TGUFDebug("Buff: "..buff.name.." Start: "..start.." Expiration: "..buff.expirationTime.." Duration: "..buff.duration);
        if (start > 0 and duration > 0) then
            cooldown:SetCooldown(start,duration);
            cooldown:Show();
        else
            cooldown:Hide();
        end
        frame:Show();
    end
end

local TGUnitBuffTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitBuff",
    template = "TGUnitBuffTemplate",
    constructor = TGUnitBuff_NewTGUnitBuff,
    destructor = TGUnitBuff_DestroyTGUnitBuff,
    index = 0,
    pool = {},
    attributes =
    {
        {name = "buffIndex", type = "integer", default = 1, newValue = 1, required = true},
        {name = "buffTooltipAnchor", type = "restricted-value", values = {"ANCHOR_TOPLEFT", "ANCHOR_LEFT", "ANCHOR_BOTTOMLEFT", "ANCHOR_TOPRIGHT", "ANCHOR_RIGHT", "ANCHOR_BOTTOMRIGHT"}, default = "ANCHOR_TOPLEFT", newValue = "ANCHOR_TOPLEFT", required = true},
        {name = "displayNumber", type = "boolean", default = true, newValue = true, required = false},
        {name = "numberFont", type = "string", default = "Fonts\\ARIALN.TTF", newValue = "Fonts\\ARIALN.TTF", required = false},
        {name = "numberSize", type = "integer", default = 10, newValue = 10, required = false},
        {name = "numberAlignH", type = "restricted-value", values = {"LEFT", "RIGHT", "CENTER"}, default = "RIGHT", newValue = "RIGHT", required = false},
        {name = "numberAlignV", type = "restricted-value", values = {"TOP", "BOTTOM", "CENTER"}, default = "BOTTOM", newValue = "BOTTOM", required = false},
        {name = "fontFlags", type = "multi-value", values = {"OUTLINE","THICKOUTLINE", "MONOCHROME"}, default = {"OUTLINE", "MONOCHROME"}, newValue = {"OUTLINE", "MONOCHROME"}, required = false},
        {name = "shadowColor", type = "color", newValue = {r=1, g=1, b=1, a=1}, required = false},
        {name = "shadowOffset", type = "vector", indices = {"x","y"}, newValue = {x=1, y=-1}, required = false},
    }
}
TGUnitFrames_RegisterObject(TGUnitBuffTemplate_ObjectInfo);
