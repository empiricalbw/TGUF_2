function TGUnitCastBar_NewTGUnitCastBar(frame,parentFrame,attributes)
	-- Set the unit info
	frame.unitChanged = TGUnitCastBar_UnitChanged;
	frame.hideIfInactive = attributes.hideIfInactive;
	frame.spellUnitUpdate = TGUnitCastBar_SpellUnitUpdate;
	table.insert(frame.listener.spell,frame);
	
	-- Set up the display
	local	barTexture = _G[frame:GetName().."Bar"];
	local	lagTexture = _G[frame:GetName().."Latency"];
	frame.castingColor = attributes.castingColor;
	frame.channellingColor = attributes.channellingColor;
	TGUnitCastBar_AdjustBorder(frame,attributes);
	barTexture:SetTexture(attributes.texture);
	lagTexture:SetTexture(attributes.texture);
	
	-- Return the frame
	return frame;
end

function TGUnitCastBar_DestroyTGUnitCastBar(frame)
	for k,v in pairs(frame.listener.spell) do
		if (v == frame) then
			table.remove(frame.listener.spell,k);
			return;
		end
	end
end

function TGUnitCastBar_UnitChanged(frame)
	TGUnitCastBar_SpellUnitUpdate(frame.listener.unit,frame)
end

function TGUnitCastBar_AdjustBorder(frame,attributes)
	local	frameBorder = _G[frame:GetName().."Border"];
	local	barSpark = _G[frame:GetName().."Spark"];
	local	sizeFrame = _G[frame:GetName().."SizeFrame"];
	--local	realHeight = (sizeFrame:GetTop() - sizeFrame:GetBottom());
	local	realHeight = sizeFrame:GetHeight();
	if (attributes.border == TGUF_HEALTH_BORDER_CASTING) then
		--local	realWidth = (sizeFrame:GetRight() - sizeFrame:GetLeft());
		local	realWidth = sizeFrame:GetWidth()
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

function TGUnitCastBar_SpellUnitUpdate(unit,frame)
	--TGUFDebug("TGUnitCastBar_SpellUnitUpdate");
	local	spell = unit.spell;
	local	barSpark = _G[frame:GetName().."Spark"];
	local	barTexture = _G[frame:GetName().."Bar"];
	local	lagTexture = _G[frame:GetName().."Latency"];
	if (spell.type ~= nil) then
		frame.startTime = spell.startTime;
		frame.endTime = spell.endTime;
		if (spell.type == "Casting") then
			if (frame.castingColor) then
				barTexture:SetVertexColor(frame.castingColor.r,frame.castingColor.g,frame.castingColor.b,frame.castingColor.a);
			else
				barTexture:SetVertexColor(1.0,0.7,0.0);
			end
			barTexture:Show();
			barSpark:Show();
			barSpark:SetAlpha(1.0);
			TGUnitCastBar_SetSparkPosition(frame,0);
		else
			if (frame.channellingColor) then
				barTexture:SetVertexColor(frame.channellingColor.r,frame.channellingColor.g,frame.channellingColor.b,frame.channellingColor.a);
			else
				barTexture:SetVertexColor(0.0,1.0,0.0);
			end
			barTexture:Show();
			barSpark:Show();
			barSpark:SetAlpha(0.0);
			TGUnitCastBar_SetSparkPosition(frame,1);
		end
		if (spell.timeDiff ~= nil) then
			if (spell.timeDiff > 0) then
				TGUnitCastBar_SetLatencyWidth(frame,spell.timeDiff/(spell.endTime - spell.startTime));
				if (spell.type == "Casting") then
					lagTexture:SetPoint("RIGHT");
				else
					lagTexture:SetPoint("LEFT");
				end
				lagTexture:SetVertexColor(0.5,0,0);
				lagTexture:Show();
			else
				lagTexture:Hide();
			end
		end
		frame:Show();
	else
		if (frame.hideIfInactive) then
			frame:Hide();
		else
			frame.startTime = 0;
			frame.endTime = 100;
			frame:Show();
			barTexture:Hide();
			barSpark:Hide();
			lagTexture:Hide();
		end
	end
end

function TGUnitCastBar_SetSparkPosition(frame,percent)
	local	barSpark = _G[frame:GetName().."Spark"];
	local	sizeFrame = _G[frame:GetName().."SizeFrame"];
	local	r = sizeFrame:GetRight();
	local	l = sizeFrame:GetLeft();
	if (r ~= nil and l ~= nil) then
		local	realWidth = (r - l);
		local	sparkPosition = percent*realWidth;
		if (percent > 1) then
			TGUFMsg("Percent = "..percent);
		end
		barSpark:SetPoint("CENTER", frame, "LEFT", sparkPosition, 0);
	end
end

function TGUnitCastBar_SetLatencyWidth(frame,percent)
	local	lagTexture = _G[frame:GetName().."Latency"];
	local	sizeFrame = _G[frame:GetName().."SizeFrame"];
	local	r = sizeFrame:GetRight();
	local	l = sizeFrame:GetLeft();
	if (r ~= nil and l ~= nil) then
		local	realWidth = (r - l);
		lagTexture:ClearAllPoints();
		lagTexture:SetPoint("TOP");
		lagTexture:SetPoint("BOTTOM");
		lagTexture:SetWidth(realWidth*percent);
	end
end

function TGUnitCastBar_OnUpdate(frame)
	-- If we aren't casting don't update
	local	spell = frame.listener.unit.spell;
	if (spell.type == nil) then
		return;
	end
	
	local	time = GetTime();
	if (time > frame.endTime) then
		time = frame.endTime;
	end
	if (time < frame.startTime) then
		time = frame.startTime;
	end
	
	local	percentDone = ((time - frame.startTime) / (frame.endTime - frame.startTime));
	if (spell.type == "Casting") then
		TGUnitCastBar_SetSparkPosition(frame,percentDone);
	elseif (spell.type == "Channelling") then
		TGUnitCastBar_SetSparkPosition(frame,1.0 - percentDone);
	end
end

local TGUnitCastBarTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitCastBar",
	template = "TGUnitCastBarTemplate",
	constructor = TGUnitCastBar_NewTGUnitCastBar,
	destructor = TGUnitCastBar_DestroyTGUnitCastBar,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "texture", type = "string", default = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg", newValue = "", required = true},
		{name = "border", type = "string", default = "Interface\\CastingBar\\UI-CastingBar-Border-Small", newValue = "", required = false},
		{name = "castingColor", type = "color", default = {r=1, g=0.7, b=0, a=1}, newValue = {r=1, g=0.7, b=0, a=1}, required = false},
		{name = "channellingColor", type = "color", default = {r=0, g=1, b=0, a=1}, newValue = {r=0, g=1, b=0, a=1}, required = false},
		{name = "hideIfInactive", type = "boolean", default = false, newValue = false, required = true}
	}
}
TGUnitFrames_RegisterObject(TGUnitCastBarTemplate_ObjectInfo);