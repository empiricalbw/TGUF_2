function TGUnitCastIcon_NewTGUnitCastIcon(frame,parentFrame,attributes)
	-- Set the unit info
	frame.unitChanged = TGUnitCastIcon_UnitChanged;
	frame.spellUnitUpdate = TGUnitCastIcon_SpellUnitUpdate;
	frame.backgroundColor = attributes.backgroundColor;
	table.insert(frame.listener.spell,frame);
	
	-- Update the frame
	frame:Show();
	
	-- Return the frame
	return frame;
end

function TGUnitCastIcon_DestroyTGUnitCastIcon(frame)
	for k,v in pairs(frame.listener.spell) do
		if (v == frame) then
			table.remove(frame.listener.spell,k);
			return;
		end
	end
end

function TGUnitCastIcon_UnitChanged(frame)
	TGUnitCastIcon_SpellUnitUpdate(frame.listener.unit,frame);
end

function TGUnitCastIcon_SpellUnitUpdate(unit,frame)
	--TGUFDebug("TGUnitCastIcon_SpellUnitUpdate");
	local	spell = unit.spell;
	local	barIcon	 = _G[frame:GetName().."Icon"];
	if (spell.type ~= nil) then
		barIcon:SetTexture(spell.texture);
		frame:Show();
	else
		if (frame.backgroundColor) then
			barIcon:SetTexture(frame.backgroundColor.r,frame.backgroundColor.g,frame.backgroundColor.b,frame.backgroundColor.a);
		else
			frame:Hide();
		end
	end
end

local TGUnitCastIconTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitCastIcon",
	template = "TGUnitCastIconTemplate",
	constructor = TGUnitCastIcon_NewTGUnitCastIcon,
	destructor = TGUnitCastIcon_DestroyTGUnitCastIcon,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "backgroundColor", type = "color", default = {r=0,g=0,b=0,a=1}, newValue = {r=0,g=0,b=0,a=1}, required = false}
	}
}
TGUnitFrames_RegisterObject(TGUnitCastIconTemplate_ObjectInfo);