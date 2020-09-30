local RAID_COLOR_CODES = {
    ["HUNTER"]  = "|cffabd473",
    ["WARLOCK"] = "|cff9482c9",
    ["PRIEST"]  = "|cffffffff",
    ["PALADIN"] = "|cfff58cba",
    ["MAGE"]    = "|cff69ccf0",
    ["ROGUE"]   = "|cfffff569",
    ["DRUID"]   = "|cffff7d0a",
    ["SHAMAN"]  = "|cff2459ff",
    ["WARRIOR"] = "|cffc79c6e",
    ["DEATHKNIGHT"] = "|cffc41f3b",
    ["MONK"]    = "|cff00ff96",
};

function SmartHealthString(h)
    if h >= 1000000 then
        return ""..math.floor(h/1000000).."."..math.floor((h%1000000)/100000).."M"
    end
    if h >= 10000 then
        return ""..math.floor(h/1000).."."..math.floor((h%1000)/100).."K"
    end
    return h;
end

local substitutionTable =
{
    ["$hc"] = {p = false, w = {"health"},f = function(v) return v.health.current; end},
    ["$shc"] = {p = false, w = {"health"}, f = function(v) return SmartHealthString(v.health.current); end},
    ["$hd"] = {p = false, w = {"health"},f = function(v) if (v.health.current > 0 and v.health.current < v.health.max) then return (v.health.max - v.health.current); end; end},
    ["$hm"] = {p = false, w = {"health"},f = function(v) return v.health.max; end},
    ["$shm"] = {p = false, w = {"health"}, f = function(v) return SmartHealthString(v.health.max); end},
    ["$hp"] = {p = false, w = {"health"},f = function(v) if (v.health.current ~= nil and v.health.max ~= nil) then return math.floor(v.health.current*100/v.health.max + 0.5); end; return 0; end;},
    ["$nm"] = {p = false, w = {"name"},f = function(v) return v.name; end},
    ["$nc"] = {p = false, w = {"name", "class"},
                f = function(v)
                    if (v.name and v.class.englishClass) then
                        return RAID_COLOR_CODES[v.class.englishClass]..v.name..FONT_COLOR_CODE_CLOSE;
                    end
                    return nil;
                end
                },
    ["$cl"] = {p = false, w = {"class"},f = function(v) return v.class.localizedClass; end},
    ["$cr"] = {p = false, w = {"creatureType"},f = function(v) return v.creatureType; end},
    ["$mc"] = {p = false, w = {"mana"},f = function(v) return v.mana.current; end},
    ["$mm"] = {p = false, w = {"mana"},f = function(v) return v.mana.max; end},
    ["$mp"] = {p = false, w = {"mana"},f = function(v) if (v.mana.current ~= nil and v.mana.max ~= nil and v.mana.max ~= 0) then return math.floor(v.mana.current*100/v.mana.max + 0.5); end; return 0; end;},
    ["$mt"] = {p = false, w = {"mana"},f = function(v) if (v.mana.type ~= nil) then return TGUF_POWER_TYPE_LIST[v.mana.type+1]; end; return nil; end;},
    ["$lv"] = {p = false, w = {"level"},f = function(v) if (v.level == -1) then return "??"; end; return v.level; end},
    ["$sty"] = {p = false, w = {"spell"},f = function(v) return v.spell.type; end},
    ["$ssp"] = {p = false, w = {"spell"},f = function(v) return v.spell.spell; end},
    ["$sdn"] = {p = false, w = {"spell"},f = function(v) return v.spell.displayName; end},
    ["$sic"] = {p = false, w = {"spell"},f = function(v) return v.spell.icon; end},
    ["$sst"] = {p = false, w = {"spell"},f = function(v) return v.spell.startTime; end},
    ["$set"] = {p = false, w = {"spell"},f = function(v) return v.spell.endTime; end},
    ["$sts"] = {p = false, w = {"spell"},f = function(v) return v.spell.isTradeSkill; end},
    ["$sti"] = {p = true, w = {"spell"},
                f = function(v)
                    if(v.spell.endTime ~= nil and v.spell.startTime ~= nil) then
                        local   delta = v.spell.endTime - GetTime();
                        if (delta > 0) then
                            local   t = math.floor(delta*10 + 0.5);
                            local   s = math.floor(t/10);
                            local   f = math.fmod(t,10);
                            return " ("..s.."."..f..") ";
                        else
                            return " (0.0) ";
                        end
                    end
                    return nil;
                end
                },
    ["$un"] = {p = false, f = function(v) return v.unit; end;},
    ["$ccl"] = {p = false, w = {"class", "creatureType", "npc"},
                 f = function(v)
                    if (v.npc) then
                        return v.creatureType;
                    end
                    return v.class.localizedClass;
                end
                },
    ["$npc"] = {p = false, w = {"npc"}, f = function(v) if (v.npc) then return "NPC"; end; return "Player"; end},
    ["$thp"] = {p = false, w = {"threat"},
                -- Threat percentage
                f = function(v)
                    if (v.threat.threatPct) then
                        return math.floor(v.threat.threatPct + 0.5).."%%";
                    end
                    return nil;
                end},
    ["$thc"] = {p = false, w = {"threat"},
                -- Threat ceiling (total amount of threat needed to pull aggro in units of damage)
                f = function(v)
                    if (v.threat.threatValue and v.threat.threatValue < 0) then
                        return "Fade";
                    end
                    if (v.threat.threatPct and v.threat.threatPct ~= 0 and v.threat.threatValue) then
                        return math.floor((v.threat.threatValue/v.threat.threatPct) + 0.5);
                    end
                    return nil;
                end},
    ["$thw"] = {p = false, w = {"threat"},
                -- Threat window (delta amount of threat needed to do to pull aggro in units of damage)
                f = function(v)
                    if (v.threat.isTanking ~= nil and v.threat.isTanking) then
                        return nil;
                    end
                    if (v.threat.threatPct and v.threat.threatPct ~= 0 and v.threat.threatValue) then
                        return math.floor((v.threat.threatValue/v.threat.threatPct) + 0.5 - v.threat.threatValue/100.0);
                    end
                    return nil;
                end}
};

