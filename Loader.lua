--[[
    Made by killa0731 and nhisoka
    3/31/2024
]]

local owner = "Killa5676"
local branch = "master"

loadstring(game:HttpGet("https://raw.githubusercontent.com/Killa5676/Ro-script/master/Utils/Key%20System%20fix.lua"))()

local function antiafk()
local VirtualUser = game:GetService("VirtualUser")
local plr = game.Players.LocalPlayer
    plr.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

local function webImport(file)
    local src = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Ro-script/%s/Scripts/%s.lua"):format(owner, branch, file)))
    task.spawn(src)
end

task.spawn(antiafk)

if game.PlaceId == 16510724413 then
   webImport("PetCatchers")
elseif game.PlaceId == 16953799253 then
   webImport("PlayerRng")
end
