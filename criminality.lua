-- ts file was generated at discord.gg/25ms


local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()
local v2 = v1
local v3 = v1.CreateWindow(v2, {
    Name = "Styx",
    Subtitle = "criminality",
    LogoID = "139913498922529",
    LoadingEnabled = false,
    LoadingTitle = "Loading cheat menu",
    LoadingSubtitle = "by Styx Development",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = nil
    },
    KeySystem = false
})
local vu4 = "Torso"
local vu5 = false
local vu6 = false
local vu7 = false
local vu8 = false
local vu9 = game:GetService("Lighting")
local vu10 = workspace:FindFirstChildOfClass("Terrain")
local vu11 = game:GetService("RunService")
local v12 = v3:CreateTab({
    Name = "Combat",
    Icon = "coronavirus",
    ImageSource = "Material",
    ShowTitle = true
})
v12:CreateSection("Styx Aimlock")
v12:CreateToggle({
    Name = "Enable Aim Lock",
    Description = "Hold M2 to lock on.",
    CurrentValue = false,
    Callback = function(pu13)
        vu7 = pu13
        Aimlock = vu7
        getgenv().AimPart = "Torso"
        getgenv().AimRadius = 100
        getgenv().FirstPerson = true
        getgenv().TeamCheck = false
        getgenv().PredictMovement = vu5
        getgenv().PredictionVelocity = 16
        local vu14 = game:GetService("Players")
        local vu15 = game:GetService("UserInputService")
        local v16 = game:GetService("RunService")
        local vu17 = game:GetService("StarterGui")
        local vu18 = vu14.LocalPlayer
        local vu19 = vu14.LocalPlayer:GetMouse()
        local vu20 = workspace.CurrentCamera
        local vu21 = CFrame.new
        local vu22 = Ray.new
        local _ = Vector3.new
        local _ = Vector2.new
        local vu23 = true
        local vu24 = false
        local vu25 = false
        local vu26 = nil
        local vu27 = nil
        getgenv().CiazwareUniversalAimbotLoaded = true
        getgenv().SeparateNotify = function(p28, p29, _, p30)
            vu17:SetCore("SendNotification", {
                Title = p28,
                Text = p29,
                Duration = p30
            })
        end
        getgenv().Notify = function(p31, p32, p33, p34)
            if vu25 == true then
                vu17:SetCore("SendNotification", {
                    Title = p31,
                    Text = p32,
                    Icon = p33,
                    Duration = (not p34 or not type(p34) == "number") and 3 or p34
                })
            end
        end
        getgenv().WorldToViewportPoint = function(p35)
            return vu20:WorldToViewportPoint(p35)
        end
        getgenv().WorldToScreenPoint = function(p36)
            return vu20:WorldToScreenPoint(p36)
        end
        getgenv().GetObscuringObjects = function(p37)
            local v38 = p37 and (p37:FindFirstChild(getgenv().AimPart) and vu18) and (vu18.Character:FindFirstChild("Head") and workspace:FindPartOnRay(vu22(p37[getgenv().AimPart].Position, vu18.Character.Head.Position)))
            if v38 then
                local _ = v38.IsDescendantOf
            end
        end
        getgenv().GetNearestTarget = function()
            local v39 = vu14
            local v40, v41, v42 = pairs(v39:GetPlayers())
            local v43 = {}
            local v44 = {}
            local v45 = {}
            while true do
                local v46
                v42, v46 = v40(v41, v42)
                if v42 == nil then
                    break
                end
                if v46 ~= vu18 then
                    table.insert(v43, v46)
                end
            end
            local v47, v48, v49 = pairs(v43)
            while true do
                local v50
                v49, v50 = v47(v48, v49)
                if v49 == nil then
                    break
                end
                if v50.Character and (v50.Character:FindFirstChild("Head") and (v50.Character:FindFirstChild("Humanoid") and v50.Character:FindFirstChild("Humanoid").Health > 0)) then
                    local v51 = v50.Character:FindFirstChild("Head")
                    if getgenv().TeamCheck ~= true or v50.Team == vu18.Team then
                        if getgenv().TeamCheck == false and v50.Team == vu18.Team then
                            local v52 = (v50.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                            local v53 = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (vu19.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * v52)
                            local _, v54 = game.Workspace:FindPartOnRay(v53, game.Workspace)
                            local v55 = math.floor((v54 - v51.Position).magnitude)
                            v44[v50.Name .. v49] = {}
                            v44[v50.Name .. v49].dist = v52
                            v44[v50.Name .. v49].plr = v50
                            v44[v50.Name .. v49].diff = v55
                            table.insert(v45, v55)
                        end
                    else
                        local v56 = (v50.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                        local v57 = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (vu19.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * v56)
                        local _, v58 = game.Workspace:FindPartOnRay(v57, game.Workspace)
                        local v59 = math.floor((v58 - v51.Position).magnitude)
                        v44[v50.Name .. v49] = {}
                        v44[v50.Name .. v49].dist = v56
                        v44[v50.Name .. v49].plr = v50
                        v44[v50.Name .. v49].diff = v59
                        table.insert(v45, v59)
                    end
                end
            end
            if unpack(v45) == nil then
                return nil
            end
            local v60 = math.floor(math.min(unpack(v45)))
            if getgenv().AimRadius < v60 then
                return nil
            end
            local v61, v62, v63 = pairs(v44)
            while true do
                local v64
                v63, v64 = v61(v62, v63)
                if v63 == nil then
                    break
                end
                if v64.diff == v60 then
                    return v64.plr
                end
            end
            return nil
        end
        local vu67 = vu15.InputBegan:Connect(function(p65)
            if not vu15:GetFocusedTextBox() and p65.UserInputType == Enum.UserInputType.MouseButton2 then
                vu24 = true
                local v66 = GetNearestTarget()
                if v66 ~= nil then
                    print(v66)
                    vu26 = v66
                    if vu6 then
                        Notify("Styx AimLock", "Aimlock Target: " .. tostring(vu26), "rbxassetid://123817167597199", 3)
                    end
                end
            end
        end)
        local v69 = vu15.InputEnded:Connect(function(p68)
            if pu13 and vu7 then
                if not vu15:GetFocusedTextBox() and p68.UserInputType == Enum.UserInputType.MouseButton2 then
                    if vu26 ~= nil then
                        vu26 = nil
                    end
                    if vu24 ~= false then
                        vu24 = false
                    end
                end
            elseif vu67 then
                vu67:Disconnect()
                vu67 = nil
            end
        end)
        if pu13 then
            local _ = v16.RenderStepped:Connect(function()
                getgenv().PredictMovement = vu5
                if vu7 and pu13 then
                    if getgenv().FirstPerson == true then
                        if 0 == 0 then
                            vu25 = true
                        else
                            vu25 = false
                        end
                    end
                    if vu23 == true and (vu24 == true and (vu26 and vu26.Character)) and (vu26.Character:FindFirstChild(getgenv().AimPart) and (getgenv().FirstPerson == true and vu25 == true)) then
                        if getgenv().PredictMovement ~= true then
                            if getgenv().PredictMovement == false and (vu26 and vu26.Character) and vu26.Character:FindFirstChild(getgenv().AimPart) then
                                vu20.CFrame = vu21(vu20.CFrame.p, vu26.Character[getgenv().AimPart].Position)
                            end
                        elseif vu26 and vu26.Character and vu26.Character:FindFirstChild(getgenv().AimPart) then
                            vu20.CFrame = vu21(vu20.CFrame.p, vu26.Character[getgenv().AimPart].Position + vu26.Character[getgenv().AimPart].Velocity / PredictionVelocity)
                        end
                    end
                elseif vu27 then
                    vu27:Disconnect()
                end
            end)
        elseif not (pu13 or vu7) then
            if vu27 then
                vu27:Disconnect()
            end
            if vu67 then
                local v70 = vu67
                vu67.Disconnect(v70)
                vu67 = nil
            end
            if v69 then
                v69:Disconnect()
            end
        end
    end
}, "Toggle")
v12:CreateSection("Aimlock Settings")
v12:CreateToggle({
    Name = "Enable Wall Check",
    Description = "Prevent aimlock through walls",
    CurrentValue = false,
    Callback = function(p71)
        getgenv().WallCheck = p71
    end
}, "Toggle")
v12:CreateToggle({
    Name = "Enable Headshots",
    Description = "Aim only at heads",
    CurrentValue = false,
    Callback = function(p72)
        vu4 = p72 and "Head" or "Torso"
        getgenv().AimPart = vu4
    end
}, "Toggle")
v12:CreateToggle({
    Name = "Enable Target Notifications",
    Description = "Trageting notifications",
    CurrentValue = false,
    Callback = function(p73)
        vu6 = p73
    end
}, "Toggle")
v12:CreateSlider({
    Name = "PerdictionSlider",
    Range = {
        0,
        30
    },
    Increment = 1,
    CurrentValue = 0,
    Callback = function(p74)
        vu5 = p74
    end
}, "Slider")
v12:CreateToggle({
    Name = "Enable Perdiction",
    Description = "Movement perdicition",
    CurrentValue = false,
    Callback = function(p75)
        vu5 = p75
    end
}, "Toggle")
v12:CreateButton({
    Name = "Enable Wallbang",
    Description = "Shoot though walls",
    Callback = function()
        game:service("Workspace"):FindFirstChild("Map"):FindFirstChild("Parts"):FindFirstChild("M_Parts").Parent = game:service("Workspace"):FindFirstChild("Characters")
    end
})
v12:CreateSection("Stomp Speed Mod")
local vu76 = game:GetService("ReplicatedStorage"):FindFirstChild("Values"):FindFirstChild("FinishSpeedMulti")
v12:CreateSlider({
    Name = "Modify Stomp Speed",
    Range = {
        0,
        1.8
    },
    Increment = 0.1,
    CurrentValue = vu76.Value,
    Callback = function(p77)
        vu76.Value = p77
    end
}, "Slider")
v3:CreateTab({
    Name = "Lockpick Mods",
    Icon = "lock_outline",
    ImageSource = "Material",
    ShowTitle = true
}):CreateToggle({
    Name = "Auto lockpick",
    Description = "Makes lock picking easier",
    CurrentValue = false,
    Callback = function(p78)
        vu8 = p78
    end
}, "Toggle")
function checkLockpick(...)
    local v79, v80, v81 = ipairs({
        ...
    })
    while true do
        local v82
        v81, v82 = v79(v80, v81)
        if v81 == nil then
            break
        end
        if v82.Parent and v82.Parent:FindFirstChild("UIScale") then
            v82.Parent.UIScale.Scale = 10
        end
        if v82.AbsolutePosition.Y >= 450 and v82.AbsolutePosition.Y <= 550 then
            mouse1click()
            task.wait(0.1)
            mouse1release()
        end
    end
end
spawn(function()
    while true do
        repeat
            task.wait(0.5)
            local v83 = vu8 and game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("LockpickGUI")
        until v83
        local v84 = v83.MF.LP_Frame.Frames.B1.Bar.Selection
        local v85 = v83.MF.LP_Frame.Frames.B2.Bar.Selection
        local v86 = v83.MF.LP_Frame.Frames.B3.Bar.Selection
        checkLockpick(v84, v85, v86)
    end
end)
local v87 = v3:CreateTab({
    Name = "Visuals",
    Icon = "preview",
    ImageSource = "Material",
    ShowTitle = true
})
v87:CreateSection("Player ESP")
local vu88 = false
v87:CreateToggle({
    Name = "Enable Player ESP",
    Description = nil,
    CurrentValue = false,
    Callback = function(p89)
        vu88 = p89
        local vu90 = {
            Box_Color = Color3.fromRGB(255, 0, 0),
            Tracer_Color = Color3.fromRGB(255, 0, 0),
            Tracer_Thickness = 0,
            Box_Thickness = 1,
            Tracer_Origin = "Bottom",
            Tracer_FollowMouse = false,
            Tracers = false
        }
        local vu91 = {
            TeamCheck = false,
            Green = Color3.fromRGB(0, 255, 0),
            Red = Color3.fromRGB(255, 0, 0)
        }
        local vu92 = true
        local vu93 = game:GetService("Players").LocalPlayer
        local vu94 = game:GetService("Workspace").CurrentCamera
        local v95 = vu93
        local vu96 = vu93.GetMouse(v95)
        local function vu100(p97, p98)
            local v99 = Drawing.new("Quad")
            v99.Visible = false
            v99.PointA = Vector2.new(0, 0)
            v99.PointB = Vector2.new(0, 0)
            v99.PointC = Vector2.new(0, 0)
            v99.PointD = Vector2.new(0, 0)
            v99.Color = p98
            v99.Filled = false
            v99.Thickness = p97
            v99.Transparency = 1
            return v99
        end
        local function vu104(p101, p102)
            local v103 = Drawing.new("Line")
            v103.Visible = false
            v103.From = Vector2.new(0, 0)
            v103.To = Vector2.new(0, 0)
            v103.Color = p102
            v103.Thickness = p101
            v103.Transparency = 1
            return v103
        end
        local function vu111(p105, p106)
            local v107, v108, v109 = pairs(p106)
            while true do
                local v110
                v109, v110 = v107(v108, v109)
                if v109 == nil then
                    break
                end
                v110.Visible = p105
            end
        end
        local vu112 = Color3.fromRGB(0, 0, 0)
        local function vu133(pu113)
            local vu114 = {
                blacktracer = vu104(vu90.Tracer_Thickness * 2, vu112),
                tracer = vu104(vu90.Tracer_Thickness, vu90.Tracer_Color),
                black = vu100(vu90.Box_Thickness * 2, vu112),
                box = vu100(vu90.Box_Thickness, vu90.Box_Color),
                healthbar = vu104(3, vu112),
                greenhealth = vu104(1.5, vu112)
            }
            local function vu120(p115)
                local v116, v117, v118 = pairs(vu114)
                while true do
                    local v119
                    v118, v119 = v116(v117, v118)
                    if v118 == nil then
                        break
                    end
                    if v119 ~= vu114.healthbar and (v119 ~= vu114.greenhealth and (v119 ~= vu114.blacktracer and v119 ~= vu114.black)) then
                        v119.Color = p115
                    end
                end
            end
            local function v132()
                local vu121 = nil
                local _ = game:GetService("RunService").RenderStepped:Connect(function()
                    if pu113.Character == nil or (pu113.Character:FindFirstChild("Humanoid") == nil or (pu113.Character:FindFirstChild("HumanoidRootPart") == nil or pu113.Character.Humanoid.Health <= 0 or (pu113.Character:FindFirstChild("Head") == nil or not vu88))) then
                        vu111(false, vu114)
                        if game.Players:FindFirstChild(pu113.Name) == nil then
                            vu121:Disconnect()
                        end
                    else
                        local vu122, v123 = vu94:WorldToViewportPoint(pu113.Character.HumanoidRootPart.Position)
                        if v123 then
                            local v124 = vu94:WorldToViewportPoint(pu113.Character.Head.Position)
                            local vu125 = math.clamp((Vector2.new(v124.X, v124.Y) - Vector2.new(vu122.X, vu122.Y)).magnitude, 2, math.huge)
                            local function v127(p126)
                                p126.PointA = Vector2.new(vu122.X + vu125, vu122.Y - vu125 * 2)
                                p126.PointB = Vector2.new(vu122.X - vu125, vu122.Y - vu125 * 2)
                                p126.PointC = Vector2.new(vu122.X - vu125, vu122.Y + vu125 * 2)
                                p126.PointD = Vector2.new(vu122.X + vu125, vu122.Y + vu125 * 2)
                            end
                            v127(vu114.box)
                            v127(vu114.black)
                            if vu90.Tracers then
                                if vu90.Tracer_Origin ~= "Middle" then
                                    if vu90.Tracer_Origin == "Bottom" then
                                        vu114.tracer.From = Vector2.new(vu94.ViewportSize.X * 0.5, vu94.ViewportSize.Y)
                                        vu114.blacktracer.From = Vector2.new(vu94.ViewportSize.X * 0.5, vu94.ViewportSize.Y)
                                    end
                                else
                                    vu114.tracer.From = vu94.ViewportSize * 0.5
                                    vu114.blacktracer.From = vu94.ViewportSize * 0.5
                                end
                                if vu90.Tracer_FollowMouse then
                                    vu114.tracer.From = Vector2.new(vu96.X, vu96.Y + 36)
                                    vu114.blacktracer.From = Vector2.new(vu96.X, vu96.Y + 36)
                                end
                                vu114.tracer.To = Vector2.new(vu122.X, vu122.Y + vu125 * 2)
                                vu114.blacktracer.To = Vector2.new(vu122.X, vu122.Y + vu125 * 2)
                            else
                                vu114.tracer.From = Vector2.new(0, 0)
                                vu114.blacktracer.From = Vector2.new(0, 0)
                                vu114.tracer.To = Vector2.new(0, 0)
                                vu114.blacktracer.To = Vector2.new(0, 2)
                            end
                            local v128 = (Vector2.new(vu122.X - vu125, vu122.Y - vu125 * 2) - Vector2.new(vu122.X - vu125, vu122.Y + vu125 * 2)).magnitude
                            local v129 = pu113.Character.Humanoid.Health / pu113.Character.Humanoid.MaxHealth * v128
                            vu114.greenhealth.From = Vector2.new(vu122.X - vu125 - 4, vu122.Y + vu125 * 2)
                            vu114.greenhealth.To = Vector2.new(vu122.X - vu125 - 4, vu122.Y + vu125 * 2 - v129)
                            vu114.healthbar.From = Vector2.new(vu122.X - vu125 - 4, vu122.Y + vu125 * 2)
                            vu114.healthbar.To = Vector2.new(vu122.X - vu125 - 4, vu122.Y - vu125 * 2)
                            local v130 = Color3.fromRGB(0, 255, 0)
                            local v131 = Color3.fromRGB(255, 0, 0)
                            vu114.greenhealth.Color = v131:lerp(v130, pu113.Character.Humanoid.Health / pu113.Character.Humanoid.MaxHealth)
                            if vu91.TeamCheck then
                                if pu113.TeamColor ~= vu93.TeamColor then
                                    vu120(vu91.Red)
                                else
                                    vu120(vu91.Green)
                                end
                            else
                                vu114.tracer.Color = vu90.Tracer_Color
                                vu114.box.Color = vu90.Box_Color
                            end
                            if vu92 == true then
                                vu120(pu113.TeamColor.Color)
                            end
                            vu111(true, vu114)
                        else
                            vu111(false, vu114)
                        end
                    end
                end)
            end
            coroutine.wrap(v132)()
        end
        local v134, v135, v136 = pairs(game:GetService("Players"):GetPlayers())
        local vu137 = vu93
        while true do
            local v138
            v136, v138 = v134(v135, v136)
            if v136 == nil then
                break
            end
            if v138.Name ~= vu137.Name then
                coroutine.wrap(vu133)(v138)
            end
        end
        game.Players.PlayerAdded:Connect(function(p139)
            if p139.Name ~= vu137.Name then
                coroutine.wrap(vu133)(p139)
            end
        end)
    end,
    "Toggle"
})
local vu140 = false
v87:CreateToggle({
    Name = "Enable crate ESP",
    Description = "Highlights crates in standard mode",
    CurrentValue = false,
    Callback = function(p141)
        vu140 = p141
        if p141 then
            while vu140 do
                wait(1)
                if vu140 then
                    local _ = {
                        ColorSequenceKeypoint.new(0, Color3.new(1, 0.666667, 0)),
                        ColorSequenceKeypoint.new(0, Color3.new(1, 0.666667, 0))
                    }
                    local v142, v143, v144 = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
                    while true do
                        local v145
                        v144, v145 = v142(v143, v144)
                        if v144 == nil then
                            break
                        end
                        if v145.Name == "C1" and v145:FindFirstChild("MeshPart") then
                            if v145.MeshPart.TextureID ~= "rbxassetid://11157915894" then
                                if v145.MeshPart.TextureID ~= "rbxassetid://11157911882" then
                                    if tostring(v145.MeshPart.Particle.Color) == "0 1 0.666667 0 0 1 1 0.666667 0 0 " and not v145:FindFirstChild("ESP") then
                                        local v146 = Instance.new("Highlight")
                                        v146.Name = "ESP"
                                        v146.FillColor = Color3.fromRGB(255, 255, 0)
                                        v146.OutlineColor = Color3.fromRGB(255, 255, 0)
                                        v146.Parent = v145
                                    end
                                elseif not v145:FindFirstChild("ESP") then
                                    local v147 = Instance.new("Highlight")
                                    v147.Name = "ESP"
                                    v147.FillColor = Color3.fromRGB(0, 255, 0)
                                    v147.OutlineColor = Color3.fromRGB(0, 255, 0)
                                    v147.Parent = v145
                                end
                            elseif not v145:FindFirstChild("ESP") then
                                local v148 = Instance.new("Highlight")
                                v148.Name = "ESP"
                                v148.FillColor = Color3.fromRGB(255, 0, 0)
                                v148.OutlineColor = Color3.fromRGB(255, 0, 0)
                                v148.Parent = v145
                            end
                        end
                    end
                    local v149, v150, v151 = pairs(workspace.Debris.VParts:GetChildren())
                    while true do
                        local v152
                        v151, v152 = v149(v150, v151)
                        if v151 == nil then
                            break
                        end
                        if v152 and (v152.Name == "SupplyCrate" and (v152 and not v152:FindFirstChild("ESP"))) then
                            local v153 = Instance.new("Highlight")
                            v153.Name = "ESP"
                            v153.FillColor = Color3.fromRGB(255, 255, 0)
                            v153.OutlineColor = Color3.fromRGB(255, 255, 0)
                            v153.Parent = v152
                        end
                    end
                    local v154, v155, v156 = pairs(workspace.Map.MysteryBoxes:GetChildren())
                    while true do
                        local v157
                        v156, v157 = v154(v155, v156)
                        if v156 == nil then
                            break
                        end
                        if v157 and (v157.Name == "MysteryBox" and (v157 and not v157:FindFirstChild("ESP"))) then
                            local v158 = Instance.new("Highlight")
                            v158.Name = "ESP"
                            v158.FillColor = Color3.fromRGB(0, 255, 255)
                            v158.OutlineColor = Color3.fromRGB(0, 255, 255)
                            v158.Parent = v157
                        end
                    end
                end
            end
        elseif not (vu140 or p141) then
            local v159, v160, v161 = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
            while true do
                local v162
                v161, v162 = v159(v160, v161)
                if v161 == nil then
                    break
                end
                if v162.Name == "C1" and v162:FindFirstChild("ESP") then
                    v162.ESP:Destroy()
                end
            end
            local v163, v164, v165 = pairs(workspace.Debris.VParts:GetChildren())
            while true do
                local v166
                v165, v166 = v163(v164, v165)
                if v165 == nil then
                    break
                end
                if v166 and (v166.Name == "SupplyCrate" and (v166 and v166:FindFirstChild("ESP"))) then
                    v166.ESP:Destroy()
                end
            end
            local v167, v168, v169 = pairs(workspace.Map.MysteryBoxes:GetChildren())
            while true do
                local v170
                v169, v170 = v167(v168, v169)
                if v169 == nil then
                    break
                end
                if v170 and (v170.Name == "MysteryBox" and (v170 and v170:FindFirstChild("ESP"))) then
                    v170.ESP:Destroy()
                end
            end
        end
    end
})
v87:CreateToggle({
    Name = "Enable robbable ESP",
    Description = "Highlights robbable items",
    CurrentValue = false,
    Callback = function(p171)
        toggleespsafe = p171
        if p171 then
            local function v176(pu172)
                pcall(function()
                    if pu172:FindFirstChild("SafeESP") then
                        if pu172:FindFirstChild("Values") and (pu172:FindFirstChild("Values"):FindFirstChild("Broken") and pu172:FindFirstChild("SafeESP"):FindFirstChild("name")) then
                            if pu172.Values.Broken.Value ~= true then
                                pu172:FindFirstChild("SafeESP"):FindFirstChild("health").Text = "Health: " .. pu172:FindFirstChild("Values"):FindFirstChild("Health").Value
                                pu172:FindFirstChild("SafeESP"):FindFirstChild("health").Visible = true
                                pu172:FindFirstChild("SafeESP"):FindFirstChild("name").TextColor3 = Color3.fromRGB(0, 255, 0)
                            else
                                pu172:FindFirstChild("SafeESP"):FindFirstChild("name").TextColor3 = Color3.fromRGB(255, 0, 0)
                                pu172:FindFirstChild("SafeESP"):FindFirstChild("health").Visible = false
                            end
                        end
                    else
                        local v173 = Instance.new("BillboardGui", pu172)
                        v173.Name = "SafeESP"
                        v173.AlwaysOnTop = true
                        v173.Size = UDim2.new(1.2, 0, 1.2, 0)
                        local v174 = Instance.new("TextLabel", v173)
                        v174.Size = UDim2.new(1, 0, 0.3, 0)
                        v174.Name = "name"
                        v174.Font = Enum.Font.SourceSans
                        v174.FontSize = Enum.FontSize.Size18
                        v174.TextStrokeTransparency = 0
                        v174.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        v174.BackgroundTransparency = 1
                        local v175 = Instance.new("TextLabel", v173)
                        v175.Size = UDim2.new(1, 0, 0.3, 0)
                        v175.Name = "health"
                        v175.Font = Enum.Font.SourceSans
                        v175.FontSize = Enum.FontSize.Size18
                        v175.TextStrokeTransparency = 0
                        v175.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        v175.Position = UDim2.new()
                        v175.BackgroundTransparency = 1
                        v175.TextColor3 = Color3.fromRGB(0, 255, 0)
                        v175.Position = UDim2.new(0, 0, 0, 17)
                        v175.Text = "Health: "
                        if pu172:FindFirstChild("Values") and pu172:FindFirstChild("Values"):FindFirstChild("Broken") then
                            if pu172.Values.Broken.Value ~= true then
                                v174.TextColor3 = Color3.fromRGB(0, 255, 0)
                            else
                                v174.TextColor3 = Color3.fromRGB(255, 0, 0)
                            end
                        end
                        if pu172.Name:lower():find("smallsafe") then
                            v174.Text = "Small Safe"
                        elseif pu172.Name:lower():find("mediumsafe") then
                            v174.Text = "Medium Safe"
                        elseif pu172.Name:lower():find("register") then
                            v174.Text = "Register"
                        elseif pu172.Name:lower():find("cash") then
                            v174.Text = "Register"
                        end
                    end
                end)
            end
            while toggleespsafe do
                wait(1)
                if toggleespsafe then
                    local v177, v178, v179 = pairs(game:GetService("Workspace").Map.BredMakurz:GetChildren())
                    while true do
                        local v180
                        v179, v180 = v177(v178, v179)
                        if v179 == nil then
                            break
                        end
                        if v180 then
                            v176(v180)
                        end
                    end
                end
            end
        elseif not (p171 or toggleespsafe) then
            local v181, v182, v183 = pairs(game:GetService("Workspace").Map.BredMakurz:GetChildren())
            while true do
                local v184
                v183, v184 = v181(v182, v183)
                if v183 == nil then
                    break
                end
                if v184:FindFirstChild("SafeESP") then
                    v184.SafeESP:Destroy()
                end
            end
        end
    end
}, "Toggle")
v87:CreateToggle({
    Name = "Enable Dealer ESP",
    Description = "Highlights dealer npcs",
    CurrentValue = false,
    Callback = function(p185)
        toggleespdealer = p185
        if p185 then
            local function v188(p186)
                if toggleespdealer and (p186 and not p186:FindFirstChild("DealerESP")) then
                    local v187 = Instance.new("Highlight")
                    v187.Parent = p186
                    v187.FillColor = Color3.new(1, 1, 1)
                    v187.Name = "DealerESP"
                    if p186.Name ~= "ArmoryDealer" then
                        if p186.Name == "Dealer" then
                            v187.FillColor = Color3.fromRGB(153, 255, 153)
                            v187.OutlineColor = Color3.fromRGB(153, 255, 153)
                        end
                    else
                        v187.FillColor = Color3.fromRGB(153, 204, 255)
                        v187.OutlineColor = Color3.fromRGB(153, 204, 255)
                    end
                end
            end
            while toggleespdealer do
                wait(0.01)
                local v189, v190, v191 = pairs(workspace.Map.Shopz:GetChildren())
                while true do
                    local v192
                    v191, v192 = v189(v190, v191)
                    if v191 == nil then
                        break
                    end
                    if v192.Name == "Dealer" or v192.Name == "ArmoryDealer" then
                        v188(v192)
                    end
                end
            end
        else
            local v193, v194, v195 = pairs(workspace.Map.Shopz:GetChildren())
            while true do
                local v196
                v195, v196 = v193(v194, v195)
                if v195 == nil then
                    break
                end
                if (v196.Name == "Dealer" or v196.Name == "ArmoryDealer") and v196:FindFirstChild("DealerESP") then
                    v196:FindFirstChild("DealerESP"):Destroy()
                end
            end
        end
    end
})
v87:CreateToggle({
    Name = "Enable Scrap ESP",
    Description = "Highlights scrap piles",
    CurrentValue = false,
    Callback = function(p197)
        toggleespscrap = p197
        if p197 then
            while toggleespscrap do
                wait(1)
                if toggleespscrap then
                    local v198, v199, v200 = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
                    while true do
                        local v201
                        v200, v201 = v198(v199, v200)
                        if v200 == nil then
                            break
                        end
                        if (v201.Name == "S1" or v201.Name == "S2") and (v201:FindFirstChild("MeshPart") and not v201:FindFirstChild("ESP")) then
                            local v202 = Instance.new("Highlight")
                            v202.Name = "ESP"
                            v202.FillColor = Color3.fromRGB(150, 150, 150)
                            v202.OutlineColor = Color3.fromRGB(150, 150, 150)
                            v202.Parent = v201
                        end
                    end
                end
            end
        elseif not (toggleespscrap or p197) then
            local v203, v204, v205 = pairs(game.Workspace.Filter.SpawnedPiles:GetChildren())
            while true do
                local v206
                v205, v206 = v203(v204, v205)
                if v205 == nil then
                    break
                end
                if (v206.Name == "S1" or v206.Name == "S2") and v206:FindFirstChild("ESP") then
                    v206.ESP:Destroy()
                end
            end
        end
    end
}, "Toggle")
v3:CreateTab({
    Name = "Protection",
    Icon = "shield",
    ImageSource = "Material",
    ShowTitle = true
}):CreateButton({
    Name = "Admin Protection",
    Description = "Kick when admin joins",
    Callback = function()
        local vu207 = {
            34616594,
            626833004,
            3717066084,
            141193516,
            418086275,
            412741116,
            438805620,
            198610386,
            1517131734,
            67180844,
            87189764,
            153835477,
            111250044,
            42066711,
            9212846,
            31365111,
            48058122,
            955294,
            295331237,
            166406495,
            3659305297
        }
        local function vu209(p208)
            if table.find(vu207, p208.UserId) then
                game.Players.LocalPlayer:Kick("An admin has joined you, you have been kicked to protect your account - Styx Development")
            end
        end
        local function v214()
            local v210, v211, v212 = ipairs(game.Players:GetPlayers())
            while true do
                local v213
                v212, v213 = v210(v211, v212)
                if v212 == nil then
                    break
                end
                vu209(v213)
            end
        end
        game.Players.PlayerAdded:Connect(vu209)
        v214()
    end
})
local v215 = v3:CreateTab({
    Name = "Performance",
    Icon = "leaderboard",
    ImageSource = "Material",
    ShowTitle = true
})
v215:CreateButton({
    Name = "Enable Fullbright",
    Description = "Brightens game",
    Callback = function()
        pcall(function()
            local vu216 = game:GetService("Lighting")
            vu216.Ambient = Color3.fromRGB(255, 255, 255)
            vu216.Brightness = 1
            vu216.FogEnd = 10000000000
            local v217, v218, v219 = pairs(vu216:GetDescendants())
            while true do
                local v220
                v219, v220 = v217(v218, v219)
                if v219 == nil then
                    break
                end
                if v220:IsA("BloomEffect") or (v220:IsA("BlurEffect") or (v220:IsA("ColorCorrectionEffect") or v220:IsA("SunRaysEffect"))) then
                    v220.Enabled = false
                end
            end
            vu216.Changed:Connect(function()
                vu216.Ambient = Color3.fromRGB(255, 255, 255)
                vu216.Brightness = 1
                vu216.FogEnd = 10000000000
            end)
            spawn(function()
                local v221 = game:GetService("Players").LocalPlayer.Character
                while wait() do
                    repeat
                        wait()
                    until v221 ~= nil
                    if not v221.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                        local v222 = Instance.new("PointLight", v221.HumanoidRootPart)
                        v222.Brightness = 1
                        v222.Range = 60
                    end
                end
            end)
        end)
    end
})
v215:CreateButton({
    Name = "Enable FPS Boost",
    Description = "If you have a low end pc use this",
    Callback = function()
        if vu10 then
            vu10.WaterWaveSize = 0
            vu10.WaterWaveSpeed = 0
            vu10.WaterReflectance = 0
            vu10.WaterTransparency = 0
        end
        if vu9 then
            vu9.GlobalShadows = false
            vu9.FogEnd = 9000000000
        end
        settings().Rendering.QualityLevel = 1
        local v223, v224, v225 = pairs(game:GetDescendants())
        while true do
            local v226
            v225, v226 = v223(v224, v225)
            if v225 == nil then
                break
            end
            if v226:IsA("Part") or (v226:IsA("UnionOperation") or (v226:IsA("MeshPart") or (v226:IsA("CornerWedgePart") or v226:IsA("TrussPart")))) then
                v226.Material = "Plastic"
                v226.Reflectance = 0
            elseif v226:IsA("Decal") then
                v226.Transparency = 1
            elseif v226:IsA("ParticleEmitter") or v226:IsA("Trail") then
                v226.Lifetime = NumberRange.new(0)
            elseif v226:IsA("Explosion") then
                v226.BlastPressure = 1
                v226.BlastRadius = 1
            end
        end
        local v227 = vu9
        local v228, v229, v230 = pairs(v227:GetDescendants())
        while true do
            local v231
            v230, v231 = v228(v229, v230)
            if v230 == nil then
                break
            end
            if v231:IsA("BlurEffect") or (v231:IsA("SunRaysEffect") or (v231:IsA("ColorCorrectionEffect") or (v231:IsA("BloomEffect") or v231:IsA("DepthOfFieldEffect")))) then
                v231.Enabled = false
            end
        end
        workspace.DescendantAdded:Connect(function(pu232)
            task.spawn(function()
                if pu232:IsA("ForceField") or pu232:IsA("Sparkles") then
                    vu11.Heartbeat:Wait()
                    pu232:Destroy()
                elseif pu232:IsA("Smoke") or pu232:IsA("Fire") then
                    vu11.Heartbeat:Wait()
                    pu232:Destroy()
                end
            end)
        end)
    end
})
