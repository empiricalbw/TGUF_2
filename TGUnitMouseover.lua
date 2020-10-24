function TGUnitMouseover_OnUpdate()
    -- This code is ripped from DiscordART :)
    local obj = GetMouseFocus();
    local text = "MouseOver: ";
    local label = TGUnitMouseoverText;

    if (obj and obj ~= WorldFrame and obj:GetName()) then
        text = text..obj:GetName();
        if (obj:GetParent()  and obj:GetParent() ~= WorldFrame and obj:GetParent():GetName() ) then
            text = text.."\nParent: "..obj:GetParent():GetName();
            if (obj:GetParent():GetParent() and obj:GetParent():GetParent() ~= WorldFrame and obj:GetParent():GetParent():GetName()) then
                text = text.."\nParent's Parent: "..obj:GetParent():GetParent():GetName();
            end
        end
    end

    if ( not string.find(text, "TGUnitMouseoverText") ) then
        label:SetText(text);
    else
        label:SetText("MouseOver: ");
    end
end
