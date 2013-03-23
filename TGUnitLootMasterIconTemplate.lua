function TGUnitLootMasterIcon_NewTGUnitLootMasterIcon(frame,parentFrame,attributes)
	-- Set the unit info
	frame.unitChanged = TGUnitLootMasterIcon_UnitChanged;
	frame.lootMasterUnitUpdate = TGUnitLootMasterIcon_LootMasterUnitUpdate;
	table.insert(frame.listener.lootMaster,frame);
	
	-- Update the frame
	frame:Show();
	
	-- Return the frame
	return frame;
end

function TGUnitLootMasterIcon_DestroyTGUnitLootMasterIcon(frame)
	for k,v in pairs(frame.listener.lootMaster) do
		if (v == frame) then
			table.remove(frame.listener.lootMaster,k);
			return;
		end
	end
end

function TGUnitLootMasterIcon_UnitChanged(frame)
	TGUnitLootMasterIcon_LootMasterUnitUpdate(frame.listener.unit,frame);
end

function TGUnitLootMasterIcon_LootMasterUnitUpdate(unit,frame)
	--TGUFDebug("TGUnitLootMasterIcon_LootMasterUnitUpdate: "..unit.unit);
	if (unit.lootMaster) then
		frame:Show();
	else
		frame:Hide();
	end
end

local TGUnitLootMasterIconTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitLootMasterIcon",
	template = "TGUnitLootMasterIconTemplate",
	constructor = TGUnitLootMasterIcon_NewTGUnitLootMasterIcon,
	destructor = TGUnitLootMasterIcon_DestroyTGUnitLootMasterIcon,
	index = 0,
	pool = {},
	attributes =
	{
	}
}
TGUnitFrames_RegisterObject(TGUnitLootMasterIconTemplate_ObjectInfo);