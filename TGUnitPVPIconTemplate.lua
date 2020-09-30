function TGUnitPVPIcon_NewTGUnitPVPIcon(frame,parentFrame,attributes)
    -- Set the unit info
    frame.unitChanged         = TGUnitPVPIcon_UnitChanged
    frame.pvpStatusUnitUpdate = TGUnitPVPIcon_PVPUnitUpdate
    table.insert(frame.listener.pvpStatus,frame)
    
    -- Update the frame
    frame:Show()
    
    -- Return the frame
    return frame
end

function TGUnitPVPIcon_DestroyTGUnitPVPIcon(frame)
    for k,v in pairs(frame.listener.pvpStatus) do
        if (v == frame) then
            table.remove(frame.listener.pvpStatus,k)
            return
        end
    end
end

function TGUnitPVPIcon_UnitChanged(frame)
    TGUnitPVPIcon_PVPUnitUpdate(frame.listener.unit,frame)
end

function TGUnitPVPIcon_PVPUnitUpdate(unit,frame)
    if (unit.pvpStatus ~= TGUF_PVP_NONE) then
        frame:Show()
    else
        frame:Hide()
    end
end

local TGUnitPVPIconTemplate_ObjectInfo =
{
    type        = "Frame",
    name        = "TGUnitPVPIcon",
    template    = "TGUnitPVPIconTemplate",
    constructor = TGUnitPVPIcon_NewTGUnitPVPIcon,
    destructor  = TGUnitPVPIcon_DestroyTGUnitPVPIcon,
    index       = 0,
    pool        = {},
    attributes =
    {
    }
}
TGUnitFrames_RegisterObject(TGUnitPVPIconTemplate_ObjectInfo)
