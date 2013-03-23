--[[
	A "layout" describes how to use unitframe templates to actually instantiate
	a series of unitframes (say for the party, the target/targetoftarget or
	focus/targetoffocus).
]]
local TGUF_LAYOUTS = {};
local TGUF_NUM_ANCHORS = 0;
local TGUF_CURR_ANCHOR = 0;

function TGUnitFrames_RegisterLayout(layout,layoutName)
	if (TGUF_LAYOUTS[layoutName] == nil) then
		TGUF_LAYOUTS[layoutName] = layout;
	end
end

function TGUnitFrames_AllocateLayout(layoutName) 
	--- Look up the layout
	local	layout = TGUF_LAYOUTS[layoutName];
	if (layout == nil) then
		return;
	end
	
	--[[
	-- Clear all the anchor frames
	for i=1,TGUF_NUM_ANCHORS do
		local	anchor = _G["TGUFLayoutAnchor"..i];
		anchor:ClearAllPoints();
		anchor:SetParent(TGUnitFramesLayoutManagerFrame);
		anchor:Hide();
	end
	]]
	
	-- Allocate the frames in the layout
	--DEFAULT_CHAT_FRAME:AddMessage("Allocating layout "..layoutName..".");
	--TGUF_CURR_ANCHOR = 0;
	local frames = TGUnitFrames_AllocateLayoutRecursive(UIParent,layout.frames,TGUnitFramesLayoutManagerFrame);
	
	-- Filter out the default UI as appropriate
	for k,v in pairs(layout.filters) do
		TGUF_FilterDefaultFrame(v);
	end
	
	return frames;
end

function TGUnitFrames_AllocateLayoutRecursive(parent,layout,layoutParent)
	local	layoutFrames = {};
	local	layoutManagerFrames = {};
	for k,v in ipairs(layout) do
		-- Set up the anchors
		local	anchorFrames = {};
		local	anchorManagerFrames = {};
		for k1,v1 in ipairs(v.anchors) do
			local	anchorIndex = v1.anchor;
			if (v1.anchor < 0) then
				anchorIndex = k+v1.anchor;
			end
			if (anchorIndex > 0) then
				anchorFrames[k1] = layoutFrames[anchorIndex];
				anchorManagerFrames[k1] = layoutManagerFrames[anchorIndex];
			else
				anchorFrames[k1] = parent;
				anchorManagerFrames[k1] = layoutParent;
			end
		end
		
		-- Allocate the frame
		layoutFrames[k] = TGUnitFrames_AllocateUnitFrameTemplate(
			v.unit,
			v.collection,
			v.type,
			parent,
			v.anchors,
			anchorFrames);
		if (v.hideInRaid) then
			TGUnitFramesRaidHider_RegisterForHiding(layoutFrames[k]);
		end
		if (v.showInRaid) then
			TGUnitFramesRaidHider_RegisterForShowing(layoutFrames[k]);
		end
		
		-- Allocate the layout manager frame
		layoutManagerFrames[k] = TGUnitFramesLayoutManagerFrame_NewAnchor(layoutFrames[k],layoutParent,v.anchors,anchorManagerFrames);
		
		-- Do any dependent frames
		if (v.dependents ~= nil) then
			TGUnitFrames_AllocateLayoutRecursive(layoutFrames[k],v.dependents,layoutManagerFrames[k]);
		end
	end
	
	return layoutFrames;
end

function TGUnitFramesLayoutManagerFrame_OnLoad(frame)
end

function TGUnitFramesLayoutManagerFrame_OnUpdate(frame)
end

function TGUnitFramesLayoutManagerFrame_NewAnchor(realFrame,parentFrame,anchors,anchorFrames)
	local	anchorFrame;
	TGUF_CURR_ANCHOR = TGUF_CURR_ANCHOR + 1;
	if TGUF_CURR_ANCHOR <= TGUF_NUM_ANCHORS then
		anchorFrame = _G["TGUFLayoutAnchor"..TGUF_NUM_ANCHORS];
	else
		TGUF_NUM_ANCHORS = TGUF_NUM_ANCHORS + 1;
	 	anchorFrame = CreateFrame("Frame","TGUFLayoutAnchor"..TGUF_NUM_ANCHORS,TGUnitFramesLayoutManagerFrame,"TGUnitFramesLayoutTemplate");
	end
	
	anchorFrame:ClearAllPoints();
	for k,v in ipairs(anchors) do
		anchorFrame:SetPoint(v.myPoint,anchorFrames[k],v.anchorPoint,v.dX,v.dY);
	end
	anchorFrame:SetWidth(realFrame:GetWidth());
	anchorFrame:SetHeight(realFrame:GetHeight());
	
	local	T = _G[anchorFrame:GetName().."ParentLine"];
	local	C = TGUnitFramesLayoutManagerFrame;
	local	sx,sy = _G[anchorFrame:GetName().."Parent"]:GetCenter();
	local	ex,ey = _G[parentFrame:GetName().."Handle"]:GetCenter();
	DrawRouteLine(T,C,sx,sy,ex,ey,32);
	T:Show();
	_G[anchorFrame:GetName().."AnchorLine"]:Hide();
	
	return anchorFrame;
end

function TGUnitFramesLayoutManager_Slash()
	if (TGUnitFramesLayoutManagerFrame:IsVisible()) then
		TGUnitFramesLayoutManagerFrame:Hide();
	else
		TGUnitFramesLayoutManagerFrame:Show();
	end
end
