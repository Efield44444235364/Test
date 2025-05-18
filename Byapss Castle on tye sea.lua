local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

Notification.new("<Color=Green>Castle in the sea<Color=/>"):Display()

hrp.CFrame = CFrame.new(hrp.Position.X, 316.354218, hrp.Position.Z)
hrp.Anchored = true

task.wait(3)
hrp.Anchored = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5116.27246, 316.354218, -3176.95435))
task.wait(1.5)
