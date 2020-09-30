function TGUnitRaidTargetIcon_NewTGUnitRaidTargetIcon(frame,parentFrame,attributes)
    -- Set the unit info
    frame.unitChanged = TGUnitRaidTargetIcon_UnitChanged;
    frame.raidIconUnitUpdate = TGUnitRaidTargetIcon_RaidTargetUnitUpdate;
    table.insert(frame.listener.raidIcon,frame);
    
    -- Return the frame
    return frame;
end

function TGUnitRaidTargetIcon_DestroyTGUnitRaidTargetIcon(frame)
    for k,v in pairs(frame.listener.raidIcon) do
        if (v == frame) then
            table.remove(frame.listener.raidIcon,k);
            return;
        end
    end
end

function TGUnitRaidTargetIcon_UnitChanged(frame)
    TGUnitRaidTargetIcon_RaidTargetUnitUpdate(frame.listener.unit,frame);
end

function TGUnitRaidTargetIcon_RaidTargetUnitUpdate(unit,frame)
    --TGUFDebug("TGUnitRaidTargetIcon_RaidTargetUnitUpdate: "..unit.unit);
    if (unit.raidIcon) then
        local   iconTexture = _G[frame:GetName().."Icon"];
        SetRaidTargetIconTexture(iconTexture,unit.raidIcon);
        frame:Show();
    else
        frame:Hide();
    end
end

local TGUnitRaidTargetIconTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitRaidTargetIcon",
    template = "TGUnitRaidTargetIconTemplate",
    constructor = TGUnitRaidTargetIcon_NewTGUnitRaidTargetIcon,
    destructor = TGUnitRaidTargetIcon_DestroyTGUnitRaidTargetIcon,
    index = 0,
    pool = {},
    attributes =
    {
    }
}
TGUnitFrames_RegisterObject(TGUnitRaidTargetIconTemplate_ObjectInfo);
