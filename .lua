local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Main")
local Window_2 = Library:NewWindow("Tool")
local Window_3 = Library:NewWindow("Misc")

local user = game:GetService("Players").LocalPlayer
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()

local Tab1 = Window_1:NewSection("Fireball Assistant")
local Tab2 = Window_1:NewSection("Punch Assistant")
local Tab3 = Window_2:NewSection("Tools Assistant")
local Tab4 = Window_3:NewSection("Visual")
local Tab5 = Window_3:NewSection("ESP")
local Tab6 = Window_3:NewSection("Teleport")
local workspace = game:GetService("Workspace")
local function PlayerFolder(func)
  for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    func(v)
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
    while wait(1) do
    if _G.fb == false then break end
      PlayerFolder(function(v)
          if v.Name ~= user.Name then
            user["Character"][getEquippedTool()]["Event"]:FireServer(v.Character.HumanoidRootPart.Position)
          end
        end)
    end
end)

Tab1:CreateToggle("Loop spam nearest",function(value)
        _G.fbn = value
    while wait(0.5) do
    if _G.fbn == false then break end
      PlayerFolder(function(v)
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

Tab4:CreateToggle("No damage",function(value)
    _G.dmg = value
end)

Tab5:CreateToggle("Player ESP",function(value)
    ESP:Toggle(value)
end)

Tab5:CreateToggle("Tracers ESP",function(value)
    ESP.Tracers = value
end)

Tab5:CreateToggle("ESP Name",function(value)
    ESP.Names = value
end)

Tab5:CreateToggle("ESP Box",function(value)
    ESP.Boxes = value
end)

Tab6:CreateToggle("Teleport to enemy",function(value)
    _G.tpenem = value
    while wait() do
      if _G.tpenem == false then break end
      PlayerFolder(function(v)
        user["Character"]["HumanoidRootPart"]["Position"] = v["Character"]["HumanoidRootPart"]["Position"]
      end)
    end
end)

workspace.ChildAdded:Connect(function(v)
    for x,i in pairs(v:GetChildren()) do
      if i.Name == "Main" and _G.dmg == true then
        i:Destroy()
        v:Destroy()
      end
    end
end)
