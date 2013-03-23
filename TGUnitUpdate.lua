function TGUF_UpdateUnitGeneric(unit,exists,existsChanged,field,func)
	-- newVal, changed = TGUF_UpdateUnitName(TGUFUnit,field,func)
	if (exists) then
		local newVal = func(unit.unit);
		local changed = (newVal ~= unit[field]);
		if (changed) then
			unit[field] = newVal;
		end
		return newVal, changed;
	elseif (existsChanged) then
		return nil, true;
	end
	
	return nil, false;
end

function TGUF_UpdateUnitGenericX1(unit,exists,existsChanged,field,subField,func)
	-- newVal, changed = TGUF...
	if (exists) then
		local newVal = func(unit.unit);
		local changed = (newVal ~= unit[field][subField]);
		if (changed) then
			unit[field][subField] = newVal;
		end
		return newVal, changed;
	elseif (existsChanged) then
		return nil, true;
	end
	
	return nil, false;
end

function TGUF_UpdateUnitGenericX2(unit,exists,existsChanged,field,subField1,subField2,func)
	-- newVal1, newVal2, changed = TGUF...
	if (exists) then
		local newVal1, newVal2 = func(unit.unit);
		local changed = (newVal1 ~= unit[field][subField1] or
						 newVal2 ~= unit[field][subField2]);
		if (changed) then
			unit[field][subField1] = newVal1;
			unit[field][subField2] = newVal2;
		end
		return newVal1, newVal2, changed;
	elseif (existsChanged) then
		return nil, nil, true;
	end
	
	return nil, nil, false;
end

function TGUF_UpdateUnitExists(unit)
	local newVal = UnitExists(unit.unit);
	local changed = (newVal ~= unit.exists);
	if (changed) then
		unit.exists = newVal;
	end
	
	return newVal, changed;
end

function TGUF_UpdateIsPlayerTarget(unit,exists,existsChanged)
	-- isPlayerTarget, changed = TGUF_UpdateIsPlayerTarget(TGUFUnit)
	if (exists) then
		-- The unit exists
		local isPlayerTarget;
		
		if (UnitIsUnit(unit.unit,"target")) then
			isPlayerTarget = true;
		else
			isPlayerTarget = false;
		end
		local changed = (isPlayerTarget ~= unit.isPlayerTarget);
		if (changed) then
			unit.isPlayerTarget = isPlayerTarget;
		end
		return isPlayerTarget,isPlayerTargetChanged;
	elseif (existsChanged) then
		-- The unit no longer exists
		unit.isPlayerTarget = nil;
		return nil, true;
	end

	-- The unit doesn't exist
	return nil, false;
end

function TGUF_UpdateComboPoints(unit,exists,existsChanged)
	if (exists) then
		local newComboPoints;
		if (unit.isPlayerTarget) then
			newComboPoints = GetComboPoints("player");
		else
			newComboPoints = 0;
		end
		local changed = (newComboPoints ~= unit.comboPoints);
		if (changed) then
			unit.comboPoints = newComboPoints;
		end
		return newComboPoints, changed;	
	elseif (existsChanged) then
		unit.comboPoints = nil;
		return nil, true;
	end
	
	return nil, false;
end

function TGUF_UpdateUnitName(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"name",UnitName);
end

function TGUF_UpdateUnitClass(unit,exists,existsChanged)
	return TGUF_UpdateUnitGenericX2(unit,exists,existsChanged,"class","localizedClass","englishClass",UnitClass);
end

function TGUF_UpdateUnitHealth(unit,exists,existsChanged)
	return TGUF_UpdateUnitGenericX1(unit,exists,existsChanged,"health","current",UnitHealth);
end

function TGUF_UpdateUnitHealthMax(unit,exists,existsChanged)
	return TGUF_UpdateUnitGenericX1(unit,exists,existsChanged,"health","max",UnitHealthMax);
end

