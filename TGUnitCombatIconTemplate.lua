function TGUnitCombatIcon_NewTGUnitCombatIcon(frame,parentFrame,attributes)
    -- Set the unit info
    frame.unitChanged = TGUnitCombatIcon_UnitChanged;
    frame.combatUnitUpdate = TGUnitCombatIcon_CombatUnitUpdate;
    table.insert(frame.listener.combat,frame);
    
    -- Update the frame
    frame:Show();
    
    -- Return the frame
    return frame;
end

function TGUnitCombatIcon_DestroyTGUnitCombatIcon(frame)
    for k,v in pairs(frame.listener.combat) do
        if (v == frame) then
            table.remove(frame.listener.combat,k);
            return;
        end
    end
end

function TGUnitCombatIcon_UnitChanged(frame)
    TGUnitCombatIcon_CombatUnitUpdate(frame.listener.unit,frame);
end

function TGUnitCombatIcon_CombatUnitUpdate(unit,frame)
    --TGUFDebug("TGUnitCombatIcon_CombatUnitUpdate: "..unit.unit);
    if (unit.combat) then
        frame:Show();
    else
        frame:Hide();
    end
end

local TGUnitCombatIconTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitCombatIcon",
    template = "TGUnitCombatIconTemplate",
    constructor = TGUnitCombatIcon_NewTGUnitCombatIcon,
    destructor = TGUnitCombatIcon_DestroyTGUnitCombatIcon,
    index = 0,
    pool = {},
    attributes =
    {
    }
}
TGUnitFrames_RegisterObject(TGUnitCombatIconTemplate_ObjectInfo);
