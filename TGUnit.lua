--[[
    This is a list of all the unit ID's that we are keeping track of.  The unit
    ID ("target","player","focus","raid12",etc...) is used as the key into the
    table and the value is the unit information for that unit.
]]
local TGUF_UNIT_LIST = {}

--[[
    This is a list of all the unit ID's that we are keeping track of that are
    currently casting.  The game interface doesn't always correctly generate
    spellcast stop events for some units, so we need to manually poll them to
    generate the spellcast stop events.
]]
TGUF_CAST_LIST = {}

--[[
    This is a list of all the unit ID's that need to be updated when the
    player's target changes.  These units are all of the form "target*".
]]
local TGUF_TARGET_CHANGED_LIST = {}

--[[
    This is a list of all the unit ID's that need to be updated when the
    player's focus changes.  These units are all of the form "focus*".
]]
local TGUF_FOCUS_CHANGED_LIST = {};

--[[
    This is a list of the different types of power that a unit can have as well
    as a reverse-lookup table used to convert UNIT_* events to the proper
    power type.
]]
TGUF_POWER_TYPE_LIST = {
    "Mana",
    "Rage",
    "Focus",
    "Energy",
    "Happiness"
}
local TGUF_EVENT_POWER_LIST = {
    ["MANA"]      = 0,
    ["RAGE"]      = 1,
    ["FOCUS"]     = 2,
    ["ENERGY"]    = 3,
    ["HAPPINESS"] = 4,
}
                            
--[[
    This is the period between poll updates for units that the game interface
    doesn't automatically generate events for, and some variables that get
    polled for periodically.
]]
local TGUF_POLL_RATE = 0.1 -- The delay between manual polls
local TGUF_LAST_POLL = 0   -- The time of the last manual poll
local TGUF_MASTER_LOOTER_UNIT = nil

--[[
    Bitmasks defining various attributes that we can poll.
]]
local TGUF_ISPLAYERTARGET = bit.lshift(1, 0)
local TGUF_COMBOPOINTS    = bit.lshift(1, 1)
local TGUF_NAME           = bit.lshift(1, 2)
local TGUF_CLASS          = bit.lshift(1, 3)
local TGUF_HEALTH         = bit.lshift(1, 4)
local TGUF_MANA           = bit.lshift(1, 5)
local TGUF_LEVEL          = bit.lshift(1, 6)
local TGUF_COMBAT         = bit.lshift(1, 7)
local TGUF_BUFFS          = bit.lshift(1, 8)
local TGUF_DEBUFFS        = bit.lshift(1, 9)
local TGUF_SPELL          = bit.lshift(1,10)
local TGUF_REACTION       = bit.lshift(1,11)
local TGUF_LEADER         = bit.lshift(1,12)
local TGUF_RAIDICON       = bit.lshift(1,13)
local TGUF_NPC            = bit.lshift(1,14)
local TGUF_CLASSIFICATION = bit.lshift(1,15)
local TGUF_PVPSTATUS      = bit.lshift(1,16)
local TGUF_LIVING         = bit.lshift(1,17)
local TGUF_TAPPED         = bit.lshift(1,18)
local TGUF_ISVISIBLE      = bit.lshift(1,19)
local TGUF_INHEALINGRANGE = bit.lshift(1,20)
local TGUF_CREATURETYPE   = bit.lshift(1,21)
local TGUF_THREAT         = bit.lshift(1,22)
local TGUF_LASTFLAG       = bit.lshift(1,23)

local TGUF_PLAYER_ALLFLAGS    = TGUF_LASTFLAG - 1
local TGUF_NONPLAYER_ALLFLAGS = TGUF_LASTFLAG - 1 - TGUF_SPELL

--[[
    This bitmask describes the set of attributes for which the game engine
    generates events notifying us of a change.  These events are generated only
    for the player.
]]
local TGUF_PLAYEREVENT_MASK = bit.bor(
                                TGUF_ISPLAYERTARGET,
                                TGUF_COMBOPOINTS,
                                TGUF_NAME,
                                TGUF_CLASS,
                                TGUF_HEALTH,
                                TGUF_MANA,
                                TGUF_LEVEL,
                                TGUF_COMBAT,
                                TGUF_BUFFS,
                                TGUF_DEBUFFS,
                                TGUF_THREAT)
local TGUF_PLAYERPOLL_MASK = bit.bor(
                                TGUF_REACTION,
                                TGUF_LEADER,
                                TGUF_RAIDICON,
                                TGUF_NPC,
                                TGUF_CLASSIFICATION,
                                TGUF_PVPSTATUS,
                                TGUF_LIVING,
                                TGUF_TAPPED,
                                TGUF_ISVISIBLE,
                                TGUF_INHEALINGRANGE,
                                TGUF_SPELL,
                                TGUF_CREATURETYPE)
if (bit.bor(TGUF_PLAYEREVENT_MASK,TGUF_PLAYERPOLL_MASK)
    ~= TGUF_PLAYER_ALLFLAGS) then
    error("TGUF_PLAYER flags mismatch")
end

--[[
    This bitmask describes the set of attributes for which the game engine
    generates events notifying us of a change for all of the non-player unit
    IDs which the game generates events for:

        target, focus, pet, mouseover, partX, raidX
]]
local TGUF_NONPLAYEREVENT_MASK = bit.bor(
                                TGUF_ISPLAYERTARGET,
                                TGUF_NAME,
                                TGUF_CLASS,
                                TGUF_HEALTH,
                                TGUF_MANA,
                                TGUF_LEVEL,
                                TGUF_BUFFS,
                                TGUF_DEBUFFS)
local TGUF_NONPLAYERPOLL_MASK = bit.bor(
                                TGUF_COMBOPOINTS,
                                TGUF_COMBAT,
                                TGUF_REACTION,
                                TGUF_LEADER,
                                TGUF_RAIDICON,
                                TGUF_NPC,
                                TGUF_CLASSIFICATION,
                                TGUF_PVPSTATUS,
                                TGUF_LIVING,
                                TGUF_TAPPED,
                                TGUF_ISVISIBLE,
                                TGUF_INHEALINGRANGE,
                                TGUF_CREATURETYPE,
                                TGUF_THREAT)
