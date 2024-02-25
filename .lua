local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Main")


local Tab1 = Window_1:NewSection("Fireball")

local function PlayerFolder(func)
  for i,v in pairs(game:GetService("Players"):GetPlayer()) do
    func(i,v)
  end
end

Tab1:CreateToggle("Auto spam",function(value)
        _G.fb = value
    while wait() do
    if _G.fb == false then break end
      PlayerFolder(function(i,v)
          if v.Name ~= game.Players.LocalPlayer then
            game:GetService("Players")["LocalPlayer"]["Character"]:FindFirstChild("Lightning God Fireball")["Event"]:FireServer(v.Character.HumanoidRootPart.Position)
          end
    end
end)