function TGUF_UpdateUnitManaType(unit,exists,existsChanged)
	return TGUF_UpdateUnitGenericX1(unit,exists,existsChanged,"mana","type",UnitPowerType);
end

function TGUF_UpdateUnitMana(unit,exists,existsChanged)
	return TGUF_UpdateUnitGenericX1(unit,exists,existsChanged,"mana","current",UnitMana);
end

function TGUF_UpdateUnitManaMax(unit,exists,existsChanged)
	return TGUF_UpdateUnitGenericX1(unit,exists,existsChanged,"mana","max",UnitManaMax);
end

function TGUF_UpdateUnitSpell(unit,exists,existsChanged)
	-- casting, changed = TGUF_UpdateUnitSpell(TGUFUnit)
	if (exists) then
		local newSpell, newRank, newDisplayName, newTexture;
		local newStartTime, newEndTime, newIsTradeSkill;
		local newType;
	
		newSpell,
		newRank,
		newDisplayName,
		newTexture,
		newStartTime,
		newEndTime,
		newIsTradeSkill = UnitCastingInfo(unit.unit);
	
		if (newSpell ~= nil) then
			newType = "Casting";
		else
			newSpell,
			newRank,
			newDisplayName,
			newTexture,
			newStartTime,
			newEndTime,
			newIsTradeSkill = UnitChannelInfo(unit.unit)
		
			if (newSpell ~= nil) then
				newType = "Channelling";
			else
				--[[
				if(unit.spell.type ~= nil) then
					TGUFDebug("Old spell type was "..unit.spell.type..", not casting anymore, unit = "..unit.unit..".");
				end
				]]
				newType         = nil;
				newSpell        = nil;
				newRank         = nil;
				newDisplayName  = nil;
				newTexture      = nil;
				newStartTime    = nil;
				newEndTime      = nil;
				newIsTradeSkill = nil;
			end
		end
	
		if (newStartTime ~= nil) then
			newStartTime = newStartTime / 1000.0;
		end
		if (newEndTime ~= nil) then
			newEndTime = newEndTime / 1000.0;
		end
	
		local changed = (newType ~= unit.spell.type or newSpell ~= unit.spell.spell
		  or newRank ~= unit.spell.rank or newDisplayName ~= unit.spell.displayName
		  or newTexture ~= unit.spell.texture or newStartTime ~= unit.spell.startTime
		  or newEndTime ~= unit.spell.endTime or newIsTradeSkill ~= unit.spell.isTradeSkill)
		if (changed) then
			unit.spell.type         = newType;
			unit.spell.spell        = newSpell;
			unit.spell.rank         = newRank;
			unit.spell.displayName  = newDisplayName;
			unit.spell.texture      = newTexture;
			unit.spell.startTime    = newStartTime;
			unit.spell.endTime      = newEndTime;
			unit.spell.isTradeSkill = newIsTradeSkill;
		end
	
		return (newType ~= nil), changed;
	elseif (existsChanged) then
		if (unit.spell.type ~= nil) then
		  	unit.spell.type           = nil;
		  	unit.spell.spell          = nil;
		  	unit.spell.rank           = nil;
		  	unit.spell.displayName    = nil;
		  	unit.spell.texture        = nil;
		  	unit.spell.startTime      = nil;
		  	unit.spell.endTime        = nil;
		  	unit.spell.isTradeSkill   = nil;
			TGUF_CAST_LIST[unit.unit] = nil;
			return false, true;
		end
	end
	
	return false, false;
end

function TGUF_UpdateUnitLevel(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"level",UnitLevel);
end

function TGUF_UpdateUnitCombat(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"combat",UnitAffectingCombat);
end

local buffCache    = {count=0,buff={}};
local buffsChanged = {};
for i=1,32 do
	buffCache.buff[i] = {};
	buffsChanged[i]   = false;
