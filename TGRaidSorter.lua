local TGRS_FRAMES;

local RAID_ORDER = {
    ["WARRIOR"] = 1,
    ["DEATHKNIGHT"] = 2,
    ["DRUID"]   = 3,
    ["ROGUE"]   = 4,
    ["MAGE"]    = 5,
    ["WARLOCK"] = 6,
    ["HUNTER"]  = 7,
    ["PRIEST"]  = 8,
    ["PALADIN"] = 9,
    ["SHAMAN"]  = 10,
    ["MONK"]    = 11,
};

function TGRaidSorter_OnAddonLoaded()
end

function TGRaidSorter_SetRaidFrames(frames)
    if (#frames ~= 40) then
        TGMsg("Expected raid frames to be 40 units in size.")
    end
    TGRS_FRAMES = frames;
    TGRaidSorter_SortFrames();
end

function TGRaidSorter_UnitCompare(unit1,unit2)
    local   class1 = unit1.listener.unit.class.englishClass;
    local   class2 = unit2.listener.unit.class.englishClass;
    --print("class1: "..tostring(class1).." class2: "..tostring(class2));
    if (not unit1.listener.unit.exists) then
        --print("unit1.exists: "..tostring(unit1.listener.unit.exists));
        class1 = nil;
    end
    if (not unit2.listener.unit.exists) then
        --print("unit2.exists: "..tostring(unit2.listener.unit.exists));
        class2 = nil;
    end
    if (class1 == nil and class2 == nil) then
        return unit1.listener.unit.unit < unit2.listener.unit.unit;
    end
    
    if (class1 == nil) then
        return false;
    end
    
    if (class2 == nil) then
        return true;
    end
        
    if (class1 == class2) then
        return (unit1.listener.unit.name < unit2.listener.unit.name);
    end
    return (RAID_ORDER[class1] < RAID_ORDER[class2]);
end

function TGRaidSorter_SortFrames()
    -- Sorting doesn't work for now.
    if (true) then
        TGRS_SORT_QUEUED = nil;
        return;
    end
    
    if (TGRS_FRAMES == nil) then
        return;
    end
    
    if (not TGRS_FRAMES[1]:CanChangeProtectedState()) then
        TGRS_SORT_QUEUED = true;
        return;
    end
    
    -- Remember the old ordering
    local   sortedUnits = {};
    for k,v in pairs(TGRS_FRAMES) do
        table.insert(sortedUnits,{listener=v.listener,raidIndex=v.listener.unit.unit});
    end
    
    -- Sort
    table.sort(sortedUnits,TGRaidSorter_UnitCompare);
    
    -- Set the listeners
    --print("Sorted raid frames");
    for k,v in ipairs(sortedUnits) do
        TGUnitComponent_WatchUnit(TGRS_FRAMES[k].listener,TGUnitComponent_NewUnit(v.raidIndex))
    end
    
    TGRS_SORT_QUEUED = nil;
end

function TGRaidSorter_OnRaidRosterUpdate()
    --print("OnRaidRosterUpdate");
    TGRaidSorter_SortFrames();
end

function TGRaidSorter_OnPeriodicUpdate()
    if (TGRS_SORT_QUEUED and TGRS_FRAMES[1]:CanChangeProtectedState()) then
        TGRaidSorter_SortFrames();
    end
end

local TGRaidSorterComponent = {
    ["onPeriodicUpdate"] = TGRaidSorter_OnPeriodicUpdate,
    ["onAddonLoaded"] = TGRaidSorter_OnAddonLoaded
    };
TGUnitFrames_RegisterComponent(TGRaidSorterComponent);
