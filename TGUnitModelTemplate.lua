local TGUF_MODEL_UPDATESTATE_DRAW = 0;
local TGUF_MODEL_UPDATESTATE_RESET = 1;
local TGUF_MODEL_UPDATESTATE_NONE = 2;

local TGUF_CAMERA_TO_INDEX_TABLE = {
	["HEAD"] = 0,
	["BODY"] = 1,
	};
	
function TGUnitModel_NewTGUnitModel(frame,parentFrame,attributes)
	-- Set the unit info
	frame.unitChanged = TGUnitModel_UnitChanged;
	frame.backgroundColor = attributes.backgroundColor;
	frame.impossibleColor = attributes.impossibleColor;
	frame.veryDifficultColor = attributes.veryDifficultColor;
	frame.difficultColor = attributes.difficultColor;
	frame.standardColor = attributes.standardColor;
	frame.trivialColor = attributes.trivialColor;
	--[[
	frame.modelScale = attributes.modelPercent/100.0;
	frame.modelPosition = attributes.modelPosition;
	frame.modelRotation = attributes.modelRotationDegrees*math.pi/180;
	]]
	--[[
	if (attributes.cameraIndex ~= nil) then
		if (attributes.cameraIndex == 1) then
			frame.camera = "BODY";
			attributes.camera = "BODY";
		else
			frame.camera = "HEAD";
			attributes.camera = "HEAD";
		end
		attributes.cameraIndex = nil;
	end
	]]
	frame.cameraIndex = TGUF_CAMERA_TO_INDEX_TABLE[attributes.camera];
	--[[
	if (frame.cameraIndex == nil) then
		frame.cameraIndex = 0;
	end
	]]
	frame.existsUnitUpdate = TGUnitModel_ModelUpdate; --TGUnitModel_ExistsUnitUpdate;
	frame.modelUnitUpdate = TGUnitModel_ModelUpdate;
	frame.levelUnitUpdate = TGUnitModel_LevelAggroNPCUpdate;
	frame.reactionUnitUpdate = TGUnitModel_LevelAggroNPCUpdate;
	frame.npcUnitUpdate = TGUnitModel_LevelAggroNPCUpdate;
	frame.nameUnitUpdate = TGUnitModel_ModelUpdate;
	frame.livingUnitUpdate = TGUnitModel_LivingUpdate;
	table.insert(frame.listener.exists,frame);
	table.insert(frame.listener.model,frame);
	table.insert(frame.listener.level,frame);
	table.insert(frame.listener.reaction,frame);
	table.insert(frame.listener.npc,frame);
	table.insert(frame.listener.living,frame);
	table.insert(frame.listener.name,frame)
	frame.updateState = TGUF_MODEL_UPDATESTATE_NONE;
	
	-- Update the frame
	frame:Show();
	local	modelFrame = _G[frame:GetName().."Model"];
	modelFrame:SetFrameLevel(frame:GetFrameLevel() + 1);
	
	-- Return the frame
	return frame;
end

function TGUnitModel_DestroyTGUnitModel(frame)
	for k,v in pairs(frame.listener.exists) do
		if (v == frame) then
			table.remove(frame.listener.exists,k);
			return;
		end
	end
	for k,v in pairs(frame.listener.model) do
		if (v == frame) then
			table.remove(frame.listener.model,k);
			return;
		end
	end
	for k,v in pairs(frame.listener.level) do
		if (v == frame) then
			table.remove(frame.listener.level,k);
			return;
		end
	end
	for k,v in pairs(frame.listener.reaction) do
		if (v == frame) then
			table.remove(frame.listener.reaction,k);
			return;
		end
	end
	for k,v in pairs(frame.listener.npc) do
		if (v == frame) then
			table.remove(frame.listener.npc,k);
			return;
		end
	end
	for k,v in pairs(frame.listener.living) do
		if (v == frame) then
			table.remove(frame.listener.living,k);
			return;
		end
	end
	for k,v in pairs(frame.listener.name) do
		if (v == frame) then
			table.remove(frame.listener.name,k);
			return;
		end
	end
end

function TGUnitModel_UnitChanged(frame)
	--TGUnitModel_ExistsUnitUpdate(frame.listener.unit,frame);
	TGUnitModel_ModelUpdate(frame.listener.unit,frame);
	TGUnitModel_LevelAggroNPCUpdate(frame.listener.unit,frame);
end

--[[
function TGUnitModel_ExistsUnitUpdate(unit,frame)
	local	modelFrame = _G[frame:GetName().."Model"];
	if (unit.exists) then
		frame.updateState = TGUF_MODEL_UPDATESTATE_RESET;
		frame:Show();
	else
		frame:Hide();
	end
end
]]

