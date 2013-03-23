function TGUnitClassificationTexture_NewTGUnitClassificationTexture(frame,parentFrame,attributes)
	-- Create a new TGUnitTexture
	frame.unitChanged = TGUnitClassificationTexture_UnitChanged;
	frame.texture = attributes.texture;
	frame.color = {};
	frame.color[TGUF_CLASSIFICATION_NORMAL] = attributes.normalColor;
	frame.color[TGUF_CLASSIFICATION_RARE] = attributes.rareColor;
	frame.color[TGUF_CLASSIFICATION_ELITE] = attributes.eliteColor;
	frame.color[TGUF_CLASSIFICATION_RARE_ELITE] = attributes.rareEliteColor;
	frame.color[TGUF_CLASSIFICATION_BOSS] = attributes.bossColor;
	frame.classificationUnitUpdate = TGUnitClassificationTexture_ClassificationUpdate;
	table.insert(frame.listener.classification,frame);
	
	-- Display as necessary
	local	texture = _G[frame:GetName().."Texture"];
	texture:SetTexture(frame.texture);
	texture:Show();
	frame:Show();
	
	return frame;
end

function TGUnitClassificationTexture_DestroyTGUnitClassificationTexture(frame)
	for k,v in pairs(frame.listener.classification) do
		if (v == frame) then
			table.remove(frame.listener.classification,k);
			return;
		end
	end
end

function TGUnitClassificationTexture_UnitChanged(frame)
	TGUnitClassificationTexture_ClassificationUpdate(unit,frame);
end

function TGUnitClassificationTexture_ClassificationUpdate(unit,frame)
	--TGUFDebug("TGUnitCastIcon_SpellUnitUpdate");
	local	classification = unit.classification;
	local	texture	 = _G[frame:GetName().."Texture"];
	
	if (classification.classification ~= nil) then
		local	color = frame.color[classification.classification];
		texture:SetVertexColor(color.r,color.g,color.b,color.a);
		frame:Show();
	else
		frame:Hide();
	end
end

local TGUnitClassificationTextureTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitClassificationTexture",
	template = "TGUnitClassificationTextureTemplate",
	constructor = TGUnitClassificationTexture_NewTGUnitClassificationTexture,
	destructor = TGUnitClassificationTexture_DestroyTGUnitClassificationTexture,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "texture", type = "string", default = "", newValue = "", required = true},
		{name = "normalColor", type = "color", default = {r=0,g=0,b=0,a=0}, newValue = {r=0,g=0,b=0,a=0}, required = true},
		{name = "rareColor", type = "color", default = {r=0.573,g=0.588,b=0.612,a=1}, newValue = {r=0.573,g=0.588,b=0.612,a=1}, required = true},
		{name = "eliteColor", type = "color", default = {r=1,g=0.75,b=0.35,a=1}, newValue = {r=1,g=0.75,b=0.35,a=1}, required = true},
		{name = "rareEliteColor", type = "color", default = {r=0.75,g=0.4,b=0,a=1}, newValue = {r=0.75,g=0.4,b=0,a=1}, required = true},
		{name = "bossColor", type = "color", default = {r=0.55,g=0.075,b=0.10,a=1}, newValue = {r=0.55,g=0.075,b=0.10,a=1}, required = true}
	}
}
TGUnitFrames_RegisterObject(TGUnitClassificationTextureTemplate_ObjectInfo);