if (bit.bor(TGUF_NONPLAYEREVENT_MASK,TGUF_NONPLAYERPOLL_MASK)
    ~= TGUF_NONPLAYER_ALLFLAGS) then
    error("TGUF_NONPLAYER flags mismatch")
end

--[[
    This is the list of healing spells that we use for range testing on each
    class.
]]
local TGUF_HEALING_RANGE = {
    ["PRIEST"]  = "Heal",
    ["DRUID"]   = "Healing Touch",
    ["PALADIN"] = "Holy Light",
    ["SHAMAN"]  = "Healing Wave"
}
TGUF_HEALING_SPELL = nil

--[[
    This is the list of all unit ID's that the game interface will generate
    events for to update their statistics.  Any other units need to be manually
    polled.
    
    The game engine is supposed to generate TGUF_PLAYEREVENT_MASK events for
    these units, so we should not need to poll those attributes for these units.
]]
local TGUF_AUTO_UNITS = {
    "player",
    "pet",
    "target",
    --"focus",
    "mouseover",

    "party1", "party2", "party3", "party4",

    "raid1",  "raid2",  "raid3",  "raid4",  "raid5",
    "raid6",  "raid7",  "raid8",  "raid9",  "raid10",
    "raid11", "raid12", "raid13", "raid14", "raid15",
    "raid16", "raid17", "raid18", "raid19", "raid20",
    "raid21", "raid22", "raid23", "raid24", "raid25",
    "raid26", "raid27", "raid28", "raid29", "raid30",
    "raid31", "raid32", "raid33", "raid34", "raid35",
    "raid36", "raid37", "raid38", "raid39", "raid40"
}

--[[
    Reaction types.
]]
TGUF_REACTION_FRIENDLY = 0 -- Unit is "green", won't aggro
TGUF_REACTION_NEUTRAL  = 1 -- Unit is "yellow", won't aggro unless attacked
TGUF_REACTION_HOSTILE  = 2 -- Unit is "red", will aggro

--[[
    List of classification types.
]]
TGUF_CLASSIFICATION_NORMAL     = 0 -- Nothing special
TGUF_CLASSIFICATION_RARE       = 1 -- Rare!
TGUF_CLASSIFICATION_ELITE      = 2
TGUF_CLASSIFICATION_RARE_ELITE = 3
TGUF_CLASSIFICATION_BOSS       = 4
TGUF_STRING_TO_CLASSIFICATION_TABLE = {
    ["normal"]    = TGUF_CLASSIFICATION_NORMAL,
    ["rare"]      = TGUF_CLASSIFICATION_RARE,
    ["elite"]     = TGUF_CLASSIFICATION_ELITE,
    ["rareelite"] = TGUF_CLASSIFICATION_RARE_ELITE,
    ["worldboss"] = TGUF_CLASSIFICATION_BOSS
}

--[[
    List of PVP types.
]]
TGUF_PVP_NONE        = 0    -- Not flagged
TGUF_PVP_FLAGGED     = 1    -- PVP flagged
TGUF_PVP_FFA_FLAGGED = 2    -- PVP free-for-all flagged

--[[
    List of living types.
]]
TGUF_LIVING_ALIVE = 0       -- Unit is alive
TGUF_LIVING_DEAD  = 1       -- Unit is dead
TGUF_LIVING_GHOST = 2       -- Unit is a ghost

--[[
    List of tapped types.
]]
TGUF_TAPPED_NONE   = 0      -- Unit is not tapped
TGUF_TAPPED_PLAYER = 1      -- Unit is tapped by the player
TGUF_TAPPED_OTHER  = 2      -- Unit is tapped by someone else

--[[
    This is a template unit, used when the template editor is open so that the
    user can see various made-up stats.
]]
local TGUF_TEMPLATE_UNIT =
{
    unit           = "template",
    listeners      = {},
    exists         = true,
    isPlayerTarget = false,
    name           = "Abracadabra",
    class          = {localizedClass="Warrior",englishClass="WARRIOR"},
    creatureType   = "Humanoid",
    health         = {current=12000,max=12345},
    mana           = {type=0,current=12000,max=12345},
    spell          = {},
    level          = 60,
    combat         = true,
    leader         = true,
    lootMaster     = true,
    raidIcon       = 1,
    model          = nil,
    npc            = false,
    reaction       = TGUF_REACTION_FRIENDLY,
    classification = TGUF_CLASSIFICATION_ELITE,
    pvpStatus      = TGUF_PVP_FLAGGED,
    living         = TGUF_LIVING_ALIVE,
    tapped         = false,
    comboPoints    = 5,
    isVisible      = 1,
    inHealingRange = 1,
    threat         = {isTanking=false,status=1,threatPct=90,rawThreatPct=110,
                      threatValue=123400},
    buffs =
    {
        count = 32,
        buff =
        {
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=1,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=2,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=3,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=4,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=5,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=6,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=7,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=8,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=9,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=10,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=11,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=12,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=13,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=14,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=15,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=16,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=17,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=18,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=19,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=20,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=21,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=22,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=23,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=24,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=25,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=26,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=27,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=28,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=29,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=30,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=31,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=32,expirationTime=10,duration=-1}
        }
    },
    debuffs =
    {
        count = 32,
        debuff =
        {
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=1,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=2,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=3,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=4,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=5,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=6,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=7,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=8,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=9,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=10,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=11,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=12,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=13,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=14,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=15,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=16,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=17,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=18,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=19,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=20,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=21,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=22,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=23,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=24,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=25,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=26,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=27,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=28,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=29,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=30,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=31,expirationTime=10,duration=-1},
            {name="Test",texture="Interface\\CharacterFrame\\TempPortrait",
             applications=32,expirationTime=10,duration=-1}
        }
    },
    debuffCounts =
    {
        Magic   = 0,
        Curse   = 0,
        Disease = 0,
        Poison  = 0
    }
}

-- OnLoad work
function TGUnitComponent_OnAddonLoaded()
    -- Determine which spell we should use for healing range checks.
    local _,englishClass = UnitClass("player")
    TGUF_HEALING_SPELL = TGUF_HEALING_RANGE[englishClass]
