--[[
	Creates a new TGUnitProcTemplate.
]]
function TGUnitProc_NewTGUnitProc(frame,parentFrame,attributes)
	-- Create a new TGUnitProc
	frame.unitChanged = TGUnitProc_UnitChanged;
	frame.procName = attributes.procName;
	frame.procType = attributes.procType;
	frame.procTexture = "Interface\\CharacterFrame\\TempPortrait";
	frame.cooldown = attributes.cooldown;
	frame.buffTooltipAnchor = attributes.buffTooltipAnchor;
	
	-- Register for the appropriate notifications
	if (attributes.procType == "Buff-Present" or attributes.procType == "Buff-Absent") then
		table.insert(frame.listener.anyBuff,frame);
		frame.anyBuffUnitUpdate = TGUnitProc_BuffUnitUpdate;
	elseif (attributes.procType == "Debuff-Present" or attributes.procType == "Debuff-Absent") then
		table.insert(frame.listener.anyDebuff,frame);
		frame.anyDebuffUnitUpdate = TGUnitProc_BuffUnitUpdate;
	elseif (attributes.procType == "Ability-Available" or attributes.procType == "Ability-CoolingDown") then
		frame.procType = "Ability";
	end
	if (attributes.procType == "Buff-Absent" or attributes.procType == "Debuff-Absent") then
		frame.cooldown = false;
	end
	
	-- Scan the spellbook for an appropriate texture
	local tempTexture = GetSpellTexture(frame.procName);
	if tempTexture ~= nil then
		frame.procTexture = tempTexture;
	end
	
	-- Set up the frame
	local	countFrame = _G[frame:GetName().."ChildCount"];
	local	showNumber = true;
	if (attributes.displayNumber ~= nil) then
		showNumber = attributes.displayNumber;
	end
	frame.displayNumber = showNumber;
	if (showNumber) then
		local	font = "Fonts\\ARIALN.TTF";
		--local	fontSize = 11*(countFrame:GetTop() - countFrame:GetBottom())/16;
		local	fontFlags = nil;
		local	fontSize = 11*(countFrame:GetHeight())/16;
		local	alignH = "RIGHT";
		local	alignV = "BOTTOM";
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

function TGUnitProc_UnitChanged(frame)
	TGUnitProc_BuffUnitUpdate(frame.listener.unit,frame)
end

function TGUnitProc_DestroyTGUnitProc(frame)
	local	listener = nil;
	if (frame.procType == "Buff-Present" or frame.procType == "Buff-Absent") then
		listener = frame.listener.anyBuff;
	elseif (frame.procType == "Debuff-Present" or frame.procType == "Debuff-Absent") then
		listener = frame.listener.anyDebuff;
	end
	if listener ~= nil then
		for k,v in pairs(listener) do
			if (v == frame) then
				table.remove(listener,k);
				return;
			end
		end
	end
end

function TGUnitProcTemplate_OnEnter(frame)
	--[[
	local	dX = 0;
	local	dY = 0;
	if (frame.buffTooltipAnchor == "ANCHOR_BOTTOMRIGHT") then
		dX = 15;
		dY = -25;
	end
	GameTooltip:SetOwner(frame, frame.buffTooltipAnchor, dX, dY);
	if (frame.procType == "Buff-Present" or frame.procType == "Buff-Absent") then
		if (frame.listener.unit.unit == "template") then
			GameTooltip:SetText("Buff \""..frame.procName.."\"");
		else
			GameTooltip:SetUnitBuff(frame.listener.unit.unit, frame.buffIndex);
		end
	elseif (frame.procType == "Debuff-Present" or frame.procType == "Debuff-Absent") then
		if (frame.listener.unit.unit == "template") then
			GameTooltip:SetText("Debuff \""..frame.procName.."\"");
		else
			GameTooltip:SetUnitDebuff(frame.listener.unit.unit, frame.debuffIndex);
		end
	elseif (frame.procType == "Ability-Available") then
	elseif (frame.procType == "Ability-CoolingDown") then
	end
	]]
end

function TGUnitProcTemplate_OnLeave(frame)
	--[[
	GameTooltip:Hide();
	]]
