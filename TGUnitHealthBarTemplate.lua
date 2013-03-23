TGUF_HEALTH_BORDER_CASTING = "Interface\\CastingBar\\UI-CastingBar-Border-Small";

function TGUnitHealthBar_NewTGUnitHealthBar(frame,parentFrame,attributes)
	-- Set the unit info
	frame.unitChanged = TGUnitHealthBar_UnitChanged;
	frame.healthUnitUpdate = TGUnitHealthBar_HealthUnitUpdate;
	frame.tappedUnitUpdate = TGUnitHealthBar_HealthUnitUpdate;
	table.insert(frame.listener.health,frame);
	table.insert(frame.listener.tapped,frame);
	
	-- Set up the display
	frame.barColor = attributes.barColor;
	if (attributes.colorFollowsHealth ~= nil) then
		frame.colorFollowsHealth = attributes.colorFollowsHealth;
	else
		frame.colorFollowsHealth = true;
	end
	frame.barHighThresholdColor = attributes.barHighThresholdColor;
	frame.barHighThreshold = attributes.barHighThreshold/100;
	frame.barLowThresholdColor = attributes.barLowThresholdColor;
	frame.barLowThreshold = attributes.barLowThreshold/100;
	frame.barColor = attributes.barColor;
	frame.tappedColor = attributes.tappedColor;
	TGUnitHealthBar_AdjustBorder(frame,attributes);
	frame:SetStatusBarTexture(attributes.texture);
	frame:Show();
	
	-- Return the frame
	return frame;
end

function TGUnitHealthBar_DestroyTGUnitHealthBar(frame)
	for k,v in pairs(frame.listener.health) do
		if (v == frame) then
			table.remove(frame.listener.health,k);
			return;
		end
	end
	for k,v in pairs(frame.listener.tapped) do
		if (v == frame) then
			table.remove(frame.listener.tapped,k);
			return;
		end
	end
end

function TGUnitHealthBar_UnitChanged(frame)
	TGUnitHealthBar_HealthUnitUpdate(frame.listener.unit,frame);
end

function TGUnitHealthBar_AdjustBorder(frame,attributes)
	local frameBorder = _G[frame:GetName().."Border"];
	if (attributes.border == TGUF_HEALTH_BORDER_CASTING) then
		frameBorder:SetWidth(197*frame:GetWidth()/150);
		frameBorder:SetHeight(49*frame:GetHeight()/10);
		frameBorder:ClearAllPoints();
		frameBorder:SetPoint("TOP", frame, "TOP", 0, 20*frame:GetHeight()/10);
	else
		--TGUFDebug("Unrecognized healthbar border.");
	end
	if (attributes.border ~= nil) then
		frameBorder:SetTexture(attributes.border);
		frameBorder:Show();
	else
		frameBorder:Hide();
	end
end

function TGUnitHealthBar_HealthUnitUpdate(unit,frame)
	if (unit.exists) then
		--TGUFDebug("TGUnitHealthBar_HealthUnitUpdate");
		local	r,g,b,a;
		local	max = unit.health.max;
		local	curr = unit.health.current;
		
		if (frame.tappedColor ~= nil and unit.tapped == TGUF_TAPPED_OTHER) then
			r = frame.tappedColor.r;
			g = frame.tappedColor.g;
			b = frame.tappedColor.b;
			a = frame.tappedColor.a;
		elseif (frame.colorFollowsHealth) then
			local	p = curr/max;
			local	t;
			if (p <= frame.barLowThreshold) then
				-- Health is between 0% and barLowThreshold
				r = frame.barLowThresholdColor.r;
				g = frame.barLowThresholdColor.g;
				b = frame.barLowThresholdColor.b;
				a = frame.barLowThresholdColor.a;
			elseif (p <= frame.barHighThreshold) then
				-- Health is between barLowThreshold and barHighThreshold
				-- We want to have:
				--	t = percentage of the way through this section = (p - low)/(high - low)
				--	r = low.r + (high.r - low.r)*t
				t = (p - frame.barLowThreshold)/(frame.barHighThreshold - frame.barLowThreshold);
				r = frame.barLowThresholdColor.r + (frame.barHighThresholdColor.r - frame.barLowThresholdColor.r)*t;
				g = frame.barLowThresholdColor.g + (frame.barHighThresholdColor.g - frame.barLowThresholdColor.g)*t;
				b = frame.barLowThresholdColor.b + (frame.barHighThresholdColor.b - frame.barLowThresholdColor.b)*t;
				a = frame.barLowThresholdColor.a + (frame.barHighThresholdColor.a - frame.barLowThresholdColor.a)*t;
			elseif (p < 1) then
				-- Health is between barHighThreshold and 100%
				t = (p - frame.barHighThreshold)/(1 - frame.barHighThreshold);
				r = frame.barHighThresholdColor.r + (frame.barColor.r - frame.barHighThresholdColor.r)*t;
				g = frame.barHighThresholdColor.g + (frame.barColor.g - frame.barHighThresholdColor.g)*t;
				b = frame.barHighThresholdColor.b + (frame.barColor.b - frame.barHighThresholdColor.b)*t;
				a = frame.barHighThresholdColor.a + (frame.barColor.a - frame.barHighThresholdColor.a)*t;
			else
				-- Health is at (or above!) 100%
				r = frame.barColor.r;
				g = frame.barColor.g;
				b = frame.barColor.b;
				a = frame.barColor.a;
			end
		else
			r = frame.barColor.r;
			g = frame.barColor.g;
			b = frame.barColor.b;
			a = frame.barColor.a;
		end
		
		frame:SetStatusBarColor(r,g,b,a);
		frame:SetMinMaxValues(0,max);
		frame:SetValue(curr);
	end
end

local TGUnitHealthBarTemplate_ObjectInfo =
{
	type = "StatusBar",
	name = "TGUnitHealthBar",
	template = "TGUnitHealthBarTemplate",
	constructor = TGUnitHealthBar_NewTGUnitHealthBar,
	destructor = TGUnitHealthBar_DestroyTGUnitHealthBar,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "texture", type = "string", default = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg", newValue = "", required = false},
		{name = "border", type = "string", default = "Interface\\CastingBar\\UI-CastingBar-Border-Small", newValue = "", required = false},
		{name = "barColor", type = "color", default = {r=0, g=1, b=0, a=1}, newValue = {r=0, g=1, b=0, a=1}, required = true},
		{name = "colorFollowsHealth", type = "boolean", default = true, newValue = true, required = false},
		{name = "barHighThresholdColor", type = "color", default = {r=1, g=1, b=0, a=1}, newValue = {r=1, g=1, b=0, a=1}, required = true},
		{name = "barHighThreshold", type = "integer", default = 60, newValue = 60, required = true},
		{name = "barLowThresholdColor", type = "color", default = {r=1, g=0, b=0, a=1}, newValue = {r=1, g=0, b=0, a=1}, required = true},
		{name = "barLowThreshold", type = "integer", default = 30, newValue = 30, required = true},
		{name = "tappedColor", type = "color", default = {r=0.5,g=0.5,b=0.5,a=1}, newValue = {r=0.5,g=0.5,b=0.5,a=1}, required = false}
	}
}
TGUnitFrames_RegisterObject(TGUnitHealthBarTemplate_ObjectInfo);