--[[
	This component allow a frame to register itself to be shown or hidden
	depending on whether or not we are in a raid.  If the frame is protected
	and can't be changed then it is queued up and handled at a later time.
	
	If the frame has the "registeredForUnitWatching" value set, then it
	UnregisterUnitWatch will be called before hiding the frame and
	RegisterUnitWatch will be called before showing the frame.
]]
local TGUF_RAID_HIDE_FRAMES = {};
local TGUF_RAID_SHOW_FRAMES = {};
local TGUF_RAID_HIDE_FRAMES_QUEUE = {};
local TGUF_RAID_SHOW_FRAMES_QUEUE = {};
local TGUF_RAID_POLL_THROTTLE = 1;
local lastRaidPollTime = 0;
local TGUF_RAID_STATE_NO_RAID = 0;
local TGUF_RAID_STATE_IN_RAID = 1;
local lastRaidPollState = TGUF_RAID_STATE_NO_RAID;

function TGUnitFramesRaidHider_RegisterForHiding(frame)
	for k,v in pairs(TGUF_RAID_HIDE_FRAMES) do
		if (v == frame) then
			return;
		end
	end
	table.insert(TGUF_RAID_HIDE_FRAMES,frame);
	if (lastRaidPollState == TGUF_RAID_STATE_NO_RAID) then
		table.insert(TGUF_RAID_SHOW_FRAMES_QUEUE,frame);
	elseif (lastRaidPollState == TGUF_RAID_STATE_IN_RAID) then
		table.insert(TGUF_RAID_HIDE_FRAMES_QUEUE,frame);
	end
	frame.hideInRaid = true;
end

function TGUnitFramesRaidHider_RegisterForShowing(frame)
	for k,v in pairs(TGUF_RAID_SHOW_FRAMES) do
		if (v == frame) then
			return;
		end
	end
	table.insert(TGUF_RAID_SHOW_FRAMES,frame);
	if (lastRaidPollState == TGUF_RAID_STATE_NO_RAID) then
		table.insert(TGUF_RAID_HIDE_FRAMES_QUEUE,frame);
	elseif (lastRaidPollState == TGUF_RAID_STATE_IN_RAID) then
		table.insert(TGUF_RAID_SHOW_FRAMES_QUEUE,frame);
	end
	frame.showInRaid = true;
end

function TGUnitFramesRaidHider_UnregisterForHiding(frame)
	for k,v in pairs(TGUF_RAID_HIDE_FRAMES) do
		if (v == frame) then
			table.remove(TGUF_RAID_HIDE_FRAMES,k);
			frame.hideInRaid = nil;
			return;
		end
	end
end

function TGUnitFramesRaidHider_UnregisterForShowing(frame)
	for k,v in pairs(TGUF_RAID_SHOW_FRAMES) do
		if (v == frame) then
			table.remove(TGUF_RAID_SHOW_FRAMES,k);
			frame.showInRaid = nil;
			return;
		end
	end
end

function TGUnitFramesRaidHider_OnPeriodicUpdate()
	-- Throttle our polling
	local	currTime = GetTime();
	if (currTime - lastRaidPollTime < TGUF_RAID_POLL_THROTTLE) then
		return;
	end
	
	-- Handle state appropriately
	local	numRaidMembers = GetNumGroupMembers();
	if (lastRaidPollState == TGUF_RAID_STATE_NO_RAID) then
		if (UnitInRaid("player")) then
			-- We are now in a raid!
			TGUF_RAID_HIDE_FRAMES_QUEUE = {};
			TGUF_RAID_SHOW_FRAMES_QUEUE = {};
			for _,v in pairs(TGUF_RAID_HIDE_FRAMES) do
				table.insert(TGUF_RAID_HIDE_FRAMES_QUEUE,v);
			end
			for _,v in pairs(TGUF_RAID_SHOW_FRAMES) do
				table.insert(TGUF_RAID_SHOW_FRAMES_QUEUE,v);
			end
			lastRaidPollState = TGUF_RAID_STATE_IN_RAID;
		else
			-- We are still not in a raid
		end
	elseif (lastRaidPollState == TGUF_RAID_STATE_IN_RAID) then
		if (not UnitInRaid("player")) then
			-- We are no longer in a raid!
			TGUF_RAID_HIDE_FRAMES_QUEUE = {};
			TGUF_RAID_SHOW_FRAMES_QUEUE = {};
			for _,v in pairs(TGUF_RAID_HIDE_FRAMES) do
				table.insert(TGUF_RAID_SHOW_FRAMES_QUEUE,v);
			end
			for _,v in pairs(TGUF_RAID_SHOW_FRAMES) do
				table.insert(TGUF_RAID_HIDE_FRAMES_QUEUE,v);
			end
			lastRaidPollState = TGUF_RAID_STATE_NO_RAID;
		else
			-- We are still in a raid
		end
	end
	
	-- Handle the queues
	for k,v in pairs(TGUF_RAID_HIDE_FRAMES_QUEUE) do
		if (v:CanChangeProtectedState()) then
			v:Hide();
			if (v.registeredForUnitWatching) then
				UnregisterUnitWatch(v);
			end
			if (not v:IsVisible()) then
				TGUF_RAID_HIDE_FRAMES_QUEUE[k] = nil;
			end
		end
	end
	for k,v in pairs(TGUF_RAID_SHOW_FRAMES_QUEUE) do
		if (v:CanChangeProtectedState()) then
			v:Show();
			if (v.registeredForUnitWatching) then
				RegisterUnitWatch(v);
			end
			if (v:IsVisible()) then
				TGUF_RAID_SHOW_FRAMES_QUEUE[k] = nil;
			end
		end
	end
	
	-- Update poll time
	lastRaidPollTime = currTime;
end

-- Register the TGUnit component
local TGUnitFramesRaidHiderComponent = {
	["onPeriodicUpdate"] = TGUnitFramesRaidHider_OnPeriodicUpdate,
	};
TGUnitFrames_RegisterComponent(TGUnitFramesRaidHiderComponent);
