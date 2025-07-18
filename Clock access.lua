local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- จุด CFrame สร้างเส้นด้าย
local CFrame1 = CFrame.new(29036.2891, 14891.5742, -115.205002)
local CFrame2 = CFrame.new(29035.3457, 14892.2734, -60.5715141)
local Destination = Workspace._WorldOrigin.Locations:WaitForChild("Ancient Clock")

-- ตำแหน่งศูนย์กลางของ Temple
local TempleCenter = Vector3.new(28286.3555, 14896.5488, 102.6247)
local MaxTempleDistance = 1000 -- ถ้าอยู่ห่างจาก temple เกินนี้ = ออกจาก temple

local ThreadPart = nil
local ThreadConnection = nil
local IsInTemple = false
local Teleported = false

-- ฟังก์ชันสร้างเส้นด้าย
local function createThread()
	if ThreadPart then return end

	local pos1, pos2 = CFrame1.Position, CFrame2.Position
	local midPos = (pos1 + pos2) / 2
	local distance = (pos1 - pos2).Magnitude

	local part = Instance.new("Part")
	part.Name = "TeleportThread"
	part.Size = Vector3.new(distance, 4, 4)
	part.CFrame = CFrame.new(midPos, pos2) * CFrame.Angles(0, math.pi, 0)
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = 1
	part.Parent = Workspace

	ThreadPart = part

	-- ตัวจับการแตะ
	ThreadConnection = part.Touched:Connect(function(hit)
		if Teleported then return end
		if hit:IsDescendantOf(LocalPlayer.Character) then
			Teleported = true
			task.wait(0.2)
			HRP.CFrame = Destination.CFrame + Vector3.new(0, 5, 0)
		end
	end)
end

-- ฟังก์ชันลบเส้นด้าย
local function destroyThread()
	if ThreadConnection then
		ThreadConnection:Disconnect()
		ThreadConnection = nil
	end
	if ThreadPart then
		ThreadPart:Destroy()
		ThreadPart = nil
	end
	Teleported = false
end

-- ลูปหลัก: ตรวจว่าอยู่ใน Temple หรือไม่
RunService.Heartbeat:Connect(function()
	if not HRP or not HRP.Parent then return end

	local dist = (HRP.Position - TempleCenter).Magnitude

	if dist <= MaxTempleDistance then
		if not IsInTemple then
			IsInTemple = true
			createThread()
		end
	else
		if IsInTemple then
			IsInTemple = false
			destroyThread()
		end
	end
end)