end
function TGUF_UpdateUnitBuffs(unit,exists,existsChanged)
	-- aBuffChanged, buffChangedArray = TGUF_UpdateUnitBuffs(TGUFUnit)
	if (exists) then
		local index;
		local buffChanged = false;
		for i=1,32 do
			index = i;
			buffCache.buff[i].name,
			buffCache.buff[i].rank,
			buffCache.buff[i].texture,
			buffCache.buff[i].applications,
			_,
			buffCache.buff[i].duration,
			buffCache.buff[i].expirationTime = UnitBuff(unit.unit,i);
			if (buffCache.buff[i].name == nil) then
				break;
			end
		end
		buffCache.count = index-1;
		for j=index+1,32 do
			buffCache.buff[j].name = nil;
			buffCache.buff[j].rank = nil;
			buffCache.buff[j].texture = nil;
			buffCache.buff[j].applications = nil;
			buffCache.buff[j].duration = nil;
			buffCache.buff[j].expirationTime = nil;
		end
		for i=1,32 do
			if(buffCache.buff[i].name ~= unit.buffs.buff[i].name
			  or buffCache.buff[i].rank ~= unit.buffs.buff[i].rank
			  or buffCache.buff[i].texture ~= unit.buffs.buff[i].texture
			  or buffCache.buff[i].applications ~= unit.buffs.buff[i].applications
			  or buffCache.buff[i].duration ~= unit.buffs.buff[i].duration
			  or buffCache.buff[i].expirationTime ~= unit.buffs.buff[i].expirationTime) then
				buffsChanged[i] = true;
				buffChanged = true;
			end
		end
		if (buffChanged) then
			local temp = unit.buffs;
			unit.buffs = buffCache;
			buffCache = temp;
		end
		return buffChanged, buffsChanged;
	elseif (existsChanged) then	
		for i=1,32 do
			if (unit.buffs.buff[i].name ~= nil) then
				buffsChanged[i] = true;
				buffChanged = true;
			end
			unit.buffs.buff[i].name           = nil;
			unit.buffs.buff[i].rank           = nil;
			unit.buffs.buff[i].texture        = nil;
			unit.buffs.buff[i].applications   = nil;
			unit.buffs.buff[i].type           = nil;
			unit.buffs.buff[i].duration       = nil;
			unit.buffs.buff[i].expirationTime = nil;
		end
		unit.buffs.count = 0;
		return buffChanged, buffsChanged;
	end
	
	return false, nil;
end

local debuffCache    = {count=0,debuff={}};
local debuffsChanged = {};
for i=1,32 do
	debuffCache.debuff[i] = {};
	debuffsChanged[i]     = false;
