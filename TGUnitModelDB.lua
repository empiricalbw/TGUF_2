local dbUnit;
local modelRotation;
TGMD_MODELS = {};

function TGUnitModelDB_SetUnit(unit)
    -- Set the unit info
    dbUnit = unit;
    
    -- Update the frame
    TGUnitModelDBFrameModelBGModel:SetModelScale(1);
    TGUnitModelDBFrameModelBGModel:SetPosition(0,0,0);
    TGUnitModelDBFrameModelBGModel:SetRotation(0);
    TGUnitModelDBFrameModelBGModel:ClearModel();
    TGUnitModelDBFrameModelBGModel:SetUnit(unit);
    modelRotation = 0;
    TGUnitModelDBFrame:Show();
    modelPath = TGUnitModelDBFrameModelBGModel:GetModel();
    TGUnitModelDBFrameModelInfoText:SetText(tostring(modelPath));
    
    -- Return the frame
    return frame;
end

function TGUnitModelDB_OnUpdate(elapsedTime,frame)
    local   rotation = 0;
    
    if (TGUnitModelDBFrameRotateRight:GetButtonState() == "PUSHED") then
        TGUnitModelDB_DeltaRotate(-elapsedTime*2*PI*ROTATIONS_PER_SECOND);
    elseif (TGUnitModelDBFrameRotateLeft:GetButtonState() == "PUSHED") then
        TGUnitModelDB_DeltaRotate(elapsedTime*2*PI*ROTATIONS_PER_SECOND);
    end
end

function TGUnitModelDB_DeltaRotate(d)
    if (d ~= 0) then
        modelRotation = modelRotation + d;
        if (modelRotation < 0) then
            modelRotation = modelRotation + 2*PI;
        elseif (modelRotation >= 2*PI) then
            modelRotation = modelRotation - 2*PI;
        end
        TGUnitModelDBFrameModelBGModel:SetRotation(modelRotation);
    end
end

function TGUnitModelDB_OnShow(frame)
end

function TGUnitModelDB_OnHide(frame)
end

function TGUnitModelDB_OnAnimFinished(frame)
end

function TGUnitModelDB_RotateLeft()
    TGUnitModelDB_DeltaRotate(-0.03);
    PlaySound("igInventoryRotateCharacter");
end

function TGUnitModelDB_RotateRight()
    TGUnitModelDB_DeltaRotate(0.03);
    PlaySound("igInventoryRotateCharacter");
end

function TGUnitFramesModelDB_ShowModelDB(unit)
    if (UnitExists(unit) and UnitIsVisible(unit)) then
        TGUnitModelDB_SetUnit(unit);
    end
end

function TGUnitFramesModelDB_Slash()
    if (TGUnitModelDBFrame:IsVisible()) then
        TGUnitModelDBFrame:Hide();
    elseif (UnitExists("target") and UnitIsVisible("target")) then
        TGUnitModelDB_SetUnit("target");
    else
        TGUFMsg("No visible target to display model.");
    end
end

function TGUnitFramesModelDB_List()
    for k,v in pairs(TGMD_MODELS) do
        TGUFMsg(k);
    end
end
