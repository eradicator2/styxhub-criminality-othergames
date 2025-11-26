-- ts file was generated at discord.gg/25ms


local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))():CreateWindow({
    Name = "Styx",
    Subtitle = "Pet Star Simulator",
    LogoID = "139913498922529",
    LoadingEnabled = false,
    LoadingTitle = "Loading cheat menu",
    LoadingSubtitle = "by styx Software",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = nil
    },
    KeySystem = false
})
local vu2 = false
local vu3 = false
local vu4 = false
local vu5 = false
local vu6 = false
local vu7 = false
local vu8 = false
local vu9 = false
local vu10 = false
local vu11 = false
local vu12 = false
local vu13 = false
local vu14 = false
local vu15 = game:GetService("Workspace")
local vu16 = game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("collectStar")
local _ = {
    SPAWN = CFrame.new(7.33309793, 16.7703228, - 576.58551),
    ["Autumn Forest"] = CFrame.new(10.3925657, 15.81071, - 777.209778),
    ["Flower Garden"] = CFrame.new(8.3031559, 15.4084587, - 983.220154),
    ["Snow Forest"] = CFrame.new(8.03649139, 15.596941, - 1171.98706),
    ["Tropical Palms"] = CFrame.new(9.36836529, 14.6717863, - 1357.40198),
    ["Mine Shaft"] = CFrame.new(9.30014706, 14.6118708, - 1559.61206),
    ["Diamond Mine"] = CFrame.new(8.57099342, 11.0603123, - 1755.42505),
    ["Magical Forest"] = CFrame.new(9.02206707, 10.289094, - 1946.15503),
    ["Sakura Forest"] = CFrame.new(9.77635002, 13.6511049, - 2135.83032),
    ["Sakura Ravine"] = CFrame.new(9.40575123, 14.5590153, - 2334.23047),
    ["Magma Ravine"] = CFrame.new(9.08853817, 15.4755154, - 2526.4812),
    ["Cloud Road"] = CFrame.new(10.4396534, 12.1884127, - 2719.23633),
    Heaven = CFrame.new(4.78637934, 15.5101233, - 2895.18091),
    ["Diamond Cave"] = CFrame.new(2.99225378, 12.2029552, - 167.539459),
    VIP = CFrame.new(- 129.121338, 7.64340401, - 421.93277),
    Leaderboards = CFrame.new(59.952877, 9.46869946, - 365.169403),
    Index = CFrame.new(71.1227112, 13.3126602, - 455.96405)
}
local vu17 = {
    "Collect",
    "Thaillut",
    "FavoriteTheGame",
    "SorryForShutDown",
    "Update1",
    "ComingSoon",
    "Update2"
}
local v18 = {
    "Select Egg...",
    "Basic Egg",
    "Autumn Egg",
    "Bee Egg",
    "Snow Egg",
    "Tropical Egg",
    "Mine Egg",
    "Diamond Egg",
    "Magical Egg",
    "Sakura Egg",
    "Split Egg",
    "Devil Egg",
    "Cloud Egg",
    "Heaven Egg"
}
local vu19 = nil
local v20 = {
    "Select Potion...",
    "Gems T1",
    "Gems T2",
    "Gems T3",
    "Gems T4",
    "Luck T1",
    "Luck T2",
    "Luck T3",
    "Luck T4",
    "Treasure Hunter T1",
    "Treasure Hunter T2",
    "Treasure Hunter T3",
    "Treasure Hunter T4",
    "Stars T1",
    "Stars T2",
    "Stars T3",
    "Stars T4",
    "XP T1",
    "XP T2",
    "XP T3",
    "XP T4",
    "Elixir Of Gods"
}
local vu21 = nil
local v22 = {
    "Select World...",
    "SPAWN",
    "Autumn Forest",
    "Flower Garden",
    "Snow Forest",
    "Tropical Palms",
    "Mine Shaft",
    "Diamond Mine",
    "Magical Forest",
    "Sakura Forest",
    "Sakura Ravine",
    "Magma Ravine",
    "Cloud Road",
    "Heaven",
    "VIP",
    "Diamond Cave"
}
local vu23 = nil
local v24 = v1:CreateTab({
    Name = "Auto Farm",
    Icon = "shop",
    ImageSource = "Material",
    ShowTitle = true
})
v24:CreateDropdown({
    Name = "Select World",
    Description = "Select world to auto collect",
    Options = v22,
    CurrentOption = v22[1],
    MultipleOptions = false,
    SpecialType = nil,
    Callback = function(p25)
        vu23 = p25
        print("Selected world:", vu23)
    end
}, "worldDropdown")
v24:CreateToggle({
    Name = "Auto Collect Stars",
    Description = "Collects stars from selected world",
    CurrentValue = false,
    Callback = function(p26)
        vu2 = p26
        if vu2 then
            if not vu23 then
                warn("Please select a world before enabling Auto Collect Stars.")
                vu2 = false
                return
            end
            local v27 = vu15.LocalStars:FindFirstChild(vu23)
            if not v27 then
                warn("World folder not found: " .. vu23)
                vu2 = false
                return
            end
            while vu2 do
                local v28 = v27:GetChildren()
                local v29, v30, v31 = ipairs(v28)
                while true do
                    local v32
                    v31, v32 = v29(v30, v31)
                    if v31 == nil then
                        break
                    end
                    if v32:IsA("BasePart") or (v32:IsA("Model") or v32:IsA("Folder")) then
                        local v33 = {
                            vu23,
                            v32.Name
                        }
                        vu16:FireServer(unpack(v33))
                    end
                end
                task.wait(0)
            end
            print("Stopped collecting stars.")
        end
    end
}, "collectStarsToggle")
local v34 = v1:CreateTab({
    Name = "Pets",
    Icon = "emoji_emotions",
    ImageSource = "Material",
    ShowTitle = true
})
v34:CreateDropdown({
    Name = "Select Egg",
    Description = "Select egg to auto hatch",
    Options = v18,
    CurrentOption = v18[1],
    MultipleOptions = false,
    SpecialType = nil,
    Callback = function(p35)
        vu19 = p35
        print("Selected Egg:", vu19)
    end
}, "eggDropdown")
v34:CreateToggle({
    Name = "Auto Hatch Selected Egg",
    Description = "Auto hatches from selected egg, must be near the egg",
    CurrentValue = false,
    Callback = function(p36)
        vu13 = p36
        if vu13 then
            if not vu19 or vu19 == "Select Egg..." then
                warn("Please select an egg before enabling Auto Hatch.")
                vu13 = false
                return
            end
            print("Started auto hatching:", vu19)
            while vu13 do
                local v37 = {
                    vu19,
                    "Open All"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("PetSystem"):WaitForChild("Remote"):WaitForChild("Hatch"):InvokeServer(unpack(v37))
                wait(0.1)
            end
        else
            print("Stopped auto hatching.")
        end
    end
}, "autoHatchToggle")
local v38 = v1:CreateTab({
    Name = "Upgrades",
    Icon = "sparkle",
    ImageSource = "Material",
    ShowTitle = true
})
v38:CreateToggle({
    Name = "Auto Upgrade: Egg Luck",
    Description = nil,
    CurrentValue = false,
    Callback = function(p39)
        vu7 = p39
        while vu7 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("buyUpgrade"):InvokeServer(unpack({
                "EGG_LUCK"
            }))
            wait(0.1)
        end
    end
}, "eggUpgradeToggle")
v38:CreateToggle({
    Name = "Auto Upgrade: More Gems",
    Description = nil,
    CurrentValue = false,
    Callback = function(p40)
        vu8 = p40
        while vu8 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("buyUpgrade"):InvokeServer(unpack({
                "MORE_GEMS"
            }))
            wait(0.1)
        end
    end
}, "gemsUpgradeToggle")
v38:CreateToggle({
    Name = "Auto Upgrade: Inventory Slots",
    Description = nil,
    CurrentValue = false,
    Callback = function(p41)
        vu9 = p41
        while vu9 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("buyUpgrade"):InvokeServer(unpack({
                "PET_SLOTS"
            }))
            wait(0.1)
        end
    end
}, "inventoryUpgradeToggle")
v38:CreateToggle({
    Name = "Auto Upgrade: Star Spawning Luck",
    Description = nil,
    CurrentValue = false,
    Callback = function(p42)
        vu10 = p42
        while vu10 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("buyUpgrade"):InvokeServer(unpack({
                "STAR_SPAWN_LUCK"
            }))
            wait(0.1)
        end
    end
}, "spawningUpgradeToggle")
v38:CreateToggle({
    Name = "Auto Upgrade: Walk Speed",
    Description = nil,
    CurrentValue = false,
    Callback = function(p43)
        vu11 = p43
        while vu11 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("buyUpgrade"):InvokeServer(unpack({
                "WALK_SPEED"
            }))
            wait(0.1)
        end
    end
}, "speedUpgradeToggle")
v38:CreateToggle({
    Name = "Auto Upgrade: Potion Duration",
    Description = nil,
    CurrentValue = false,
    Callback = function(p44)
        vu12 = p44
        while vu12 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("buyUpgrade"):InvokeServer(unpack({
                "POTION_DURATION"
            }))
            wait(0.1)
        end
    end
}, "potionUpgradeToggle")
local v45 = v1:CreateTab({
    Name = "Potions",
    Icon = "star",
    ImageSource = "Material",
    ShowTitle = true
})
v45:CreateDropdown({
    Name = "Select Potion",
    Description = "Select potion to auto consume",
    Options = v20,
    CurrentOption = v20[1],
    MultipleOptions = false,
    SpecialType = nil,
    Callback = function(p46)
        vu21 = p46
        print("Selected Potion:", vu21)
    end
}, "potionDropdown")
v45:CreateToggle({
    Name = "Auto Consume Selected Potion",
    Description = "Auto consumes slected potion.",
    CurrentValue = false,
    Callback = function(p47)
        vu14 = p47
        if vu14 then
            if not vu21 or vu21 == "Select Potion..." then
                warn("Please select a potion before enabling Auto Consume.")
                vu14 = false
                return
            end
            print("Started auto consuming:", vu21)
            while vu14 do
                local v48 = {
                    vu21
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("usePotion"):InvokeServer(unpack(v48))
                wait(0.1)
            end
        else
            print("Stopped auto consuming.")
        end
    end
}, "autoConsumeToggle")
local v49 = v1:CreateTab({
    Name = "Rewards",
    Icon = "cake",
    ImageSource = "Material",
    ShowTitle = true
})
v49:CreateButton({
    Name = "Redeem All Codes",
    Description = "Redeems all available codes.",
    Callback = function()
        local v50 = game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("redeemCode")
        local v51, v52, v53 = ipairs(vu17)
        while true do
            local v54
            v53, v54 = v51(v52, v53)
            if v53 == nil then
                break
            end
            v50:InvokeServer(unpack({
                v54
            }))
            wait(0.1)
        end
    end
})
v49:CreateToggle({
    Name = "Auto Collect Time Rewards",
    Description = nil,
    CurrentValue = false,
    Callback = function(p55)
        vu4 = p55
        while vu4 do
            for v56 = 1, 16 do
                game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("claimGift"):InvokeServer(unpack({
                    v56
                }))
                wait(0.1)
            end
            wait(60)
        end
    end
}, "timeGiftsToggle")
v49:CreateToggle({
    Name = "Auto Collect Level Rewards",
    Description = "collect the level up rewards",
    CurrentValue = false,
    Callback = function(p57)
        vu3 = p57
        while vu3 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("claimLevelRoad"):InvokeServer()
            wait(3)
        end
    end
}, "levelRewardsToggle")
v49:CreateToggle({
    Name = "Auto Collect Daily Reward",
    Description = nil,
    CurrentValue = false,
    Callback = function(p58)
        vu5 = p58
        while vu5 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("claimDailyReward"):InvokeServer()
            wait(60)
        end
    end
}, "dailyRewardToggle")
v49:CreateToggle({
    Name = "Auto Collect Index Rewards",
    Description = nil,
    CurrentValue = false,
    Callback = function(p59)
        vu6 = p59
        while vu6 do
            game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("Remote"):WaitForChild("claimIndexReward"):InvokeServer()
            wait(30)
        end
    end
}, "collectIndexToggle")
local function vu66(p60, p61)
    if p60 and p60.Touched then
        local v62, v63, v64 = pairs(getconnections(p60.Touched))
        while true do
            local v65
            v64, v65 = v62(v63, v64)
            if v64 == nil then
                break
            end
            if v65.Function then
                v65.Function(p61)
            end
        end
    end
end
v49:CreateButton({
    Name = "Collect Daily Chest",
    Description = "Can be claimed once a day.",
    Callback = function()
        local v67 = vu15.Chests.DAILY_CHEST.DAILY_CHEST.DAILY_CHEST
        local v68 = game.Players.LocalPlayer
        vu66(v67, ((v68.Character or v68.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")))
    end
})
v49:CreateButton({
    Name = "Collect Crystal Chest",
    Description = "Can be claimed once a day.",
    Callback = function()
        local v69 = vu15.Chests.CRYSTAL_CHEST.CRYSTAL_CHEST.CRYSTAL_CHEST
        local v70 = game.Players.LocalPlayer
        vu66(v69, ((v70.Character or v70.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")))
    end
})
v49:CreateButton({
    Name = "Collect VIP Chest",
    Description = "Must own VIP gamepass, can be claimed once a day.",
    Callback = function()
        local v71 = vu15.Chests.VIP_CHEST.VIP_CHEST.VIP_CHEST
        local v72 = game.Players.LocalPlayer
        vu66(v71, ((v72.Character or v72.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")))
    end
})
v1:CreateTab({
    Name = "Player",
    Icon = "person_search",
    ImageSource = "Material",
    ShowTitle = true
}):CreateSlider({
    Name = "Walkspeed",
    Range = {
        16,
        200
    },
    Increment = 5,
    CurrentValue = 50,
    Callback = function(p73)
        local v74 = game.Players.LocalPlayer
        local v75 = v74.Character
        if v75 then
            v75 = v74.Character:FindFirstChild("Humanoid")
        end
        if v75 then
            v75.WalkSpeed = p73
        end
    end
}, "speedSlider")
