local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Main")
local Window_2 = Library:NewWindow("Tool")

local user = game:GetService("Players").LocalPlayer

local Tab1 = Window_1:NewSection("Fireball Assistant")
local Tab2 = Window_1:NewSection("Punch Assistant")
local Tab3 = Window_2:NewSection("Tools Assistant")
local function PlayerFolder(func)
  for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    func(i,v)
  end
end

local function ToolManage()
  for i,v in pairs(user["Backpack"]:GetChildren()) do
    if v:IsA("Tool") or v:IsA("HopperBin") then
      v.Parent = user["Character"]
    end
  end
end

local function getEquippedTool()
        local char = user.Character
        local polvus = char and char:FindFirstChildWhichIsA("Tool")
    
        if polvus ~= nil then
            if polvus.Name ~= "Punch" then
               return polvus.Name
            end
        else
            return "nil"
        end
    end

Tab1:CreateToggle("Loop spam",function(value)
        _G.fb = value
    while wait(0.5) do
    if _G.fb == false then break end
      PlayerFolder(function(i,v)
          if v.Name ~= user.Name then
            user["Character"][getEquippedTool()]["Event"]:FireServer(v.Character.HumanoidRootPart.Position)
          end
        end)
    end
end)

Tab1:CreateToggle("Loop spam nearest",function(value)
        _G.fbn = value
    while wait() do
    if _G.fbn == false then break end
      PlayerFolder(function(i,v)
          if v.Name ~= user.Name then
                if (user.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 50 then
                  user["Character"][getEquippedTool()]["Event"]:FireServer(v.Character.HumanoidRootPart.Position)
                end
          end
        end)
    end
end)

Tab2:CreateToggle("Loop punch",function(value)
    _G.p = value
    while wait() do
      if _G.p == false then break end
      user["Character"]["Punch"]["Event"]:FireServer(1)
      user["Character"]["Punch"]["Event"]:FireServer(2)
    end
end)

Tab3:CreateToggle("Loop equip multiple tool",function(value)
    _G.equip = value
    while wait() do
      if _G.equip == false then break end
      ToolManage()
    end
end)
