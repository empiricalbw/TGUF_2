--[[
	An "object" is one element in a unit frame, such as a TGUnitText element.
	The object manager takes care of registering object types and allowing
	construction/destruction of these given objects.
]]
TGUF_OBJECTS = {}
TGUF_OBJECTS_INDEX = {}

function TGUnitFrames_RegisterObject(objectInfo)
	if (TGUF_OBJECTS[objectInfo.name] == nil) then
		TGUF_OBJECTS[objectInfo.name] = objectInfo;
		table.insert(TGUF_OBJECTS_INDEX,objectInfo.name);
	end
end

function TGUnitFrames_AllocateObject(name,parent,attributes,anchorFrames,listener)
	if (TGUF_OBJECTS[name] ~= nil) then
		local frame = TGUnitFrames_ObjectInfoAllocate(TGUF_OBJECTS[name],parent,attributes,anchorFrames);
		frame.listener = listener;
		frame = TGUF_OBJECTS[name].constructor(frame,parent,attributes,anchorFrames);
		table.insert(listener.unitChanged,frame);
		if frame == nil then
			TGUFMsg("TGUF_OBJECT[\""..name.."\"].constructor() returned nil");
		end
		return frame;
	end
	TGUFMsg("TGUF_OBJECT[\""..name.."\"] was nil");
	return nil;
end

function TGUnitFrames_DestroyObject(frame)
	if (frame ~= nil) then
		for k,v in pairs(frame.listener) do
			if (v == frame) then
				table.remove(frame.listener,k);
				break;
			end
		end
		TGUnitFrames_ObjectInfoDestroy(frame);
	end
end

function TGUnitFrames_ObjectInfoAllocate(objectInfo,parentFrame,attributes,anchorFrames)
	-- Pop a frame out of the recycled pool
	local	frame = table.remove(objectInfo.pool);
	
	-- Check if we got a frame, if not allocate one
	if (frame == nil) then
		-- Okay, make a new frame since there are none to recycle
		objectInfo.index = objectInfo.index + 1;
		frame = TGUnitFrames_NewFrame(objectInfo.type,objectInfo.name..objectInfo.index,parentFrame,objectInfo.template,attributes.anchors,attributes.size,anchorFrames);
		frame.objectInfo = objectInfo;
		frame:SetFrameStrata("MEDIUM");
		frame:SetFrameLevel(parentFrame:GetFrameLevel() + 1);
		if (frame:GetFrameLevel() > 10) then
			TGUFMsg("New frame  "..objectInfo.name..objectInfo.index.." with parent "..parentFrame:GetName().." had frameLevel "..frame:GetFrameLevel().."!");
		end
	else
		-- Okay, we have a frame from the recycled pool, set it's attributes.
		--TGUFMsg("Recycling frame of type "..objectInfo.name..".");
		frame:ClearAllPoints();
		frame:SetParent(parentFrame);
		frame:SetFrameStrata("MEDIUM");
		frame:SetFrameLevel(parentFrame:GetFrameLevel() + 1);
		TGUnitFrames_SetAttributes(frame,attributes.anchors,attributes.size,anchorFrames);
		if (frame:GetFrameLevel() > 10) then
			TGUFMsg("Recycled frame  "..objectInfo.name..objectInfo.index.." with parent "..parentFrame:GetName().." had frameLevel "..frame:GetFrameLevel().."!");
		end
	end
	-- Return the frame
	return frame;
end

function TGUnitFrames_ObjectInfoDestroy(frame)
	-- Destroy our children
	--[[
	local child = EnumerateFrames();
	while child do
		if (child:GetParent() == frame) then
			if (child.objectInfo ~= nil) then
				TGUnitFrames_ObjectInfoDestroy(child);
			end
		end
		child = EnumerateFrames(child);
	end
	]]
	--TGUFDebug("Destroying frame: "..frame.objectInfo.name);
	if (frame.tgufChildren ~= nil) then
		while table.maxn(frame.tgufChildren)>0 do
			TGUnitFrames_ObjectInfoDestroy(frame.tgufChildren[1]);
		end
	end
	frame.tgufChildren = nil;
	if (frame.tgufParent ~= nil and frame.tgufParent.tgufChildren ~= nil) then
		for k,v in pairs(frame.tgufParent.tgufChildren) do
			if (v == frame) then
				--TGUFDebug("Removing frame: "..frame.objectInfo.name.." index "..k);
				table.remove(frame.tgufParent.tgufChildren,k);
				break;
			end
		end
	end
	frame.tgufParent = nil;
	
	-- Destroy ourself
	if (frame.hideInRaid) then
		TGUnitFramesRaidHider_UnregisterForHiding(frame);
	end
	if (frame.showInRaid) then
		TGUnitFramesRaidShower_UnregisterForShowing(frame);
	end
	frame.objectInfo.destructor(frame);
	
	-- Attach us to UIParent, clear our anchors and hide us
	frame:Hide();
	frame:ClearAllPoints();
	frame:SetParent(UIParent);
	frame:SetFrameStrata("MEDIUM");
	frame:SetFrameLevel(2);
	
	-- Finally, recycle us
	table.insert(frame.objectInfo.pool,frame);
end
