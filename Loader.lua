--[[
    Made by killa0731 and nhisoka
    3/31/2024
]]

local owner = "Killa5676"
local branch = "master"

local function antiafk()
    for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
        v:Disable()
    end
end

local function webImport(file)
    local src = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Ro-script/%s/Scripts/%s.lua"):format(owner, branch, file)))
    task.spawn(src)
end

task.spawn(antiafk)

if game.PlaceId == 16510724413 then
   webImport("PetCatchers")
end