function TGUnitText_NewTGUnitText(frame,parentFrame,attributes)
    -- Create a new TGUnitText
    frame.unitChanged = TGUnitText_UnitChanged;
    frame.text = attributes.text;
    
    -- Setup the display
    local   frameText = _G[frame:GetName().."Text"];
    if (attributes.alignH) then
        frameText:SetJustifyH(attributes.alignH);
    end
    if (attributes.alignV) then
        frameText:SetJustifyV(attributes.alignV);
    end
    local font = "Fonts\\FRIZQT__.TTF";
    local fontSize = 10;
    local fontR = 1.0;
    local fontG = 0.82;
    local fontB = 0;
    local fontA = 1.0;
    if (attributes.font) then
        font = attributes.font;
        if (not string.find(font,"\\")) then
            font = "Interface\\AddOns\\TGUF_2\\Fonts\\"..font;
        end
    end
    if (attributes.fontSize) then
        fontSize = attributes.fontSize;
    end
    if (attributes.color) then
        fontR = attributes.color.r;
        fontG = attributes.color.g;
        fontB = attributes.color.b;
        fontA = attributes.color.a;
    end
    frame.poll = false;
    frame.lastPoll = 0;
    --TGUFDebug("Setting font to: "..font.." "..fontSize.."-point");
    frameText:SetFont(font,fontSize);
    frameText:SetTextColor(fontR,fontG,fontB,fontA);
    
    TGUnitText_SetWatchers(frame);
    frame:Show();
    
    return frame;
end

function TGUnitText_DestroyTGUnitText(frame)
    TGUnitText_ClearWatchers(frame);
end

function TGUnitText_UnitChanged(frame)
    TGUnitText_UnitUpdate(frame.listener.unit,frame);
end

function TGUnitText_SetWatchers(frame)
    local   listeners = {};
    for k,v in pairs(substitutionTable) do
        if (string.find(frame.text,k)) then
            if (table.getn(v.w) ~= 0) then
                for _,v2 in pairs(v.w) do
                    listeners[v2] = 1;
                end
                if (v.p == true) then
                    frame.poll = true;
                end
            end
        end
    end
    for k,_ in pairs(listeners) do
        frame[k.."UnitUpdate"] = TGUnitText_UnitUpdate;
        table.insert(frame.listener[k],frame);
    end
end

function TGUnitText_ClearWatchers(frame)
    local   listeners = {};
    for k,v in pairs(substitutionTable) do
        if (string.find(frame.text,k)) then
            for _,v2 in pairs(v.w) do
                if (listeners[v2] == nil) then
                    listeners[v2] = 1;
                end
            end
        end
    end
    for k,_ in pairs(listeners) do
        for k1,v1 in pairs(frame.listener[k]) do
            if (v1 == frame) then
                table.remove(frame.listener[k],k1);
                break;
            end
        end
    end
end

function TGUnitText_UnitUpdate(unit,frame)
    --TGUFDebug("TGUnitText_UnitUpdate");
    if (not unit.exists) then
        return;
    end
    
    -- Perform the substitutions
    local   finalStr = frame.text;
    for k,v in pairs(substitutionTable) do
        local   elem = v.f(unit);
        if (elem ~= nil) then
            finalStr = string.gsub(finalStr,k,tostring(elem));
        else
            finalStr = string.gsub(finalStr,k,"");
        end
    end
    
    -- Set the text
    local   frameText = _G[frame:GetName().."Text"];
    frameText:SetText(finalStr);
end

local TGUnitTextTemplate_ObjectInfo =
{
    type = "Frame",
    name = "TGUnitText",
    template = "TGUnitTextTemplate",
    constructor = TGUnitText_NewTGUnitText,
    destructor = TGUnitText_DestroyTGUnitText,
    index = 0,
    pool = {},
    attributes =
    {
        {name = "text", type = "string", default = "", newValue = "", required = true},
        {name = "alignH", type = "restricted-value", values = {"LEFT", "RIGHT", "CENTER"}, newValue = "LEFT", required = false},
        {name = "alignV", type = "restricted-value", values = {"TOP", "BOTTOM", "CENTER"}, newValue = "CENTER", required = false},
        {name = "font", type = "string", newValue = "Fonts\\FRIZQT__.TTF", required = false},
        {name = "fontSize", type = "integer", newValue = 10, required = false},
        {name = "color", type = "color", default = {r=1.0,g=0.82,b=0,a=1.0}, newValue = {r=1.0,g=0.82,b=0,a=1.0}, required = false}
    }
}
TGUnitFrames_RegisterObject(TGUnitTextTemplate_ObjectInfo);
