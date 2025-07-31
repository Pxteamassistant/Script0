-- SS Backdoor Injector GUI Menu Script
-- Made by px734m (Still in development)

local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")

function scanForBackdoor()
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            if obj.Name:lower():find("backdoor") or obj.Name:lower():find("admin") then
                return true
            end
        end
    end
    return false
end

function createMenu(player)
    player:SendNotification({
        Title = "SS Backdoor Injector",
        Text = "What do you want?\nChoose: ID or Weapon\n*Still in development*",
        Duration = 10
    })

    player.Chatted:Connect(function(message)
        message = message:lower()
        if message == "id" then
            player:SendNotification({
                Title = "Asset Injector",
                Text = "What object do you want to add to the game? Provide asset ID:",
                Duration = 10
            })
            wait(1)
            listenForAssetID(player)
        elseif message == "weapon" then
            player:SendNotification({
                Title = "Weapons Menu",
                Text = "Choose: Azure Sword or Devil Sword",
                Duration = 10
            })
            player.Chatted:Connect(function(weaponMsg)
                if weaponMsg:lower():find("azure") then
                    insertAsset(player, 10288498712)
                elseif weaponMsg:lower():find("devil") then
                    insertAsset(player, 13078237623)
                else
                    player:SendNotification({
                        Title = "Invalid",
                        Text = "Invalid weapon name",
                        Duration = 5
                    })
                end
            end)
        end
    end)
end

function listenForAssetID(player)
    player.Chatted:Connect(function(idMsg)
        local id = tonumber(idMsg)
        if id then
            insertAsset(player, id)
        else
            player:SendNotification({
                Title = "Error",
                Text = "Invalid ID",
                Duration = 5
            })
        end
    end)
end

function insertAsset(player, assetID)
    local success, model = pcall(function()
        return InsertService:LoadAsset(assetID)
    end)
    if success and model then
        local asset = model:GetChildren()[1]
        if asset then
            player:SendNotification({
                Title = "Confirm",
                Text = "Found '" .. asset.Name .. "'. Is this what you wanted? (yes/no)",
                Duration = 10
            })

            player.Chatted:Connect(function(confirm)
                if confirm:lower() == "yes" then
                    asset.Parent = workspace
                    asset:MoveTo(player.Character.Head.Position + Vector3.new(0, 3, 0))
                    player:SendNotification({
                        Title = "Success",
                        Text = "Okay, the object has been added, look in front of you.",
                        Duration = 5
                    })
                elseif confirm:lower() == "no" then
                    player:SendNotification({
                        Title = "Retry",
                        Text = "Write your ID model here:",
                        Duration = 5
                    })
                    listenForAssetID(player)
                end
            end)
        end
    else
        player:SendNotification({
            Title = "Error",
            Text = "Could not load asset. Retry with different ID.",
            Duration = 5
        })
    end
end

if scanForBackdoor() then
    local player = Players.LocalPlayer or Players:GetPlayers()[1]
    if player then
        player:SendNotification({
            Title = "SS Script",
            Text = "Conditions for the SS script to work have been found!",
            Duration = 10
        })
        createMenu(player)
    end
end
