--game lode 
if game:IsLoaded() then
    print("game is load")
else
    game.Loaded:Wait()
    print("game not load pls wait")
end

local GameP = tostring(game.PlaceId or "Unknown Place")
local executor = identifyexecutor and identifyexecutor() or "Unknown Executor"

--function
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
             if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait(.1)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                    for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        if v.Name ==  "snowisland_Cylinder.081" then
                            topos(v.CFrame* CFrame.new(0,0,0))
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                    for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                        if v.Name ==  "HumanoidRootPart" then
                            topos(v.CFrame* Pos)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    
                            wait(0.5)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(0.5)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait(.1)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v.Name == "StartPoint" then
                            topos(v.CFrame* CFrame.new(0,3,0))
                            if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                                _G.AutoQuestRace = false
                                StopTween(_G.AutoQuestRace)
                                end
                            end
                          end
                       end
                end
            end
        end
    end)
end)

--Tp  loafl
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

--Tp tace door



local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Kawnew Kaiton",
    SubTitle = "Map : Fisch [" .. GameP .. "] | " .. executor,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.LeftControl
})


--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Auto Farm", Icon = "fish" }),
    a = Window:AddTab({ Title = "Server", Icon = "" }),
    k = Window:AddTab({ Title = "TP", Icon = "" }),
    Settings = Window:AddTab({ Title = "Misc/Config", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "notification",
        Content = "Welcom",
        SubContent = "Drive Word Auto Farm", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "เปิดแล้วรอมันจะเสร็จให้เองง",
        Content = ""
    })



    Tabs.a:AddButton({
        Title = "Rejoin",
        Description = "Rejoin Server!!",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "Rejoin??",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
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
    
    Tabs.k:AddButton({
        Title = "Tp to Top of great Tree",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Efield44444235364/Test/refs/heads/main/All%20tp%20top.lua"))()
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
    
    Tabs.k:AddButton({
        Title = "Casttle on The sea",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
Notification.new("<Color=Green>Castle in the sea<Color=/>"):Display()
hrp.CFrame = CFrame.new(hrp.Position.X, 316.354218, hrp.Position.Z)
hrp.Anchored = true

task.wait(3)
hrp.Anchored = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5116.27246, 316.354218, -3176.95435))
task.wait(1.5)

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

Tabs.k:AddButton({
        Title = "Masion",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Notification.new("<Color=Yellow>Teleport to Mansion<Color=/>"):Display()
hrp.CFrame = CFrame.new(hrp.Position.X, 374.953247, hrp.Position.Z)
hrp.Anchored = true
task.wait(3)
hrp.Anchored = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12466.2646, 374.953247, -7540.37549,
    0.999991, 1.64309295e-08, 0.00423685974,
    -1.63177223e-08, 1, -2.67542752e-08,
    -0.00423685974, 2.66848996e-08, 0.999991))
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
    
    Tabs.k:AddButton({
        Title = "Hydra Island",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Notification.new("<Color=Purple>Hydra Island<Color=/>"):Display()
hrp.CFrame = CFrame.new(hrp.Position.X, 1014.37549, hrp.Position.Z)
hrp.Anchored = true
task.wait(3)
hrp.Anchored = false
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5640.42139, 1014.37549, -348.289978, -0.959107161, 4.32769269e-08, -0.283043116, 2.78972614e-08, 1, 5.83673092e-08, 0.283043116, 4.80843774e-08, -0.959107161))

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

local section = Tabs.a:AddSection("// FPS BOOST \\")

    Tabs.a:AddButton({
        Title = "FPS BOOST",
        Description = "Boost FPS 10++",
        Callback = function()
            Window:Dialog({
                Title = "Notification",
                Content = "Turn On?",
                Buttons = {
                    {
                        Title = "ON",
                        Callback = function()
   loadstring(game:HttpGet("https://pastebin.pl/view/raw/b93a0d93"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

local section = Tabs.Main:AddSection("Auto Something..")

    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto RaceV4 All", Default = false })

    Toggle:OnChanged(function(value)
        print("Toggle changed:", Options.MyToggle.Value)
      _G.AutoQuestRace = value
    end)
    Options.MyToggle:SetValue(false)

    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto TP To race door", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
       if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094)
                    wait(0.5)
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
                    end
                 end)
       end)
Options.MyToggle:SetValue(false)

    local Keybind = Tabs.Settings:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Settings:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("Kawnew Premium Script hub")
SaveManager:SetFolder("Kawnew Premium Script hub/Fisch")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "K_Now",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()


print("Anti Afk ")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti afk ran")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end)
    getfenv().grav = workspace.Gravity