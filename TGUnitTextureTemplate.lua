function TGUnitTexture_NewTGUnitTexture(frame,parentFrame,attributes)
	-- Create a new TGUnitTexture
	frame.unitChanged = TGUnitTexture_UnitChanged;
	frame.texture = attributes.texture;
	frame.textureColor = attributes.textureColor;
	frame.bgColor = attributes.bgColor;
	frame.edgeColor = attributes.edgeColor;
	frame.backdrop = {	bgFile = attributes.bgFile,edgeFile = attributes.edgeFile,tile = attributes.bgTile,
						tileSize = attributes.bgTileSize, edgeSize = attributes.edgeSize,
						insets = attributes.bgInsets };
	
	
	-- Display as necessary
	local	backgroundTexture = _G[frame:GetName().."Background"];
	if ( (frame.backdrop.bgFile ~= nil and frame.backdrop.bgFile ~= "") or
		 (frame.backdrop.edgeFile ~= nil and frame.backdrop.edgeFile ~= "")) then
		backgroundTexture:Hide();
		frame:SetBackdrop(frame.backdrop);
		if (frame.bgColor ~= nil) then
			frame:SetBackdropColor(frame.bgColor);
		end
		if (frame.edgeColor ~= nil) then
			frame:SetBackdropBorderColor(frame.edgeColor.r,frame.edgeColor.g,frame.edgeColor.b,frame.edgeColor.a);
		end
	else
		frame:SetBackdrop(nil);
		if (frame.bgColor ~= nil) then
			backgroundTexture:SetTexture(frame.bgColor.r,frame.bgColor.g,frame.bgColor.b,frame.bgColor.a);
			backgroundTexture:Show();
		else
			backgroundTexture:Hide();
		end
	end
	local	texture = _G[frame:GetName().."Texture"];
	if (frame.texture ~= nil) then
		texture:SetTexture(frame.texture);
		if (frame.textureColor ~= nil) then
			texture:SetVertexColor(frame.textureColor.r,frame.textureColor.g,frame.textureColor.b,frame.textureColor.a);
		end
		texture:Show();
	elseif (frame.textureColor ~= nil) then
		texture:SetTexture(frame.textureColor.r,frame.textureColor.g,frame.textureColor.b,frame.textureColor.a);
		texture:Show();
	else
		texture:Hide();
	end
	
	frame:Show();
	return frame;
end

function TGUnitTexture_DestroyTGUnitTexture(frame)
end

function TGUnitTexture_UnitChanged(frame)
end

local TGUnitTextureTemplate_ObjectInfo =
{
	type = "Frame",
	name = "TGUnitTexture",
	template = "TGUnitTextureTemplate",
	constructor = TGUnitTexture_NewTGUnitTexture,
	destructor = TGUnitTexture_DestroyTGUnitTexture,
	index = 0,
	pool = {},
	attributes =
	{
		{name = "texture", type = "string", newValue = "", required = false},
		{name = "textureColor", type = "color", newValue = {r=0,g=0,b=0,a=1}, required = false},
		{name = "bgFile", type = "string", newValue = "", required = false},
		{name = "bgColor", type = "color", newValue = {r=0,g=0,b=0,a=1}, required = false},
		{name = "bgInsets", type = "insets", newValue = {left=0,right=0,top=0,bottom=0}, required = false},
		{name = "bgTile", type = "boolean", newValue = false, required = false},
		{name = "bgTileSize", type = "integer", newValue = 16, required = false},
		{name = "edgeFile", type = "string", newValue = "", required = false},
		{name = "edgeColor", type = "color", newValue = {r=0,g=0,b=0,a=1}, required = false},
		{name = "edgeSize", type = "integer", newValue = 16, required = false},
	}
}
TGUnitFrames_RegisterObject(TGUnitTextureTemplate_ObjectInfo);