end

function TGUnitProcTemplate_OnUpdate(frame)
	-- If we aren't an ability proc, then exit.
	if (frame.procType ~= "Ability") then
		return;
	end
	
	-- Get the cooldown information for the desired ability.
	local child = _G[frame:GetName().."Child"];
	local texture = _G[frame:GetName().."ChildIcon"];
	local count = _G[frame:GetName().."ChildCount"];
	local cooldown = _G[frame:GetName().."ChildCooldown"];
	local procStart, procDuration = GetSpellCooldown(frame.procName,BOOKTYPE_SPELL);
	if (procStart == nil or procDuration == nil) then
		return;
	end
	
	-- Set the texture.
	texture:SetTexture(frame.procTexture);
	count:Hide();
	
	-- Display the cooldown as requested.  If the cooldown is just the global cooldown,
	-- then don't display it.
	if (frame.cooldown and procStart > 0 and procDuration >= 1.5) then
		cooldown:SetCooldown(procStart,procDuration);
		cooldown:Show();
		texture:SetVertexColor(0.5,0.5,0.5,0.5);
	else
		cooldown:Hide();
		texture:SetVertexColor(1,1,1,1);
	end
	
	-- Show the texture.
	child:Show();
end

function TGUnitProc_BuffUnitUpdate(unit,frame)
	--TGUFDebug("TGUnitProc_BuffUnitUpdate");
	local	child = _G[frame:GetName().."Child"];
	local	texture = _G[frame:GetName().."ChildIcon"];
	local	count = _G[frame:GetName().."ChildCount"];
	
	-- Determine if the specified proc is present or absent.
	local	list;
	if (frame.procType == "Buff-Present" or frame.procType == "Buff-Absent") then
		list = unit.buffs.buff;
	else
		list = unit.debuffs.debuff;
	end
	local proc;
	if (frame.listener.unit.unit == "template") then
		proc = list[1];
	else
		for k,v in pairs(list) do
			if (v.name == frame.procName) then
				proc = v;
				break;
			end
		end
	end
	
	-- Determine what texture should be displayed.
	local procTexture;
	local procDuration;
	local procStart;
	local procApplications;
	if ((frame.procType == "Buff-Present" or frame.procType == "Debuff-Present") and proc ~= nil) then
		-- The desired buff/debuff is indeed present.
		procTexture = proc.texture;
		procDuration = proc.duration;
		procStart = proc.expirationTime - procDuration;
		procApplications = proc.applications;
	elseif ((frame.procType == "Buff-Absent" or frame.procType == "Debuff-Absent") and (proc == nil or frame.listener.unit.unit == "template")) then
		-- The desired buff/debuff is indeed absent.
		procTexture = frame.procTexture;
		procApplications = 0;
	end
	
	-- If we should hide it, do so and exit.
	if (procTexture == nil) then
		child:Hide();
		return;
	end
	
	-- Set the texture.
	texture:SetTexture(procTexture);
	if (frame.displayNumber) then
		if (procApplications > 1) then
			count:SetText(procApplications);
			count:Show();
		else
			count:Hide();
		end
	end
	
	-- Display the cooldown as requested.
	local cooldown = _G[frame:GetName().."ChildCooldown"];
	if (frame.cooldown and procStart > 0 and procDuration > 0) then
		cooldown:SetCooldown(procStart,procDuration);
		cooldown:Show();
	else
		cooldown:Hide();
	end
	
	-- Show the texture.
	child:Show();
end

local TGUnitProcTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitProc",
	template = "TGUnitProcTemplate",
	constructor = TGUnitProc_NewTGUnitProc,
	destructor = TGUnitProc_DestroyTGUnitProc,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "procName", type = "string", default = 1, newValue = 1, required = true},
		{name = "procType", type = "restricted-value", values = {"Buff-Present","Buff-Absent","Debuff-Present","Debuff-Absent","Ability"}, default = "Buff-Present", newValue = "Buff-Present", required = true},
		{name = "cooldown", type = "boolean", default = true, newValue = true, required = true},
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
TGUnitFrames_RegisterObject(TGUnitProcTemplate_ObjectInfo);
