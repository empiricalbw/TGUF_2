function TGUnitLeaderIcon_NewTGUnitLeaderIcon(frame,parentFrame,attributes)
    -- Set the unit info
    frame.unitChanged = TGUnitLeaderIcon_UnitChanged;
    frame.leaderUnitUpdate = TGUnitLeaderIcon_LeaderUnitUpdate;
    table.insert(frame.listener.leader,frame);
    
    -- Update the frame
    frame:Show();
    
    -- Return the frame
    return frame;
end

function TGUnitLeaderIcon_DestroyTGUnitLeaderIcon(frame)
    for k,v in pairs(frame.listener.leader) do
        if (v == frame) then
            table.remove(frame.listener.leader,k);
            return;
        end
    end
end

function TGUnitLeaderIcon_UnitChanged(frame)
    TGUnitLeaderIcon_LeaderUnitUpdate(frame.listener.unit,frame);
end

function TGUnitLeaderIcon_LeaderUnitUpdate(unit,frame)
    --TGUFDebug("TGUnitLeaderIcon_LeaderUnitUpdate: "..unit.unit);
    if (unit.leader) then
        frame:Show();
    else
        frame:Hide();
    end
end

local TGUnitLeaderIconTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitLeaderIcon",
    template = "TGUnitLeaderIconTemplate",
    constructor = TGUnitLeaderIcon_NewTGUnitLeaderIcon,
    destructor = TGUnitLeaderIcon_DestroyTGUnitLeaderIcon,
    index = 0,
    pool = {},
    attributes =
    {
    }
}
TGUnitFrames_RegisterObject(TGUnitLeaderIconTemplate_ObjectInfo);
