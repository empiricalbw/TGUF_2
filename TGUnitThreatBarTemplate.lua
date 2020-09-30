--[[
    Threat Bar.
    
    If isTanking is true, then we are tanking:
        - no spark
        If (status == 2):
            - bar is orange (tanking but someone has more threat)
        ElseIf (status == 3):
            - bar is red (tanking and have highest threat)
        Else:
            - WTF? Status must be 2 or 3 if we are tanking.
    
    ElseIf threatPct is nil, we aren't on threat list:
        - bar is hidden
        - no spark
    
    Else, someone else is tanking:
        - playerThreat = threatValue
        - tankThreat = playerThreat/(rawThreatPct/100.0)
        - aggroThreat = playerThreat/(threatPct/100.0)
        - sparkPct is at:
            (tankThreat/aggroThreat) percent
            = (playerThreat/(rawThreatPct/100.0))/(playerThreat/(threatPct/100.0))
            = (1/(rawThreatPct/100.0))/(1/(threatPct/100.0))
            = (100.0/rawThreatPct)/(100.0/threatPct)
            = (threatPct/rawThreatPct)
        - fillPct is at:
            (playerThreat/aggroThreat) percent
            = playerThreat/(playerThreat/(threatPct/100.0))
            = 1/(1/(threatPct/100.0))
            = (threatPct/100.0)
        If (status == 0):
            - bar is yellow (have less threat than tank)
        ElseIf (status == 1):
            - bar is orange (have more threat than tank)
        Else:
            - WTF? Status must be 1 or 2 if we aren't tanking.
]]
function TGUnitThreatBar_NewTGUnitThreatBar(frame,parentFrame,attributes)
    -- Set the unit info
    frame.unitChanged = TGUnitThreatBar_UnitChanged;
    frame.threatUnitUpdate = TGUnitThreatBar_ThreatUnitUpdate;
    frame.showSpark = attributes.showSpark;
    if (frame.showSpark == nil) then
        frame.showSpark = false;
    end
    table.insert(frame.listener.threat,frame);
    
    -- Set up the display
    local   barTexture = _G[frame:GetName().."Bar"];
    frame.lowThreatColor = attributes.lowThreatColor;
    if (frame.lowThreatColor == nil) then
        frame.lowThreatColor = {r=1, g=1, b=0, a=1};
    end
    frame.mediumThreatColor = attributes.mediumThreatColor;
    if (frame.mediumThreatColor == nil) then
        frame.mediumThreatColor = {r=1, g=0.5, b=0.25, a=1};
    end
    frame.highThreatColor = attributes.highThreatColor;
    if (frame.highThreatColor == nil) then
        frame.highThreatColor = {r=1, g=0.1, b=0.1, a=1};
    end
    TGUnitThreatBar_AdjustBorder(frame,attributes);
    barTexture:SetTexture(attributes.texture);
    
    -- Return the frame
    return frame;
end

function TGUnitThreatBar_DestroyTGUnitThreatBar(frame)
    for k,v in pairs(frame.listener.threat) do
        if (v == frame) then
            table.remove(frame.listener.threat,k);
            return;
        end
    end
end

function TGUnitThreatBar_UnitChanged(frame)
    TGUnitThreatBar_ThreatUnitUpdate(frame.listener.unit,frame)
end

function TGUnitThreatBar_AdjustBorder(frame,attributes)
    local   frameBorder = _G[frame:GetName().."Border"];
    local   barSpark = _G[frame:GetName().."Spark"];
    local   sizeFrame = _G[frame:GetName().."SizeFrame"];
    --local realHeight = (sizeFrame:GetTop() - sizeFrame:GetBottom());
    local   realHeight = sizeFrame:GetHeight();
    if (attributes.border == TGUF_HEALTH_BORDER_CASTING) then
        --local realWidth = (sizeFrame:GetRight() - sizeFrame:GetLeft());
        local   realWidth = sizeFrame:GetWidth()
        frameBorder:ClearAllPoints();
        frameBorder:SetWidth(197*realWidth/150);
        frameBorder:SetHeight(49*realHeight/10);
        frameBorder:SetPoint("TOP", frame, "TOP", 0, 20*realHeight/10);
    else
        --TGUFDebug("Unrecognized healthbar border.");
    end
    if (attributes.border ~= nil) then
        frameBorder:SetTexture(attributes.border);
        frameBorder:Show();
    else
        frameBorder:Hide();
    end
    barSpark:SetHeight(32*realHeight/9);
end

