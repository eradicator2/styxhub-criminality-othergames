-- ts file was generated at discord.gg/25ms


local vu1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()
local v2 = vu1
local v3 = {
    Name = "Styx",
    Subtitle = "dig it",
    LogoID = "139913498922529",
    LoadingEnabled = false,
    LoadingTitle = "Loading cheat menu",
    LoadingSubtitle = "by Styx Development",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = nil
    },
    KeySystem = false
}
local v4 = vu1.CreateWindow(v2, v3)
local vu5 = false
local v6 = v4:CreateTab({
    Name = "Auto Farm",
    Icon = "plumbing",
    ImageSource = "Material",
    ShowTitle = true
})
v6:CreateToggle({
    Name = "Dig Easier",
    Description = "Makes digging easier",
    CurrentValue = false,
    Callback = function(p7)
        vu5 = p7
        if vu5 then
            task.spawn(function()
                local v8 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                while vu5 do
                    local v9 = v8:FindFirstChild("Main")
                    if v9 then
                        v9 = v8.Main:FindFirstChild("DigMinigame")
                    end
                    local vu10 = v9 and v9:FindFirstChild("Area")
                    if vu10 then
                        vu10.Size = UDim2.new(10, 0, vu10.Size.Y.Scale, vu10.Size.Y.Offset)
                        vu10:GetPropertyChangedSignal("Position"):Connect(function()
                            if vu5 then
                                vu10.Position = UDim2.new(0.5, 0, vu10.Position.Y.Scale, vu10.Position.Y.Offset)
                            end
                        end)
                    end
                    wait(0.5)
                end
            end)
        end
    end
}, "digEasierToggle")
v6:CreateLabel({
    Text = "Want more features? Join the discord to suggest features!",
    Style = 2
})
v6:CreateButton({
    Name = "Copy Discord Invite",
    Description = "Copies the Discord invite link to your clipboard.",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/styxscripts")
            print("Discord: .gg/styxscripts")
        else
            warn("Clipboard functionality is not available.")
            print("Discord: .gg/styxscripts")
        end
        vu1:Notification({
            Title = "Invite Copied!",
            Icon = "content_copy",
            ImageSource = "Material",
            Content = "The Discord invite link has been copied to your clipboard."
        })
    end
})
