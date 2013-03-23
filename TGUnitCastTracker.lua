local TGUF_PLAYER_CAST = {};
local TGUF_PLAYER_SPELLS = {};
local TGUF_CAST_INFO =	{	["Renew"] = {length = 15, texture = "Interface\\Icons\\Spell_Holy_Renew", tick = 3},
				["Rejuvenation"] = {length = 12, texture = "Interface\\Icons\\Spell_Nature_Rejuvenation", tick = 3},
				["Regrowth"] = {length = 21, texture = "Interface\\Icons\\Spell_Nature_ResistNature", tick = 3},
				["Shadow Word: Pain"] = {length = 18, texture = "Interface\\Icons\\Spell_Shadow_ShadowWordPain", tick = 3},
				["Vampiric Touch"] = {length = 15, texture = "Interface\\Icons\\Spell_Holy_Stoicism", tick = 3},
				["Power Infusion"] = {length = 15, texture = "Interface\\Icons\\Spell_Holy_PowerInfusion"},
				["Abolish Disease"] = {length = 20, texture = "Interface\\Icons\\Spell_Nature_NullifyDisease", tick = 5},
				["Immolate"] = {length = 15, texture = "Interface\\Icons\\Spell_Fire_Immolation", tick = 3},
				["Corruption"] = {length = 18, texture = "Interface\\Icons\\Spell_Shadow_AbominationExplosion", tick = 3},
				["Curse of Agony"] = {length = 24, texture = "Interface\\Icons\\Spell_Shadow_CurseOfSargeras", tick = 2},
				["Siphon Life"] = {length = 30, texture = "Interface\\Icons\\Spell_Shadow_Requiem", tick = 3},
				["Lacerate"] = {length = 15, texture = "Interface\\Icons\\Ability_Druid_Lacerate", tick = 3},
						};
local TGUF_PLAYER_CLASS = nil;
local MAX_SPELLS = 10;

function TGUnitCastTracker_OnAddonLoaded()
end

function TGUnitCastTracker_OnPlayerEnteringWorld()
	_,TGUF_PLAYER_CLASS = UnitClass("player");
	--[[
	if (TGUF_PLAYER_CLASS == "PRIEST") then
		for tab=1,GetNumTalentTabs() do
			for talent=1,GetNumTalents(tab) do
				local	name,icon,_,_,rank = GetTalentInfo(tab,talent);
				if (name == "Improved Shadow Word: Pain") then
					--TGUFMsg("Player has rank "..rank.." of Improved Shadow Word: Pain ("..icon..")");
					TGUF_CAST_INFO["Shadow Word: Pain"].length = TGUF_CAST_INFO["Shadow Word: Pain"].length + 3*rank;
				end
			end
		end
	end
	]]
end

function TGUnitCastTracker_OnSpellcastSent(event,unit)
	if (arg1 == "player") then
		TGUF_PLAYER_CAST.unit = arg1;
		TGUF_PLAYER_CAST.spellName = arg2;
		TGUF_PLAYER_CAST.spellRank = arg3;
		TGUF_PLAYER_CAST.target = arg4;
		TGUF_PLAYER_CAST.resisted = false;
	end
end

function TGUnitCastTracker_OnSpellSucceeded(event,unit)
    if (arg1 ~= nil and arg1 == "player" and TGUF_PLAYER_CAST.spellName == arg2 and TGUF_PLAYER_CAST.resisted == false) then
		--DEFAULT_CHAT_FRAME:AddMessage("Player casted "..arg2.." ("..arg3..") on "..TGUF_PLAYER_CAST.target..".");
		
		local	castingInfo = TGUF_CAST_INFO[arg2];
		if (castingInfo ~= nil) then
			local	spellCast = nil;
			for k,v in pairs(TGUF_PLAYER_SPELLS) do
				if (v.spellName == TGUF_PLAYER_CAST.spellName and v.target == TGUF_PLAYER_CAST.target) then
					v.rank = TGUF_PLAYER_CAST.spellRank;
					v.lastStartTime = v.startTime;
					v.startTime = GetTime();
					spellCast = v;
					break;
				end
			end
			if (spellCast == nil) then
				spellCast = {spellName = TGUF_PLAYER_CAST.spellName, rank = TGUF_PLAYER_CAST.spellRank, target = TGUF_PLAYER_CAST.target, startTime = GetTime(), length = castingInfo.length};
				table.insert(TGUF_PLAYER_SPELLS,spellCast);
			end
			TGUnitCastTracker:Show();
			TGUnitCastTracker_OnUpdate();
		end
	end
end

