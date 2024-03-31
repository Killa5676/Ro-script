local owner = "Killa5676"
local branch = "master"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Ro-script/%s/Scripts/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

if game.PlaceId == 16510724413 then
   webImport("Pet Catchers")
end
