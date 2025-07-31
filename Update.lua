-- GUI: What do you want? + выбор ID или оружия
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- UI создание
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "WeaponSelector"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 250, 0, 160)
frame.Position = UDim2.new(0.5, -125, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "What do you want?"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

local idButton = Instance.new("TextButton", frame)
idButton.Position = UDim2.new(0.1, 0, 0.3, 0)
idButton.Size = UDim2.new(0.8, 0, 0.2, 0)
idButton.Text = "ID"
idButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
idButton.TextColor3 = Color3.new(1, 1, 1)
idButton.Font = Enum.Font.SourceSans
idButton.TextSize = 16

local weaponButton = Instance.new("TextButton", frame)
weaponButton.Position = UDim2.new(0.1, 0, 0.55, 0)
weaponButton.Size = UDim2.new(0.8, 0, 0.2, 0)
weaponButton.Text = "Weapon"
weaponButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
weaponButton.TextColor3 = Color3.new(1, 1, 1)
weaponButton.Font = Enum.Font.SourceSans
weaponButton.TextSize = 16

local devLabel = Instance.new("TextLabel", frame)
devLabel.Position = UDim2.new(0, 0, 0.85, 0)
devLabel.Size = UDim2.new(1, 0, 0.15, 0)
devLabel.Text = "*Still in development*"
devLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
devLabel.Font = Enum.Font.SourceSansItalic
devLabel.TextSize = 14
devLabel.BackgroundTransparency = 1

-- Функции
local function insertModel(id)
	local InsertService = game:GetService("InsertService")
	local model = InsertService:LoadAsset(id)
	local object = model:GetChildren()[1]
	object.Parent = workspace
	object:MoveTo(player.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
end

idButton.MouseButton1Click:Connect(function()
	local input = tonumber(game:GetService("Chat"):Chat(player.Character.Head, "Enter ID in console/log"))
	print("Type this line in console: insertModel(YourID)")
end)

weaponButton.MouseButton1Click:Connect(function()
	local options = {
		["Azure Sword"] = 10288498712,
		["Devil sword"] = 13078237623
	}
	
	local chosen = "Azure Sword" -- или Devil sword, можешь сделать выбор через доп. GUI
	insertModel(options[chosen])
end)