end

--[[
    This creates a unit Listener object that will receive notifications when
    various events occur.  It is the responsibility of the caller to set
    callback functions for the various things they are interested in listening
    to.
]]
function TGUnitComponent_NewListener()
    local listener = {}
    
    listener.unit = nil
    listener.unitChanged = {}
    listener.exists = {}
    listener.isPlayerTarget = {}
    listener.name = {}
    listener.class = {}
    listener.creatureType = {}
    listener.health = {}
    listener.mana = {}
    listener.spell = {}
    listener.level = {}
    listener.combat = {}
    listener.leader = {}
    listener.lootMaster = {}
    listener.raidIcon = {}
    listener.model = {}
    listener.npc = {}
    listener.reaction = {}
    listener.classification = {}
    listener.pvpStatus = {}
    listener.living = {}
    listener.tapped = {}
    listener.comboPoints = {}
    listener.isVisible = {}
    listener.inHealingRange = {}
    listener.threat = {}
    listener.buffs = {{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
                      {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}}
    listener.anyBuff = {}
    listener.debuffs = {{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
                        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}}
    listener.anyDebuff = {}
    listener.debuffCounts = {}
    
    return listener
end

--[[
    This registers the specified listener object to listen for events from the
    specified unit.  If the listener was previously listening for events from a
    different unit, a UnitChanged event is dispatched.
]]
function TGUnitComponent_RegisterUnitListener(listener,newUnit)
    -- If the listener was listening to an old unit, remove it from the old
    -- unit's list of listeners.
    local oldUnit = listener.unit
    if oldUnit then
        for k,v in pairs(oldUnit.listeners) do
            if (v == listener) then
                table.remove(oldUnit.listeners,k)
                break
            end
        end
    end
    
    -- Add the listener to the new unit's list of listeners.
    listener.unit = newUnit
    table.insert(newUnit.listeners,listener)
    
    -- Dispatch a UnitChanged event if the unit ID changed.
    if (oldUnit ~= newUnit) then
        TGUnitComponent_UnitChanged(listener)
    end
end

--[[
    Notify listeners that the specified unit has changed.
]]
function TGUnitComponent_UnitChanged(listener)
    for k,v in pairs(listener.unitChanged) do
        v.unitChanged(v)
    end
end

--[[
    Given a unit ID, this function will either return the table that maintains
    the stats for that particular unit, or create a new table if this unit is
    not being tracked yet.
]]
function TGUnitComponent_NewUnit(unit)
    -- Sanity
    if (unit == nil) then
        return nil
    end
    if (unit == "template") then
        return TGUF_TEMPLATE_UNIT
    end
    
    -- If it already exists return it
    if (TGUF_UNIT_LIST[unit] ~= nil) then
        return TGUF_UNIT_LIST[unit]
    end
    
    -- Create the unit
    local theUnit = {}
    
    -- Determine which attributes need polling
    if (unit == "player") then
        theUnit.allFlags  = TGUF_PLAYER_ALLFLAGS
        theUnit.pollFlags = TGUF_PLAYERPOLL_MASK
    else
        theUnit.allFlags = TGUF_NONPLAYER_ALLFLAGS

        local autoUnit = false
        for _,v in pairs(TGUF_AUTO_UNITS) do
            if (v == unit) then
                autoUnit = true
                break
            end
        end
        if (autoUnit) then
            theUnit.pollFlags = TGUF_NONPLAYERPOLL_MASK
        else
            theUnit.pollFlags = TGUF_NONPLAYER_ALLFLAGS
        end
    end
    
    -- Initialize the rest of the unit
    theUnit.unit = unit
    theUnit.listeners = {}
    theUnit.exists = false
    theUnit.isPlayerTarget = nil
    theUnit.name = nil
    theUnit.class = {localizedClass=nil,englishClass=nil}
    theUnit.creatureType = nil
    theUnit.health = {current=nil,max=nil}
    theUnit.mana = {type=nil,current=nil,max=nil}
    theUnit.spell = {}
    theUnit.level = nil
    theUnit.combat = nil
    theUnit.leader = nil
    theUnit.lootMaster = (TGUF_MASTER_LOOTER_UNIT == unit)
    theUnit.raidIcon = nil
    theUnit.model = nil
    theUnit.npc = nil
    theUnit.reaction = nil
    theUnit.classification = nil
    theUnit.pvpStatus = nil
    theUnit.living = nil
    theUnit.tapped = nil
    theUnit.comboPoints = nil
    theUnit.isVisible = nil
    theUnit.inHealingRange = nil
    theUnit.threat = {isTanking=nil,status=nil,threatPct=nil,rawThreatPct=nil,
                      threatValue=nil}
    theUnit.buffs = {count=0,buff={}}
    for i=1,32 do
        theUnit.buffs.buff[i] = {}
    end
    theUnit.debuffs = {count=0,debuff={}}
    for i=1,32 do
        theUnit.debuffs.debuff[i] = {}
    end
    TGUF_UNIT_LIST[unit] = theUnit
    if (string.find(unit,"^target")) then
        TGUF_TARGET_CHANGED_LIST[unit] = theUnit
    end
    if (string.find(unit,"^focus")) then
        TGUF_FOCUS_CHANGED_LIST[unit] = theUnit;
    end
    theUnit.debuffCounts = {Magic=0,Curse=0,Disease=0,Poison=0}
    
    -- Update the unit
    TGUnitComponent_UpdateUnit(unit,theUnit.allFlags)
    TGUnitComponent_UpdateSpecialUnitsPeriodic()
    
    return theUnit
end

--[[
    This function is called to have the specified listener start watching the
    specified unit, replacing any previous listener that was watching it.
]]
function TGUnitComponent_WatchUnit(listener,newUnit)
    TGUnitComponent_RegisterUnitListener(listener,newUnit)
end

--[[
    This function is called periodically to poll all the units that need
    manual polling as well as to poll all the units that are casting a spell
    to see if the spellcast has completed.  In the future, the spellcast
    polling should actually be implemented as a min-heap and then we just
    need to poll the top element.
]]
function TGUnitComponent_OnPeriodicUpdate()
    -- Break out if it isn't time to poll yet.
    local   currTime = GetTime()
    if (currTime - TGUF_LAST_POLL <= TGUF_POLL_RATE) then
        return
    end
    
    -- Poll the elements of all units that require manual polling
    for _,v in pairs(TGUF_UNIT_LIST) do
        TGUnitComponent_UpdateUnit(v.unit,v.pollFlags)
    end
    
    -- Finally do any other periodic updates we need
    TGUnitComponent_UpdateSpecialUnitsPeriodic()
    
    -- Update for when we need to poll again
    TGUF_LAST_POLL = currTime
end

function TGUnitComponent_OnPlayerEnteringWorld()
    TGUnitComponent_ForceUpdate()
end

function TGUnitComponent_ForceUpdate()
    for _,v in pairs(TGUF_UNIT_LIST) do
        TGUnitComponent_UpdateUnit(v.unit,v.allFlags)
    end
    TGUnitComponent_UpdateSpecialUnitsPeriodic()
end

--[[
    Each listener for a particular unit can register to listen for
    notifications about any attribute change.  This registration is
    accomplished by inserting an object in the table for the attribute in
    question, X, that has a function of the name XUnitUpdate.  For instance,
    to listen for notifications about whether or not a unit is within healing
    range, you would do something like the following:
    
        obj.inHealingRangeUnitUpdate = MyInHealingRangeUpdateFunc
        table.insert(listener.inHealingRange,obj)
    
    Now, when the inHealingRange event fires, your MyInHealingRangeUpdateFunc
    will be called with obj as the only parameter.
]]
function TGUnitComponent_MarkUpdate(handler,unit,index)
    for _,listener in pairs(unit.listeners) do
        local   handlers
        if (index == nil and listener[handler] ~= nil) then
            handlers = listener[handler]
        elseif (index ~= nil and listener[handler][index] ~= nil) then
            handlers = listener[handler][index]
        end
        if handlers then
            for _,frame in pairs(handlers) do
                frame.updateYourself = true
                if (frame[handler.."UnitUpdate"]) then
                    frame[handler.."UnitUpdate"](unit,frame)
                else
                    TGUFMsg("No "..handler.."UnitUpdate")
                end
            end
        else
            TGUFMsg("No handlers for "..handler)
        end
    end
end

function btestmask(m1,m2)
    return (bit.band(m1,m2) ~= 0)
end

function TGUnitComponent_UpdateUnit(unit,flags)
    -- See if we are watching this unit
    local theUnit = TGUF_UNIT_LIST[unit]
    if (flags == nil) then
        TGUFMsg("Flags to TGUnitComponent_UpdateUnit was nil")
    end
    if (theUnit == nil) then
        return
    end
    
    -- Do existence check
    local newExists, existsChanged = TGUF_UpdateUnitExists(theUnit)
    
    -- Update isPlayerTarget
    local isPlayerTarget,isPlayerTargetChanged
    if (btestmask(flags,TGUF_ISPLAYERTARGET)) then
        isPlayerTarget,isPlayerTargetChanged =
            TGUF_UpdateIsPlayerTarget(theUnit,newExists,existsChanged)
    end
    
    -- Update combo points
    local newComboPoints, comboPointsChanged
    if (btestmask(flags,TGUF_COMBOPOINTS)) then
        newComboPoints, comboPointsChanged =
            TGUF_UpdateComboPoints(theUnit,newExists,existsChanged)
    end
            
    -- Update name
    local newName, nameChanged
    if (btestmask(flags,TGUF_NAME)) then
        newName, nameChanged =
            TGUF_UpdateUnitName(theUnit,newExists,existsChanged)
    end
    
    -- Update class
    local newClass, newEnglishClass, classChanged
    if (btestmask(flags,TGUF_CLASS)) then
        newClass, newEnglishClass, classChanged =
            TGUF_UpdateUnitClass(theUnit,newExists,existsChanged)
    end
    
    -- Update health
    local newHealthCurrent, currentHealthChanged
    local newHealthMax, maxHealthChanged
    local healthChanged
    if (btestmask(flags,TGUF_HEALTH)) then
        newHealthCurrent, currentHealthChanged =
            TGUF_UpdateUnitHealth(theUnit,newExists,existsChanged)
        newHealthMax, maxHealthChanged =
            TGUF_UpdateUnitHealthMax(theUnit,newExists,existsChanged)
        healthChanged = (currentHealthChanged or maxHealthChanged)
    end
    
    -- Update mana
    local newManaType, manaTypeChanged
    local newManaCurrent, manaCurrentChanged
    local newManaMax, manaMaxChanged
    local manaChanged
    if (btestmask(flags,TGUF_MANA)) then
        newManaType, manaTypeChanged =
            TGUF_UpdateUnitManaType(theUnit,newExists,existsChanged)
        newManaCurrent, manaCurrentChanged =
            TGUF_UpdateUnitMana(theUnit,newExists,existsChanged)
        newManaMax, manaMaxChanged =
            TGUF_UpdateUnitManaMax(theUnit,newExists,existsChanged)
        manaChanged = (manaTypeChanged or manaCurrentChanged or manaMaxChanged)
    end
    
    -- Update level
    local newLevel, levelChanged
    if (btestmask(flags,TGUF_LEVEL)) then
        newLevel, levelChanged =
            TGUF_UpdateUnitLevel(theUnit,newExists,existsChanged)
    end
    
    -- Update combat
    local newCombat, combatChanged
    if (btestmask(flags,TGUF_COMBAT)) then
        newCombat, combatChanged =
            TGUF_UpdateUnitCombat(theUnit,newExists,existsChanged)
    end
    
    -- Update buffs
    local aBuffChanged, buffsChanged
    if (btestmask(flags,TGUF_BUFFS)) then
        aBuffChanged, buffsChanged =
            TGUF_UpdateUnitBuffs(theUnit,newExists,existsChanged)
    end
    
    -- Update debuffs
    local aDebuffChanged, debuffsChanged, debuffCountsChanged
    if (btestmask(flags,TGUF_DEBUFFS)) then
        aDebuffChanged, debuffsChanged, debuffCountsChanged =
            TGUF_UpdateUnitDebuffs(theUnit,newExists,existsChanged)
    end
    
    -- Update spellcast
    local isCasting, spellChanged
    if (btestmask(flags,TGUF_SPELL)) then
        isCasting, spellChanged =
            TGUF_UpdateUnitSpell(theUnit,newExists,existsChanged)
        if (spellChanged) then
            if (isCasting) then
                TGUF_CAST_LIST[theUnit.unit] = theUnit
            else
                TGUF_CAST_LIST[theUnit.unit] = nil
            end
        end
    end
    
    -- Update reaction
    local newreaction, reactionChanged
    if (btestmask(flags,TGUF_REACTION)) then
        newreaction, reactionChanged =
            TGUF_UpdateUnitReaction(theUnit,newExists,existsChanged)
    end
    
    -- Update leader
    local newLeader, leaderChanged
    if (btestmask(flags,TGUF_LEADER)) then
        newLeader, leaderChanged =
            TGUF_UpdateUnitIsGroupLeader(theUnit,newExists,existsChanged)
    end
    
    -- Update raid icon
    local newRaidIcon, raidIconChanged
    if (btestmask(flags,TGUF_RAIDICON)) then
        newRaidIcon, raidIconChanged =
            TGUF_UpdateUnitRaidIcon(theUnit,newExists,existsChanged)
    end
    
    -- Update NPC
    local newNPC, npcChanged
    if (btestmask(flags,TGUF_NPC)) then
        newNPC, npcChanged =
            TGUF_UpdateUnitIsNPC(theUnit,newExists,existsChanged)
    end
    
    -- Update classification
    local newClassification, classificationChanged
    if (btestmask(flags,TGUF_CLASSIFICATION)) then
        newClassification,
        classificationChanged =
            TGUF_UpdateUnitClassification(theUnit,newExists,existsChanged)
    end
    
    -- Update PVP status
    local newPVPStatus, pvpStatusChanged
    if (btestmask(flags,TGUF_PVPSTATUS)) then
        newPVPStatus, pvpStatusChanged =
            TGUF_UpdateUnitPVPStatus(theUnit,newExists,existsChanged)
    end
    
    -- Update living status
    local newLiving, livingChanged
    if (btestmask(flags,TGUF_LIVING)) then
        newLiving, livingChanged =
            TGUF_UpdateUnitLiving(theUnit,newExists,existsChanged)
    end
    
    -- Update tapped status
    local newTapped, tappedChanged
    if (btestmask(flags,TGUF_TAPPED)) then
        newTapped, tappedChanged =
            TGUF_UpdateUnitTapped(theUnit,newExists,existsChanged)
    end
    
    -- Update visible status
    local newIsVisible, isVisibleChanged
    if (btestmask(flags,TGUF_ISVISIBLE)) then
        newIsVisible, isVisibleChanged =
            TGUF_UpdateUnitIsVisible(theUnit,newExists,existsChanged)
    end
    
    -- Update healing range status
    local newInHealingRange, inHealingRangeChanged
    if (btestmask(flags,TGUF_INHEALINGRANGE)) then
        newInHealingRange, inHealingRangeChanged =
            TGUF_UpdateUnitInHealingRange(theUnit,newExists,existsChanged)
    end
    
    -- Update creature type
    local newCreatureType, creatureTypeChanged
    if (btestmask(flags,TGUF_CREATURETYPE)) then
        newCreatureType, creatureTypeChanged =
            TGUF_UpdateUnitCreatureType(theUnit,newExists,existsChanged)
    end
    
    -- Update threat
    local threatChanged
    if (btestmask(flags,TGUF_THREAT)) then
        threatChanged = TGUF_UpdateUnitThreat(theUnit,newExists,existsChanged)
    end
    
    -- Send notifications
    if (isPlayerTargetChanged) then
        TGUFUnitDebug(unit..".isPlayerTarget->"..tostring(newIsPlayerTarget))
        TGUnitComponent_MarkUpdate("isPlayerTarget",theUnit)
    end
    if (nameChanged) then
        TGUFUnitDebug(unit..".name->"..tostring(newName))
        TGUnitComponent_MarkUpdate("name",theUnit)
    end
    if (classChanged) then
        TGUFUnitDebug(unit..".class->"..tostring(newClass))
        TGUnitComponent_MarkUpdate("class",theUnit)
    end
    if (healthChanged) then
        TGUFUnitDebug(unit..".health.current->"..tostring(newHealthCurrent))
        TGUFUnitDebug(unit..".health.max->"..tostring(newHealthMax))
        TGUnitComponent_MarkUpdate("health",theUnit)
    end
    if (manaChanged) then
        TGUFUnitDebug(unit..".mana.type->"..tostring(newManaType))
        TGUFUnitDebug(unit..".mana.current->"..tostring(newManaCurrent))
        TGUFUnitDebug(unit..".mana.max->"..tostring(newManaMax))
        TGUnitComponent_MarkUpdate("mana",theUnit)
    end
    if (spellChanged) then
        TGUFUnitDebug(unit..".spell-iscasting->"..tostring(isCasting))
        TGUnitComponent_MarkUpdate("spell",theUnit)
    end
    if (levelChanged) then
        TGUFUnitDebug(unit..".level.level->"..tostring(newLevel))
        TGUnitComponent_MarkUpdate("level",theUnit)
    end
    if (combatChanged) then
        TGUFUnitDebug(unit..".combat.combat->"..tostring(newCombat))
        TGUnitComponent_MarkUpdate("combat",theUnit)
    end
    if (aBuffChanged) then
        for i=1,32 do
            if (buffsChanged[i]) then
                TGUnitComponent_MarkUpdate("buffs",theUnit,i)
                buffsChanged[i] = false
            end
        end
        TGUnitComponent_MarkUpdate("anyBuff",theUnit)
    end
    if (aDebuffChanged) then
        for i=1,32 do
            if (debuffsChanged[i]) then
                TGUnitComponent_MarkUpdate("debuffs",theUnit,i)
                debuffsChanged[i] = false
            end
        end
        TGUnitComponent_MarkUpdate("anyDebuff",theUnit)
    end
    if (comboPointsChanged) then
        TGUFUnitDebug(unit..".comboPoints->"..tostring(newComboPoints))
        TGUnitComponent_MarkUpdate("comboPoints",theUnit)
    end
    if (debuffCountsChanged) then
        TGUFUnitDebug(unit..".debuffCounts->"..
                      tostring(theUnit.debuffCounts.Magic)..","..
                      tostring(theUnit.debuffCounts.Curse).. ","..
                      tostring(theUnit.debuffCounts.Disease)..","..
                      tostring(theUnit.debuffCounts.Poison))
        TGUnitComponent_MarkUpdate("debuffCounts",theUnit)
    end
    if (leaderChanged) then
        TGUFUnitDebug(unit..".leader.leader->"..tostring(newLeader))
        TGUnitComponent_MarkUpdate("leader",theUnit)
    end
    if (raidIconChanged) then
        TGUFUnitDebug(unit..".raidIcon.raidIcon->"..tostring(newRaidIcon))
        TGUnitComponent_MarkUpdate("raidIcon",theUnit)
    end
    if (reactionChanged) then
        TGUFUnitDebug(unit..".reaction.reaction->"..tostring(newreaction))
        TGUnitComponent_MarkUpdate("reaction",theUnit)
    end
    if (npcChanged) then
        TGUFUnitDebug(unit..".npc.npc->"..tostring(newNPC))
        TGUnitComponent_MarkUpdate("npc",theUnit)
    end
    if (classificationChanged) then
        TGUFUnitDebug(unit..".npc.npc->"..tostring(newClassification))
        TGUnitComponent_MarkUpdate("classification",theUnit)
    end
    if (pvpStatusChanged) then
        TGUFUnitDebug(unit..".pvpStatus.pvpStatus->"..tostring(newPVPStatus))
        TGUnitComponent_MarkUpdate("pvpStatus",theUnit)
    end
    if (livingChanged) then
        TGUFUnitDebug(unit..".living.living->"..tostring(newLiving))
        TGUnitComponent_MarkUpdate("living",theUnit)

        -- Sometimes we lose unit health update events when a unit comes alive
        -- or dies.  We do an update here.  I think this is a bug in Blizzard's
        -- engine.
        theUnit.health.current = UnitHealth(unit)
        theUnit.health.max     = UnitHealthMax(unit)
        TGUnitComponent_MarkUpdate("health",theUnit)
    end
    if (tappedChanged) then
        TGUFUnitDebug(unit..".tapped.tapped->"..tostring(newTapped))
        TGUnitComponent_MarkUpdate("tapped",theUnit)
    end
    if (isVisibleChanged) then
        TGUFUnitDebug(unit..".isVisible.isVisible->"..tostring(newIsVisible))
        TGUnitComponent_MarkUpdate("isVisible",theUnit)
    end
    if (inHealingRangeChanged) then
        TGUFUnitDebug(unit..".inHealingRange.inHealingRange->"..
                      tostring(newInHealingRange))
        TGUnitComponent_MarkUpdate("inHealingRange",theUnit)
    end
    if (creatureTypeChanged) then
        TGUFUnitDebug(unit..".creatureType->"..tostring(newCreatureType))
        TGUnitComponent_MarkUpdate("creatureType",theUnit)
    end
    if (threatChanged) then
        TGUnitComponent_MarkUpdate("threat",theUnit)
    end
    if (existsChanged) then
        TGUFUnitDebug(unit..".exists->"..tostring(newExists))
        if (UnitExists(unit.."target")) then
            TGUFUnitDebug(unit.."target.exists->true")
        else
            TGUFUnitDebug(unit.."target.exists->false")
        end
        TGUnitComponent_MarkUpdate("exists",theUnit)
    end
end

--[[
    TGUnitComponent_UpdateSpecialUnitsPeriodic polls:
        master looter
]]
local TGUF_LOOT_MASTER_ID = {
    [0] = "player",
    [1] = "party1",
    [2] = "party2",
    [3] = "party3",
    [4] = "party4"
}
function TGUnitComponent_UpdateSpecialUnitsPeriodic()
    -- Update the master looter
    local lootMethod,lootMaster = GetLootMethod()
    if (lootMaster ~= nil) then
        lootMaster = TGUF_LOOT_MASTER_ID[lootMaster]
    end
    if (lootMaster ~= TGUF_MASTER_LOOTER_UNIT) then
        -- Notify the old loot master unit of the change
        if (TGUF_MASTER_LOOTER_UNIT ~= nil) then
            local oldLootMaster = TGUF_UNIT_LIST[TGUF_MASTER_LOOTER_UNIT]
            if (oldLootMaster ~= nil and oldLootMaster.exists) then
                oldLootMaster.lootMaster = false
                TGUnitComponent_MarkUpdate("lootMaster",oldLootMaster)
            end
            TGUFUnitDebug(TGUF_MASTER_LOOTER_UNIT.." is no longer loot master.")
        end
        
        -- Notify the new loot master unit of the change
        if (lootMaster ~= nil) then
            local newLootMaster = TGUF_UNIT_LIST[lootMaster]
            if (newLootMaster ~= nil and newLootMaster.exists) then
                newLootMaster.lootMaster = true
                TGUnitComponent_MarkUpdate("lootMaster",newLootMaster)
            end
            TGUFUnitDebug(lootMaster.." is now loot master.")
        end
        
        -- Update the cached info
        TGUF_MASTER_LOOTER_UNIT = lootMaster
    end
end

function TGUnitComponent_OnUnitPowerChange(event, unit, powerType)
    -- Get the unit ID
    TGUFUnitDebug(event.."["..powerType.."]: "..unit)
    
    -- See if we are watching this unit
    local theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the energy
    if (theUnit.mana.type == TGUF_EVENT_POWER_LIST[powerType]) then
        theUnit.mana.current = UnitPower(unit)
    else
        TGUFUnitDebug("Got "..event.." for unit "..unit..
                      " but unit's power type was "..
                      TGUF_POWER_TYPE_LIST[theUnit.mana.type+1]..".")
        theUnit.mana.type    = UnitPowerType(unit)
        theUnit.mana.current = UnitPower(unit)
        theUnit.mana.max     = UnitPowerMax(unit)
    end
    TGUnitComponent_MarkUpdate("mana",theUnit)
end

function TGUnitComponent_OnUnitMaxPowerChange(event, unit, powerType)
    -- Get the unit ID
    TGUFUnitDebug(event.."["..powerType.."]: "..unit)
    
    -- See if we are watching this unit
    local theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the energy
    if (theUnit.mana.type == TGUF_EVENT_POWER_LIST[event]) then
        theUnit.mana.max = UnitPowerMax(unit)
    else
        TGUFUnitDebug("Got "..event.." for unit "..unit..
                      " but unit's power type was "..
                      TGUF_POWER_TYPE_LIST[theUnit.mana.type+1]..".")
        theUnit.mana.type    = UnitPowerType(unit)
        theUnit.mana.current = UnitPower(unit)
        theUnit.mana.max     = UnitPowerMax(unit)
    end
    TGUnitComponent_MarkUpdate("mana",theUnit)
end

function TGUnitComponent_OnUnitPowerTypeChange(event, unit)
    -- Get the unit ID
    TGUFUnitDebug(event..": "..unit)
    
    -- See if we are watching this unit
    local   theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the power
    theUnit.mana.type    = UnitPowerType(unit)
    theUnit.mana.current = UnitPower(unit)
    theUnit.mana.max     = UnitPowerMax(unit)
    TGUnitComponent_MarkUpdate("mana",theUnit)
end

function TGUnitComponent_OnUnitHealthChange(event,unit)
    -- Get the unit ID
    TGUFUnitDebug(event..": "..unit)
    
    -- See if we are watching this unit
    local   theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the health
    theUnit.health.current = UnitHealth(unit)
    TGUnitComponent_MarkUpdate("health",theUnit)
end

function TGUnitComponent_OnUnitMaxHealthChange(event,unit)
    -- Get the unit ID
    TGUFUnitDebug(event..": "..unit)
    
    -- See if we are watching this unit
    local   theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the health
    theUnit.health.max = UnitHealthMax(unit)
    TGUnitComponent_MarkUpdate("health",theUnit)
end

function TGUnitComponent_OnUnitLevelChange(event,unit)
    -- Get the unit ID
    TGUFUnitDebug(event..": "..unit)
    
    -- See if we are watching this unit
    local   theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the level
    theUnit.level = UnitLevel(unit)
    TGUnitComponent_MarkUpdate("level",theUnit)
end

function TGUnitComponent_OnUnitNameChange(event,unit)
    -- Get the unit ID
    TGUFUnitDebug(event..": "..unit)
    
    -- See if we are watching this unit
    local   theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the level
    theUnit.name = UnitName(unit)
    TGUnitComponent_MarkUpdate("name",theUnit)
end

function TGUnitComponent_OnUnitAuraStateChanged(event,unit)
    TGUFUnitDebug(event..": "..unit)
end

function TGUnitComponent_OnUnitAuraChanged(event,unit)
    -- Get the unit ID
    TGUFUnitDebug(event..": "..unit)
    
    -- See if we are watching this unit
    local   theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit == nil) then
        return
    end
    
    -- Update the buffs
    local aBuffChanged, buffsChanged = TGUF_UpdateUnitBuffs(theUnit,true,false)
    
    -- Update debuffs
    local aDebuffChanged, debuffsChanged, debuffCountsChanged =
            TGUF_UpdateUnitDebuffs(theUnit,true,false)
    
    if (aBuffChanged) then
        for i=1,32 do
            if (buffsChanged[i]) then
                TGUnitComponent_MarkUpdate("buffs",theUnit,i)
                buffsChanged[i] = false
            end
        end
        TGUnitComponent_MarkUpdate("anyBuff",theUnit)
    end
    if (aDebuffChanged) then
        for i=1,32 do
            if (debuffsChanged[i]) then
                TGUnitComponent_MarkUpdate("debuffs",theUnit,i)
                debuffsChanged[i] = false
            end
        end
        TGUnitComponent_MarkUpdate("anyDebuff",theUnit)
    end
    if (debuffCountsChanged) then
        TGUnitComponent_MarkUpdate("debuffCounts",theUnit)
    end