function TGUnitThreatBar_ThreatUnitUpdate(unit,frame)
    --TGUFDebug("TGUnitThreatBar_ThreatUnitUpdate");
    local   threat = unit.threat;
    local   barSpark = _G[frame:GetName().."Spark"];
    local   barTexture = _G[frame:GetName().."Bar"];
    if (threat.isTanking) then
        --[[
            If isTanking is true, then we are tanking:
                - no spark
                If (status == 2):
                    - bar is orange (tanking but someone has more threat)
                ElseIf (status == 3):
                    - bar is red (tanking and have highest threat)
                Else:
                    - WTF? Status must be 2 or 3 if we are tanking.
        ]]
        barSpark:Hide();
        TGUnitThreatBar_SetBarPercent(frame,1);
        if (threat.status < 0 or threat.status > 3) then
            error("Bizarre threat status "..threat.status.." while tanking.");
        elseif (threat.status == 3) then
            barTexture:SetVertexColor(frame.highThreatColor.r,frame.highThreatColor.g,frame.highThreatColor.b,frame.highThreatColor.a);
        else
            if (threat.status == 0) then
                print("Threat status was 0 (have less threat than tank) but isTanking was "..tostring(threat.isTanking));
            elseif (threat.status == 1) then
                print("Threat status was 1 (have more threat than tank) but isTanking was "..tostring(threat.isTanking));
            end
            barTexture:SetVertexColor(frame.mediumThreatColor.r,frame.mediumThreatColor.g,frame.mediumThreatColor.b,frame.mediumThreatColor.a);
        end
        barTexture:Show();
        frame:Show();
    elseif (threat.threatPct == nil) then
        --[[
            ElseIf threatPct is nil, we aren't on threat list:
                - bar is hidden
                - no spark
        ]]
        barSpark:Hide();
        barTexture:Hide();
        frame:Hide();
    else
        --[[
            Else, someone else is tanking:
                - playerThreat = threatValue
                - tankThreat = playerThreat/(rawThreatPct/100.0)
                - aggroThreat = playerThreat/(threatPct/100.0)
                - sparkPct is at:
                    (tankThreat/aggroThreat) percent
                    = (playerThreat/(rawThreatPct/100.0))/(playerThreat/(threatPct/100.0))
                    = (1/(rawThreatPct/100.0))/(1/(threatPct/100.0))
                    = (100.0/rawThreatPct)/(100.0/threatPct)
                    = (threatPct/rawThreatPct)
                - fillPct is at:
                    (playerThreat/aggroThreat) percent
                    = playerThreat/(playerThreat/(threatPct/100.0))
                    = 1/(1/(threatPct/100.0))
                    = (threatPct/100.0)
                If (status == 0):
                    - bar is yellow (have less threat than tank)
                ElseIf (status == 1):
                    - bar is orange (have more threat than tank)
                Else:
                    - WTF? Status must be 1 or 2 if we aren't tanking.
        ]]
        TGUnitThreatBar_SetSparkPercent(frame,(threat.threatPct/threat.rawThreatPct));
        TGUnitThreatBar_SetBarPercent(frame,(threat.threatPct/100.0));
        if (threat.status < 0 or threat.status > 3) then
            error("Bizarre threat status "..threat.status.." while not tanking.");
        elseif (threat.status == 0) then
            barTexture:SetVertexColor(frame.lowThreatColor.r,frame.lowThreatColor.g,frame.lowThreatColor.b,frame.lowThreatColor.a);
        else
            if (threat.status == 2) then
                print("Threat status was 2 (tanking insecurely) but isTanking was "..tostring(threat.isTanking));
            elseif (threat.status == 3) then
                print("Threat status was 3 (tanking securely) but isTanking was "..tostring(threat.isTanking));
            end
            barTexture:SetVertexColor(frame.mediumThreatColor.r,frame.mediumThreatColor.g,frame.mediumThreatColor.b,frame.mediumThreatColor.a);
        end
        if (frame.showSpark) then
            barSpark:Show();
        else
            barSpark:Hide();
        end
        barTexture:Show();
        frame:Show();
    end
end

function TGUnitThreatBar_SetBarPercent(frame,percent)
    local bar = _G[frame:GetName().."Bar"];
    local position = TGUnitThreatBar_GetPercentPosition(frame,percent);
    if (position) then
        bar:SetPoint("RIGHT", frame, "LEFT", position, 0);
    end
end

function TGUnitThreatBar_SetSparkPercent(frame,percent)
    local   barSpark = _G[frame:GetName().."Spark"];
    local   position = TGUnitThreatBar_GetPercentPosition(frame,percent);
    if (position) then
        barSpark:SetPoint("CENTER", frame, "LEFT", position, 0);
    end
end

function TGUnitThreatBar_GetPercentPosition(frame,percent)
    local sizeFrame = _G[frame:GetName().."SizeFrame"];
    local r = sizeFrame:GetRight();
    local l = sizeFrame:GetLeft();
    if (r ~= nil and l ~= nil) then
        local realWidth = (r - l);
        local position = percent*realWidth;
        return position;
    end
    return nil;
end

local TGUnitThreatBarTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitThreatBar",
    template = "TGUnitThreatBarTemplate",
    constructor = TGUnitThreatBar_NewTGUnitThreatBar,
    destructor = TGUnitThreatBar_DestroyTGUnitThreatBar,
    index = 0,
    pool = {},
    attributes =
    {
        {name = "texture", type = "string", default = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg", newValue = "", required = true},
        {name = "border", type = "string", default = "Interface\\CastingBar\\UI-CastingBar-Border-Small", newValue = "", required = false},
        {name = "showSpark", type = "boolean", default = true, newValue = true, required = false},
        {name = "lowThreatColor", type = "color", default = {r=1, g=1, b=0, a=1}, newValue = {r=1, g=1, b=0, a=1}, required = false},
        {name = "mediumThreatColor", type = "color", default = {r=1, g=0.5, b=0.25, a=1}, newValue = {r=1, g=0.5, b=0.25, a=1}, required = false},
        {name = "highThreatColor", type = "color", default = {r=1, g=0.1, b=0.1, a=1}, newValue = {r=1, g=0.1, b=0.1, a=1}, required = false},
    }
}
TGUnitFrames_RegisterObject(TGUnitThreatBarTemplate_ObjectInfo);