function TGUnitModelTemplate_OnUpdate(frame)
	--[[
	if (frame.updateState == TGUF_MODEL_UPDATESTATE_DRAW) then
		TGUFMsg("Updating model")
		local	modelFrame = _G[frame:GetName().."Model"];
		modelFrame:SetModelScale(frame.modelScale);
		modelFrame:SetPosition(frame.modelPosition.x,frame.modelPosition.y,frame.modelPosition.z);
		modelFrame:SetRotation(frame.modelRotation);
		frame.updateState = TGUF_MODEL_UPDATESTATE_NONE;
	end
	]]
	local	modelFrame = _G[frame:GetName().."Model"];
	if (frame.updateState == TGUF_MODEL_UPDATESTATE_RESET) then
		local	unit = frame.listener.unit;
		local	unitName = frame.listener.unit.name;
		modelFrame:SetModelScale(1);
		modelFrame:SetPosition(0,0,0);
		modelFrame:SetRotation(0);
		modelFrame:ClearModel();
		frame.animRunning = false;
		if (unit.unit == "template" or (UnitExists(unit.unit) and UnitIsVisible(unit.unit) and unit.name ~= "Zereketh the Unbound")) then
			--TGUFMsg("Resetting model");
			if (unit.unit == "template") then
				modelFrame:SetUnit("player");
			else
				modelFrame:SetUnit(unit.unit);
			end
			if (unit.living == TGUF_LIVING_DEAD) then
				TGUnitModelTemplate_PlayAnimation(frame,1);
				modelFrame:SetCamera(1);
			else
				if (unit.living == TGUF_LIVING_GHOST) then
					frame:SetAlpha(0.3);
				else
					frame:SetAlpha(1.0);
				end
				modelFrame:SetCamera(frame.cameraIndex);
			end
			local	modelPath = modelFrame:GetModel();
			if (modelPath ~= nil) then
				TGMD_MODELS[modelPath] = 1;
			end
		end
		frame.updateState = TGUF_MODEL_UPDATESTATE_DRAW;
	end
	if (frame.animRunning) then
		local	seqTime = (GetTime()*1000 - frame.sequenceStartTime);
		modelFrame:SetSequenceTime(frame.sequence,seqTime);
	end
end

function TGUnitModelTemplate_OnShow(frame)
	--TGUFMsg("TGUnitModelTemplate_OnShow()");
	frame.updateState = TGUF_MODEL_UPDATESTATE_RESET;
end

function TGUnitModelTemplate_OnHide(frame)
	local	modelFrame = _G[frame:GetName().."Model"];
	modelFrame:ClearModel();
end

function TGUnitModelTemplate_OnAnimFinished(frame)
	TGUFMsg("Animation finished")
	frame.animRunning = false;
end

function TGUnitModelTemplate_PlayAnimation(frame,sequence)
	frame.animRunning = true;
	frame.sequence = sequence;
	frame.sequenceStartTime = GetTime()*1000;
end

function TGUnitModel_ModelUpdate(unit,frame)
	--TGUFMsg("TGUnitModel_ModelUpdate()");
	frame.updateState = TGUF_MODEL_UPDATESTATE_RESET;
end

function TGUnitModel_LivingUpdate(unit,frame)
	frame.updateState = TGUF_MODEL_UPDATESTATE_RESET;
end

function TGUnitModel_LevelAggroNPCUpdate(unit,frame)
	local	backgroundTexture = _G[frame:GetName().."Background"];
	local	color = nil;
	
	if (unit.exists) then
		if (unit.npc == false and unit.reaction == TGUF_REACTION_FRIENDLY) then
			-- Friendly PC's don't get a con background
			color = frame.backgroundColor;
		else
			-- Enemy PC's and NPC's get a con background
			local	levelDiff = unit.level - UnitLevel("player");
	
			if ( levelDiff >= 5 ) then
				color = frame.impossibleColor;
			elseif ( levelDiff >= 3 ) then
				color = frame.veryDifficultColor;
			elseif ( levelDiff >= -2 ) then
				color = frame.difficultColor;
			elseif ( -levelDiff <= GetQuestGreenRange() ) then
				color = frame.standardColor;
			else
				color = frame.trivialColor;
			end
			if (color == nil) then
				color = frame.backgroundColor;
			end
		end
	else
		color = frame.backgroundColor;
	end
	backgroundTexture:SetTexture(color.r,color.g,color.b,color.a);
end

local TGUnitModelTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitModel",
	template = "TGUnitModelTemplate",
	constructor = TGUnitModel_NewTGUnitModel,
	destructor = TGUnitModel_DestroyTGUnitModel,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "camera", type = "restricted-value", values = {"HEAD", "BODY"}, default = "HEAD", newValue = "HEAD", required = true},
		{name = "backgroundColor", type = "color", default = {r=0,g=0,b=0,a=0.5}, newValue = {r=0,g=0,b=0,a=0.5}, required = true},
		{name = "impossibleColor", type = "color", default = {r=1,g=0.1,b=0.1,a=0.5}, newValue = {r=1,g=0.1,b=0.1,a=0.5}, required = false},
		{name = "veryDifficultColor", type = "color", default = {r=1,g=0.5,b=0.25,a=0.5}, newValue = {r=1,g=0.5,b=0.25,a=0.5}, required = false},
		{name = "difficultColor", type = "color", default = {r=1,g=1,b=0,a=0.5}, newValue = {r=1,g=1,b=0,a=0.5}, required = false},
		{name = "standardColor", type = "color", default = {r=0.25,g=0.75,b=0.25,a=0.5}, newValue = {r=0.25,g=0.75,b=0.25,a=0.5}, required = false},
		{name = "trivialColor", type = "color", default = {r=0.5,g=0.5,b=0.5,a=0.5}, newValue = {r=0.5,g=0.5,b=0.5,a=0.5}, required = false}
	}
}
TGUnitFrames_RegisterObject(TGUnitModelTemplate_ObjectInfo);