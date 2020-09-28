local TGUF_NEW_UNIT_FRAME_TEMPLATE =
{
	-- Unit frame
	type = "TGUnitFrame",
	size = {width=180,height=40},
	highlightIfTargetted = false,
	backgroundColor = {r=0,g=0,b=0,a=0.5}
}

local TGUF_DEBUG_STUPID_TEMPLATE =
{
	-- Unit frame
	type = "TGUnitFrame",
	size = {width=180,height=40},
	highlightIfTargetted = false,
	backgroundColor = {r=0,g=0,b=0,a=0.5},
	children =
	{
		{	-- Stupid text frame
			type = "TGUnitText",
			anchors = {
				{myPoint="CENTER",anchor=-1,anchorPoint="CENTER",dX=0,dY=0}},
			size = {width=180,height=20},
			text = "YOU ARE STUPID",
			alignH = "CENTER",
			alignV = "CENTER"
		}
	}
}

local	TGUF_DEBUG_FRAME_TEMPLATE =
{
	-- Unit frame
	type = "TGUnitFrame",
	name = "Root UnitFrame",
	size = {width=170,height=66},
	highlightIfTargetted = true,
	backgroundColor = {r=0,g=0,b=0,a=0.5},
	children =
	{
		{		-- Combat icon frame
			type = "TGUnitCombatIcon",
			name = "Combat Icon",
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=-2,dY=2}},
			size = {height=20,width=20}
		},
		{		-- Name text frame
			type = "TGUnitText",
			name = "Name",
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=-1,dY=-2},
				{myPoint="TOPRIGHT",anchor=0,anchorPoint="TOPRIGHT",dX=-5,dY=-2}},
			size = {height=12},
			text = "$nm",
			alignH = "LEFT"
		},
		{		-- Class/level text frame
			type = "TGUnitText",
			name = "Class/Level",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPLEFT",dX=0,dY=0},
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPRIGHT",dX=0,dY=0}},
			size = {height=12},
			text = "$lv $cl",
			alignH = "RIGHT"
		},
		{		-- Health bar frame
			type = "TGUnitHealthBar",
			name = "Health Bar",
			anchors = {
				{myPoint="TOPLEFT",anchor=-3,anchorPoint="BOTTOM",dX=2,dY=1}},
			border = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
			texture = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
			barColor = {r=0,g=1,b=0,a=1},
			barHighThresholdColor = {r=1,g=1,b=0,a=1},
			barHighThreshold = 60,
			barLowThresholdColor = {r=1,g=0,b=0,a=1},
			barLowThreshold = 30,
			children =
			{
				{	-- Health text frame
					type = 	"TGUnitText",
					name = "Health Text",
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="LEFT",dX=5,dY=0},
						{myPoint="RIGHT",anchor=0,anchorPoint="RIGHT",dX=-5,dY=0}},
					size = {height=20},
					text = "Health: $hc/$hm",
					alignH = "LEFT",
					alignV = "CENTER"
				}
			}
		},
		{		-- Mana bar frame
			type = "TGUnitManaBar",
			name = "Mana Bar",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-7}},
			border = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
			texture = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
			--texture = "Interface\\TargetingFrame\\UI-StatusBar"
			children =
			{
				{		-- Mana text frame
					type = "TGUnitText",
					name = "Mana Text",
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="LEFT",dX=5,dY=0},
						{myPoint="RIGHT",anchor=0,anchorPoint="RIGHT",dX=-5,dY=0}},
					size = {height=20},
					text = "$mt: $mc/$mm",
					alignH = "LEFT",
					alignV = "CENTER"
				}
			}
		},
		{		-- Cast bar frame
			type = "TGUnitCastBar",
			name = "Cast Bar",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-7}},
			hideIfInactive = false,
			texture = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
			children =
			{
				{		-- Cast icon frame
					type = "TGUnitCastIcon",
					name = "Cast Icon",
					size = {width=10,height=10},
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="LEFT",dX=5,dY=0}},
				},
				{		--- Cast spell text
					type = "TGUnitText",
					name = "Cast Text",
					size = {height=12},
					anchors = {
						{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=5,dY=0},
						{myPoint="RIGHT",anchor=0,anchorPoint="RIGHT",dX=-5,dY=0}},
					text = "-$ssp-",
					alignH = "CENTER",
					alignV = "CENTER"
				}
			}
		},
		{ 	-- Debuff frame 1
			type = "TGUnitBuff",
			name = "Debuff 1",
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="BOTTOMLEFT",dX=0,dY=-1}},
			buffIndex = -1,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{	-- Debuff frame 2
			type = "TGUnitBuff",
			name = "Debuff 2",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPRIGHT",dX=2,dY=0}},
			buffIndex = -2,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{	-- Debuff frame 3
			type = "TGUnitBuff",
			name = "Debuff 3",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPRIGHT",dX=2,dY=0}},
			buffIndex = -3,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{	-- Debuff frame 4
			type = "TGUnitBuff",
			name = "Debuff 4",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPRIGHT",dX=2,dY=0}},
			buffIndex = -4,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{	-- Debuff frame 5
			type = "TGUnitBuff",
			name = "Debuff 5",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPRIGHT",dX=2,dY=0}},
			buffIndex = -5,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{	-- Debuff frame 6
			type = "TGUnitBuff",
			name = "Debuff 6",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPRIGHT",dX=2,dY=0}},
			buffIndex = -6,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{	-- Debuff frame 7
			type = "TGUnitBuff",
			name = "Debuff 7",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPRIGHT",dX=2,dY=0}},
			buffIndex = -7,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{	-- Debuff frame 8
			type = "TGUnitBuff",
			name = "Debuff 8",
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="TOPRIGHT",dX=2,dY=0}},
			buffIndex = -8,
			buffTooltipAnchor = "ANCHOR_BOTTOMRIGHT"
		},
		{ 	-- Buff frame 1
			type = "TGUnitBuff",
			name = "Buff 1",
			anchors = {
				{myPoint="BOTTOMRIGHT",anchor=0,anchorPoint="TOPRIGHT",dX=0,dY=1}},
			buffIndex = 1,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
		{	-- Buff frame 2
			type = "TGUnitBuff",
			name = "Buff 2",
			anchors = {
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPLEFT",dX=-2,dY=0}},
			buffIndex = 2,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
		{	-- Buff frame 3
			type = "TGUnitBuff",
			name = "Buff 3",
			anchors = {
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPLEFT",dX=-2,dY=0}},
			buffIndex = 3,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
		{	-- Buff frame 4
			type = "TGUnitBuff",
			name = "Buff 4",
			anchors = {
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPLEFT",dX=-2,dY=0}},
			buffIndex = 4,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
		{	-- Buff frame 5
			type = "TGUnitBuff",
			name = "Buff 5",
			anchors = {
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPLEFT",dX=-2,dY=0}},
			buffIndex = 5,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
		{	-- Buff frame 6
			type = "TGUnitBuff",
			name = "Buff 6",
			anchors = {
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPLEFT",dX=-2,dY=0}},
			buffIndex = 6,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
		{	-- Buff frame 7
			type = "TGUnitBuff",
			name = "Buff 7",
			anchors = {
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPLEFT",dX=-2,dY=0}},
			buffIndex = 7,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
		{	-- Buff frame 8
			type = "TGUnitBuff",
			name = "Buff 8",
			anchors = {
				{myPoint="TOPRIGHT",anchor=-1,anchorPoint="TOPLEFT",dX=-2,dY=0}},
			buffIndex = 8,
			buffTooltipAnchor = "ANCHOR_RIGHT"
		},
	}
}

--[[
local TGUF_DEBUG_STUPID_PARTY_LAYOUT =
{
	filters =
	{
		"player",
	},
	frames =
	{
		{	-- Player unit
			--type = "TGUnitDebug",
			collection = "Built-in",
			type = "TGUnitDebug",
			unit = "player",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=20,dY=-20}},
			dependents =
			{
				{	-- Player pet
					collection = "Built-in",
					type = "TGUnitDebug",
					unit = "pet",
					hideInRaid = false,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=7}},
					dependents =
					{
						{	-- Player pet target
							collection = "Built-in",
							type = "TGUnitDebug",
							unit = "pettarget",
							hideInRaid = false,
							anchors = {
								{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
						}
					}
				}
			}
		},
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_STUPID_PARTY_LAYOUT,"TGUnitDebugStupidPartyLayout");
]]

local TGUF_DEBUG_PARTY_LAYOUT =
{
	filters =
	{
		"player",
		"party"
	},
	frames =
	{
		{	-- Player unit
			--type = "TGUnitDebug",
			collection = "DUF",
			type = "DUF_PlayerSmallModel",
			unit = "player",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=20,dY=-20}},
			dependents =
			{
				{	-- Player pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "pet",
					hideInRaid = false,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=7}},
					dependents =
					{
						{	-- Player pet target
							collection = "DUF",
							type = "DUF_PetTarget",
							unit = "pettarget",
							hideInRaid = false,
							anchors = {
								{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
						}
					}
				}
			}
		},
		{	-- Party1 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModelNoCast",
			unit = "party1",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-34}},
			dependents =
			{
				{	-- Party1 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet1",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		},
		{	-- Party2 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModelNoCast",
			unit = "party2",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-42}},
			dependents =
			{
				{	-- Party2 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet2",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		},
		{	-- Party3 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModelNoCast",
			unit = "party3",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-42}},
			dependents =
			{
				{	-- Party3 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet3",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		},
		{	-- Party4 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModelNoCast",
			unit = "party4",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-42}},
			dependents =
			{
				{	-- Party4 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet4",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		}
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_PARTY_LAYOUT,"TGUnitDebugPartyLayout");

--[[
local TGUF_DEBUG_PARTY_LAYOUT_MODERN =
{
	filters =
	{
		"player",
		"party"
	},
	frames =
	{
		{	-- Player unit
			collection = "Modern",
			type = "Player",
			unit = "player",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=550,dY=-670}},
			dependents =
			{
				{	-- Player pet
					collection = "Modern",
					type = "PlayerPet",
					unit = "pet",
					hideInRaid = false,
					anchors = {
						{myPoint="TOPLEFT",anchor=0,anchorPoint="BOTTOMLEFT",dX=0,dY=-13}},
					dependents =
					{
						{	-- Player pet target
							collection = "Modern",
							type = "PlayerPetTarget",
							unit = "pettarget",
							hideInRaid = false,
							anchors = {
								{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
						}
					}
				}
			}
		},
		{	-- Party1 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModel",
			unit = "party1",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-34}},
			dependents =
			{
				{	-- Party1 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet1",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		},
		{	-- Party2 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModel",
			unit = "party2",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-42}},
			dependents =
			{
				{	-- Party2 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet2",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		},
		{	-- Party3 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModel",
			unit = "party3",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-42}},
			dependents =
			{
				{	-- Party3 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet3",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		},
		{	-- Party4 unit
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Party",
			type = "DUF_PartySmallModel",
			unit = "party4",
			hideInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-42}},
			dependents =
			{
				{	-- Party4 pet
					collection = "DUF",
					type = "DUF_Pet",
					unit = "partypet4",
					hideInRaid = true,
					anchors = {
						{myPoint="LEFT",anchor=0,anchorPoint="RIGHT",dX=7,dY=0}}
				}
			}
		}
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_PARTY_LAYOUT_MODERN,"TGUnitDebugPartyLayoutModern");
]]

local TGUF_DEBUG_RAID_LAYOUT =
{
	filters =
	{
		"raid"
	},
	frames =
	{
		{	-- Raid1 unit
			collection = "DUF",
			unit = "raid1",
			showInRaid = true,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=70,dY=-90}}
		}
	}
}
function TGUFDebugRaidLayout_AllocateFrames(j,k,type)
	for i=j,k do
		local	raidFrame = {collection="DUF",type=type,unit="raid"..i,showInRaid=true,
							anchors={{myPoint="TOPLEFT",anchor=-1,anchorPoint="BOTTOMLEFT",dX=0,dY=-1}}};
		TGUF_DEBUG_RAID_LAYOUT.frames[i] = raidFrame;
	end
end
--[[
	This layout does:
		1		6
		2		7
		3		8
		4		9
		5		10
		11		16
		12		17
		13		18
		14		19
		15		20
		etc...
]]
--Left column
TGUF_DEBUG_RAID_LAYOUT.frames[1].type = "DUF_Raid_Left";
TGUFDebugRaidLayout_AllocateFrames(2,5,"DUF_Raid_Left");
TGUF_DEBUG_RAID_LAYOUT.frames[6] = {collection="DUF",type="DUF_Raid_Right",unit="raid6",showInRaid=true,
							  		anchors={{myPoint="TOPLEFT",anchor=1,anchorPoint="TOPRIGHT",dX=3,dY=0}}};
TGUFDebugRaidLayout_AllocateFrames(7,10,"DUF_Raid_Right");
TGUFDebugRaidLayout_AllocateFrames(11,15,"DUF_Raid_Left");
TGUF_DEBUG_RAID_LAYOUT.frames[11].anchors[1].anchor=5;
TGUFDebugRaidLayout_AllocateFrames(16,20,"DUF_Raid_Right");
TGUF_DEBUG_RAID_LAYOUT.frames[16].anchors[1].anchor=10;
TGUFDebugRaidLayout_AllocateFrames(21,25,"DUF_Raid_Left");
TGUF_DEBUG_RAID_LAYOUT.frames[21].anchors[1].anchor=15;
TGUFDebugRaidLayout_AllocateFrames(26,30,"DUF_Raid_Right");
TGUF_DEBUG_RAID_LAYOUT.frames[26].anchors[1].anchor=20;
TGUFDebugRaidLayout_AllocateFrames(31,35,"DUF_Raid_Left");
TGUF_DEBUG_RAID_LAYOUT.frames[31].anchors[1].anchor=25;
TGUFDebugRaidLayout_AllocateFrames(36,40,"DUF_Raid_Right");
TGUF_DEBUG_RAID_LAYOUT.frames[36].anchors[1].anchor=30;
--[[
	This layout does:
		1
		2
		3
		4
		...
TGUF_DEBUG_RAID_LAYOUT.frames[1].type = "DUF_Raid_Right";
TGUFDebugRaidLayout_AllocateFrames(2,40,"DUF_Raid_Right");
]]
-- And finally, register it
TGUnitFrames_RegisterLayout(TGUF_DEBUG_RAID_LAYOUT,"TGUnitDebugRaidLayout");

local TGUF_DEBUG_TARGET_LAYOUT =
{
	filters =
	{
		"target"
	},
	frames =
	{
		{	-- Target
			--type = "TGUnitDebug",
			collection = "DUF",
			--type = "DUF_Target",
			type = "DUF_TargetThreadNoCast",
			unit = "target",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=550,dY=-520}}
		},
		{	-- Targettarget
			--type = "TGUnitDebug",
			collection = "DUF",
			type = "DUF_Generic",
			unit = "targettarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		},
		{	-- Targettargettarget
			--type = "TGUnitDebug",
			collection = "DUF",
			type = "DUF_Generic",
			unit = "targettargettarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		}
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_TARGET_LAYOUT,"TGUnitDebugTargetLayout");

--[[
local TGUF_DEBUG_TARGET_LAYOUT_MODERN =
{
	filters =
	{
		"target"
	},
	frames =
	{
		{	-- Target
			collection = "Modern",
			type = "Target",
			unit = "target",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=550,dY=-580}}
		},
		{	-- Targettarget
			collection = "Modern",
			type = "Target",
			unit = "targettarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		},
		{	-- Targettargettarget
			collection = "Modern",
			type = "Target",
			unit = "targettargettarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		}
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_TARGET_LAYOUT_MODERN,"TGUnitDebugTargetLayoutModern");
]]

--[[
local TGUF_DEBUG_FOCUS_LAYOUT =
{
	filters =
	{
		"focus"
	},
	frames =
	{
		{	-- Target
			--type = "TGUnitDebug",
			collection = "DUF",
			type = "DUF_Generic",
			unit = "focus",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=550,dY=-620}}
		},
		{	-- Targettarget
			--type = "TGUnitDebug",
			collection = "DUF",
			type = "DUF_Generic",
			unit = "focustarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		},
		{	-- Targettargettarget
			--type = "TGUnitDebug",
			collection = "DUF",
			type = "DUF_Generic",
			unit = "focustargettarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		}
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_FOCUS_LAYOUT,"TGUnitDebugFocusLayout");
]]

--[[
local TGUF_DEBUG_FOCUS_LAYOUT_MODERN =
{
	filters =
	{
		"focus"
	},
	frames =
	{
		{	-- Target
			collection = "Modern",
			type = "Target",
			unit = "focus",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=717,dY=-670}}
		},
		{	-- Targettarget
			collection = "Modern",
			type = "Target",
			unit = "focustarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		},
		{	-- Targettargettarget
			collection = "Modern",
			type = "Target",
			unit = "focustargettarget",
			hideInRaid = false,
			anchors = {
				{myPoint="LEFT",anchor=-1,anchorPoint="RIGHT",dX=7,dY=0}}
		}
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_FOCUS_LAYOUT_MODERN,"TGUnitDebugFocusLayoutModern");
]]

function TGUnitDebug_AllocateFocusFrames()
	TGUF_DEBUG_FRAME_TEMPLATE.highlightIfTargetted = true;
	local	f1 = TGUnitFrames_AllocateUnitFrameTemplate("focus","TGUnitDebug",UIParent,{{myPoint="LEFT",anchorPoint="LEFT",dX=0,dY=0}},{UIParent});
	local	f2 = TGUnitFrames_AllocateUnitFrameTemplate("focustarget","TGUnitDebug",UIParent,{{myPoint="LEFT",anchorPoint="RIGHT",dX=2,dY=0}},{f1});
end

function TGUnitDebug_AllocateTargetFrames()
	TGUF_DEBUG_FRAME_TEMPLATE.highlightIfTargetted = true;
	local	f1 = TGUnitFrames_AllocateUnitFrameTemplate("targettargettarget","TGUnitDebug",UIParent,{{myPoint="RIGHT",anchorPoint="RIGHT",dX=0,dY=0}},{UIParent});
	local	f2 = TGUnitFrames_AllocateUnitFrameTemplate("targettarget","TGUnitDebug",UIParent,{{myPoint="RIGHT",anchorPoint="LEFT",dX=-2,dY=0}},{f1});
	TGUF_DEBUG_FRAME_TEMPLATE.highlightIfTargetted = false;
	local	f3 = TGUnitFrames_AllocateUnitFrameTemplate("target","TGUnitDebug",UIParent,{{myPoint="RIGHT",anchorPoint="LEFT",dX=-2,dY=0}},{f2});
end

--[[
local TGUF_DEBUG_AUTOFIND_LAYOUT =
{
	filters =
	{
	},
	frames =
	{
		{	-- AutoFind
			--type = "TGUnitDebug",
			collection = "DUF",
			type = "DUF_Generic",
			unit = "autotarget",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=550,dY=-880}}
		},
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_AUTOFIND_LAYOUT,"TGUnitDebugAutoFindLayout");
]]

local TGUF_DEBUG_CASTBAR_LAYOUT =
{
	filters =
	{
	},
	frames =
	{
		{
			collection = "DUF",
			type = "DUF_PlayerCastBar",
			unit = "player",
			hideInRaid = false,
			anchors = {
				{myPoint="TOPLEFT",anchor=0,anchorPoint="TOPLEFT",dX=550,dY=-770}
			}
		}
	}
}
TGUnitFrames_RegisterLayout(TGUF_DEBUG_CASTBAR_LAYOUT,"TGUnitDebugPlayerCastBarLayout");

local firstTime = true;
function TGUnitFramesDebuggingComponent_OnPlayerEnteringWorld()
	if firstTime == true then
		TGUnitFrames_RegisterUnitFrameTemplate(TGUF_NEW_UNIT_FRAME_TEMPLATE,"New Unit Frame",true);
		TGUnitFrames_RegisterUnitFrameTemplate(TGUF_DEBUG_FRAME_TEMPLATE,"TGUnitDebug",true);
		TGUnitFrames_RegisterUnitFrameTemplate(TGUF_DEBUG_STUPID_TEMPLATE,"TGUnitStupid",true);

		--[[
		TGUnitFrames_AllocateLayout("TGUnitDebugPartyLayoutModern");
		TGUnitFrames_AllocateLayout("TGUnitDebugTargetLayoutModern");
		TGUnitFrames_AllocateLayout("TGUnitDebugFocusLayoutModern");
		]]
		--TGUnitFrames_AllocateLayout("TGUnitDebugStupidPartyLayout");
		TGUnitFrames_AllocateLayout("TGUnitDebugPartyLayout");
		TGUnitFrames_AllocateLayout("TGUnitDebugTargetLayout");
		--TGUnitFrames_AllocateLayout("TGUnitDebugFocusLayout");
		--TGUnitFrames_AllocateLayout("TGUnitDebugPlayerCastBarLayout");
		--TGUnitFrames_AllocateLayout("TGUnitDebugAutoFindLayout")

		local raidFrames = TGUnitFrames_AllocateLayout("TGUnitDebugRaidLayout");
		TGRaidSorter_SetRaidFrames(raidFrames);

		firstTime = false;
	end
end

-- Register the component
local TGUnitFramesDebuggingComponent = {
	["onPlayerEnteringWorld"] = TGUnitFramesDebuggingComponent_OnPlayerEnteringWorld
	};
TGUnitFrames_RegisterComponent(TGUnitFramesDebuggingComponent);
