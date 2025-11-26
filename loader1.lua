-- ts file was generated at discord.gg/25ms


local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/refs/heads/main/library/LuaLib/ROBLOX/PandaSVALLib.lua"))()
v1:Initialize({
    Service = "styx",
    API_Key = "4eec3bb0049412d43b7b79ae5e315382dabcc8d65dcbca06e81e7de213606f47",
    DisplayName = "Styx",
    IsDebug = true,
    Allow_BlacklistUsers = false,
    GUIVersion = true,
    EnableWebhook = true,
    Webhook_URL = "https://discord.com/api/webhooks/1287999958229717062/Deuj8lusBpZFUinvy36qXMZg4kjr2mwcdLXX9mc50wF_XQUopZJijRSG9-CrAol6fWPg",
    Authenticated = function()
        local _ = game.Players.LocalPlayer
        print("[Pelinda] Key authenticated successfully! Access granted.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EarlFisherLoves/Charon/refs/heads/main/loader.lua"))()
        local v2 = game:GetService("Players").LocalPlayer
        local v3 = v2:FindFirstChild("PlayerGui")
        if v3 then
            v3 = v2.PlayerGui:FindFirstChild("PandaGUI")
        end
        if v3 then
            v3:Destroy()
            print("[Pelinda] PandaGUI has been removed.")
        end
    end,
    NotAuthenticated = function()
        local _ = game.Players.LocalPlayer
        print("[Pelinda] Authentication failed. Access denied.")
    end
})
local vu4 = game:GetService("HttpService")
local function v5()
    return "styx_" .. vu4:GenerateGUID(false):gsub("-", "")
end
print("----------------------------------------------")
print("[Console] - Copied Key:" .. v1:GetKey())
local v6 = "styx_2187e16288d9d5c6f02508633a473673fa050abd0c5ebe10c22b6d3ddfe72f84"
if v1:ValidateKey(v5()) then
    print("Tampering detected!")
elseif v1:ValidateKey(v6) then
    print("Key is valid")
else
    print("Key is invalid")
end
print("----------------------------------------------")