end

function TGUnitComponent_OnPlayerTargetChange(event)
    TGUFUnitDebug(event)
    for k,v in pairs(TGUF_TARGET_CHANGED_LIST) do
        TGUnitComponent_UpdateUnit(k,v.allFlags)
        TGUnitComponent_MarkUpdate("model",v)
    end
    
    -- Update all units' isPlayerTarget attribute
    for k,v in pairs(TGUF_UNIT_LIST) do
        if (v.exists) then
            local   oldIsPlayerTarget = v.isPlayerTarget
            local   newIsPlayerTarget = UnitIsUnit(k,"target")
            if (newIsPlayerTarget) then
                newIsPlayerTarget = true
            else
                newIsPlayerTarget = false
            end
            if (oldIsPlayerTarget ~= newIsPlayerTarget) then
                v.isPlayerTarget = newIsPlayerTarget
                TGUnitComponent_MarkUpdate("isPlayerTarget",v)
            end
            --[[
            if (newIsPlayerTarget) then
                TGUnitComponent_MarkUpdate("model",v)
            end
            ]]
        end
    end
    
    TGUnitComponent_UpdateSpecialUnitsPeriodic()
end

function TGUnitComponent_OnPlayerFocusChange(event)
    TGUFUnitDebug(event);
    for k,_ in pairs(TGUF_FOCUS_CHANGED_LIST) do
        TGUnitComponent_UpdateUnit(k,TGUF_ALLFLAGS);
    end
