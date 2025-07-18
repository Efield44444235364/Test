local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local Remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- STEP 1: เช็ค RaceV4Progress
local success = pcall(function()
    return Remote:InvokeServer("RaceV4Progress", "Check")
end)
if not success then
    return
end

-- STEP 2: Teleport ไป Temple
pcall(function()
    Remote:InvokeServer("RaceV4Progress", "Teleport")
end)

task.wait(0.1)

-- STEP 3: Activate Temple
pcall(function()
    Remote:InvokeServer("RaceV4Progress", "Activate")
end)

-- STEP 4: ย้าย Temple จาก MapStash
local MapStash = ReplicatedStorage:FindFirstChild("MapStash")
if MapStash then
    local temple = MapStash:FindFirstChild("Temple of Time")
    if temple then
        temple.Parent = Workspace
    end
end

-- STEP 5: ขอเข้า Temple
local templePos = Vector3.new(28286.3555, 14895.3018, 102.6247)
pcall(function()
    Remote:InvokeServer("requestEntrance", templePos)
end)
Humanoid.PlatformStand = true -- แช่แข็งตัวตอนเข้า Temple

-- STEP 6: ตรวจว่าอยู่ใน Temple จริง
task.wait(0.2)
local templeExactPos = Vector3.new(28286.3555, 14896.5488, 102.624695)
if (HRP.Position - templeExactPos).Magnitude >= 20 then
    return
end

-- STEP 7–8: บินนิ่งไปยังจุดกลาง Temple
local targetCFrame = CFrame.new(
    28609.959, 14896.5488, 106.442062,
    0.884707332, -1.14530732e-08, 0.466146886,
    4.99972579e-08, 1, -7.03209011e-08,
    -0.466146886, 8.55194813e-08, 0.884707332
)

local tween = TweenService:Create(
    HRP,
    TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    { CFrame = targetCFrame }
)
tween:Play()
tween.Completed:Wait()
task.wait(0.2)

-- คุยกับ NPC (TeleportBack)
pcall(function()
    Remote:InvokeServer("RaceV4Progress", "TeleportBack")
end)

-- STEP 9.2: ปลด PlatformStand ก่อนคุยกับ NPC
Humanoid.PlatformStand = false

-- STEP 10: วาร์ปไปจุดสุดท้าย
local finalCFrame = CFrame.new(
    3028.84082, 2280.90283, -7324.7832,
    0.0116851926, 2.98534752e-09, -0.999931753,
    8.20532461e-11, 1, 2.98651015e-09,
    0.999931753, -1.16945592e-10, 0.0116851926
)
HRP.CFrame = HRP.CFrame * (finalCFrame - HRP.CFrame)
