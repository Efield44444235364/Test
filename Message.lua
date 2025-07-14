print("loading....")
--Function


local placeid = game.PlaceId

spawn(function()
    while task.wait() do
        if _G.AutoQuestRace then
            local plr = game.Players.LocalPlayer
            local currentMap = workspace:FindFirstChild("Map")
            local inTrialMap = false
            
            -- ตรวจสอบว่าอยู่ในแมพ Trial หรือไม่ ตามเผ่า
            if currentMap then
                local race = plr.Data.Race.Value
                if race == "Human" or race == "Ghoul" then
                    if workspace:FindFirstChild("Enemies") then
                        inTrialMap = true
                    end
                elseif race == "Skypiea" then
                    inTrialMap = currentMap:FindFirstChild("SkyTrial") ~= nil
                elseif race == "Mink" then
                    inTrialMap = currentMap:FindFirstChild("MinkTrial") ~= nil
                elseif race == "Cyborg" then
                    inTrialMap = currentMap:FindFirstChild("CyborgTrial") ~= nil
                elseif race == "Fishman" then
                    inTrialMap = currentMap:FindFirstChild("SeaBeasts") ~= nil
                end
            end
            
            if not inTrialMap then
                -- แจ้งเตือนผู้เล่นด้วย Fluent
                Fluent:Notify({
                    Title = "Hi, user",
                    Content = "UR not in trial yet!\n",
                    Duration = 8
                })
                _G.AutoQuestRace = false
                task.wait(5) -- รอ 5 วินาทีก่อนเช็คใหม่
            else
                if plr.PlayerGui:FindFirstChild("Main") and plr.PlayerGui.Main.Timer.Visible then
                    local race = plr.Data.Race.Value
                    local VirtualInputManager = game:GetService("VirtualInputManager")
                    
                    if race == "Human" or race == "Ghoul" then
                        for _, v in pairs(workspace.Enemies:GetDescendants()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                pcall(function()
                                    repeat
                                        task.wait(0.1)
                                        v.Humanoid.Health = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        if sethiddenproperty then
                                            sethiddenproperty(plr, "SimulationRadius", math.huge)
                                        end
                                    until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
                                end)
                            end
                        end

                    elseif race == "Skypiea" then
                        local finish = currentMap:FindFirstChild("SkyTrial") and currentMap.SkyTrial.Model:FindFirstChild("FinishPart")
                        if finish then
                            plr.Character.HumanoidRootPart.CFrame = finish.CFrame
                        end

                    elseif race == "Mink" then
                        local ceiling = currentMap:FindFirstChild("MinkTrial") and currentMap.MinkTrial:FindFirstChild("Ceiling")
                        if ceiling then
                            plr.Character.HumanoidRootPart.CFrame = ceiling.CFrame * CFrame.new(0, -5, 0)
                        end
                        task.wait(0.5)
                        if not plr.PlayerGui.Main.Timer.Visible then
                            _G.AutoQuestRace = false
                        end

                    elseif race == "Cyborg" then
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(28654, 14898.7832, -30)

                    elseif race == "Fishman" then
                        for _, v in pairs(workspace.SeaBeasts.SeaBeast1:GetDescendants()) do
                            if v.Name == "HumanoidRootPart" then
                                plr.Character.HumanoidRootPart.CFrame = v.CFrame

                                local keys = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C}

                                -- Equip Melee
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Melee" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end
                                task.wait(0.5)

                                -- Equip Blox Fruit
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end
                                task.wait(0.5)

                                -- Equip Sword
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Sword" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end
                                task.wait(0.5)

                                -- Equip Gun
                                for _, tool in pairs(plr.Backpack:GetChildren()) do
                                    if tool:IsA("Tool") and tool.ToolTip == "Gun" then
                                        plr.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                for _, key in ipairs(keys) do
                                    VirtualInputManager:SendKeyEvent(true, key, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, key, false, game)
                                end

                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Kawnew | " .. placeid,
    SubTitle = " | Race V4",
    TabWidth = 100, -- เล็กลงอีก
    Size = UDim2.fromOffset(400, 240), -- เล็กและเตี้ย
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    tp = Window:AddTab({ Title = "Race", Icon = "" }),
    tp2 = Window:AddTab({ Title = "Teleport", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do



    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Race trial", Default = false })
    Toggle:OnChanged(function(Value)
    
        print("load")
        _G.AutoQuestRace = Value
    end)

    Options.MyToggle:SetValue(false)

    local Toggle = Tabs.Main:AddToggle("Temple", {Title = "Auto Optimize Temple of time", Default = false })
    Toggle:OnChanged(function()
        print("load")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Efield44444235364/Roblox/refs/heads/main/Temple%20of%20time%20optimize.lua"))()
    end)

    Options.Temple:SetValue(false)



--Telepoart

local section = Tabs.tp:AddSection("Temple of time")

Tabs.tp:AddButton({
        Title = "Tp to temple of time",
        Description = "Teleport to temple of time noBug!!",
        Callback = function()
            Window:Dialog({
                Title = "RU sure?",
                Content = "click",
                Buttons = {
                    {
                        Title = "Ya",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Efield44444235364/Roblox/refs/heads/main/Temple%20of%20time%20Bypass.lua"))()
                        end
                    },
                    {
                        Title = "Nope",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.tp:AddButton({
    Title = "Tp To race door",
    Description = "Teleport to your Race Door",
    Callback = function()
        Window:Dialog({
            Title = "RU sure?",
            Content = "Click 'Ya' to teleport.",
            Buttons = {
                {
                    Title = "Ya",
                    Callback = function()
                        local center = Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875)
                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - center).Magnitude <= 300 then
                            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094)
                            end
                        else
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Efield44444235364/Roblox/refs/heads/main/Temple%20of%20time%20Bypass.lua"))()
                            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156)
                            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094)
                            end
                        end
                    end
                },
                {
                    Title = "Nope",
                    Callback = function()
                        print("❎ Cancelled.")
                    end
                }
            }
        })
    end
})
local section = Tabs.tp:AddSection("Island TP")
Tabs.tp:AddButton({
        Title = "Top of great tree",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Ok",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Efield44444235364/Test/refs/heads/main/TopTreeebugfix.lua"))()
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.tp2:AddButton({
        Title = "Mansion",
        Description = "tp to Mansion!!",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Ok",
                        Callback = function()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12549.8017578125, 337.2079162597656, -7462.84033203125))
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    
    Tabs.tp2:AddButton({
        Title = "Castle on the sea",
        Description = "tp to Castle on the sea!!",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Ok",
                        Callback = function()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5100.50586, 314.555267, -3052.72144, 0.916875184, -3.16727689e-09, 0.399174064, 6.39725473e-09, 1, -6.7594752e-09, -0.399174064, 8.75121309e-09, 0.916875184))
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5067.83398, 314.555267, -2991.13501, -0.299354255, 4.89374266e-08, 0.954142034, -1.49885544e-08, 1, -5.59919933e-08, -0.954142034, -3.10626511e-08, -0.299354255)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5067.83398, 314.555267, -2991.13501, -0.299354255, 4.89374266e-08, 0.954142034, -1.49885544e-08, 1, -5.59919933e-08, -0.954142034, -3.10626511e-08, -0.299354255)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })











    local Keybind = Tabs.Settings:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle",
        Default = "LeftControl",
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end
            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle")

    local Input = Tabs.Settings:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("Kawnew")
SaveManager:SetFolder("Kawnew/" .. placeid)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)

Fluent:Notify({
    Title = "Kawnew",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()