function TGUnitCastTracker_OnUpdate()
	-- Start by removing any old spells from the casting list
	local	removedOne;
	local	currTime = GetTime();
	repeat
		removedOne = false;
		for k,v in pairs(TGUF_PLAYER_SPELLS) do
			if (v.startTime + v.length <= currTime) then
				table.remove(TGUF_PLAYER_SPELLS,k)
				removedOne = true;
				break;
			end
		end
	until(removedOne == false);
	
	-- If we have no more spells, we are done
	local	numSpells = #TGUF_PLAYER_SPELLS;
	if (numSpells == 0) then
		TGUnitCastTracker:Hide();
		return;
	end
	if (numSpells > MAX_SPELLS) then
		numSpells = MAX_SPELLS;
	end
	
	-- Okay, we need to display spells.
	for k=1,numSpells do
		local v = TGUF_PLAYER_SPELLS[k];
		
		-- Get the cast bar
		local	castInfo = TGUF_CAST_INFO[v.spellName];
		local	percent = (currTime - v.startTime)/v.length;
		if (percent > 1) then
			percent = 1;
		end
		local	castTrackerBar = _G["TGUnitCastTrackerBar"..k];
		if (castTrackerBar ~= nil) then
			local	castTrackerIcon = _G["TGUnitCastTrackerBar"..k.."IconTexture"];
			local	castTrackerBarFrame = _G["TGUnitCastTrackerBar"..k.."Bar"];
			local	castTrackerBarFrameText = _G["TGUnitCastTrackerBar"..k.."SizeFrameText"];
			local	castTrackerBarTexture = _G["TGUnitCastTrackerBar"..k.."BarTexture"];
			local	castTrackerBarSpark = _G["TGUnitCastTrackerBar"..k.."BarSpark"];
			castTrackerBar:Show();
			castTrackerIcon:SetTexture(castInfo.texture);
			castTrackerIcon:Show();
			castTrackerBarTexture:SetVertexColor(0.25,1,0.25,1);
			castTrackerBarFrameText:Show();
			castTrackerBarFrameText:SetText(v.target);
			
			local	sizeFrame = _G["TGUnitCastTrackerBar"..k.."SizeFrame"];
			local	realWidth = sizeFrame:GetWidth();
			--TGUFMsg(""..(1-percent)*realWidth);
			local	percentWidth = math.floor((1-percent)*realWidth + 0.5);
			if (percentWidth <= 0) then
				percentWidth = 1;
			end
			castTrackerBarFrame:SetWidth(percentWidth);
			
			local	elapsed = currTime - v.startTime;
			if (elapsed > 0.125 and castInfo.tick ~= nil) then
				local	modulo = (elapsed % castInfo.tick);
				if (modulo > castInfo.tick/2) then
					modulo = modulo - castInfo.tick;
				end
				modulo = modulo + 0.125;
				if (0 <= modulo and modulo < 0.5) then
					castTrackerBarSpark:SetAlpha(1-2*modulo);
				else
					castTrackerBarSpark:SetAlpha(0);
				end
			else
				castTrackerBarSpark:SetAlpha(0);
			end
		end
	end
	
	-- Hide others
	for k=numSpells+1,MAX_SPELLS do
		local	castTrackerBar = _G["TGUnitCastTrackerBar"..k];
		if (castTrackerBar ~= nil) then
			castTrackerBar:Hide();
		end
	end
	
	-- Finally set the height
	TGUnitCastTracker:SetHeight(11 + numSpells*15)
end

local failmsgs = {
	--[[
	resistmsg = string.gsub(SPELLRESISTSELFOTHER,"%%.-s","(.+)"),
	evademsg = string.gsub(SPELLEVADEDSELFOTHER,"%%.-s","(.+)"),
	immunemsg = string.gsub(SPELLIMMUNESELFOTHER,"%%.-s","(.+)"),
	reflectmsg = string.gsub(SPELLREFLECTSELFOTHER,"%%.-s","(.+)"),
	dodgemsg = string.gsub(SPELLDODGEDSELFOTHER,"%%.-s","(.+)"),
	parrymsg = string.gsub(SPELLPARRIEDSELFOTHER,"%%.-s","(.+)"),
	missmsg = string.gsub(SPELLMISSSELFOTHER,"%%.-s","(.+)"),
	absorbmsg = string.gsub(SPELLLOGABSORBSELFOTHER,"%%.-s","(.+)"),
	]]
}

function TGUnitCastTracker_OnChatMsgSpellSelfDamage(event,msg)
	local	_,spellname,target;
	local	currTime = GetTime();
	
	for index,value in pairs(failmsgs) do
		_,_,spellname,target = string.find(msg,value)
		if spellname then
			break
		end
	end
	if spellname and target then
		if TGUF_PLAYER_CAST.spellName == spellname and TGUF_PLAYER_CAST.target == target then
			TGUF_PLAYER_CAST.resisted = true;
		end
		for k,v in pairs(TGUF_PLAYER_SPELLS) do
			if spellname == v.spellName and target == v.target then
				if (v.lastStartTime == nil) then
					table.remove(TGUF_PLAYER_SPELLS,k);
				else
					v.startTime = v.lastStartTime;
				end
				break;
			end
		end
	end
end

function TGUnitMouseover_OnUpdate()
	-- This code is ripped from DiscordART :)
	local obj = GetMouseFocus();
	local text = "MouseOver: ";
	local label = TGUnitMouseoverText;

	if (obj and obj ~= WorldFrame and obj:GetName()) then
		text = text..obj:GetName();
		if (obj:GetParent()  and obj:GetParent() ~= WorldFrame and obj:GetParent():GetName() ) then
			text = text.."\nParent: "..obj:GetParent():GetName();
			if (obj:GetParent():GetParent() and obj:GetParent():GetParent() ~= WorldFrame and obj:GetParent():GetParent():GetName()) then
				text = text.."\nParent's Parent: "..obj:GetParent():GetParent():GetName();
			end
		end
	end

	if ( not string.find(text, "TGUnitMouseoverText") ) then
		label:SetText(text);
	else
		label:SetText("MouseOver: ");
	end
end

-- Register the TGUnit component
local TGUnitCastTrackerComponent = {
	["onSpellcastSent"] = TGUnitCastTracker_OnSpellcastSent,
	["onSpellcastSucceeded"] = TGUnitCastTracker_OnSpellSucceeded,
	["onChatMsgSpellSelfDamage"] = TGUnitCastTracker_OnChatMsgSpellSelfDamage,
	
	["onAddonLoaded"] = TGUnitCastTracker_OnAddonLoaded,
	["onPlayerEnteringWorld"] = TGUnitCastTracker_OnPlayerEnteringWorld
	};
TGUnitFrames_RegisterComponent(TGUnitCastTrackerComponent);