end
local debuffCounts = {Magic=0,Curse=0,Disease=0,Poison=0};
function TGUF_UpdateUnitDebuffs(unit,exists,existsChanged)
	-- aDebuffChanged, debuffChangedArray, debuffCountChanged = TGUF...
	if (exists) then
		local	debuffType;
		local	index;
		local	debuffChanged = false;
		debuffCounts.Magic = 0;
		debuffCounts.Curse = 0;
		debuffCounts.Disease = 0;
		debuffCounts.Poison = 0;
		for i=1,32 do
			index = i;
			debuffCache.debuff[i].name,
			debuffCache.debuff[i].rank,
			debuffCache.debuff[i].texture,
			debuffCache.debuff[i].applications,
			debuffType,
			debuffCache.debuff[i].duration,
			debuffCache.debuff[i].expirationTime = UnitDebuff(unit.unit,i);
			debuffCache.debuff[i].type = debuffType;
			if (debuffCache.debuff[i].name == nil) then
				break;
			elseif (debuffType ~= nil) then
				debuffCounts[debuffType] = debuffCounts[debuffType] + 1;
			end
		end
		debuffCache.count = index-1;
		for j=index+1,32 do
			debuffCache.debuff[j].name           = nil;
			debuffCache.debuff[j].rank           = nil;
			debuffCache.debuff[j].texture        = nil;
			debuffCache.debuff[j].applications   = nil;
			debuffCache.debuff[j].type           = nil;
			debuffCache.debuff[j].duration       = nil;
			debuffCache.debuff[j].expirationTime = nil;
		end
		for i=1,32 do
			if(debuffCache.debuff[i].name ~= unit.debuffs.debuff[i].name
			  or debuffCache.debuff[i].rank ~= unit.debuffs.debuff[i].rank
			  or debuffCache.debuff[i].texture ~= unit.debuffs.debuff[i].texture
			  or debuffCache.debuff[i].applications ~= unit.debuffs.debuff[i].applications
			  or debuffCache.debuff[i].type ~= unit.debuffs.debuff[i].type
			  or debuffCache.debuff[i].duration ~= unit.debuffs.debuff[i].duration
			  or debuffCache.debuff[i].expirationTime ~= unit.debuffs.debuff[i].expirationTime) then
				debuffsChanged[i] = true;
				debuffChanged = true;
			end
		end
		if (debuffChanged) then
			if (debuffCounts.Magic ~= unit.debuffCounts.Magic) then
				--TGUFMsg("magic1("..unit.unit.."): "..tostring(unit.debuffCounts.Magic).."->"..tostring(debuffCounts.Magic));
				debuffCountsChanged = true;
				unit.debuffCounts.Magic = debuffCounts.Magic;
			end
			if (debuffCounts.Curse ~= unit.debuffCounts.Curse) then
				--TGUFMsg("curse1("..unit.unit.."): "..tostring(unit.debuffCounts.Curse).."->"..tostring(debuffCounts.Curse));
				debuffCountsChanged = true;
				unit.debuffCounts.Curse = debuffCounts.Curse;
			end
			if (debuffCounts.Disease ~= unit.debuffCounts.Disease) then
				--TGUFMsg("disease1("..unit.unit.."): "..tostring(unit.debuffCounts.Disease).."->"..tostring(debuffCounts.Disease));
				debuffCountsChanged = true;
				unit.debuffCounts.Disease = debuffCounts.Disease;
			end
			if (debuffCounts.Poison ~= unit.debuffCounts.Poison) then
				--TGUFMsg("poison1("..unit.unit.."): "..tostring(unit.debuffCounts.Poison).."->"..tostring(debuffCounts.Poison));
				debuffCountsChanged = true;
				unit.debuffCounts.Poison = debuffCounts.Poison;
			end
	
			local	temp = unit.debuffs;
			unit.debuffs = debuffCache;
			debuffCache = temp;
			TGUFUnitDebug(unit.unit..".debuffs.count->"..tostring(unit.debuffs.count));
		end
		return debuffChanged, debuffsChanged, debuffCountsChanged;
	elseif (existsChanged) then
		for i=1,32 do
			if (unit.debuffs.debuff[i].name ~= nil) then
				debuffsChanged[i] = true;
				debuffChanged = true;
			end
			unit.debuffs.debuff[i].name           = nil;
			unit.debuffs.debuff[i].rank           = nil;
			unit.debuffs.debuff[i].texture        = nil;
			unit.debuffs.debuff[i].applications   = nil;
			unit.debuffs.debuff[i].type           = nil;
			unit.debuffs.debuff[i].duration       = nil;
			unit.debuffs.debuff[i].expirationTime = nil;
		end
		unit.debuffs.count = 0;
	
		if (unit.debuffCounts.Magic ~= 0 or unit.debuffCounts.Curse ~= 0 or
			unit.debuffCounts.Disease ~= 0 or unit.debuffCounts.Poison ~=0) then
			debuffCountsChanged = true;
		end
		unit.debuffCounts.Magic   = 0;
		unit.debuffCounts.Curse   = 0;
		unit.debuffCounts.Disease = 0;
		unit.debuffCounts.Poison  = 0;
		return debuffChanged, debuffsChanged, debuffCountsChanged;
	end

	return false, nil, false;
end

