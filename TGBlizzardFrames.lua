-- A list of units we are filtering
local TGUF_FILTER_LIST = {}

-- Call this to filter the default UI frames for a particular unit
function TGUF_FilterDefaultFrame(selector)
    if (selector == "player") then
        TGUF_FILTER_LIST["player"] = true;
        TGUF_HideBlizzardPlayerFrame();
    elseif (selector == "pet") then
        TGUF_FILTER_LIST["pet"] = true;
        TGUF_HideBlizzardPetFrame();
    elseif (selector == "party") then
        TGUF_FILTER_LIST["party1"] = true;
        TGUF_FILTER_LIST["party2"] = true;
        TGUF_FILTER_LIST["party3"] = true;
        TGUF_FILTER_LIST["party4"] = true;
        TGUF_HideBlizzardPartyFrames();
    elseif (selector == "partypet") then
        TGUF_FILTER_LIST["partypet1"] = true;
        TGUF_FILTER_LIST["partypet2"] = true;
        TGUF_FILTER_LIST["partypet3"] = true;
        TGUF_FILTER_LIST["partypet4"] = true;
    elseif (selector == "target") then
        TGUF_FILTER_LIST["target"] = true;
        TGUF_HideBlizzardTargetFrame();
    elseif (selector == "focus") then
        TGUF_FILTER_LIST["focus"] = true;
        TGUF_HideBlizzardFocusFrame();
    elseif (selector == "raid") then
        TGUF_FILTER_LIST["raid"] = true;
        TGUF_HideBlizzardRaidFrames();
    end
end

-- Player frame.
local playerFrameHidden = false;
function TGUF_HideBlizzardPlayerFrame()
    if (playerFrameHidden == true) then
        return;
    end
    playerFrameHidden = true;
    
    -- Player and pet frames
    PlayerFrame:UnregisterAllEvents();
    PlayerFrameHealthBar:UnregisterAllEvents();
    PlayerFrameManaBar:UnregisterAllEvents();
    PlayerFrame:Hide();
    
    -- Casting bar
    CastingBarFrame:UnregisterAllEvents();
    PetCastingBarFrame:UnregisterAllEvents();
end

-- Party frames.
local partyFramesHidden = false;
function TGUF_HideBlizzardPartyFrames()
    if (partyFramesHidden == true) then
        return;
    end
    partyFramesHidden = true;
    for i = 1, 4 do
        local frame = _G["PartyMemberFrame"..i];
        frame:UnregisterAllEvents();
        frame:Hide();
        frame.Show = function() end;
    end
    UIParent:UnregisterEvent("RAID_ROSTER_UPDATE");
end

-- Raid frames.
local raidFramesHidden = false;
function TGUF_HideBlizzardRaidFrames()
    if (raidFramesHidden == true) then
        return;
    end
    raidFramesHidden = true;

    local function hideRaid()
        CompactRaidFrameManager:UnregisterAllEvents()
        CompactRaidFrameContainer:UnregisterAllEvents()
        CompactRaidFrameManager:Hide()
        local shown = CompactRaidFrameManager_GetSetting("IsShown")
        if (shown and shown ~= "0") then
            CompactRaidFrameManager_SetSetting("IsShown","0")
        end
    end

    hooksecurefunc("CompactRaidFrameManager_UpdateShown",hideRaid)

    hideRaid()

    CompactRaidFrameContainer:HookScript("OnShow",hideRaid)
    CompactRaidFrameManager:HookScript("OnShow",hideRaid)
end

-- Target frame
local targetFrameHidden = false;
function TGUF_HideBlizzardTargetFrame()
    if (targetFrameHidden == true) then
        return;
    end
    targetFrameHidden = true;
    TargetFrame:UnregisterAllEvents();
    TargetFrame:Hide();
    ComboFrame:UnregisterAllEvents();
end

-- Focus frame
local focusFrameHidden = false;
function TGUF_HideBlizzardFocusFrame()
    if (focusFrameHidden == true) then
        return;
    end
    focusFrameHidden = true;
    FocusFrame:UnregisterAllEvents();
    FocusFrame:Hide();
end
