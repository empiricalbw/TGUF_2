local autoTargetFrame = nil;

function AutoTarget_SetFrame(frame)
    if (autoTargetFrame and frame) then
        print("Error: AutoTarget frame already registered!");
    end
    autoTargetFrame = frame;
end

function AutoTarget_Name(name)
    if (autoTargetFrame) then
        autoTargetFrame:SetAttribute("unit",name);
    end
end

function AutoTarget_Off()
    if (autoTargetFrame) then
        autoTargetFrame:SetAttribute("unit","");
    end
end

function AutoTarget_TargetFound()
    print("AutoTarget: Target found.");
end

function AutoTarget_TargetLost()
    print("AutoTarget: Target lost.");
end