function TGUF_UnitReaction(unitID)
	if (UnitIsFriend(unitID,"player")) then
		return TGUF_REACTION_FRIENDLY;
	elseif (UnitIsEnemy(unitID,"player")) then
		return TGUF_REACTION_HOSTILE;
	end
	return TGUF_REACTION_NEUTRAL;
end

function TGUF_UpdateUnitReaction(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"reaction",TGUF_UnitReaction);	
end

function TGUF_UpdateUnitIsGroupLeader(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"leader",UnitIsGroupLeader);
end

function TGUF_UpdateUnitRaidIcon(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"raidIcon",GetRaidTargetIndex);
end

function TGUF_UnitIsNPC(unitID)
	return not UnitIsPlayer(unitID);
end

function TGUF_UpdateUnitIsNPC(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"npc",TGUF_UnitIsNPC);
end

function TGUF_UnitClassification(unitID)
	return TGUF_STRING_TO_CLASSIFICATION_TABLE[UnitClassification(unitID)];
end

function TGUF_UpdateUnitClassification(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"classification",TGUF_UnitClassification);
end

function TGUF_UnitPVPStatus(unitID)
	if (UnitIsPVPFreeForAll(unitID)) then
		return TGUF_PVP_FFA_FLAGGED;
	elseif (UnitIsPVP(unitID)) then
		return TGUF_PVP_FLAGGED;
	end
	return TGUF_PVP_NONE;
end

function TGUF_UpdateUnitPVPStatus(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"pvpStatus",TGUF_UnitPVPStatus);
end

function TGUF_UnitLiving(unitID)
	if (UnitIsGhost(unitID)) then
		return TGUF_LIVING_GHOST;
	elseif (UnitIsDead(unitID)) then
		return TGUF_LIVING_DEAD;
	end
	return TGUF_LIVING_ALIVE;
end

function TGUF_UpdateUnitLiving(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"living",TGUF_UnitLiving);
end

function TGUF_UnitTapped(unitID)
	if (UnitIsTappedByPlayer(unitID)) then
		return TGUF_TAPPED_PLAYER;
	elseif (UnitIsTapped(unitID)) then
		return TGUF_TAPPED_OTHER;
	end
	return TGUF_TAPPED_NONE;
end

function TGUF_UpdateUnitTapped(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"tapped",TGUF_UnitTapped);
end

function TGUF_UpdateUnitIsVisible(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"isVisible",UnitIsVisible);
end

function TGUF_UnitInHealingRange(unitID)
	if (TGUF_HEALING_SPELL ~= nil) then
		local val = IsSpellInRange(TGUF_HEALING_SPELL,unitID);
		if (val == 0) then
			return nil;
		end
		return val;
	end
	return nil;
end

function TGUF_UpdateUnitInHealingRange(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"inHealingRange",TGUF_UnitInHealingRange);
end

function TGUF_UpdateUnitCreatureType(unit,exists,existsChanged)
	return TGUF_UpdateUnitGeneric(unit,exists,existsChanged,"creatureType",UnitCreatureType);
end

function TGUF_UpdateUnitThreat(unit,exists,existsChanged)
	if (exists) then
		local isTanking, status, threatPct, rawThreatPct, threatValue = UnitDetailedThreatSituation("player",unit.unit);
		local changed = (isTanking ~= unit.threat.isTanking
			or status ~= unit.threat.status
			or threatPct ~= unit.threat.threatPct
			or rawThreatPct ~= unit.threat.rawThreatPct
			or threatValue ~= unit.threat.threatValue);
		if (changed) then
			unit.threat.isTanking    = isTanking;
			unit.threat.status       = status;
			unit.threat.threatPct    = threatPct;
			unit.threat.rawThreatPct = rawThreatPct;
			unit.threat.threatValue  = threatValue;
		end
		return changed;	
	elseif (existsChanged) then	
		unit.threat.isTanking    = nil;
		unit.threat.status       = nil;
		unit.threat.threatPct    = nil;
		unit.threat.rawThreatPct = nil;
		unit.threat.threatValue  = nil;
		return true;
	end

	return false;
end
