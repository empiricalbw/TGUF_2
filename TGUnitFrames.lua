TGUF_SHORT_VERSION_STR   = "1.0a1"
TGUF_VERSION_STR         = "TGUnitFrames "..TGUF_SHORT_VERSION_STR;

local TGUF_COMPONENTS           = {}
local TGUF_DISPATCH_LIST        = {}
local TGUF_EVENT_DISPATCH_TABLE =
{
    ["ADDON_LOADED"]                  = "onAddonLoaded",
    ["PLAYER_ENTERING_WORLD"]         = "onPlayerEnteringWorld",
    ["CVAR_UPDATE"]                   = "onCVARUpdate",
    ["UNIT_MANA"]                     = "onUnitPowerChange",
    ["UNIT_HAPPINESS"]                = "onUnitPowerChange",
    ["UNIT_DISPLAYPOWER"]             = "onUnitPowerTypeChange",
    ["UNIT_HEALTH"]                   = "onUnitHealthChange",
    ["UNIT_MAXHEALTH"]                = "onUnitMaxHealthChange",
    ["UNIT_LEVEL"]                    = "onUnitLevelChange",
    ["PLAYER_TARGET_CHANGED"]         = "onPlayerTargetChange",
    ["UNIT_SPELLCAST_START"]          = "onSpellcastStart",
    ["UNIT_SPELLCAST_DELAYED"]        = "onSpellcastDelayed",
    ["UNIT_SPELLCAST_STOP"]           = "onSpellcastStop",
    ["UNIT_SPELLCAST_FAILED"]         = "onSpellcastFailed",
    ["UNIT_SPELLCAST_INTERRUPTED"]    = "onSpellcastInterrupted",
    ["UNIT_SPELLCAST_CHANNEL_START"]  = "onSpellcastChannelStart",
    ["UNIT_SPELLCAST_CHANNEL_UPDATE"] = "onSpellcastChannelUpdate",
    ["UNIT_SPELLCAST_CHANNEL_STOP"]   = "onSpellcastChannelStop",
    ["UNIT_SPELLCAST_SUCCEEDED"]      = "onSpellcastSucceeded",
    ["UNIT_SPELLCAST_SENT"]           = "onSpellcastSent",
    ["UNIT_PET"]                      = "onUnitPet",
    ["GROUP_JOINED"]                  = "onGroupJoined",
    ["GROUP_ROSTER_UPDATE"]           = "onGroupRosterUpdate",
    ["UPDATE_MOUSEOVER_UNIT"]         = "onMouseoverChanged",
    ["UNIT_AURA"]                     = "onUnitAuraChanged",
    ["PLAYER_REGEN_DISABLED"]         = "onPlayerRegenDisabled",
    ["PLAYER_REGEN_ENABLED"]          = "onPlayerRegenEnabled",
    ["UNIT_MODEL_CHANGED"]            = "onUnitModelChange",
    ["UNIT_NAME_UPDATE"]              = "onUnitNameChange",
}
    
function TGUnitFrames_RegisterComponent(component)
    table.insert(TGUF_COMPONENTS,component);
    for k,v in pairs(component) do
        if (TGUF_DISPATCH_LIST[k] == nil) then
            TGUF_DISPATCH_LIST[k] = {};
        end
        --TGUFDebug("Inserting function "..tostring(v).." into "..k.." dispatch list.");
        table.insert(TGUF_DISPATCH_LIST[k],v);
    end
end

function TGUnitFrames_DispatchComponent(handler,...)
    local handlerList = TGUF_DISPATCH_LIST[handler];
    if (handlerList == nil) then
        return;
    end
    for _,v in pairs(handlerList) do
        if (v ~= nil) then
            v(...);
        else
            TGUFDebug("Attempted to call a nil handler function in the "..
                      handler.." dispatch list.");
        end
    end
end

function TGUnitFrames_OnLoad(frame)
    -- Register for events we are interested in
    for k,_ in pairs(TGUF_EVENT_DISPATCH_TABLE) do
        frame:RegisterEvent(k);
    end
    
    -- Set up slash commands
    SlashCmdList["TGUNITFRAMESTEMPLATEMANAGER"] = TGUnitFramesTemplateManager_Slash;
    SLASH_TGUNITFRAMESTEMPLATEMANAGER1 = "/tguf";
    SlashCmdList["TGUNITFRAMESMODELDB"] = TGUnitFramesModelDB_Slash;
    SLASH_TGUNITFRAMESMODELDB1 = "/tgmd";
    SlashCmdList["TGUNITFRAMESMODELDBLIST"] = TGUnitFramesModelDB_List;
    SLASH_TGUNITFRAMESMODELDBLIST1 = "/tgmdl";
    SlashCmdList["TGUNITFRAMESLAYOUTMANAGER"] = TGUnitFramesLayoutManager_Slash;
    SLASH_TGUNITFRAMESLAYOUTMANAGER1 = "/tglm";
    SlashCmdList["AUTOTARGETNAME"] = AutoTarget_Name;
    SLASH_AUTOTARGETNAME1 = "/atnm";
    SlashCmdList["AUTOTARGETOFF"] = AutoTarget_Off;
    SLASH_AUTOTARGETOFF1 = "/atoff";
    SlashCmdList["SOUNDFXOFF"] = SoundFX_Off;
    SLASH_SOUNDFXOFF1 = "/sf0";
    SlashCmdList["SOUNDFXON"] = SoundFX_On;
    SLASH_SOUNDFXON1 = "/sf1";
