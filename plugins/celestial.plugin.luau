local Plugin = {
	["PluginName"] = "Celestial",
	["PluginDescription"] = "Celestial for Mount of the Gods.",
	["Commands"] = {
		["celestial"] = {
			["ListName"] = "celestial",
			["Description"] = "Launches Celestial.",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				--[[ Made By: yesok#3877 ]]
				--
				local library = loadstring(game:HttpGet("https://pastebin.com/raw/zH17BK2a", true))()
				local MOTG = library:CreateWindow({ text = "Celestial" })
				local MOTG_ChatGUI = library:CreateWindow({ text = "Chat Haxx" })

				_G.JoinLogs = false
				repStrg = game:GetService("ReplicatedStorage")
				plrs = game:GetService("Players")
				plr = plrs.LocalPlayer
				resources = repStrg.Resources
				remotes = resources.Remotes
				banList = {}

				local function sendNotification(title, text, icon)
					game:GetService("StarterGui"):SetCore("SendNotification", {
						Title = tostring(title),
						Text = tostring(text),
						Icon = tostring(icon),
					})
				end

				local function detectInput(path, input)
					for _, detect in pairs(path:GetChildren()) do
						if string.lower(string.sub(detect.Name, 1, #input)) == string.lower(input) then
							return detect
						end
					end
				end

				local function checkStat(stat)
					statAmount = 0
					for _, comp in pairs(plr.PlayerGui.HUD[stat]:GetChildren()) do
						if comp:IsA("Frame") and comp.BackgroundColor3 ~= Color3.fromRGB(255, 97, 56) then
							if comp.Size == UDim2.new(0, 15, 0, 15) then
								statAmount = statAmount + 1
							end
						end
					end
					return statAmount
				end

				local function convertString(obj)
					segments = obj:split(".")
					current = game

					for _, v in pairs(segments) do
						current = current[v]
					end
					return current
				end

				local function inputPlayer(input, remote, ...)
					if string.lower(input) == "all" then
						for _, playa in pairs(plrs:GetPlayers()) do
							remote:FireServer(playa, ...)
						end
					elseif string.lower(input) == "others" then
						for _, playa in pairs(plrs:GetPlayers()) do
							if playa ~= plr then
								remote:FireServer(playa, ...)
							end
						end
					elseif string.lower(input) == "me" then
						remote:FireServer(plr, ...)
					else
						input = detectInput(plrs, input)
						remote:FireServer(input, ...)
					end
				end

				local function returnState(bool)
					if bool == true then
						return "Enabled"
					elseif bool == false then
						return "Disabled"
					end
				end

				resources.Bindables.Notify:Fire(":]", "? Celestial Made By: yesok#3877 ?", Color3.new(0.2, 0.78, 0.3))

				MOTG_ChatGUI:AddToggle("Building Chat", function(bool)
					_G.BuildingChat = bool
					wait(0.1)
					sendNotification(
						"Notification Log",
						"Building Chat: " .. returnState(_G.BuildingChat),
						"rbxthumb://type=Asset&id=36997136&w=150&h=150"
					)
					local meta = getrawmetatable(game)
					make_writeable(meta)
					local namecall = meta.__namecall

					meta.__namecall = newcclosure(function(self, ...)
						local remote = tostring(self)
						local args = { ... }

						if remote == "SayMessageRequest" and _G.BuildingChat == true then
							remotes.BuildingChat:FireServer(game.Players.LocalPlayer.Character.Head, args[1])
							return nil
						end
						return namecall(self, ...)
					end)
				end)

				MOTG_ChatGUI:AddLabel(" ━━━━━━━━━━━━━━━")

				MOTG_ChatGUI:AddBox("Target Request", function(object, focus)
					if focus then
						if string.lower(object.Text) == "all" then
							TargetRequest = "all"
						elseif string.lower(object.Text) == "others" then
							TargetRequest = "others"
						else
							TargetRequest = detectInput(plrs, object.Text)
							TargetRequest = TargetRequest.Name
							print(TargetRequest)
						end
					end
				end)

				MOTG_ChatGUI:AddBox("Message Request", function(object, focus)
					if focus then
						TargetMessageRequest = object.Text
					end
				end)

				MOTG_ChatGUI:AddButton("Say Message", function()
					if TargetRequest == "all" then
						for _, playa in pairs(plrs:GetPlayers()) do
							remotes.BuildingChat:FireServer(playa.Character.Head, TargetMessageRequest)
						end
					elseif TargetRequest == "others" then
						for _, playa in pairs(plrs:GetPlayers()) do
							if playa ~= plr then
								remotes.BuildingChat:FireServer(playa.Character.Head, TargetMessageRequest)
							end
						end
					else
						remotes.BuildingChat:FireServer(plrs[TargetRequest].Character.Head, TargetMessageRequest)
					end
				end)

				MOTG_ChatGUI:AddLabel(" ━━━━━━━━━━━━━━━")

				MOTG_ChatGUI:AddBox("Message Request", function(object, focus)
					if focus then
						MessageRequest = object.Text
					end
				end)

				MOTG_ChatGUI:AddButton("Chat Everything", function()
					for _, v in pairs(workspace:GetDescendants()) do
						game.ReplicatedStorage.Resources.Remotes.BuildingChat:FireServer(v, MessageRequest)
					end
				end)

				MOTG:AddToggle("Join Logs", function(bool)
					_G.JoinLogs = bool
					wait(0.1)
					sendNotification(
						"Notification Log",
						"Join Logs: " .. returnState(_G.JoinLogs),
						"rbxthumb://type=Asset&id=36997136&w=150&h=150"
					)
				end)

				MOTG:AddToggle("Pause Time", function(bool)
					remotes.ToggleTimer:FireServer(bool)
					wait(0.1)
					sendNotification(
						"Notification Log",
						"Pause Time: " .. returnState(repStrg.TimerPaused.Value),
						"rbxthumb://type=Asset&id=36997136&w=150&h=150"
					)
				end)

				MOTG:AddToggle("PVP", function(bool)
					remotes.TogglePVP:FireServer(bool)
					wait(0.1)
					sendNotification(
						"Notification Log",
						"PVP: " .. returnState(repStrg.PVP.Value),
						"rbxthumb://type=Asset&id=36997136&w=150&h=150"
					)
				end)

				MOTG:AddLabel(" ━━━━━━━━━━━━━━━")

				MOTG:AddButton("Refill Hunger/Thirst", function()
					local totalAmount = 0
					local thirstAmount = checkStat("Thirst")
					local hungerAmount = checkStat("Hunger")

					if thirstAmount > hungerAmount then
						totalAmount = thirstAmount
					elseif thirstAmount < hungerAmount then
						totalAmount = hungerAmount
					elseif thirstAmount == hungerAmount then
						totalAmount = thirstAmount
					end

					for i = 1, totalAmount do
						remotes.InteractItem:FireServer("Use", resources.Items["Glowberry"])
					end

					if plr.Character.Head:WaitForChild("PointLight") then
						PL = plr.Character.Head.PointLight
						if PL.Color == Color3.fromRGB(255, 0, 243) then
							remotes.DestroyItem:FireServer(PL)
						end
					end

					if plr.Character.Head:FindFirstChild("PointLight", true) then
						remotes.DestroyItem:FireServer(plr.Character.Head.PointLight)
					end
				end)

				MOTG:AddButton("Refill Health", function()
					repeat
						remotes.InteractItem:FireServer("Use", resources.Items["Health Potion"])
						wait()
					until plr.Character.Humanoid.Health == plr.Character.Humanoid.MaxHealth
				end)

				MOTG:AddButton("Kill Animals", function()
					for _, animal in pairs(workspace.Animals:GetChildren()) do
						remotes.DestroyItem:FireServer(animal)
					end
				end)

				MOTG:AddButton("God Animals", function()
					for _, animal in pairs(workspace.Animals:GetChildren()) do
						remotes.DamageAnimal:FireServer(animal, -math.huge)
					end
				end)

				MOTG:AddButton("Chop Trees", function()
					for _, tree in pairs(workspace.Plants:GetChildren()) do
						if type(string.find(tree.Name, "Tree")) or type(string.find(tree.Name, "Palm")) == "number" then
							remotes.ChopTree:FireServer(tree)
						end
					end
				end)

				MOTG:AddButton("Break Rocks", function()
					for _, rock in pairs(workspace.Rocks:GetChildren()) do
						remotes.BreakRock:FireServer(rock)
					end
				end)

				MOTG:AddButton("End Season", function()
					remotes.EndSeason:FireServer()
				end)

				MOTG:AddButton("Raise Island", function()
					remotes.RaiseIsland:FireServer()
				end)

				MOTG:AddLabel(" ━━━━━━━━━━━━━━━")

				MOTG:AddBox("Spawn Player", function(object, focus)
					if focus then
						inputPlayer(object.Text, remotes.Spawn, player, nil)
					end
				end)

				MOTG:AddBox("Kill Player", function(object, focus)
					if focus then
						if repStrg.PVP.Value == false then
							sendNotification(
								"Notification Log",
								"PVP Is Disabled",
								"rbxthumb://type=Asset&id=36997136&w=150&h=150"
							)
							return
						else
							inputPlayer(object.Text, remotes.DamagePlayer, math.huge)
						end
					end
				end)

				MOTG:AddBox("God Player", function(object, focus)
					if focus then
						if repStrg.PVP.Value == false then
							sendNotification(
								"Notification Log",
								"PVP Is Disabled",
								"rbxthumb://type=Asset&id=36997136&w=150&h=150"
							)
							return
						else
							inputPlayer(object.Text, remotes.DamagePlayer, -math.huge)
						end
					end
				end)

				MOTG:AddBox("Kick Player", function(object, focus)
					if focus then
						player = detectInput(plrs, object.Text)
						inputPlayer(object.Text, remotes.DestroyItem, player)
						sendNotification(
							"Notification Log",
							player.Name .. " Was Kicked",
							plrs:GetUserThumbnailAsync(
								player.UserId,
								Enum.ThumbnailType.HeadShot,
								Enum.ThumbnailSize.Size420x420
							)
						)
					end
				end)

				MOTG:AddBox("Ban Player", function(object, focus)
					if focus then
						if _G.JoinLogs == false then
							sendNotification(
								"Notification Log",
								"Join Logs Are Disabled",
								"rbxthumb://type=Asset&id=36997136&w=150&h=150"
							)
						else
							player = detectInput(plrs, object.Text)
							banList[player.Name] = true
							remotes.DestroyItem:FireServer(player)
							sendNotification(
								"Notification Log",
								player.Name .. " Was Banned",
								plrs:GetUserThumbnailAsync(
									player.UserId,
									Enum.ThumbnailType.HeadShot,
									Enum.ThumbnailSize.Size420x420
								)
							)
						end
					end
				end)

				plrs.PlayerAdded:Connect(function(plr)
					if _G.JoinLogs == true then
						sendNotification(
							"Notification Log",
							plr.Name .. " Has Joined",
							plrs:GetUserThumbnailAsync(
								plr.UserId,
								Enum.ThumbnailType.HeadShot,
								Enum.ThumbnailSize.Size420x420
							)
						)
						if banList[plr.Name] == true then
							remotes.DestroyItem:FireServer(plr)
							sendNotification(
								"Notification Log",
								plr.Name .. " Was Kicked",
								plrs:GetUserThumbnailAsync(
									plr.UserId,
									Enum.ThumbnailType.HeadShot,
									Enum.ThumbnailSize.Size420x420
								)
							)
							return
						end
					else
					end
				end)

				MOTG:AddBox("Equip Mask", function(object, focus)
					if focus then
						mask = detectInput(resources.Hats, object.Text)
						remotes.EquipMask:FireServer(tostring(mask))
					end
				end)

				MOTG:AddBox("Destroy Item", function(object, focus)
					if focus then
						item = convertString(object.Text)
						remotes.DestroyItem:FireServer(item)
					end
				end)

				MOTG:AddBox("Use Item", function(object, focus)
					if focus then
						item = detectInput(resources.Items, object.Text)
						remotes.InteractItem:FireServer("Use", item)
					end
				end)

				MOTG:AddBox("Play Music", function(object, focus)
					if focus then
						for _, sound in pairs(game:GetService("SoundService"):GetChildren()) do
							remotes.DestroyItem:FireServer(sound)
						end
						remotes.PlaySound:FireServer("rbxassetid://" .. tonumber(object.Text), game.SoundService)
					end
				end)

				MOTG:AddLabel(" ━━━━━━━━━━━━━━━")

				MOTG:AddBox("Item Request", function(object, focus)
					if focus then
						ItemRequest = detectInput(resources.Items, object.Text)
					end
				end)

				MOTG:AddButton("Spawn Item", function()
					remotes.MakeItem:FireServer(
						tostring(ItemRequest),
						(plr.Character.Head.CFrame * CFrame.new(0, 5.5, 0)).p
					)
				end)

				MOTG:AddButton("Clear Items", function()
					for _, item in pairs(workspace.Items:GetChildren()) do
						remotes.DestroyItem:FireServer(item)
					end
				end)

				MOTG:AddButton("Print Item Names", function()
					for i = 1, #resources.Items:GetChildren() do
						print("[" .. tostring(i) .. "] " .. resources.Items:GetChildren().Name)
					end
				end)
			end,
		},
	},
}

return Plugin
