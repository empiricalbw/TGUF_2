
TGUF_TEMPLATES_USER_TEMPLATES = {
}
TGUF_USER_COLLECTIONS = {
	["DUF"] = {
		["DUF_Target"] = {
			["anchors"] = {
				{
					["anchorPoint"] = "CENTER",
					["dY"] = 0,
					["myPoint"] = "CENTER",
					["dX"] = 0,
				}, -- [1]
			},
			["type"] = "TGUnitFrame",
			["name"] = "Root UnitFrame",
			["highlightIfTargetted"] = false,
			["collection"] = "DUF",
			["backgroundColor"] = {
				["a"] = "0",
				["b"] = 0,
				["g"] = 0,
				["r"] = 0,
			},
			["children"] = {
				{
					["type"] = "TGUnitClassificationBorder",
					["eliteColor"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.75,
						["b"] = 0.35,
					},
					["rareEliteColor"] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.4,
						["b"] = 0,
					},
					["rareColor"] = {
						["a"] = 1,
						["r"] = 0.573,
						["g"] = 0.588,
						["b"] = 0.612,
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 15,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -15,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -15,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["disabled"] = false,
							["dX"] = 15,
						}, -- [2]
					},
					["name"] = "Classification Border",
					["edgeFile"] = "Interface\\Addons\\TGUF_2\\Images\\RoundedBorder",
					["edgeSize"] = 24,
					["bossColor"] = {
						["a"] = 1,
						["r"] = 0.55,
						["g"] = 0.075,
						["b"] = 0.1,
					},
					["children"] = {
						{
							["comboIndex"] = 1,
							["name"] = "Combo 1",
							["size"] = {
								["height"] = 64,
								["width"] = 11,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = 13,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 0,
									["dX"] = 13,
								}, -- [1]
							},
							["color"] = {
								["a"] = 1,
								["b"] = "0",
								["g"] = "0",
								["r"] = "0.15",
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo1",
						}, -- [1]
						{
							["comboIndex"] = 2,
							["name"] = "Combo 2",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
							},
							["color"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 0,
								["r"] = "0.3",
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo2",
						}, -- [2]
						{
							["comboIndex"] = 3,
							["name"] = "Combo 3",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
							},
							["color"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 0,
								["r"] = "0.45",
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo3",
						}, -- [3]
						{
							["comboIndex"] = 4,
							["name"] = "Combo 4",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
							},
							["color"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 0,
								["r"] = "0.6",
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo4",
						}, -- [4]
						{
							["comboIndex"] = 5,
							["name"] = "Combo 5",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
							},
							["color"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 0,
								["r"] = "0.75",
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo5",
						}, -- [5]
					},
					["normalColor"] = {
						["a"] = 0,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
				}, -- [1]
				{
					["type"] = "TGUnitTexture",
					["bgColor_oldValue"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["bgColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["textureColor"] = {
						["a"] = 1,
						["b"] = "0",
						["g"] = "0",
						["r"] = "0",
					},
					["name"] = "Bar Background",
					["edgeSize_oldValue"] = 16,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 42,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = 0,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["disabled"] = false,
							["dX"] = 0,
						}, -- [2]
					},
					["children"] = {
						{
							["difficultColor"] = {
								["a"] = 0.5,
								["r"] = 1,
								["g"] = 1,
								["b"] = 0,
							},
							["type"] = "TGUnitModel",
							["impossibleColor_oldValue"] = {
								["a"] = 0.5,
								["r"] = 1,
								["g"] = 0.1,
								["b"] = 0.1,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
							},
							["modelPercent"] = 100,
							["impossibleColor"] = {
								["a"] = 0.5,
								["r"] = 1,
								["g"] = 0.1,
								["b"] = 0.1,
							},
							["standardColor"] = {
								["a"] = 0.5,
								["r"] = 0.25,
								["g"] = 0.75,
								["b"] = 0.25,
							},
							["camera"] = "HEAD",
							["trivialColor"] = {
								["a"] = 0.5,
								["r"] = 0.5,
								["g"] = 0.5,
								["b"] = 0.5,
							},
							["name"] = "Model",
							["veryDifficultColor"] = {
								["a"] = 0.5,
								["r"] = 1,
								["g"] = 0.5,
								["b"] = 0.25,
							},
							["modelRotationDegrees"] = 30,
							["modelPosition"] = {
								["y"] = 0,
								["x"] = 1.6,
								["z"] = -0.15,
							},
							["backgroundColor"] = {
								["a"] = 0.3,
								["b"] = 0.502,
								["g"] = 0.502,
								["r"] = 0.502,
							},
							["size"] = {
								["height"] = 42,
								["width"] = 42,
							},
						}, -- [1]
						{
							["type"] = "TGUnitStatusBorder",
							["name"] = "Border",
							["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 6,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = -7,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = -6,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 0,
									["dX"] = 6,
									["disabled"] = false,
								}, -- [2]
							},
							["edgeSize"] = 20,
							["edgeColor_oldValue"] = {
								["a"] = 1,
								["b"] = "1",
								["g"] = "1",
								["r"] = "1",
							},
						}, -- [2]
						{
							["type"] = "TGUnitHealthBar",
							["barLowThresholdColor"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 0,
								["r"] = 1,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPRIGHT",
									["anchor"] = 0,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
							},
							["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
							["barColor"] = {
								["a"] = 1,
								["b"] = 0.529,
								["g"] = 0.655,
								["r"] = 0.271,
							},
							["size"] = {
								["height"] = 13,
							},
							["colorFollowsHealth"] = true,
							["tappedColor"] = {
								["a"] = 1,
								["r"] = "0.666",
								["g"] = "0.666",
								["b"] = "0.666",
							},
							["name"] = "Health Bar",
							["barHighThreshold"] = 60,
							["barLowThreshold"] = 30,
							["barHighThresholdColor"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							},
							["children"] = {
								{
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 0,
										}, -- [1]
									},
									["type"] = "TGUnitCombatIcon",
									["name"] = "Combat Icon",
									["size"] = {
										["height"] = 20,
										["width"] = 20,
									},
								}, -- [1]
								{
									["type"] = "TGUnitText",
									["alignH"] = "RIGHT",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 1,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["disabled"] = true,
											["dX"] = 5,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 1,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = -5,
										}, -- [2]
									},
									["text"] = "$hc/$hm",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Health Text",
									["fontSize"] = 10,
									["alignV"] = "CENTER",
									["color"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["size"] = {
										["height"] = 12,
										["width"] = 75,
									},
								}, -- [2]
								{
									["type"] = "TGUnitText",
									["alignH"] = "LEFT",
									["color"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "1",
									},
									["text"] = "$nm",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Name",
									["anchors"] = {
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = -2,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "TOPLEFT",
											["dY"] = 0,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = -1,
											["disabled"] = false,
											["dX"] = 15,
										}, -- [2]
										{
											["anchorPoint"] = "TOP",
											["dY"] = 0,
											["myPoint"] = "TOP",
											["anchor"] = -1,
											["disabled"] = true,
											["dX"] = 0,
										}, -- [3]
									},
									["alignV"] = "CENTER",
									["fontSize"] = 10,
									["size"] = {
										["height"] = 12,
									},
								}, -- [3]
							},
							["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
						}, -- [3]
						{
							["energyColor"] = {
								["a"] = 1,
								["r"] = "0.75",
								["g"] = "0.75",
								["b"] = "0.25",
							},
							["type"] = "TGUnitManaBar",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = -2,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = -2,
									["myPoint"] = "TOPRIGHT",
									["anchor"] = -1,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
							},
							["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
							["rageColor"] = {
								["a"] = 1,
								["r"] = 0.675,
								["g"] = "0.15",
								["b"] = "0.15",
							},
							["name"] = "Mana Bar",
							["size"] = {
								["height"] = 13,
							},
							["focusColor"] = {
								["a"] = 1,
								["r"] = 0.675,
								["g"] = 0.337,
								["b"] = 0.169,
							},
							["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
							["children"] = {
								{
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 3,
										}, -- [1]
									},
									["type"] = "TGUnitRaidTargetIcon",
									["name"] = "Raid Target Icon",
									["size"] = {
										["height"] = 12,
										["width"] = 12,
									},
								}, -- [1]
								{
									["type"] = "TGUnitText",
									["alignH"] = "LEFT",
									["color"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["text"] = "$thp $lv $ccl",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Class/Level",
									["fontSize"] = 10,
									["alignV"] = "CENTER",
									["anchors"] = {
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = -1,
											["dX"] = 5,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["disabled"] = false,
											["dX"] = 0,
										}, -- [2]
									},
									["size"] = {
										["height"] = 20,
									},
								}, -- [2]
								{
									["type"] = "TGUnitText",
									["alignH"] = "RIGHT",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 5,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = -5,
										}, -- [2]
									},
									["text"] = "$mc/$mm",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Mana Text",
									["fontSize"] = 10,
									["alignV"] = "CENTER",
									["color"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["size"] = {
										["height"] = 20,
									},
								}, -- [3]
							},
							["manaColor"] = {
								["a"] = 1,
								["b"] = 1,
								["g"] = 0.624,
								["r"] = 0.376,
							},
						}, -- [4]
						{
							["type"] = "TGUnitCastIcon",
							["name"] = "Cast Icon",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = -2,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 0,
								}, -- [1]
							},
							["size"] = {
								["height"] = 12,
								["width"] = 12,
							},
							["backgroundColor"] = {
								["a"] = "0.5",
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
							["hideIfInactive"] = true,
						}, -- [5]
						{
							["type"] = "TGUnitCastBar",
							["anchors"] = {
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = -1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = -2,
									["myPoint"] = "TOPRIGHT",
									["anchor"] = -2,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
							},
							["castingColor"] = {
								["a"] = 1,
								["b"] = "0.25",
								["g"] = "1",
								["r"] = 1,
							},
							["size"] = {
								["height"] = 12,
								["width"] = 50,
							},
							["name"] = "Cast Bar",
							["children"] = {
								{
									["type"] = "TGUnitText",
									["alignH"] = "CENTER",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 1,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 5,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 1,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = -5,
										}, -- [2]
									},
									["text"] = "-$ssp-",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Cast Text",
									["fontSize"] = 10,
									["alignV"] = "CENTER",
									["color"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["size"] = {
										["height"] = 12,
									},
								}, -- [1]
							},
							["hideIfInactive"] = false,
							["channellingColor"] = {
								["a"] = 1,
								["b"] = "0.25",
								["g"] = "1",
								["r"] = "0.25",
							},
							["castingColor_oldValue"] = {
								["a"] = 1,
								["b"] = "0.25",
								["g"] = "1",
								["r"] = 1,
							},
							["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
						}, -- [6]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = -3,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 1",
							["numberSize"] = 10,
							["buffIndex"] = -1,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [7]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 2",
							["numberSize"] = 10,
							["buffIndex"] = -2,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [8]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 3",
							["numberSize"] = 10,
							["buffIndex"] = -3,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [9]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 4",
							["numberSize"] = 10,
							["buffIndex"] = -4,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [10]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 5",
							["numberSize"] = 10,
							["buffIndex"] = -5,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [11]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 6",
							["numberSize"] = 10,
							["buffIndex"] = -6,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [12]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 7",
							["numberSize"] = 10,
							["buffIndex"] = -7,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [13]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 8",
							["numberSize"] = 10,
							["buffIndex"] = -8,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [14]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 9",
							["numberSize"] = 10,
							["buffIndex"] = -9,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [15]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Debuff 10",
							["numberSize"] = 10,
							["buffIndex"] = -10,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [16]
						{
							["type"] = "TGUnitBuff",
							["displayNumber_oldValue"] = true,
							["numberSize_oldValue"] = 10,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberFont_oldValue"] = "Fonts\\ARIALN.TTF",
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 11",
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["buffIndex"] = -11,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [17]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -11,
									["dX"] = 0,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 12",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -12,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [18]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 13",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -13,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [19]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 14",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -14,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [20]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 15",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -15,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [21]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 16",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -16,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [22]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 17",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -17,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [23]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 18",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -18,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [24]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 19",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -19,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [25]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 20",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -20,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [26]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 21",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -21,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [27]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberSize"] = 10,
							["name"] = "Debuff 22",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -22,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [28]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 3,
									["myPoint"] = "BOTTOMLEFT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 1",
							["numberSize"] = 10,
							["buffIndex"] = 1,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [29]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 2",
							["numberSize"] = 10,
							["buffIndex"] = 2,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [30]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 3",
							["numberSize"] = 10,
							["buffIndex"] = 3,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [31]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 4",
							["numberSize"] = 10,
							["buffIndex"] = 4,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [32]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 5",
							["numberSize"] = 10,
							["buffIndex"] = 5,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [33]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 6",
							["numberSize"] = 10,
							["buffIndex"] = 6,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [34]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 7",
							["numberSize"] = 10,
							["buffIndex"] = 7,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [35]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 8",
							["numberSize"] = 10,
							["buffIndex"] = 8,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [36]
						{
							["type"] = "TGUnitBuff",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 9",
							["numberSize"] = 10,
							["buffIndex"] = 9,
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [37]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberSize"] = 10,
							["name"] = "Buff 10",
							["buffIndex"] = 10,
							["type"] = "TGUnitBuff",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [38]
						{
							["type"] = "TGUnitBuff",
							["displayNumber_oldValue"] = true,
							["numberSize_oldValue"] = 10,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["numberSize"] = 10,
							["numberFont_oldValue"] = "Fonts\\ARIALN.TTF",
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["name"] = "Buff 11",
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["buffIndex"] = 11,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [39]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOP",
									["dY"] = 0,
									["myPoint"] = "BOTTOM",
									["anchor"] = -11,
									["dX"] = 0,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberSize"] = 10,
							["name"] = "Buff 12",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 12,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [40]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberSize"] = 10,
							["name"] = "Buff 13",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 13,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [41]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberSize"] = 10,
							["name"] = "Buff 14",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 14,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [42]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberSize"] = 10,
							["name"] = "Buff 15",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 15,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [43]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberSize"] = 10,
							["name"] = "Buff 16",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 16,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [44]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["name"] = "Buff 17",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 17,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [45]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["name"] = "Buff 18",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 18,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [46]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["name"] = "Buff 19",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 19,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [47]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["name"] = "Buff 20",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 20,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [48]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["name"] = "Buff 21",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 21,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [49]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["name"] = "Buff 22",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 22,
							["numberAlignH"] = "RIGHT",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [50]
					},
					["edgeFile_oldValue"] = "Interface\\Tooltips\\UI-Tooltip-Border",
				}, -- [2]
			},
			["size"] = {
				["height"] = 42,
				["width"] = 242,
			},
		},
		["DUF_Pet"] = {
			["anchors"] = {
				{
					["anchorPoint"] = "RIGHT",
					["dY"] = 0,
					["myPoint"] = "LEFT",
					["anchor"] = 0,
					["dX"] = 7,
				}, -- [1]
			},
			["type"] = "TGUnitFrame",
			["name"] = "Root UnitFrame",
			["children"] = {
				{
					["type"] = "TGUnitTexture",
					["name"] = "Border",
					["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 6,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -6,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -6,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["disabled"] = false,
							["dX"] = 6,
						}, -- [2]
					},
					["edgeSize"] = 20,
				}, -- [1]
				{
					["type"] = "TGUnitHealthBar",
					["barLowThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 0,
						}, -- [1]
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPRIGHT",
							["anchor"] = 0,
							["dX"] = 0,
							["disabled"] = false,
						}, -- [2]
					},
					["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
					["barColor"] = {
						["a"] = 1,
						["r"] = 0.271,
						["g"] = 0.655,
						["b"] = 0.529,
					},
					["barHighThreshold"] = 60,
					["name"] = "Health Bar",
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
					["barHighThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["barLowThreshold"] = 30,
					["children"] = {
						{
							["fontSize"] = 9,
							["alignH"] = "LEFT",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["text"] = "$nm",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Name",
							["type"] = "TGUnitText",
							["alignV"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 2,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
								{
									["anchorPoint"] = "TOP",
									["dY"] = 0,
									["myPoint"] = "TOP",
									["anchor"] = 0,
									["dX"] = 0,
									["disabled"] = true,
								}, -- [3]
							},
							["size"] = {
								["height"] = 10,
							},
						}, -- [1]
						{
							["fontSize"] = 9,
							["alignH"] = "RIGHT",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 5,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = -5,
								}, -- [2]
							},
							["text"] = "$hc/$hm",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Health Text",
							["type"] = "TGUnitText",
							["alignV"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["size"] = {
								["height"] = 10,
							},
						}, -- [2]
					},
					["size"] = {
						["height"] = 10,
					},
				}, -- [2]
				{
					["manaColor"] = {
						["a"] = 1,
						["r"] = 0.376,
						["g"] = 0.624,
						["b"] = 1,
					},
					["type"] = "TGUnitManaBar",
					["name"] = "Mana Bar",
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
					["anchors"] = {
						{
							["anchorPoint"] = "BOTTOM",
							["dY"] = -1,
							["myPoint"] = "TOP",
							["anchor"] = -1,
							["dX"] = 0,
						}, -- [1]
						{
							["anchorPoint"] = "LEFT",
							["dY"] = -2,
							["myPoint"] = "LEFT",
							["anchor"] = 0,
							["dX"] = 0,
							["disabled"] = false,
						}, -- [2]
						{
							["anchorPoint"] = "RIGHT",
							["dY"] = 0,
							["myPoint"] = "RIGHT",
							["anchor"] = 0,
							["disabled"] = false,
							["dX"] = 0,
						}, -- [3]
					},
					["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
					["children"] = {
						{
							["fontSize"] = 9,
							["alignH"] = "LEFT",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["text"] = "$lv $ccl",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Class/Level",
							["type"] = "TGUnitText",
							["alignV"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = -1,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 2,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = -1,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["size"] = {
								["height"] = 10,
							},
						}, -- [1]
						{
							["fontSize"] = 9,
							["alignH"] = "RIGHT",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = -1,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 5,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = -1,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = -5,
								}, -- [2]
							},
							["text"] = "$mc/$mm",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Mana Text",
							["type"] = "TGUnitText",
							["alignV"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["size"] = {
								["height"] = 10,
							},
						}, -- [2]
					},
					["size"] = {
						["height"] = 10,
					},
				}, -- [3]
				{
					["channellingColor"] = {
						["a"] = 1,
						["r"] = "0.25",
						["g"] = "1",
						["b"] = "0.25",
					},
					["anchors"] = {
						{
							["anchorPoint"] = "BOTTOM",
							["dY"] = -1,
							["myPoint"] = "TOP",
							["anchor"] = -1,
							["dX"] = 0,
						}, -- [1]
						{
							["anchorPoint"] = "LEFT",
							["dY"] = 0,
							["myPoint"] = "LEFT",
							["anchor"] = 0,
							["dX"] = 0,
							["disabled"] = false,
						}, -- [2]
						{
							["anchorPoint"] = "RIGHT",
							["dY"] = 0,
							["myPoint"] = "RIGHT",
							["anchor"] = 0,
							["disabled"] = false,
							["dX"] = 0,
						}, -- [3]
					},
					["castingColor"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = "1",
						["b"] = "0.25",
					},
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
					["name"] = "Cast Bar",
					["castingColor_oldValue"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = "1",
						["b"] = "0.25",
					},
					["type"] = "TGUnitCastBar",
					["hideIfInactive"] = false,
					["children"] = {
					},
					["size"] = {
						["height"] = 3,
						["width"] = 50,
					},
				}, -- [4]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "BOTTOMLEFT",
							["dY"] = -2,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 0,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 1",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -1,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [5]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberSize"] = 9,
					["type"] = "TGUnitBuff",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignV"] = "BOTTOM",
					["buffIndex"] = -2,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 2",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["shadowOffset_oldValue"] = {
						["y"] = -2,
						["x"] = 2,
					},
					["fontFlags_oldValue"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [6]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 3",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -3,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [7]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 4",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -4,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [8]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 5",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -5,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [9]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 6",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -6,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [10]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 7",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -7,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [11]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 8",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -8,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [12]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 9",
					["type"] = "TGUnitBuff",
					["buffIndex"] = -9,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [13]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 3,
							["myPoint"] = "BOTTOMLEFT",
							["anchor"] = 0,
							["dX"] = 0,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 1",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 1,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [14]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 2",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 2,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [15]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 3",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 3,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [16]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 4",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 4,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [17]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 5",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 5,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [18]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 6",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 6,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [19]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 7",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 7,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [20]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 8",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 8,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [21]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Buff 9",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 9,
					["numberSize"] = 9,
					["numberAlignH"] = "RIGHT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [22]
			},
			["collection"] = "DUF",
			["highlightIfTargetted"] = true,
			["backgroundColor"] = {
				["a"] = "1",
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["size"] = {
				["height"] = 25,
				["width"] = 125,
			},
		},
		["DUF_PartySmallModel"] = {
			["collection"] = "DUF",
			["type"] = "TGUnitFrame",
			["name"] = "Root UnitFrame",
			["children"] = {
				{
					["normalFile"] = "Interface\\Addons\\TGUF_2\\Images\\RoundedBorder",
					["edgeSize"] = 16,
					["poisonColor"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0.6,
						["b"] = 0,
					},
					["normalSize"] = 16,
					["type"] = "TGUnitStatusBorder",
					["normalColor"] = {
						["a"] = "0",
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					["diseaseColor"] = {
						["a"] = 1,
						["r"] = 0.6,
						["g"] = 0.4,
						["b"] = 0,
					},
					["magicColor"] = {
						["a"] = 1,
						["r"] = 0.2,
						["g"] = 0.6,
						["b"] = 1,
					},
					["name"] = "Status Border",
					["normalSize_oldValue"] = 16,
					["edgeFile"] = "Interface\\Addons\\TGUF_2\\Images\\RoundedBorder",
					["normalFile_oldValue"] = "Interface\\Addons\\TGUF_2\\DUF_Images\\JessBorder",
					["curseColor"] = {
						["a"] = 1,
						["r"] = 0.6,
						["g"] = 0,
						["b"] = 1,
					},
					["children"] = {
						{
							["normalFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
							["type"] = "TGUnitStatusBorder",
							["normalColor"] = {
								["a"] = 1,
								["b"] = 1,
								["g"] = 1,
								["r"] = 1,
							},
							["name"] = "Border",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = -4,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 0,
									["dX"] = 4,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 4,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 0,
									["dX"] = -4,
									["disabled"] = false,
								}, -- [2]
							},
							["normalFile_oldValue"] = "Interface\\Addons\\TGUF_2\\DUF_Images\\JessBorder",
							["magicColor_oldValue"] = {
								["a"] = 1,
								["b"] = 1,
								["g"] = 0.6,
								["r"] = 0.2,
							},
							["curseColor_oldValue"] = {
								["a"] = 1,
								["r"] = 0.6,
								["g"] = 0,
								["b"] = 1,
							},
							["poisonColor_oldValue"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 0.6,
								["r"] = 0,
							},
							["edgeFile_oldValue"] = "Interface\\Tooltips\\UI-Tooltip-Border",
							["normalSize_oldValue"] = 16,
							["normalSize"] = 20,
							["edgeSize_oldValue"] = 20,
							["diseaseColor_oldValue"] = {
								["a"] = 1,
								["b"] = 0,
								["g"] = 0.4,
								["r"] = 0.6,
							},
							["children"] = {
								{
									["type"] = "TGUnitHealthBar",
									["barLowThresholdColor"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = 0,
										["b"] = 0,
									},
									["anchors"] = {
										{
											["anchorPoint"] = "TOPLEFT",
											["dY"] = -6,
											["myPoint"] = "TOPLEFT",
											["anchor"] = 0,
											["dX"] = 6,
										}, -- [1]
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = 0,
											["dX"] = -6,
											["disabled"] = false,
										}, -- [2]
									},
									["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
									["barColor"] = {
										["a"] = 1,
										["r"] = 0.271,
										["g"] = 0.655,
										["b"] = 0.529,
									},
									["barHighThreshold"] = 60,
									["name"] = "Health Bar",
									["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
									["barLowThreshold"] = 30,
									["barHighThresholdColor"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = 1,
										["b"] = 0,
									},
									["children"] = {
										{
											["anchors"] = {
												{
													["anchorPoint"] = "LEFT",
													["dY"] = 0,
													["myPoint"] = "LEFT",
													["anchor"] = 0,
													["dX"] = 23,
												}, -- [1]
											},
											["type"] = "TGUnitCombatIcon",
											["name"] = "Combat Icon",
											["size"] = {
												["height"] = 20,
												["width"] = 20,
											},
										}, -- [1]
										{
											["type"] = "TGUnitText",
											["alignH"] = "LEFT",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["text"] = "$nm",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Name",
											["fontSize"] = 10,
											["alignV"] = "CENTER",
											["anchors"] = {
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 0,
													["myPoint"] = "LEFT",
													["anchor"] = -1,
													["dX"] = 0,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 0,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["dX"] = 0,
													["disabled"] = false,
												}, -- [2]
												{
													["anchorPoint"] = "TOP",
													["dY"] = -3,
													["myPoint"] = "TOP",
													["anchor"] = 0,
													["dX"] = 0,
													["disabled"] = false,
												}, -- [3]
											},
											["size"] = {
												["height"] = 12,
											},
										}, -- [2]
										{
											["type"] = "TGUnitText",
											["alignH"] = "RIGHT",
											["anchors"] = {
												{
													["anchorPoint"] = "LEFT",
													["dY"] = 1,
													["myPoint"] = "LEFT",
													["anchor"] = 0,
													["dX"] = 5,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 1,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["dX"] = -5,
												}, -- [2]
											},
											["text"] = "$hc/$hm",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Health Text",
											["fontSize"] = 10,
											["alignV"] = "CENTER",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["size"] = {
												["height"] = 20,
											},
										}, -- [3]
									},
									["size"] = {
										["height"] = 20,
									},
								}, -- [1]
								{
									["energyColor"] = {
										["a"] = 1,
										["r"] = "0.75",
										["g"] = "0.75",
										["b"] = "0.25",
									},
									["type"] = "TGUnitManaBar",
									["anchors"] = {
										{
											["anchorPoint"] = "BOTTOMLEFT",
											["dY"] = -2,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "BOTTOMRIGHT",
											["dY"] = -2,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = -1,
											["dX"] = 0,
											["disabled"] = false,
										}, -- [2]
									},
									["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
									["rageColor"] = {
										["a"] = 1,
										["r"] = "0.675",
										["g"] = "0.15",
										["b"] = "0.15",
									},
									["name"] = "Mana Bar",
									["manaColor"] = {
										["a"] = 1,
										["r"] = 0.376,
										["g"] = 0.624,
										["b"] = 1,
									},
									["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
									["children"] = {
										{
											["anchors"] = {
												{
													["anchorPoint"] = "TOPLEFT",
													["dY"] = 0,
													["myPoint"] = "TOPLEFT",
													["anchor"] = 0,
													["dX"] = 26,
												}, -- [1]
											},
											["type"] = "TGUnitRaidTargetIcon",
											["name"] = "Raid Target Icon",
											["size"] = {
												["height"] = 12,
												["width"] = 12,
											},
										}, -- [1]
										{
											["type"] = "TGUnitText",
											["alignH"] = "LEFT",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["text"] = "$lv $cl",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Class/Level",
											["fontSize"] = 10,
											["alignV"] = "CENTER",
											["anchors"] = {
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 0,
													["myPoint"] = "LEFT",
													["anchor"] = -1,
													["dX"] = 5,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 0,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["disabled"] = false,
													["dX"] = 0,
												}, -- [2]
											},
											["size"] = {
												["height"] = 20,
											},
										}, -- [2]
										{
											["type"] = "TGUnitText",
											["alignH"] = "RIGHT",
											["anchors"] = {
												{
													["anchorPoint"] = "LEFT",
													["dY"] = 0,
													["myPoint"] = "LEFT",
													["anchor"] = 0,
													["dX"] = 5,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 0,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["dX"] = -5,
												}, -- [2]
											},
											["text"] = "$mc/$mm",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Mana Text",
											["fontSize"] = 10,
											["alignV"] = "CENTER",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["size"] = {
												["height"] = 20,
											},
										}, -- [3]
									},
									["size"] = {
										["height"] = 13,
									},
								}, -- [2]
								{
									["type"] = "TGUnitModel",
									["name"] = "Model",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = -6,
										}, -- [1]
										{
											["anchorPoint"] = "BOTTOM",
											["dY"] = -7,
											["myPoint"] = "BOTTOM",
											["anchor"] = -1,
											["disabled"] = false,
											["dX"] = 0,
										}, -- [2]
									},
									["camera"] = "BODY",
									["backgroundColor"] = {
										["a"] = "0",
										["r"] = 0,
										["g"] = 0,
										["b"] = 0,
									},
									["size"] = {
										["height"] = 47,
										["width"] = 46,
									},
								}, -- [3]
								{
									["type"] = "TGUnitCastIcon",
									["name"] = "Cast Icon",
									["anchors"] = {
										{
											["anchorPoint"] = "BOTTOMLEFT",
											["dY"] = -2,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -2,
											["dX"] = 0,
										}, -- [1]
									},
									["hideIfInactive"] = true,
									["backgroundColor"] = {
										["a"] = "0.5",
										["r"] = 0,
										["g"] = 0,
										["b"] = 0,
									},
									["size"] = {
										["height"] = 12,
										["width"] = 12,
									},
								}, -- [4]
								{
									["type"] = "TGUnitCastBar",
									["anchors"] = {
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = -2,
											["myPoint"] = "LEFT",
											["anchor"] = -1,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "BOTTOMRIGHT",
											["dY"] = -2,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = -3,
											["dX"] = 0,
											["disabled"] = false,
										}, -- [2]
									},
									["castingColor"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "0.25",
									},
									["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
									["name"] = "Cast Bar",
									["castingColor_oldValue"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "0.25",
									},
									["channellingColor"] = {
										["a"] = 1,
										["r"] = "0.25",
										["g"] = "1",
										["b"] = "0.25",
									},
									["hideIfInactive"] = false,
									["children"] = {
										{
											["type"] = "TGUnitText",
											["alignH"] = "CENTER",
											["anchors"] = {
												{
													["anchorPoint"] = "LEFT",
													["dY"] = 1,
													["myPoint"] = "LEFT",
													["anchor"] = 0,
													["dX"] = 5,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 1,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["dX"] = -5,
												}, -- [2]
											},
											["text"] = "-$ssp-",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Cast Text",
											["fontSize"] = 10,
											["alignV"] = "CENTER",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["size"] = {
												["height"] = 12,
											},
										}, -- [1]
									},
									["size"] = {
										["height"] = 12,
										["width"] = 50,
									},
								}, -- [5]
								{
									["anchors"] = {
										{
											["anchorPoint"] = "TOPLEFT",
											["dY"] = -18,
											["myPoint"] = "BOTTOMLEFT",
											["anchor"] = 0,
											["dX"] = -13,
										}, -- [1]
									},
									["type"] = "TGUnitLeaderIcon",
									["name"] = "Leader Icon",
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
								}, -- [6]
								{
									["anchors"] = {
										{
											["anchorPoint"] = "BOTTOM",
											["dY"] = 1,
											["myPoint"] = "TOP",
											["anchor"] = -1,
											["dX"] = -1,
										}, -- [1]
									},
									["type"] = "TGUnitLootMasterIcon",
									["name"] = "Loot Master Icon",
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
								}, -- [7]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "BOTTOMLEFT",
											["dY"] = 3,
											["myPoint"] = "TOPLEFT",
											["anchor"] = 0,
											["dX"] = 5,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 1",
									["numberSize"] = 10,
									["buffIndex"] = -1,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [8]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 2",
									["numberSize"] = 10,
									["buffIndex"] = -2,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [9]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 3",
									["numberSize"] = 10,
									["buffIndex"] = -3,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [10]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 4",
									["numberSize"] = 10,
									["buffIndex"] = -4,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [11]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 5",
									["numberSize"] = 10,
									["buffIndex"] = -5,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [12]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 6",
									["numberSize"] = 10,
									["buffIndex"] = -6,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [13]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 7",
									["numberSize"] = 10,
									["buffIndex"] = -7,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [14]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 8",
									["numberSize"] = 10,
									["buffIndex"] = -8,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [15]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 9",
									["numberSize"] = 10,
									["buffIndex"] = -9,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [16]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 0,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Debuff 10",
									["numberSize"] = 10,
									["buffIndex"] = -10,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [17]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPLEFT",
											["dY"] = -3,
											["myPoint"] = "BOTTOMLEFT",
											["anchor"] = 0,
											["dX"] = 5,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 1",
									["numberSize"] = 10,
									["buffIndex"] = 1,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [18]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 2",
									["numberSize"] = 10,
									["buffIndex"] = 2,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [19]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 3",
									["numberSize"] = 10,
									["buffIndex"] = 3,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [20]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 4",
									["numberSize"] = 10,
									["buffIndex"] = 4,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [21]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 5",
									["numberSize"] = 10,
									["buffIndex"] = 5,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [22]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 6",
									["numberSize"] = 10,
									["buffIndex"] = 6,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [23]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 7",
									["numberSize"] = 10,
									["buffIndex"] = 7,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [24]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 8",
									["numberSize"] = 10,
									["buffIndex"] = 8,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [25]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 9",
									["numberSize"] = 10,
									["buffIndex"] = 9,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [26]
								{
									["type"] = "TGUnitBuff",
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_RIGHT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 10",
									["numberSize"] = 10,
									["buffIndex"] = 10,
									["numberAlignH"] = "RIGHT",
									["displayNumber"] = true,
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [27]
								{
									["displayNumber"] = true,
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 11",
									["numberSize"] = 10,
									["type"] = "TGUnitBuff",
									["buffIndex"] = 11,
									["numberAlignH"] = "RIGHT",
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [28]
								{
									["displayNumber"] = true,
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 12",
									["numberSize"] = 10,
									["type"] = "TGUnitBuff",
									["buffIndex"] = 12,
									["numberAlignH"] = "RIGHT",
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [29]
								{
									["displayNumber"] = true,
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 13",
									["numberSize"] = 10,
									["type"] = "TGUnitBuff",
									["buffIndex"] = 13,
									["numberAlignH"] = "RIGHT",
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [30]
								{
									["displayNumber"] = true,
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 14",
									["numberSize"] = 10,
									["type"] = "TGUnitBuff",
									["buffIndex"] = 14,
									["numberAlignH"] = "RIGHT",
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [31]
								{
									["displayNumber"] = true,
									["anchors"] = {
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 2,
										}, -- [1]
									},
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
									["numberAlignV"] = "BOTTOM",
									["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
									["numberFont"] = "Fonts\\ARIALN.TTF",
									["name"] = "Buff 15",
									["numberSize"] = 10,
									["type"] = "TGUnitBuff",
									["buffIndex"] = 15,
									["numberAlignH"] = "RIGHT",
									["fontFlags"] = {
										"OUTLINE", -- [1]
										"MONOCHROME", -- [2]
									},
								}, -- [32]
							},
							["normalColor_oldValue"] = {
								["a"] = 1,
								["b"] = 1,
								["g"] = 1,
								["r"] = 1,
							},
						}, -- [1]
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 10,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -10,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -10,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["dX"] = 10,
							["disabled"] = false,
						}, -- [2]
					},
				}, -- [1]
			},
			["anchors"] = {
				{
					["anchorPoint"] = "BOTTOMLEFT",
					["dY"] = -42,
					["myPoint"] = "TOPLEFT",
					["anchor"] = -1,
					["dX"] = 0,
				}, -- [1]
			},
			["backgroundColor"] = {
				["a"] = "1",
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["highlightIfTargetted"] = true,
			["size"] = {
				["height"] = 49,
				["width"] = 190,
			},
		},
		["DUF_PetTarget"] = {
			["anchors"] = {
				{
					["anchorPoint"] = "RIGHT",
					["dY"] = 0,
					["myPoint"] = "LEFT",
					["anchor"] = 0,
					["dX"] = 7,
				}, -- [1]
			},
			["type"] = "TGUnitFrame",
			["name"] = "Root UnitFrame",
			["backgroundColor"] = {
				["a"] = "1",
				["b"] = 0,
				["g"] = 0,
				["r"] = 0,
			},
			["collection"] = "DUF",
			["children"] = {
				{
					["type"] = "TGUnitTexture",
					["name"] = "Border",
					["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 5,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -5,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -5,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["disabled"] = false,
							["dX"] = 5,
						}, -- [2]
					},
					["edgeSize"] = 16,
				}, -- [1]
				{
					["type"] = "TGUnitHealthBar",
					["barLowThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = -1,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 1,
						}, -- [1]
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 1,
							["myPoint"] = "TOPRIGHT",
							["anchor"] = 0,
							["dX"] = -1,
							["disabled"] = false,
						}, -- [2]
					},
					["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
					["barColor"] = {
						["a"] = 1,
						["b"] = 0.529,
						["g"] = 0.655,
						["r"] = 0.271,
					},
					["barHighThreshold"] = 60,
					["name"] = "Health Bar",
					["size"] = {
						["height"] = 10,
					},
					["barLowThreshold"] = 30,
					["barHighThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["children"] = {
						{
							["type"] = "TGUnitText",
							["alignH"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["b"] = "1",
								["g"] = "1",
								["r"] = 1,
							},
							["text"] = "$nm",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Name",
							["fontSize"] = 9,
							["alignV"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 2,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
								{
									["anchorPoint"] = "TOP",
									["dY"] = 0,
									["myPoint"] = "TOP",
									["anchor"] = 0,
									["dX"] = 0,
									["disabled"] = true,
								}, -- [3]
							},
							["size"] = {
								["height"] = 10,
							},
						}, -- [1]
					},
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
				}, -- [2]
			},
			["highlightIfTargetted"] = true,
			["size"] = {
				["height"] = 12,
				["width"] = 82,
			},
		},
		["DUF_TargetThreat"] = {
			["collection"] = "DUF",
			["type"] = "TGUnitFrame",
			["name"] = "Root UnitFrame",
			["children"] = {
				{
					["type"] = "TGUnitClassificationBorder",
					["eliteColor"] = {
						["a"] = 1,
						["b"] = 0.35,
						["g"] = 0.75,
						["r"] = 1,
					},
					["rareEliteColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0.4,
						["r"] = 0.75,
					},
					["normalColor"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["rareColor"] = {
						["a"] = 1,
						["b"] = 0.612,
						["g"] = 0.588,
						["r"] = 0.573,
					},
					["name"] = "Classification Border",
					["edgeFile"] = "Interface\\Addons\\TGUF_2\\Images\\RoundedBorder",
					["edgeSize"] = 24,
					["bossColor"] = {
						["a"] = 1,
						["b"] = 0.1,
						["g"] = 0.075,
						["r"] = 0.55,
					},
					["children"] = {
						{
							["comboIndex"] = 1,
							["name"] = "Combo 1",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo1",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = 13,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 0,
									["dX"] = 13,
								}, -- [1]
							},
							["type"] = "TGUnitComboTexture",
							["color"] = {
								["a"] = 1,
								["r"] = "0.15",
								["g"] = "0",
								["b"] = "0",
							},
							["size"] = {
								["height"] = 64,
								["width"] = 11,
							},
						}, -- [1]
						{
							["comboIndex"] = 2,
							["name"] = "Combo 2",
							["color"] = {
								["a"] = 1,
								["r"] = "0.3",
								["g"] = 0,
								["b"] = 0,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo2",
						}, -- [2]
						{
							["comboIndex"] = 3,
							["name"] = "Combo 3",
							["color"] = {
								["a"] = 1,
								["r"] = "0.45",
								["g"] = 0,
								["b"] = 0,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo3",
						}, -- [3]
						{
							["comboIndex"] = 4,
							["name"] = "Combo 4",
							["color"] = {
								["a"] = 1,
								["r"] = "0.6",
								["g"] = 0,
								["b"] = 0,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo4",
						}, -- [4]
						{
							["comboIndex"] = 5,
							["name"] = "Combo 5",
							["color"] = {
								["a"] = 1,
								["r"] = "0.75",
								["g"] = 0,
								["b"] = 0,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 0,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 1,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["type"] = "TGUnitComboTexture",
							["texture"] = "Interface\\Addons\\TGUF_2\\Images\\Combo5",
						}, -- [5]
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 15,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -15,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -15,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["dX"] = 15,
							["disabled"] = false,
						}, -- [2]
					},
				}, -- [1]
				{
					["type"] = "TGUnitTexture",
					["bgColor_oldValue"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["bgColor"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["textureColor"] = {
						["a"] = 1,
						["r"] = "0",
						["g"] = "0",
						["b"] = "0",
					},
					["edgeFile_oldValue"] = "Interface\\Tooltips\\UI-Tooltip-Border",
					["edgeSize_oldValue"] = 16,
					["name"] = "Bar Background",
					["children"] = {
						{
							["difficultColor"] = {
								["a"] = 0.5,
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							},
							["type"] = "TGUnitModel",
							["impossibleColor_oldValue"] = {
								["a"] = 0.5,
								["b"] = 0.1,
								["g"] = 0.1,
								["r"] = 1,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
							},
							["impossibleColor"] = {
								["a"] = 0.5,
								["b"] = 0.1,
								["g"] = 0.1,
								["r"] = 1,
							},
							["modelPercent"] = 100,
							["standardColor"] = {
								["a"] = 0.5,
								["b"] = 0.25,
								["g"] = 0.75,
								["r"] = 0.25,
							},
							["trivialColor"] = {
								["a"] = 0.5,
								["b"] = 0.5,
								["g"] = 0.5,
								["r"] = 0.5,
							},
							["camera"] = "HEAD",
							["name"] = "Model",
							["veryDifficultColor"] = {
								["a"] = 0.5,
								["b"] = 0.25,
								["g"] = 0.5,
								["r"] = 1,
							},
							["modelRotationDegrees"] = 30,
							["modelPosition"] = {
								["y"] = 0,
								["x"] = 1.6,
								["z"] = -0.15,
							},
							["backgroundColor"] = {
								["a"] = 0.3,
								["r"] = 0.502,
								["g"] = 0.502,
								["b"] = 0.502,
							},
							["size"] = {
								["height"] = 46,
								["width"] = 42,
							},
						}, -- [1]
						{
							["type"] = "TGUnitStatusBorder",
							["name"] = "Border",
							["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 6,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = -7,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = -6,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 0,
									["disabled"] = false,
									["dX"] = 6,
								}, -- [2]
							},
							["edgeColor_oldValue"] = {
								["a"] = 1,
								["r"] = "1",
								["g"] = "1",
								["b"] = "1",
							},
							["edgeSize"] = 20,
						}, -- [2]
						{
							["type"] = "TGUnitHealthBar",
							["barLowThresholdColor"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = 0,
								["b"] = 0,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPRIGHT",
									["anchor"] = 0,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
							["barColor"] = {
								["a"] = 1,
								["r"] = 0.271,
								["g"] = 0.655,
								["b"] = 0.529,
							},
							["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
							["colorFollowsHealth"] = true,
							["tappedColor"] = {
								["a"] = 1,
								["b"] = "0.666",
								["g"] = "0.666",
								["r"] = "0.666",
							},
							["name"] = "Health Bar",
							["barHighThreshold"] = 60,
							["barHighThresholdColor"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = 1,
								["b"] = 0,
							},
							["barLowThreshold"] = 30,
							["children"] = {
								{
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 0,
										}, -- [1]
									},
									["type"] = "TGUnitCombatIcon",
									["name"] = "Combat Icon",
									["size"] = {
										["height"] = 20,
										["width"] = 20,
									},
								}, -- [1]
								{
									["fontSize"] = 10,
									["alignH"] = "RIGHT",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 1,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 5,
											["disabled"] = true,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 1,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = -5,
										}, -- [2]
									},
									["text"] = "$hc/$hm",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Health Text",
									["type"] = "TGUnitText",
									["alignV"] = "CENTER",
									["color"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "1",
									},
									["size"] = {
										["height"] = 12,
										["width"] = 75,
									},
								}, -- [2]
								{
									["type"] = "TGUnitText",
									["alignH"] = "LEFT",
									["color"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["text"] = "$nm",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Name",
									["anchors"] = {
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = -2,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "TOPLEFT",
											["dY"] = 0,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = -1,
											["dX"] = 15,
											["disabled"] = false,
										}, -- [2]
										{
											["anchorPoint"] = "TOP",
											["dY"] = 0,
											["myPoint"] = "TOP",
											["anchor"] = -1,
											["dX"] = 0,
											["disabled"] = true,
										}, -- [3]
									},
									["alignV"] = "CENTER",
									["fontSize"] = 10,
									["size"] = {
										["height"] = 12,
									},
								}, -- [3]
							},
							["size"] = {
								["height"] = 13,
							},
						}, -- [3]
						{
							["energyColor"] = {
								["a"] = 1,
								["b"] = "0.25",
								["g"] = "0.75",
								["r"] = "0.75",
							},
							["type"] = "TGUnitManaBar",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = -2,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = -2,
									["myPoint"] = "TOPRIGHT",
									["anchor"] = -1,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
							["rageColor"] = {
								["a"] = 1,
								["b"] = "0.15",
								["g"] = "0.15",
								["r"] = 0.675,
							},
							["name"] = "Mana Bar",
							["manaColor"] = {
								["a"] = 1,
								["r"] = 0.376,
								["g"] = 0.624,
								["b"] = 1,
							},
							["focusColor"] = {
								["a"] = 1,
								["b"] = 0.169,
								["g"] = 0.337,
								["r"] = 0.675,
							},
							["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
							["children"] = {
								{
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 3,
										}, -- [1]
									},
									["type"] = "TGUnitRaidTargetIcon",
									["name"] = "Raid Target Icon",
									["size"] = {
										["height"] = 12,
										["width"] = 12,
									},
								}, -- [1]
								{
									["fontSize"] = 10,
									["alignH"] = "LEFT",
									["color"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "1",
									},
									["text"] = "$lv $ccl",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Class/Level",
									["type"] = "TGUnitText",
									["alignV"] = "CENTER",
									["anchors"] = {
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = -1,
											["dX"] = 5,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = 0,
											["disabled"] = false,
										}, -- [2]
									},
									["size"] = {
										["height"] = 20,
									},
								}, -- [2]
								{
									["fontSize"] = 10,
									["alignH"] = "RIGHT",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 5,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = -5,
										}, -- [2]
									},
									["text"] = "$mc/$mm",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Mana Text",
									["type"] = "TGUnitText",
									["alignV"] = "CENTER",
									["color"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "1",
									},
									["size"] = {
										["height"] = 20,
									},
								}, -- [3]
							},
							["size"] = {
								["height"] = 13,
							},
						}, -- [4]
						{
							["type"] = "TGUnitCastIcon",
							["name"] = "Cast Icon",
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = -2,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 0,
								}, -- [1]
							},
							["hideIfInactive"] = true,
							["backgroundColor"] = {
								["a"] = "0.5",
								["b"] = 0,
								["g"] = 0,
								["r"] = 0,
							},
							["size"] = {
								["height"] = 12,
								["width"] = 12,
							},
						}, -- [5]
						{
							["channellingColor"] = {
								["a"] = 1,
								["r"] = "0.25",
								["g"] = "1",
								["b"] = "0.25",
							},
							["anchors"] = {
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = -1,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = -2,
									["myPoint"] = "TOPRIGHT",
									["anchor"] = -2,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["castingColor"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "0.25",
							},
							["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
							["name"] = "Cast Bar",
							["castingColor_oldValue"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "0.25",
							},
							["type"] = "TGUnitCastBar",
							["hideIfInactive"] = false,
							["children"] = {
								{
									["fontSize"] = 10,
									["alignH"] = "CENTER",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 1,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 5,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 1,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = -5,
										}, -- [2]
									},
									["text"] = "-$ssp-",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Cast Text",
									["type"] = "TGUnitText",
									["alignV"] = "CENTER",
									["color"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "1",
									},
									["size"] = {
										["height"] = 12,
									},
								}, -- [1]
							},
							["size"] = {
								["height"] = 12,
								["width"] = 50,
							},
						}, -- [6]
						{
							["type"] = "TGUnitThreatBar",
							["highThreatColor"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = 0.1,
								["b"] = 0.1,
							},
							["lowThreatColor"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = 0,
							},
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -2,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = -1,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["border_oldValue"] = "\\Interface\\CastingBar\\UI-CastingBar-Border-Small",
							["showSpark"] = true,
							["mediumThreatColor"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "0.5",
								["b"] = "0.25",
							},
							["name"] = "Threat Bar",
							["size"] = {
								["height"] = 4,
							},
							["unitId"] = "player",
							["children"] = {
								{
									["type"] = "TGUnitText",
									["alignH"] = "CENTER",
									["color"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["text"] = "$thc",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Threat Ceiling",
									["color_oldValue"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = 0,
											["disabled"] = false,
										}, -- [2]
									},
									["alignV"] = "CENTER",
									["fontSize"] = 8,
									["size"] = {
										["height"] = 6,
									},
								}, -- [1]
								{
									["type"] = "TGUnitText",
									["alignH"] = "RIGHT",
									["color"] = {
										["a"] = 1,
										["b"] = "1",
										["g"] = "1",
										["r"] = 1,
									},
									["text"] = "$thw",
									["font"] = "DUF_Font1.ttf",
									["name"] = "Threat Window",
									["fontSize"] = 8,
									["alignV"] = "CENTER",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 0,
											["myPoint"] = "RIGHT",
											["anchor"] = 0,
											["dX"] = 0,
											["disabled"] = false,
										}, -- [2]
									},
									["size"] = {
										["height"] = 6,
									},
								}, -- [2]
							},
							["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
						}, -- [7]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = -3,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 1",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -1,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [8]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 2",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -2,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [9]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 3",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -3,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [10]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 4",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -4,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [11]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 5",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -5,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [12]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 6",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -6,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [13]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 7",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -7,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [14]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 8",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -8,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [15]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 9",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -9,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [16]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 10",
							["type"] = "TGUnitBuff",
							["buffIndex"] = -10,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [17]
						{
							["type"] = "TGUnitBuff",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberSize_oldValue"] = 10,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberFont_oldValue"] = "Fonts\\ARIALN.TTF",
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["buffIndex"] = -11,
							["name"] = "Debuff 11",
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["numberSize"] = 10,
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["displayNumber_oldValue"] = true,
						}, -- [18]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "BOTTOMLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -11,
									["dX"] = 0,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 12",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -12,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [19]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 13",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -13,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [20]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 14",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -14,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [21]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 15",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -15,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [22]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 16",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -16,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [23]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 17",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -17,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [24]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 18",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -18,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [25]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 19",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -19,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [26]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 20",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -20,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [27]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 21",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -21,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [28]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Debuff 22",
							["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
							["buffIndex"] = -22,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [29]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 3,
									["myPoint"] = "BOTTOMLEFT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 1",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 1,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [30]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 2",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 2,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [31]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 3",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 3,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [32]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 4",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 4,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [33]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 5",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 5,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [34]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 6",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 6,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [35]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 7",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 7,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [36]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 8",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 8,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [37]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 9",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 9,
							["numberSize"] = 10,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [38]
						{
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["name"] = "Buff 10",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["type"] = "TGUnitBuff",
							["buffIndex"] = 10,
							["numberSize"] = 10,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [39]
						{
							["type"] = "TGUnitBuff",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberSize_oldValue"] = 10,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberFont_oldValue"] = "Fonts\\ARIALN.TTF",
							["numberAlignV"] = "BOTTOM",
							["buffTooltipAnchor"] = "ANCHOR_RIGHT",
							["buffIndex"] = 11,
							["name"] = "Buff 11",
							["numberAlignH"] = "RIGHT",
							["displayNumber"] = true,
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberSize"] = 10,
							["displayNumber_oldValue"] = true,
						}, -- [40]
						{
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffIndex"] = 12,
							["anchors"] = {
								{
									["anchorPoint"] = "TOP",
									["dY"] = 0,
									["myPoint"] = "BOTTOM",
									["anchor"] = -11,
									["dX"] = 0,
								}, -- [1]
							},
							["name"] = "Buff 12",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["type"] = "TGUnitBuff",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [41]
						{
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffIndex"] = 13,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["name"] = "Buff 13",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["type"] = "TGUnitBuff",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [42]
						{
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffIndex"] = 14,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["name"] = "Buff 14",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["type"] = "TGUnitBuff",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [43]
						{
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffIndex"] = 15,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["name"] = "Buff 15",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["type"] = "TGUnitBuff",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [44]
						{
							["displayNumber"] = true,
							["numberAlignH"] = "RIGHT",
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
							["numberAlignV"] = "BOTTOM",
							["buffIndex"] = 16,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["name"] = "Buff 16",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["type"] = "TGUnitBuff",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["numberSize"] = 10,
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
						}, -- [45]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 17",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["buffIndex"] = 17,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [46]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 18",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["buffIndex"] = 18,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [47]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 19",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["buffIndex"] = 19,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [48]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 20",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["buffIndex"] = 20,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [49]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 21",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["buffIndex"] = 21,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [50]
						{
							["displayNumber"] = true,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPRIGHT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = -1,
									["dX"] = 2,
								}, -- [1]
							},
							["size"] = {
								["height"] = 16,
								["width"] = 16,
							},
							["numberAlignV"] = "BOTTOM",
							["numberFont"] = "Fonts\\ARIALN.TTF",
							["numberAlignH"] = "RIGHT",
							["name"] = "Buff 22",
							["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
							["buffIndex"] = 22,
							["type"] = "TGUnitBuff",
							["numberSize"] = 10,
							["fontFlags"] = {
								"OUTLINE", -- [1]
								"MONOCHROME", -- [2]
							},
						}, -- [51]
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 42,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = 0,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["dX"] = 0,
							["disabled"] = false,
						}, -- [2]
					},
				}, -- [2]
			},
			["anchors"] = {
				{
					["anchorPoint"] = "TOPLEFT",
					["dY"] = -580,
					["myPoint"] = "TOPLEFT",
					["anchor"] = 0,
					["dX"] = 550,
				}, -- [1]
			},
			["backgroundColor"] = {
				["a"] = "0",
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["highlightIfTargetted"] = false,
			["size"] = {
				["height"] = 46,
				["width"] = 242,
			},
		},
		["DUF_Generic"] = {
			["anchors"] = {
				{
					["anchorPoint"] = "RIGHT",
					["dY"] = 0,
					["myPoint"] = "LEFT",
					["anchor"] = -1,
					["dX"] = 7,
				}, -- [1]
			},
			["type"] = "TGUnitFrame",
			["name"] = "Root UnitFrame",
			["backgroundColor"] = {
				["a"] = "1",
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["collection"] = "DUF",
			["children"] = {
				{
					["type"] = "TGUnitTexture",
					["name"] = "Border",
					["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 6,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -6,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -6,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["dX"] = 6,
							["disabled"] = false,
						}, -- [2]
					},
					["edgeSize"] = 20,
				}, -- [1]
				{
					["type"] = "TGUnitHealthBar",
					["barLowThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 0,
						}, -- [1]
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPRIGHT",
							["anchor"] = 0,
							["dX"] = 0,
							["disabled"] = false,
						}, -- [2]
					},
					["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
					["barColor"] = {
						["a"] = 1,
						["r"] = 0.271,
						["g"] = 0.655,
						["b"] = 0.529,
					},
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
					["tappedColor"] = {
						["a"] = 1,
						["b"] = "0.666",
						["g"] = "0.666",
						["r"] = "0.666",
					},
					["name"] = "Health Bar",
					["barHighThreshold"] = 60,
					["barHighThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["barLowThreshold"] = 30,
					["children"] = {
						{
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 0,
								}, -- [1]
							},
							["type"] = "TGUnitCombatIcon",
							["name"] = "Combat Icon",
							["size"] = {
								["height"] = 20,
								["width"] = 20,
							},
						}, -- [1]
						{
							["type"] = "TGUnitText",
							["alignH"] = "RIGHT",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 1,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 5,
									["disabled"] = true,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 1,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = -5,
								}, -- [2]
							},
							["text"] = "$hc/$hm",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Health Text",
							["fontSize"] = 10,
							["alignV"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["size"] = {
								["height"] = 12,
								["width"] = 75,
							},
						}, -- [2]
						{
							["type"] = "TGUnitText",
							["alignH"] = "LEFT",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["text"] = "$nm",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Name",
							["fontSize"] = 10,
							["alignV"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = -2,
									["dX"] = 0,
								}, -- [1]
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = -1,
									["dX"] = 8,
									["disabled"] = false,
								}, -- [2]
								{
									["anchorPoint"] = "TOP",
									["dY"] = 0,
									["myPoint"] = "TOP",
									["anchor"] = -1,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [3]
							},
							["size"] = {
								["height"] = 12,
							},
						}, -- [3]
					},
					["size"] = {
						["height"] = 13,
					},
				}, -- [2]
				{
					["energyColor"] = {
						["a"] = 1,
						["r"] = "0.75",
						["g"] = "0.75",
						["b"] = "0.25",
					},
					["type"] = "TGUnitManaBar",
					["anchors"] = {
						{
							["anchorPoint"] = "BOTTOMLEFT",
							["dY"] = -2,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 0,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -2,
							["myPoint"] = "TOPRIGHT",
							["anchor"] = -1,
							["dX"] = 0,
							["disabled"] = false,
						}, -- [2]
					},
					["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
					["rageColor"] = {
						["a"] = 1,
						["r"] = "0.675",
						["g"] = "0.15",
						["b"] = "0.15",
					},
					["name"] = "Mana Bar",
					["manaColor"] = {
						["a"] = 1,
						["r"] = 0.376,
						["g"] = 0.624,
						["b"] = 1,
					},
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
					["children"] = {
						{
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = 0,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 0,
									["dX"] = 3,
								}, -- [1]
							},
							["type"] = "TGUnitRaidTargetIcon",
							["name"] = "Raid Target Icon",
							["size"] = {
								["height"] = 12,
								["width"] = 12,
							},
						}, -- [1]
						{
							["type"] = "TGUnitText",
							["alignH"] = "LEFT",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["text"] = "$lv $ccl",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Class/Level",
							["fontSize"] = 10,
							["alignV"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = -1,
									["dX"] = 5,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
							},
							["size"] = {
								["height"] = 20,
							},
						}, -- [2]
						{
							["type"] = "TGUnitText",
							["alignH"] = "RIGHT",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 5,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = -5,
								}, -- [2]
							},
							["text"] = "$mc/$mm",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Mana Text",
							["fontSize"] = 10,
							["alignV"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["size"] = {
								["height"] = 20,
							},
						}, -- [3]
					},
					["size"] = {
						["height"] = 13,
					},
				}, -- [3]
				{
					["type"] = "TGUnitCastIcon",
					["name"] = "Cast Icon",
					["anchors"] = {
						{
							["anchorPoint"] = "BOTTOMLEFT",
							["dY"] = -2,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 0,
						}, -- [1]
					},
					["hideIfInactive"] = true,
					["backgroundColor"] = {
						["a"] = "0.5",
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["size"] = {
						["height"] = 12,
						["width"] = 12,
					},
				}, -- [4]
				{
					["channellingColor"] = {
						["a"] = 1,
						["r"] = "0.25",
						["g"] = "1",
						["b"] = "0.25",
					},
					["anchors"] = {
						{
							["anchorPoint"] = "RIGHT",
							["dY"] = -2,
							["myPoint"] = "LEFT",
							["anchor"] = -1,
							["dX"] = 0,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -2,
							["myPoint"] = "TOPRIGHT",
							["anchor"] = -2,
							["dX"] = 0,
							["disabled"] = false,
						}, -- [2]
					},
					["castingColor"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = "1",
						["b"] = "0.25",
					},
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
					["name"] = "Cast Bar",
					["castingColor_oldValue"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = "1",
						["b"] = "0.25",
					},
					["type"] = "TGUnitCastBar",
					["hideIfInactive"] = false,
					["children"] = {
						{
							["type"] = "TGUnitText",
							["alignH"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 1,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 5,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 1,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = -5,
								}, -- [2]
							},
							["text"] = "-$ssp-",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Cast Text",
							["fontSize"] = 10,
							["alignV"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["size"] = {
								["height"] = 12,
							},
						}, -- [1]
					},
					["size"] = {
						["height"] = 12,
						["width"] = 50,
					},
				}, -- [5]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "BOTTOMLEFT",
							["dY"] = -2,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -4,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 1",
					["numberSize"] = 10,
					["buffIndex"] = -1,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [6]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 2",
					["numberSize"] = 10,
					["buffIndex"] = -2,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [7]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 3",
					["numberSize"] = 10,
					["buffIndex"] = -3,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [8]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 4",
					["numberSize"] = 10,
					["buffIndex"] = -4,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [9]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 5",
					["numberSize"] = 10,
					["buffIndex"] = -5,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [10]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 6",
					["numberSize"] = 10,
					["buffIndex"] = -6,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [11]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 7",
					["numberSize"] = 10,
					["buffIndex"] = -7,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [12]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 8",
					["numberSize"] = 10,
					["buffIndex"] = -8,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [13]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 9",
					["numberSize"] = 10,
					["buffIndex"] = -9,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [14]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Debuff 10",
					["numberSize"] = 10,
					["buffIndex"] = -10,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [15]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "BOTTOMLEFT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -10,
							["dX"] = 0,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 11",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -11,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [16]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 12",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -12,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [17]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 13",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -13,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [18]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 14",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -14,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [19]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 15",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -15,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [20]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 16",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -16,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [21]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 17",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -17,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [22]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 18",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -18,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [23]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 19",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -19,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [24]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_BOTTOMRIGHT",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["name"] = "Debuff 20",
					["numberAlignH"] = "RIGHT",
					["buffIndex"] = -20,
					["type"] = "TGUnitBuff",
					["numberSize"] = 10,
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [25]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 3,
							["myPoint"] = "BOTTOMLEFT",
							["anchor"] = 0,
							["dX"] = -4,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 1",
					["numberSize"] = 10,
					["buffIndex"] = 1,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [26]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignH"] = "RIGHT",
					["numberAlignV"] = "BOTTOM",
					["buffIndex"] = 2,
					["numberSize"] = 10,
					["name"] = "Buff 2",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["type"] = "TGUnitBuff",
					["displayNumber_oldValue"] = true,
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [27]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 3",
					["numberSize"] = 10,
					["buffIndex"] = 3,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [28]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 4",
					["numberSize"] = 10,
					["buffIndex"] = 4,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [29]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 5",
					["numberSize"] = 10,
					["buffIndex"] = 5,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [30]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 6",
					["numberSize"] = 10,
					["buffIndex"] = 6,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [31]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 7",
					["numberSize"] = 10,
					["buffIndex"] = 7,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [32]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 8",
					["numberSize"] = 10,
					["buffIndex"] = 8,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [33]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 9",
					["numberSize"] = 10,
					["buffIndex"] = 9,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [34]
				{
					["displayNumber"] = true,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_RIGHT",
					["numberAlignH"] = "RIGHT",
					["name"] = "Buff 10",
					["numberSize"] = 10,
					["buffIndex"] = 10,
					["type"] = "TGUnitBuff",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [35]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 11",
					["buffIndex"] = 11,
					["numberAlignH"] = "RIGHT",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 0,
							["myPoint"] = "BOTTOMLEFT",
							["anchor"] = -10,
							["dX"] = 0,
						}, -- [1]
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
				}, -- [36]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 12",
					["buffIndex"] = 12,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [37]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 13",
					["buffIndex"] = 13,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [38]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["numberAlignV"] = "BOTTOM",
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberSize"] = 10,
					["name"] = "Buff 14",
					["type"] = "TGUnitBuff",
					["buffIndex"] = 14,
					["numberAlignH"] = "RIGHT",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [39]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 15",
					["buffIndex"] = 15,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [40]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 16",
					["buffIndex"] = 16,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [41]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 17",
					["buffIndex"] = 17,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [42]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 18",
					["buffIndex"] = 18,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [43]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 19",
					["buffIndex"] = 19,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [44]
				{
					["displayNumber"] = true,
					["shadowColor_oldValue"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["shadowOffset_oldValue"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["size"] = {
						["height"] = 16,
						["width"] = 16,
					},
					["numberSize"] = 10,
					["numberAlignV"] = "BOTTOM",
					["buffTooltipAnchor"] = "ANCHOR_TOPLEFT",
					["type"] = "TGUnitBuff",
					["name"] = "Buff 20",
					["buffIndex"] = 20,
					["numberFont"] = "Fonts\\ARIALN.TTF",
					["numberAlignH"] = "RIGHT",
					["anchors"] = {
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 0,
							["myPoint"] = "TOPLEFT",
							["anchor"] = -1,
							["dX"] = 2,
						}, -- [1]
					},
					["fontFlags"] = {
						"OUTLINE", -- [1]
						"MONOCHROME", -- [2]
					},
				}, -- [45]
			},
			["highlightIfTargetted"] = true,
			["size"] = {
				["height"] = 42,
				["width"] = 170,
			},
		},
		["DUF_Raid_Left"] = {
			["type"] = "TGUnitFrame",
			["anchors"] = {
				{
					["anchorPoint"] = "BOTTOMLEFT",
					["dY"] = -3,
					["myPoint"] = "TOPLEFT",
					["anchor"] = -1,
					["dX"] = 0,
				}, -- [1]
			},
			["trackHealingRange_oldValue"] = true,
			["highlightIfTargetted"] = true,
			["trackVisibleRange"] = true,
			["trackVisibleRange_oldValue"] = true,
			["name"] = "Root UnitFrame",
			["backgroundColor"] = {
				["a"] = "1",
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["trackHealingRange"] = true,
			["collection"] = "DUF",
			["children"] = {
				{
					["type"] = "TGUnitHealthBar",
					["barLowThresholdColor"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0,
						["b"] = 0,
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = -1,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 1,
						}, -- [1]
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 1,
							["myPoint"] = "TOPRIGHT",
							["anchor"] = 0,
							["disabled"] = false,
							["dX"] = -1,
						}, -- [2]
					},
					["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
					["barColor"] = {
						["a"] = 1,
						["r"] = 0.271,
						["g"] = 0.655,
						["b"] = 0.529,
					},
					["barHighThreshold"] = 60,
					["name"] = "Health Bar",
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
					["barLowThreshold"] = 30,
					["barHighThresholdColor"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					},
					["children"] = {
						{
							["fontSize"] = 9,
							["alignH"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = "1",
								["b"] = "1",
							},
							["text"] = "$nc",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Name",
							["type"] = "TGUnitText",
							["alignV"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 2,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["disabled"] = false,
									["dX"] = 0,
								}, -- [2]
								{
									["anchorPoint"] = "TOP",
									["dY"] = 0,
									["myPoint"] = "TOP",
									["anchor"] = 0,
									["disabled"] = true,
									["dX"] = 0,
								}, -- [3]
							},
							["size"] = {
								["height"] = 10,
							},
						}, -- [1]
					},
					["size"] = {
						["height"] = 10,
					},
				}, -- [1]
			},
			["size"] = {
				["height"] = 12,
				["width"] = 82,
			},
		},
		["DUF_PlayerSmallModel"] = {
			["collection"] = "DUF",
			["type"] = "TGUnitFrame",
			["name"] = "Root UnitFrame",
			["children"] = {
				{
					["normalFile"] = "Interface\\Addons\\TGUF_2\\Images\\RoundedBorder",
					["edgeSize"] = 16,
					["poisonColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0.6,
						["r"] = 0,
					},
					["normalSize"] = 16,
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = 11,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = -11,
						}, -- [1]
						{
							["anchorPoint"] = "BOTTOMRIGHT",
							["dY"] = -11,
							["myPoint"] = "BOTTOMRIGHT",
							["anchor"] = 0,
							["dX"] = 11,
							["disabled"] = false,
						}, -- [2]
					},
					["normalColor"] = {
						["a"] = "0",
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["diseaseColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0.4,
						["r"] = 0.6,
					},
					["magicColor"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0.6,
						["r"] = 0.2,
					},
					["normalSize_oldValue"] = 16,
					["name"] = "Status Border",
					["edgeFile"] = "Interface\\Addons\\TGUF_2\\Images\\RoundedBorder",
					["curseColor"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 0,
						["r"] = 0.6,
					},
					["normalFile_oldValue"] = "Interface\\Addons\\TGUF_2\\DUF_Images\\JessBorder",
					["children"] = {
						{
							["normalFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
							["type"] = "TGUnitStatusBorder",
							["normalSize"] = 20,
							["anchors"] = {
								{
									["anchorPoint"] = "TOPLEFT",
									["dY"] = -5,
									["myPoint"] = "TOPLEFT",
									["anchor"] = 0,
									["dX"] = 5,
								}, -- [1]
								{
									["anchorPoint"] = "BOTTOMRIGHT",
									["dY"] = 5,
									["myPoint"] = "BOTTOMRIGHT",
									["anchor"] = 0,
									["dX"] = -5,
									["disabled"] = false,
								}, -- [2]
							},
							["normalColor"] = {
								["a"] = 1,
								["r"] = "1",
								["g"] = 1,
								["b"] = 1,
							},
							["curseColor_oldValue"] = {
								["a"] = 1,
								["r"] = 0.6,
								["g"] = 0,
								["b"] = 1,
							},
							["poisonColor_oldValue"] = {
								["a"] = 1,
								["r"] = 0,
								["g"] = 0.6,
								["b"] = 0,
							},
							["name"] = "Border",
							["edgeFile_oldValue"] = "Interface\\Tooltips\\UI-Tooltip-Border",
							["magicColor_oldValue"] = {
								["a"] = 1,
								["r"] = "0",
								["g"] = "0.6",
								["b"] = 1,
							},
							["edgeSize_oldValue"] = 20,
							["diseaseColor_oldValue"] = {
								["a"] = 1,
								["r"] = 0.6,
								["g"] = 0.4,
								["b"] = 0,
							},
							["children"] = {
								{
									["type"] = "TGUnitHealthBar",
									["barLowThresholdColor"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = 0,
										["b"] = 0,
									},
									["anchors"] = {
										{
											["anchorPoint"] = "TOPLEFT",
											["dY"] = -6,
											["myPoint"] = "TOPLEFT",
											["anchor"] = 0,
											["dX"] = 6,
										}, -- [1]
										{
											["anchorPoint"] = "TOPRIGHT",
											["dY"] = 0,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = 0,
											["disabled"] = false,
											["dX"] = -6,
										}, -- [2]
									},
									["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
									["barColor"] = {
										["a"] = 1,
										["r"] = 0.271,
										["g"] = 0.655,
										["b"] = 0.529,
									},
									["colorFollowsHealth"] = true,
									["barHighThreshold"] = 60,
									["name"] = "Health Bar",
									["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
									["barLowThreshold"] = 30,
									["barHighThresholdColor"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = 1,
										["b"] = 0,
									},
									["children"] = {
										{
											["anchors"] = {
												{
													["anchorPoint"] = "TOPLEFT",
													["dY"] = 0,
													["myPoint"] = "TOPLEFT",
													["anchor"] = 0,
													["dX"] = 34,
												}, -- [1]
											},
											["type"] = "TGUnitCombatIcon",
											["name"] = "Combat Icon",
											["size"] = {
												["height"] = 16,
												["width"] = 16,
											},
										}, -- [1]
										{
											["anchors"] = {
												{
													["anchorPoint"] = "BOTTOM",
													["dY"] = 3,
													["myPoint"] = "TOP",
													["anchor"] = -1,
													["dX"] = 0,
												}, -- [1]
											},
											["type"] = "TGUnitRaidTargetIcon",
											["name"] = "Raid Target Icon",
											["size"] = {
												["height"] = 12,
												["width"] = 12,
											},
										}, -- [2]
										{
											["type"] = "TGUnitText",
											["fontSize_oldValue"] = 10,
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["text"] = "$nm",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Name",
											["alignH"] = "LEFT",
											["anchors"] = {
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 0,
													["myPoint"] = "LEFT",
													["anchor"] = -2,
													["dX"] = 0,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 0,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["disabled"] = false,
													["dX"] = 0,
												}, -- [2]
												{
													["anchorPoint"] = "TOP",
													["dY"] = -1,
													["myPoint"] = "TOP",
													["anchor"] = 0,
													["disabled"] = false,
													["dX"] = 0,
												}, -- [3]
											},
											["alignV"] = "CENTER",
											["fontSize"] = 10,
											["size"] = {
												["height"] = 12,
											},
										}, -- [3]
										{
											["fontSize"] = 10,
											["alignH"] = "LEFT",
											["anchors"] = {
												{
													["anchorPoint"] = "BOTTOMLEFT",
													["dY"] = 1,
													["myPoint"] = "TOPLEFT",
													["anchor"] = -1,
													["dX"] = 0,
												}, -- [1]
												{
													["anchorPoint"] = "BOTTOMRIGHT",
													["dY"] = 1,
													["myPoint"] = "TOPRIGHT",
													["anchor"] = -1,
													["disabled"] = false,
													["dX"] = 0,
												}, -- [2]
											},
											["text"] = "$lv $cl",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Class/Level",
											["type"] = "TGUnitText",
											["alignV"] = "CENTER",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["size"] = {
												["height"] = 12,
											},
										}, -- [4]
										{
											["fontSize"] = 10,
											["alignH"] = "RIGHT",
											["anchors"] = {
												{
													["anchorPoint"] = "LEFT",
													["dY"] = 1,
													["myPoint"] = "LEFT",
													["anchor"] = 0,
													["dX"] = 5,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 1,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["dX"] = -5,
												}, -- [2]
											},
											["text"] = "$hc/$hm",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Health Text",
											["type"] = "TGUnitText",
											["alignV"] = "CENTER",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["size"] = {
												["height"] = 20,
											},
										}, -- [5]
									},
									["size"] = {
										["height"] = 28,
									},
								}, -- [1]
								{
									["energyColor"] = {
										["a"] = 1,
										["b"] = "0.25",
										["g"] = "0.66",
										["r"] = "0.66",
									},
									["type"] = "TGUnitManaBar",
									["anchors"] = {
										{
											["anchorPoint"] = "BOTTOMLEFT",
											["dY"] = -2,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -1,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "BOTTOMRIGHT",
											["dY"] = -2,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = -1,
											["disabled"] = false,
											["dX"] = 0,
										}, -- [2]
									},
									["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
									["rageColor"] = {
										["a"] = 1,
										["b"] = "0.15",
										["g"] = "0.15",
										["r"] = "0.675",
									},
									["name"] = "Mana Bar",
									["manaColor"] = {
										["a"] = 1,
										["r"] = 0.376,
										["g"] = 0.624,
										["b"] = 1,
									},
									["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
									["children"] = {
										{
											["fontSize"] = 10,
											["alignH"] = "RIGHT",
											["anchors"] = {
												{
													["anchorPoint"] = "LEFT",
													["dY"] = 1,
													["myPoint"] = "LEFT",
													["anchor"] = 0,
													["dX"] = 5,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 1,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["dX"] = -5,
												}, -- [2]
											},
											["text"] = "$mc/$mm",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Mana Text",
											["type"] = "TGUnitText",
											["alignV"] = "CENTER",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["size"] = {
												["height"] = 20,
											},
										}, -- [1]
									},
									["size"] = {
										["height"] = 11,
									},
								}, -- [2]
								{
									["type"] = "TGUnitModel",
									["anchors"] = {
										{
											["anchorPoint"] = "LEFT",
											["dY"] = 0,
											["myPoint"] = "LEFT",
											["anchor"] = 0,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "BOTTOM",
											["dY"] = -14,
											["myPoint"] = "BOTTOM",
											["anchor"] = -1,
											["dX"] = 0,
											["disabled"] = false,
										}, -- [2]
									},
									["modelPercent"] = 100,
									["camera"] = "BODY",
									["name"] = "Model",
									["modelRotationDegrees"] = 30,
									["modelPosition"] = {
										["y"] = 0,
										["x"] = 1.6,
										["z"] = -0.15,
									},
									["backgroundColor"] = {
										["a"] = "0",
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
									["size"] = {
										["height"] = 80,
										["width"] = 46,
									},
								}, -- [3]
								{
									["type"] = "TGUnitCastIcon",
									["name"] = "Cast Icon",
									["anchors"] = {
										{
											["anchorPoint"] = "BOTTOMLEFT",
											["dY"] = -3,
											["myPoint"] = "TOPLEFT",
											["anchor"] = -2,
											["dX"] = 0,
										}, -- [1]
									},
									["hideIfInactive"] = false,
									["backgroundColor"] = {
										["a"] = "0.5",
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
									["size"] = {
										["height"] = 12,
										["width"] = 12,
									},
								}, -- [4]
								{
									["channellingColor"] = {
										["a"] = 1,
										["r"] = "0.25",
										["g"] = "1",
										["b"] = "0.25",
									},
									["anchors"] = {
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = -3,
											["myPoint"] = "LEFT",
											["anchor"] = -1,
											["dX"] = 0,
										}, -- [1]
										{
											["anchorPoint"] = "BOTTOMRIGHT",
											["dY"] = -3,
											["myPoint"] = "TOPRIGHT",
											["anchor"] = -3,
											["disabled"] = false,
											["dX"] = 0,
										}, -- [2]
									},
									["castingColor"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "0.25",
									},
									["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
									["name"] = "Cast Bar",
									["castingColor_oldValue"] = {
										["a"] = 1,
										["r"] = 1,
										["g"] = "1",
										["b"] = "0.25",
									},
									["type"] = "TGUnitCastBar",
									["hideIfInactive"] = false,
									["children"] = {
										{
											["fontSize"] = 10,
											["alignH"] = "CENTER",
											["anchors"] = {
												{
													["anchorPoint"] = "LEFT",
													["dY"] = 1,
													["myPoint"] = "LEFT",
													["anchor"] = 0,
													["dX"] = 5,
												}, -- [1]
												{
													["anchorPoint"] = "RIGHT",
													["dY"] = 1,
													["myPoint"] = "RIGHT",
													["anchor"] = 0,
													["dX"] = -5,
												}, -- [2]
											},
											["text"] = "-$ssp-",
											["font"] = "DUF_Font1.ttf",
											["name"] = "Cast Text",
											["type"] = "TGUnitText",
											["alignV"] = "CENTER",
											["color"] = {
												["a"] = 1,
												["r"] = 1,
												["g"] = "1",
												["b"] = "1",
											},
											["size"] = {
												["height"] = 12,
											},
										}, -- [1]
									},
									["size"] = {
										["height"] = 12,
										["width"] = 50,
									},
								}, -- [5]
								{
									["anchors"] = {
										{
											["anchorPoint"] = "TOPLEFT",
											["dY"] = -4,
											["myPoint"] = "BOTTOMLEFT",
											["anchor"] = 0,
											["dX"] = 3,
										}, -- [1]
									},
									["type"] = "TGUnitLeaderIcon",
									["name"] = "Leader Icon",
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
								}, -- [6]
								{
									["anchors"] = {
										{
											["anchorPoint"] = "RIGHT",
											["dY"] = 2,
											["myPoint"] = "LEFT",
											["anchor"] = -1,
											["dX"] = 8,
										}, -- [1]
									},
									["type"] = "TGUnitLootMasterIcon",
									["name"] = "Loot Master Icon",
									["size"] = {
										["height"] = 16,
										["width"] = 16,
									},
								}, -- [7]
							},
							["edgeColor_oldValue"] = {
								["a"] = 1,
								["b"] = 0.231,
								["g"] = 0.11,
								["r"] = 1,
							},
						}, -- [1]
					},
					["type"] = "TGUnitStatusBorder",
				}, -- [1]
			},
			["anchors"] = {
				{
					["anchorPoint"] = "TOPLEFT",
					["dY"] = -20,
					["myPoint"] = "TOPLEFT",
					["anchor"] = 0,
					["dX"] = 20,
				}, -- [1]
			},
			["backgroundColor"] = {
				["a"] = "1",
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["highlightIfTargetted"] = true,
			["size"] = {
				["height"] = 56,
				["width"] = 200,
			},
		},
		["DUF_Raid_Right"] = {
			["type"] = "TGUnitFrame",
			["anchors"] = {
				{
					["anchorPoint"] = "BOTTOMLEFT",
					["dY"] = -3,
					["myPoint"] = "TOPLEFT",
					["anchor"] = -1,
					["dX"] = 0,
				}, -- [1]
			},
			["trackHealingRange_oldValue"] = true,
			["highlightIfTargetted"] = true,
			["trackVisibleRange"] = true,
			["trackVisibleRange_oldValue"] = true,
			["name"] = "Root UnitFrame",
			["children"] = {
				{
					["type"] = "TGUnitHealthBar",
					["barLowThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["anchors"] = {
						{
							["anchorPoint"] = "TOPLEFT",
							["dY"] = -1,
							["myPoint"] = "TOPLEFT",
							["anchor"] = 0,
							["dX"] = 1,
						}, -- [1]
						{
							["anchorPoint"] = "TOPRIGHT",
							["dY"] = 1,
							["myPoint"] = "TOPRIGHT",
							["anchor"] = 0,
							["dX"] = -1,
							["disabled"] = false,
						}, -- [2]
					},
					["border_oldValue"] = "Interface\\CastingBar\\UI-CastingBar-Border-Small",
					["barColor"] = {
						["a"] = 1,
						["b"] = 0.529,
						["g"] = 0.655,
						["r"] = 0.271,
					},
					["barHighThreshold"] = 60,
					["name"] = "Health Bar",
					["size"] = {
						["height"] = 10,
					},
					["barLowThreshold"] = 30,
					["barHighThresholdColor"] = {
						["a"] = 1,
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["children"] = {
						{
							["type"] = "TGUnitText",
							["alignH"] = "CENTER",
							["color"] = {
								["a"] = 1,
								["b"] = "1",
								["g"] = "1",
								["r"] = 1,
							},
							["text"] = "$nc",
							["font"] = "DUF_Font1.ttf",
							["name"] = "Name",
							["fontSize"] = 9,
							["alignV"] = "CENTER",
							["anchors"] = {
								{
									["anchorPoint"] = "LEFT",
									["dY"] = 0,
									["myPoint"] = "LEFT",
									["anchor"] = 0,
									["dX"] = 2,
								}, -- [1]
								{
									["anchorPoint"] = "RIGHT",
									["dY"] = 0,
									["myPoint"] = "RIGHT",
									["anchor"] = 0,
									["dX"] = 0,
									["disabled"] = false,
								}, -- [2]
								{
									["anchorPoint"] = "TOP",
									["dY"] = 0,
									["myPoint"] = "TOP",
									["anchor"] = 0,
									["dX"] = 0,
									["disabled"] = true,
								}, -- [3]
							},
							["size"] = {
								["height"] = 10,
							},
						}, -- [1]
					},
					["texture"] = "Interface\\AddOns\\TGUF_2\\DUF_Images\\bg",
				}, -- [1]
			},
			["trackHealingRange"] = true,
			["collection"] = "DUF",
			["backgroundColor"] = {
				["a"] = "1",
				["b"] = 0,
				["g"] = 0,
				["r"] = 0,
			},
			["size"] = {
				["height"] = 12,
				["width"] = 82,
			},
		},
	},
}
TGMD_MODELS = {
	["creature\\lobstrok\\lobstrok.m2"] = 1,
	["creature\\ogre\\ogre.m2"] = 1,
	["creature\\malganis\\malganis.m2"] = 1,
	["creature\\darkhound\\darkhound.m2"] = 1,
	["creature\\sporebat\\sporebat.m2"] = 1,
	--[[ skipped entry with table key ]]
	["creature\\crab\\crab.m2"] = 1,
	["creature\\druidowlbear\\druidowlbeartauren.m2"] = 1,
	["creature\\spells\\eyeofkilrog.m2"] = 1,
	["creature\\arcanegolem\\arcanegolembroken.m2"] = 1,
	["creature\\golemstone\\golemstone.m2"] = 1,
	["creature\\felbat\\felbat.m2"] = 1,
	["character\\dwarf\\male\\dwarfmale.m2"] = 1,
	["creature\\fireelemental\\fireelemental.m2"] = 1,
	["creature\\band\\bandundeadmale.m2"] = 1,
	["creature\\golemharveststage2\\golemharveststage2.m2"] = 1,
	["creature\\airelemental\\airelemental.m2"] = 1,
	["character\\human\\female\\humanfemale.m2"] = 1,
	["world\\goober\\g_gnomemultibox.m2"] = 1,
	["creature\\netherray\\netherray.m2"] = 1,
	["character\\draenei\\male\\draeneimale.m2"] = 1,
	["creature\\rabbit\\rabbit.m2"] = 1,
	["creature\\carrionbird\\carrionbird.m2"] = 1,
	["creature\\skeletonnaked\\skeletonnaked.m2"] = 1,
	["creature\\lobstrokoutland\\lobstrokoutland.m2"] = 1,
	["creature\\quillboar\\quillboarcaster.m2"] = 1,
	["creature\\northrendghoul\\northrendghoul.m2"] = 1,
	["creature\\dragonspawn\\dragonspawn.m2"] = 1,
	["creature\\bloodelfguard\\bloodelfmale_guard.m2"] = 1,
	["creature\\ancientprotector\\ancientprotector.m2"] = 1,
	["creature\\demonform\\demonform.m2"] = 1,
	["character\\dwarf\\female\\dwarffemale.m2"] = 1,
	["creature\\manafiendgreen\\manafiendgreen.m2"] = 1,
	["creature\\fungalmonster\\fungalmonster.m2"] = 1,
	["creature\\spells\\fireelementaltotem.m2"] = 1,
	["creature\\arakkoa\\arakkoa_sage.m2"] = 1,
	["creature\\stag\\stag.m2"] = 1,
	["creature\\druidcat\\druidcat.m2"] = 1,
	["creature\\goblin\\goblinshredder.m2"] = 1,
	["creature\\moarg\\moarg1.m2"] = 1,
	["creature\\ent\\ent.m2"] = 1,
	["creature\\serpent\\serpent.m2"] = 1,
	["creature\\headlesshorseman\\headlesshorseman.m2"] = 1,
	["creature\\banshee\\banshee.m2"] = 1,
	["creature\\spells\\airelementaltotem.m2"] = 1,
	["creature\\squirrel\\squirrel.m2"] = 1,
	["creature\\band\\bandtrollmale.m2"] = 1,
	["character\\bloodelf\\female\\bloodelffemale.m2"] = 1,
	["creature\\quillboar\\quillboarwarrior.m2"] = 1,
	["character\\troll\\female\\trollfemale.m2"] = 1,
	["character\\orc\\female\\orcfemale.m2"] = 1,
	["creature\\highelf\\highelffemale_hunter.m2"] = 1,
	["character\\bloodelf\\male\\bloodelfmale.m2"] = 1,
	["creature\\spells\\sentrytotem.m2"] = 1,
	["creature\\zombie\\zombie.m2"] = 1,
	["creature\\seagiant\\seagiant.m2"] = 1,
	["creature\\spells\\earthelementaltotem.m2"] = 1,
	["creature\\zombie\\zombiearm.m2"] = 1,
	["creature\\centaur\\centaur.m2"] = 1,
	["character\\naga_\\female\\naga_female.m2"] = 1,
	["creature\\deer\\deer.m2"] = 1,
	["creature\\spells\\manatotem.m2"] = 1,
	["creature\\ladysylvanaswindrunner\\ladysylvanaswindrunner.m2"] = 1,
	["creature\\penguinpet\\penguinpet.m2"] = 1,
	["creature\\egg\\eggcreature.m2"] = 1,
	["character\\skeleton\\male\\skeletonmale.m2"] = 1,
	["creature\\skeleton\\skeleton.m2"] = 1,
	["creature\\sheep\\sheep.m2"] = 1,
	["creature\\humanmalepirateswashbuckler\\humanmalepirateswashbuckler.m2"] = 1,
	["creature\\seaturtle\\seaturtle.m2"] = 1,
	["creature\\nian\\nian.m2"] = 1,
	["creature\\band\\bandorcmale.m2"] = 1,
	["creature\\waterelemental\\waterelemental.m2"] = 1,
	["character\\scourge\\male\\scourgemale.m2"] = 1,
	["character\\scourge\\female\\scourgefemale.m2"] = 1,
	["creature\\gnollcaster\\gnollcaster.m2"] = 1,
	["creature\\hippogryph\\hippogryph.m2"] = 1,
	["creature\\slime\\slime.m2"] = 1,
	["creature\\windserpentoutland\\windserpentoutland.m2"] = 1,
	["creature\\gnoll\\gnoll.m2"] = 1,
	["creature\\diablo\\diablofunsized.m2"] = 1,
	["creature\\etherial\\etherial.m2"] = 1,
	["creature\\troll\\trolljunglecaster.m2"] = 1,
	["creature\\cryptfiend\\cryptfiend.m2"] = 1,
	["character\\foresttroll\\male\\foresttrollmale.m2"] = 1,
	["creature\\lion\\lion.m2"] = 1,
	["creature\\kingvarianwrynn\\kingvarianwrynn.m2"] = 1,
	["creature\\lasher\\lasher.m2"] = 1,
	["creature\\wolf\\wolf_ghost.m2"] = 1,
	["creature\\spells\\healingtotem.m2"] = 1,
	["creature\\sealion\\sealion.m2"] = 1,
	["creature\\giraffe\\giraffe.m2"] = 1,
	["character\\human\\male\\humanmale.m2"] = 1,
	["creature\\basilisk\\basilisk.m2"] = 1,
	["creature\\bonegolem\\bonegolem.m2"] = 1,
	["creature\\parrot\\parrot.m2"] = 1,
	["creature\\frog\\frog.m2"] = 1,
	["creature\\pumpkinsoldier\\pumpkinsoldier.m2"] = 1,
	["creature\\kobold\\kobold.m2"] = 1,
	["character\\tauren\\male\\taurenmale.m2"] = 1,
	["creature\\harpy\\harpy.m2"] = 1,
	["creature\\ancientofwar\\ancientofwar.m2"] = 1,
	["creature\\druidcattauren\\druidcattauren.m2"] = 1,
	["creature\\stonekeeper\\stonekeeper.m2"] = 1,
	["creature\\felbeastshadowmoon\\felbeastshadowmoon.m2"] = 1,
	["character\\gnome\\male\\gnomemale.m2"] = 1,
	["creature\\titanfemale\\titanfemale.m2"] = 1,
	["creature\\stormcrowdruid\\stormcrowdruid.m2"] = 1,
	["creature\\orcfemalekid\\orcfemalekid.m2"] = 1,
	["creature\\satyr\\satyr.m2"] = 1,
	["character\\naga_\\male\\naga_male.m2"] = 1,
	["creature\\fungalgiant\\fungalgiant.m2"] = 1,
	["creature\\band\\bandbloodelfmale.m2"] = 1,
	["creature\\highelf\\highelfmale_hunter.m2"] = 1,
	["creature\\ghoul\\ghoul.m2"] = 1,
	["creature\\ghost\\ghost.m2"] = 1,
	["creature\\centaur\\centaurcaster.m2"] = 1,
	["creature\\troll\\trollmelee.m2"] = 1,
	["creature\\thunderlizard\\thunderlizard.m2"] = 1,
	["creature\\humanmalekid\\humanmalekid.m2"] = 1,
	["creature\\basiliskoutland\\basilisk_outland.m2"] = 1,
	["creature\\tallstrider\\tallstrider.m2"] = 1,
	["creature\\worgen\\worgen.m2"] = 1,
	["creature\\naaru\\naaru.m2"] = 1,
	["creature\\tarantula\\tarantula.m2"] = 1,
	["creature\\mountaingiant\\mountaingiant.m2"] = 1,
	["creature\\cockroach\\cockroach.m2"] = 1,
	["creature\\felhound\\felhound.m2"] = 1,
	["character\\goblin\\male\\goblinmale.m2"] = 1,
	["creature\\infernal\\infernal.m2"] = 1,
	["creature\\imp\\imp.m2"] = 1,
	["creature\\firefly\\fireflygreen.m2"] = 1,
	["creature\\succubus\\succubus.m2"] = 1,
	["creature\\highelf\\highelffemale_mage.m2"] = 1,
	["creature\\humanmalepiratecrewman\\humanmalepiratecrewman.m2"] = 1,
	["creature\\keeperofthegrove\\keeperofthegrove.m2"] = 1,
	["creature\\bear\\bear.m2"] = 1,
	["character\\nightelf\\female\\nightelffemale.m2"] = 1,
	["creature\\crackelf\\crackelfmale.m2"] = 1,
	["creature\\arakkoa\\arakkoa.m2"] = 1,
	["character\\draenei\\female\\draeneifemale.m2"] = 1,
	["creature\\ghoul\\ghoulnobirth.m2"] = 1,
	["character\\nightelf\\male\\nightelfmale.m2"] = 1,
	["creature\\boneworm\\boneworm.m2"] = 1,
	["creature\\druidowlbear\\druidowlbear.m2"] = 1,
	["creature\\shade\\shade.m2"] = 1,
	["creature\\rat\\rat.m2"] = 1,
	["creature\\dragonhawk\\dragonhawk.m2"] = 1,
	["creature\\silithidwasp\\silithidwasp.m2"] = 1,
	["creature\\spells\\stasistotem.m2"] = 1,
	["creature\\humanmalecaster\\humanmalecaster.m2"] = 1,
	["character\\troll\\male\\trollmale.m2"] = 1,
	["creature\\arakkoa\\arakkoa_warrior.m2"] = 1,
	["creature\\druidbear\\druidbear.m2"] = 1,
	["creature\\cat\\cat.m2"] = 1,
	["creature\\object\\woodendummy.m2"] = 1,
	["creature\\gnollmelee\\gnollmelee.m2"] = 1,
	["creature\\wyvern\\wyvern.m2"] = 1,
	["creature\\etherialrobe\\etherialrobe.m2"] = 1,
	["creature\\beholder\\beholder.m2"] = 1,
	["creature\\larva\\larva.m2"] = 1,
	["creature\\hyena\\hyena.m2"] = 1,
	["creature\\gazelle\\gazelle.m2"] = 1,
	["creature\\arcanegolem\\arcanegolem.m2"] = 1,
	["creature\\invisibleman\\invisibleman.m2"] = 1,
	["creature\\hydra\\hydra.m2"] = 1,
	["creature\\direwolf\\direwolf.m2"] = 1,
	["creature\\crocodile\\crocodile.m2"] = 1,
	["creature\\frenzy\\frenzy.m2"] = 1,
	["creature\\troll\\troll.m2"] = 1,
	["creature\\horse\\horse.m2"] = 1,
	["creature\\gorilla\\gorilla.m2"] = 1,
	["creature\\tripod\\tripod.m2"] = 1,
	["creature\\impoutland\\impoutland.m2"] = 1,
	["character\\broken\\male\\brokenmale.m2"] = 1,
	["creature\\wisp\\wisp.m2"] = 1,
	["creature\\chimera\\chimera.m2"] = 1,
	["creature\\worm\\worm.m2"] = 1,
	["creature\\chicken\\chicken.m2"] = 1,
	["creature\\goblin\\goblin.m2"] = 1,
	["creature\\giantspider\\giantspider.m2"] = 1,
	["creature\\epicdruidflighthorde\\epicdruidflighthorde.m2"] = 1,
	["creature\\cow\\cow.m2"] = 1,
	["character\\felorc\\male\\felorcmale.m2"] = 1,
	["creature\\tiger\\tiger.m2"] = 1,
	["creature\\faeriedragon\\faeriedragon.m2"] = 1,
	["creature\\bogbeast\\bogbeast.m2"] = 1,
	["creature\\spirithealer\\spirithealer.m2"] = 1,
	["creature\\silithid\\silithid.m2"] = 1,
	["creature\\wolf\\wolf.m2"] = 1,
	["creature\\lich\\lich.m2"] = 1,
	["creature\\ogre\\ogremage.m2"] = 1,
	["creature\\nagamale\\nagamale.m2"] = 1,
	["creature\\minespider\\minespider.m2"] = 1,
	["creature\\humanmalepiratecaptain\\humanmalepiratecaptain.m2"] = 1,
	["creature\\stormcrow\\stormcrow.m2"] = 1,
	["creature\\voidwalker\\voidwalker.m2"] = 1,
	["creature\\spells\\firelighttotem.m2"] = 1,
	["creature\\cocoon\\cocoon.m2"] = 1,
	["creature\\band\\bandtaurenmale.m2"] = 1,
	["creature\\minespider\\minespiderboss.m2"] = 1,
	["creature\\manawurm\\manawurm.m2"] = 1,
	["creature\\snake\\snake.m2"] = 1,
	["creature\\kodobeast\\kodobeast.m2"] = 1,
	["character\\tauren\\female\\taurenfemale.m2"] = 1,
	["creature\\troglodyte\\troglodyte.m2"] = 1,
	["creature\\centaur\\centaurwarrior.m2"] = 1,
	["creature\\questobjects\\creature_scourgecrystaldamaged.m2"] = 1,
	["creature\\dragonspawn\\dragonspawnarmored.m2"] = 1,
	["creature\\scorpion\\scorpion.m2"] = 1,
	["character\\goblin\\female\\goblinfemale.m2"] = 1,
	["creature\\fleshgolem\\fleshgolem.m2"] = 1,
	["creature\\raptoroutland\\raptor_outland.m2"] = 1,
	["creature\\prariedog\\prariedog.m2"] = 1,
	["creature\\krakken\\krakken.m2"] = 1,
	["creature\\hydraoutland\\hydraoutland.m2"] = 1,
	["creature\\silithidscarab\\silithidscarab.m2"] = 1,
	["creature\\dragonwhelp\\dragonwhelp.m2"] = 1,
	["creature\\felguard\\felguard.m2"] = 1,
	["creature\\troll\\trolljungleboss.m2"] = 1,
	["creature\\drake\\drake.m2"] = 1,
	["creature\\lessermanafiend\\lessermanafiend.m2"] = 1,
	["creature\\raptor\\raptor.m2"] = 1,
	["creature\\unicorn\\unicorn.m2"] = 1,
	["creature\\murloc\\murloc.m2"] = 1,
	["creature\\manafiend\\manafiend.m2"] = 1,
	["character\\orc\\male\\orcmale.m2"] = 1,
	["creature\\silithidtank\\silithidtank.m2"] = 1,
	["creature\\crawler\\crawler.m2"] = 1,
	["creature\\elementalearth\\elementalearth.m2"] = 1,
	["creature\\nagafemale\\siren.m2"] = 1,
	["creature\\kodobeast\\kodobeastpack.m2"] = 1,
	["creature\\threshadon\\threshadon.m2"] = 1,
	["creature\\dryad\\dryad.m2"] = 1,
	["creature\\wendigo\\wendigo.m2"] = 1,
	["creature\\quillboar\\quillboar.m2"] = 1,
	["creature\\felbeast\\felbeast.m2"] = 1,
	["creature\\skeletonmage\\skeletonmage.m2"] = 1,
	["creature\\dragonspawncaster\\dragonspawncaster.m2"] = 1,
	["creature\\grell\\grell.m2"] = 1,
	["creature\\druidbear\\druidbeartauren.m2"] = 1,
	["creature\\windserpent\\windserpent.m2"] = 1,
	["character\\gnome\\female\\gnomefemale.m2"] = 1,
	["creature\\ogre\\ogrewarlord.m2"] = 1,
	["creature\\spiritofredemption\\spiritofredemption.m2"] = 1,
	["creature\\boar\\boar.m2"] = 1,
	["creature\\highelf\\highelfmale_mage.m2"] = 1,
	["creature\\troll\\trollwhelp.m2"] = 1,
	["creature\\draeneimalekid\\draeneimalekid.m2"] = 1,
	["creature\\owl\\owl.m2"] = 1,
	["creature\\gargoyle\\gargoyle.m2"] = 1,
}