end

function SoundFX_Off()
    ConsoleExec("Sound_EnableSFX 0");
end

function SoundFX_On()
    ConsoleExec("Sound_EnableSFX 1");
    UIErrorsFrame:Clear();
end

function TGUnitFrames_HandleAddonLoaded(name)
    --TGUFDebug("ADDON_LOADED: "..name);
    if (name ~= "TGUF_2") then
        return false;
    end
    TGUFFindDebugFrame();
    return true
end

function TGUnitFrames_OnEvent(frame,event,...)
    -- Only 1 addon loaded event please!
    if (event == "ADDON_LOADED") then
        if not TGUnitFrames_HandleAddonLoaded(...) then
            return
        end
    end
    
    -- Dispatch
    local   dispatchName = TGUF_EVENT_DISPATCH_TABLE[event];
    if (dispatchName ~= nil) then
        TGUnitFrames_DispatchComponent(dispatchName,event,...);
    else
        TGUFDebug("Got event "..event.." but had no dispatch entry for it!");
    end
end

function TGUnitFrames_OnUpdate()
    TGUnitFrames_DispatchComponent("onPeriodicUpdate");
end

function TGUnitFrames_NewFrame(frameType,frameName,parentFrame,frameInherit,anchors,size,anchorFrames)
    local frame = CreateFrame(frameType,frameName,parentFrame,frameInherit);
    TGUnitFrames_SetAttributes(frame,anchors,size,anchorFrames);
    return frame;
end

function TGUnitFrames_SetAttributes(frame,anchors,size,anchorFrames)
    if (anchors ~= nil) then
        local   hasAnchor = false;
        frame:ClearAllPoints();
        for k,v in ipairs(anchors) do
            if (v.disabled == nil or not v.disabled) then
                frame:SetPoint(v.myPoint,anchorFrames[k],v.anchorPoint,v.dX,v.dY);
                hasAnchor = true;
            end
        end
        if (not hasAnchor) then
            TGUFDebug("Frame "..frame:GetName().." has no anchors!");
        end
    end
    if (size ~= nil) then
        if (size.width ~= nil) then
            frame:SetWidth(size.width);
        end
        if (size.height ~= nil) then
            frame:SetHeight(size.height);
        end
    end
end

local   TGUF_DEBUG_FRAME_NAME = "TGUnitFrames";
local   TGUF_DEBUG_FRAME = DEFAULT_CHAT_FRAME;
function TGUFDebug(str)
    local   finalStr = LIGHTYELLOW_FONT_COLOR_CODE.."TGUnitFramesDebug: "..FONT_COLOR_CODE_CLOSE..str;
    TGUF_DEBUG_FRAME:AddMessage(finalStr);
end

function TGUFWarning(str)
    local finalStr = LIGHTYELLOW_FONT_COLOR_CODE.."TGUnitFramesWarning: "..FONT_COLOR_CODE_CLOSE..str;
    DEFAULT_CHAT_FRAME:AddMessage(finalStr);
    if (TGUF_DEBUG_FRAME ~= DEFAULT_CHAT_FRAME) then
        TGUF_DEBUG_FRAME:AddMessage(finalStr);
    end
end

function TGUFMsg(str)
    local   finalStr = LIGHTYELLOW_FONT_COLOR_CODE.."TGUnitFrames: "..FONT_COLOR_CODE_CLOSE..str;
    TGUF_DEBUG_FRAME:AddMessage(finalStr);
    if (TGUF_DEBUG_FRAME ~= DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage(finalStr);
    end
end

function TGUFFindDebugFrame()
    for i=1,NUM_CHAT_WINDOWS do
        if (GetChatWindowInfo(i) == TGUF_DEBUG_FRAME_NAME) then
            TGUF_DEBUG_FRAME = _G["ChatFrame"..i];
            break;
        end
    end
end

--[[
local oldPlaySound = PlaySound;
function TGUFPlaySound(x)
    if (x == "igMainMenuOpen") then
        DEFAULT_CHAT_FRAME:AddMessage("PlaySound(igMainMenuOpen) backtrace:");
        local   bt = debugstack(2);
        for l in string.gmatch(bt,".-\n") do
            DEFAULT_CHAT_FRAME:AddMessage(l);
        end
    end
    oldPlaySound(x);
end
PlaySound = TGUFPlaySound;
]]
