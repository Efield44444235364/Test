local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local plr = Players.LocalPlayer

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

local Pos = CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625) -- เป้าหมาย
local hrp = WaitHRP(plr)

-- แสดง Notification ด้วย SetCore
StarterGui:SetCore("SendNotification", {
	Title = "Castle in the sea",
	Text = "Teleporting...",
	Duration = 3
})

-- ย้ายขึ้นฟ้าเล็กน้อยเพื่อหลีกเลี่ยงปัญหา collision
hrp.CFrame = CFrame.new(hrp.Position.X, 316.354218, hrp.Position.Z)
hrp.Anchored = true

-- รอและส่งคำสั่งขอเข้าด่าน
task.wait(3)
hrp.Anchored = false
ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5116.27246, 316.354218, -3176.95435))
task.wait(1.5)

-- เริ่มเตรียม Teleport
local Distance = (Pos.Position - hrp.Position).Magnitude
local TweenInfo_ = TweenInfo.new(Distance / 360, Enum.EasingStyle.Linear)

if not plr.Character:FindFirstChild("PartTele") then
	local PartTele = Instance.new("Part")
	PartTele.Size = Vector3.new(10, 1, 10)
	PartTele.Name = "PartTele"
	PartTele.Anchored = true
	PartTele.Transparency = 1
	PartTele.CanCollide = false
	PartTele.CFrame = hrp.CFrame
	PartTele.Parent = plr.Character

	local isTeleporting = true

	local connection = PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
		if not isTeleporting then return end
		task.wait()
		if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			hrp.CFrame = PartTele.CFrame
		end
	end)

	SetNoclip(plr.Character, true)

	local goal = { CFrame = Pos }
	local Tween = TweenService:Create(PartTele, TweenInfo_, goal)
	Tween:Play()

	Tween.Completed:Connect(function(status)
		if status == Enum.PlaybackState.Completed then
			isTeleporting = false
			SetNoclip(plr.Character, false)
			if connection then connection:Disconnect() end
			if PartTele then PartTele:Destroy() end
		end
	end)
end
