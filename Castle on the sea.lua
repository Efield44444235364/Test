loadstring(game:HttpGet("https://raw.githubusercontent.com/Efield44444235364/Test/refs/heads/main/Byapss%20Castle%20on%20tye%20sea.lua"))()
wait()
local Pos = CFrame.new(-5116.27246, 316.354218, -3176.95435) -- เป้าหมาย

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

local isTeleporting = false
local connection -- ตัวแปรไว้เก็บ Event Connection ของ CFrame update
local plr = game.Players.LocalPlayer

if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("HumanoidRootPart") then
    local Distance = (Pos.Position - plr.Character.HumanoidRootPart.Position).Magnitude

    if not plr.Character:FindFirstChild("PartTele") then
        local PartTele = Instance.new("Part")
        PartTele.Size = Vector3.new(10, 1, 10)
        PartTele.Name = "PartTele"
        PartTele.Anchored = true
        PartTele.Transparency = 1
        PartTele.CanCollide = false
        PartTele.CFrame = WaitHRP(plr).CFrame
        PartTele.Parent = plr.Character

        -- บันทึก connection ไว้ เพื่อตัดตอนจบ
        connection = PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
            if not isTeleporting then return end
            task.wait()
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                WaitHRP(plr).CFrame = PartTele.CFrame
            end
        end)
    end

    SetNoclip(plr.Character, true)
    isTeleporting = true

    local TweenService = game:GetService("TweenService")
    local TweenInfo_ = TweenInfo.new(Distance / 360, Enum.EasingStyle.Linear)
    local goal = {CFrame = Pos}
    local Tween = TweenService:Create(plr.Character.PartTele, TweenInfo_, goal)

    Tween:Play()
    Tween.Completed:Connect(function(status)
        if status == Enum.PlaybackState.Completed then
            -- ปิดการบิน
            isTeleporting = false
            SetNoclip(plr.Character, false)

            if connection then connection:Disconnect() end -- ตัด connection การบิน

            if plr.Character:FindFirstChild("PartTele") then
                plr.Character.PartTele:Destroy()
            end
        end
    end)
end