end

local unitPetMap = { 
    ["player"] = "pet",
    ["party1"] = "partypet1",
    ["party2"] = "partypet2",
    ["party3"] = "partypet3",
    ["party4"] = "partypet4",
    ["raid1"]  = "raidpet1",
    ["raid2"]  = "raidpet2",
    ["raid3"]  = "raidpet3",
    ["raid4"]  = "raidpet4",
    ["raid5"]  = "raidpet5",
    ["raid6"]  = "raidpet6",
    ["raid7"]  = "raidpet7",
    ["raid8"]  = "raidpet8",
    ["raid9"]  = "raidpet9",
    ["raid10"] = "raidpet10",
    ["raid11"] = "raidpet11",
    ["raid12"] = "raidpet12",
    ["raid13"] = "raidpet13",
    ["raid14"] = "raidpet14",
    ["raid15"] = "raidpet15",
    ["raid16"] = "raidpet16",
    ["raid17"] = "raidpet17",
    ["raid18"] = "raidpet18",
    ["raid19"] = "raidpet19",
    ["raid20"] = "raidpet20",
    ["raid21"] = "raidpet21",
    ["raid22"] = "raidpet22",
    ["raid23"] = "raidpet23",
    ["raid24"] = "raidpet24",
    ["raid25"] = "raidpet25",
    ["raid26"] = "raidpet26",
    ["raid27"] = "raidpet27",
    ["raid28"] = "raidpet28",
    ["raid29"] = "raidpet29",
    ["raid30"] = "raidpet30",
    ["raid31"] = "raidpet31",
    ["raid32"] = "raidpet32",
    ["raid33"] = "raidpet33",
    ["raid34"] = "raidpet34",
    ["raid35"] = "raidpet35",
    ["raid36"] = "raidpet36",
    ["raid37"] = "raidpet37",
    ["raid38"] = "raidpet38",
    ["raid39"] = "raidpet39",
    ["raid40"] = "raidpet40",
}
function TGUnitComponent_OnUnitPet(event,unit)
    local   petUnit = unitPetMap[unit]
    if (petUnit ~= nil) then
        TGUFUnitDebug(event..": "..unit)
        TGUnitComponent_UpdateUnit(petUnit,TGUF_NONPLAYER_ALLFLAGS)
    end
