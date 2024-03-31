--[[
    Made by killa0731 and nhisoka
    3/31/2024
]]

local owner = "Killa5676"
local branch = "master"

local function webImport(file)
    local src = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Ro-script/%s/Scripts/%s.lua"):format(owner, branch, file)))
    local thread = task.spawn(src)
    return thread
end

if game.PlaceId == 16510724413 then
   webImport("PetCatchers")
end
