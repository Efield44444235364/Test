local Pos = CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625)
local MAX_RETRIES = 5 -- จำนวนรอบซ้ำสูงสุด

local function WaitHRP(plr)
    local char = plr.Character or plr.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

local function SetNoclip(char, state)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end

local function DoTweenTeleport(plr, retryCount)
    local hrp = WaitHRP(plr)
    local Distance = (Pos.Position - hrp.Position).Magnitude

    if not plr.Character:FindFirstChild("PartTele") then
        local PartTele = Instance.new("Part")
        PartTele.Size = Vector3.new(10, 1, 10)
        PartTele.Name = "PartTele"
        PartTele.Anchored = true
        PartTele.Transparency = 1
        PartTele.CanCollide = false
        PartTele.CFrame = hrp.CFrame
        PartTele.Parent = plr.Character
    end

    local PartTele = plr.Character:FindFirstChild("PartTele")
    local connection
    local isTeleporting = true

    -- Set PlatformStand (ห้ามขยับ)
    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding)
    end

    -- Sync ตำแหน่ง HumanoidRootPart กับ PartTele
    connection = PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
        if isTeleporting then
            local hrp = WaitHRP(plr)
            hrp.CFrame = PartTele.CFrame
        end
    end)

    SetNoclip(plr.Character, true)

    local TweenService = game:GetService("TweenService")
    local TweenInfo_ = TweenInfo.new(Distance / 360, Enum.EasingStyle.Linear)
    local goal = {CFrame = Pos}
    local Tween = TweenService:Create(PartTele, TweenInfo_, goal)

    Tween:Play()
    Tween.Completed:Connect(function(status)
        if status == Enum.PlaybackState.Completed then
            task.wait(0.2)

            -- ย้ำตำแหน่ง 3 ครั้ง เพื่อกันเด้ง
            for i = 1, 3 do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    WaitHRP(plr).CFrame = Pos
                end
                task.wait(0.1)
            end

            isTeleporting = false
            SetNoclip(plr.Character, false)

            -- คืน PlatformStand
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Running)
            end

            if connection then connection:Disconnect() end
            if PartTele and PartTele.Parent then PartTele:Destroy() end

            -- ตรวจสอบว่าไปถึงหรือยัง
            local hrpNow = WaitHRP(plr)
            local finalDistance = (Pos.Position - hrpNow.Position).Magnitude
            if finalDistance > 10 then
                -- ถ้ายังไม่ถึง ลองใหม่
                if retryCount < MAX_RETRIES then
                    warn("🔁 Retry teleport, attempt " .. (retryCount + 1))
                    task.wait(0.5)
                    DoTweenTeleport(plr, retryCount + 1)
                else
                    warn("❌ Teleport failed after max retries.")
                end
            else
                print("✅ Teleport success!")
            end
        end
    end)
end

-- เริ่มวาร์ป
local plr = game.Players.LocalPlayer
if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("HumanoidRootPart") then
    DoTweenTeleport(plr, 0)
end