end

local raidRosterCache = {}
local partyCache = {}
function TGUnitComponent_OnGroupRosterUpdate(event)
    for i=1,40 do
        local raidName = UnitName("raid"..i)
        if (raidName ~= raidRosterCache[i]) then
            raidRosterCache[i] = raidName
            TGUnitComponent_UpdateUnit("raid"..i,TGUF_NONPLAYER_ALLFLAGS)
            TGUnitComponent_UpdateUnit("raidpet"..i,TGUF_NONPLAYER_ALLFLAGS)
        end
    end
    for i=1,4 do
        local partyName = UnitName("party"..i)
        if (partyName ~= partyCache[i]) then
            partyCache[i] = partyName
            TGUnitComponent_UpdateUnit("party"..i,TGUF_NONPLAYER_ALLFLAGS)
            TGUnitComponent_UpdateUnit("partypet"..i,TGUF_NONPLAYER_ALLFLAGS)
        end
    end
    TGRaidSorter_OnRaidRosterUpdate()
end

function TGUnitComponent_OnMouseoverChanged(event)
    TGUFUnitDebug(event)
    TGUnitComponent_UpdateUnit("mouseover",TGUF_NONPLAYER_ALLFLAGS)
end

function TGUnitComponent_OnPlayerEnterCombat(event)
    TGUFUnitDebug(event)
    local   theUnit = TGUF_UNIT_LIST["player"]
    if (theUnit ~= nil) then
        theUnit.combat = true
        TGUnitComponent_MarkUpdate("combat",theUnit)
    end
