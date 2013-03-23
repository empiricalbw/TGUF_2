function TGUnitClassificationBorder_NewTGUnitClassificationBorder(frame,parentFrame,attributes)
	-- Create a new TGUnitTexture
	frame.unitChanged = TGUnitClassificationBorder_UnitChanged;
	frame.texture = attributes.texture;
	frame.color = {};
	frame.color[TGUF_CLASSIFICATION_NORMAL] = attributes.normalColor;
	frame.color[TGUF_CLASSIFICATION_RARE] = attributes.rareColor;
	frame.color[TGUF_CLASSIFICATION_ELITE] = attributes.eliteColor;
	frame.color[TGUF_CLASSIFICATION_RARE_ELITE] = attributes.rareEliteColor;
	frame.color[TGUF_CLASSIFICATION_BOSS] = attributes.bossColor;
	frame.backdrop = {	edgeFile = attributes.edgeFile, edgeSize = attributes.edgeSize };
	frame.classificationUnitUpdate = TGUnitClassificationBorder_ClassificationUpdate;
	table.insert(frame.listener.classification,frame);
	
	-- Display as necessary
	if (frame.backdrop.edgeFile ~= nil and frame.backdrop.edgeFile ~= "") then
		frame:SetBackdrop(frame.backdrop);
		if (attributes.normalColor ~= nil) then
			frame:SetBackdropBorderColor(attributes.normalColor.r,attributes.normalColor.g,attributes.normalColor.b,attributes.normalColor.a);
		end
	else
		frame:SetBackdrop(nil);
	end
	frame:Show();
	
	return frame;
end

function TGUnitClassificationBorder_DestroyTGUnitClassificationBorder(frame)
	for k,v in pairs(frame.listener.classification) do
		if (v == frame) then
			table.remove(frame.listener.classification,k);
			return;
		end
	end
end

function TGUnitClassificationBorder_UnitChanged(frame)
	TGUnitClassificationBorder_ClassificationUpdate(frame.listener.unit,frame);
end

function TGUnitClassificationBorder_ClassificationUpdate(unit,frame)
	local	classification = unit.classification;
	
	if (classification ~= nil) then
		local	color = frame.color[classification];
		if (color == nil) then
			color = {r=1,g=1,b=1,a=0};
		end
		frame:SetBackdropBorderColor(color.r,color.g,color.b,color.a);
		frame:Show();
	else
		frame:Hide();
	end
end

local TGUnitClassificationBorderTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitClassificationBorder",
	template = "TGUnitClassificationBorderTemplate",
	constructor = TGUnitClassificationBorder_NewTGUnitClassificationBorder,
	destructor = TGUnitClassificationBorder_DestroyTGUnitClassificationBorder,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "edgeFile", type = "string", newValue = "", required = false},
		{name = "edgeSize", type = "integer", newValue = 16, required = false},
		{name = "normalColor", type = "color", default = {r=0,g=0,b=0,a=0}, newValue = {r=0,g=0,b=0,a=0}, required = true},
		{name = "rareColor", type = "color", default = {r=0.573,g=0.588,b=0.612,a=1}, newValue = {r=0.573,g=0.588,b=0.612,a=1}, required = true},
		{name = "eliteColor", type = "color", default = {r=1,g=0.75,b=0.35,a=1}, newValue = {r=1,g=0.75,b=0.35,a=1}, required = true},
		{name = "rareEliteColor", type = "color", default = {r=0.75,g=0.4,b=0,a=1}, newValue = {r=0.75,g=0.4,b=0,a=1}, required = true},
		{name = "bossColor", type = "color", default = {r=0.55,g=0.075,b=0.10,a=1}, newValue = {r=0.55,g=0.075,b=0.10,a=1}, required = true}
	}
}
TGUnitFrames_RegisterObject(TGUnitClassificationBorderTemplate_ObjectInfo);