end

function TGUnitComponent_OnPlayerLeaveCombat(event)
    TGUFUnitDebug(event)
    local   theUnit = TGUF_UNIT_LIST["player"]
    if (theUnit ~= nil) then
        theUnit.combat = false
        TGUnitComponent_MarkUpdate("combat",theUnit)
    end
end

function TGUnitComponent_OnUnitModelChange(event,unit)
    -- See if we are watching this unit
    local   theUnit = TGUF_UNIT_LIST[unit]
    if (theUnit ~= nil) then
        TGUnitComponent_MarkUpdate("model",theUnit)
    end
    
end

function TGUFUnitDebug(msg)
    --TGUFDebug(msg)
end

-- Register the TGUnit component
local TGUnitComponent = {
    ["onUnitPowerChange"]     = TGUnitComponent_OnUnitPowerChange,
    ["onUnitMaxPowerChange"]  = TGUnitComponent_OnUnitMaxPowerChange,
    ["onUnitPowerTypeChange"] = TGUnitComponent_OnUnitPowerTypeChange,
    ["onPeriodicUpdate"]      = TGUnitComponent_OnPeriodicUpdate,
    ["onUnitHealthChange"]    = TGUnitComponent_OnUnitHealthChange,
    ["onUnitMaxHealthChange"] = TGUnitComponent_OnUnitMaxHealthChange,
    ["onUnitLevelChange"]     = TGUnitComponent_OnUnitLevelChange,
    ["onPlayerTargetChange"]  = TGUnitComponent_OnPlayerTargetChange,
    ["onPlayerFocusChange"]   = TGUnitComponent_OnPlayerFocusChange,
    ["onUnitPet"]             = TGUnitComponent_OnUnitPet,
    ["onGroupJoined"]         = TGUnitComponent_OnGroupRosterUpdate,
    ["onGroupRosterUpdate"]   = TGUnitComponent_OnGroupRosterUpdate,
    ["onMouseoverChanged"]    = TGUnitComponent_OnMouseoverChanged,
    ["onUnitAuraChanged"]     = TGUnitComponent_OnUnitAuraChanged,
    ["onPlayerRegenDisabled"] = TGUnitComponent_OnPlayerEnterCombat,
    ["onPlayerRegenEnabled"]  = TGUnitComponent_OnPlayerLeaveCombat,
    ["onUnitModelChange"]     = TGUnitComponent_OnUnitModelChange,
    ["onComboPointsChange"]   = TGUnitComponent_OnComboPointChange,
    ["onUnitNameChange"]      = TGUnitComponent_OnUnitNameChange,
    ["onPlayerEnteringWorld"] = TGUnitComponent_OnPlayerEnteringWorld,
    
    ["onAddonLoaded"] = TGUnitComponent_OnAddonLoaded,
    }
TGUnitFrames_RegisterComponent(TGUnitComponent)
