local Plugin = {
	["PluginName"] = "Cyclically's Custom Btools",
	["PluginDescription"] = "Just better btools",
	["Commands"] = {
		["cycbtools"] = {
			["ListName"] = "cycbtools / btools2",
			["Description"] = "Cyclically's Custom Btools",
			["Aliases"] = { "btools2" },
			["Function"] = function(args, speaker)
				local LocalPlayer = game:GetService("Players").LocalPlayer
				local mouse = LocalPlayer:GetMouse()
				local movetool = Instance.new("Tool", LocalPlayer.Backpack)
				local deletetool = Instance.new("Tool", LocalPlayer.Backpack)
				local undotool = Instance.new("Tool", LocalPlayer.Backpack)
				local identifytool = Instance.new("Tool", LocalPlayer.Backpack)
				local movedetect = false
				local movingpart = nil
				local movetransparency = 0
				if editedparts == nil then
					editedparts = {}
					parentfix = {}
					positionfix = {}
				end
				deletetool.Name = "Delete"
				undotool.Name = "Undo"
				identifytool.Name = "Identify"
				movetool.Name = "Move"
				undotool.CanBeDropped = false
				deletetool.CanBeDropped = false
				identifytool.CanBeDropped = false
				movetool.CanBeDropped = false
				undotool.RequiresHandle = false
				deletetool.RequiresHandle = false
				identifytool.RequiresHandle = false
				movetool.RequiresHandle = false
				deletetool.Activated:Connect(function()
					notify("Delete Tool", mouse.Target.Name)
					table.insert(editedparts, mouse.Target)
					table.insert(parentfix, mouse.Target.Parent)
					table.insert(positionfix, mouse.Target.CFrame)
					mouse.Target.Parent = nil
				end)
				undotool.Activated:Connect(function()
					notify("Undo Tool", editedparts[#editedparts].Name)
					editedparts[#editedparts].Parent = parentfix[#parentfix]
					editedparts[#editedparts].CFrame = positionfix[#positionfix]
					table.remove(positionfix, #positionfix)
					table.remove(editedparts, #editedparts)
					table.remove(parentfix, #parentfix)
				end)
				identifytool.Activated:Connect(function()
					notify("Identify Tool", "Instance: " .. mouse.Target.ClassName .. "\nName: " .. mouse.Target.Name)
				end)
				movetool.Activated:Connect(function()
					notify("Move Tool", mouse.Target.Name)
					movingpart = mouse.Target
					movedetect = true
					movingpart.CanCollide = false
					movetransparency = movingpart.Transparency
					movingpart.Transparency = 0.5
					mouse.TargetFilter = movingpart
					table.insert(editedparts, movingpart)
					table.insert(parentfix, movingpart.Parent)
					table.insert(positionfix, movingpart.CFrame)
					movingpart.Transparency = movingpart.Transparency / 2
					repeat
						mouse.Move:Wait()
						movingpart.CFrame = CFrame.new(mouse.Hit.p)
					until movedetect == false
				end)
				movetool.Deactivated:Connect(function()
					notify("Move Tool", mouse.Target.Name)
					movingpart.CanCollide = true
					movedetect = false
					mouse.TargetFilter = nil
					movingpart.Transparency = movetransparenc
				end)
			end,
		},
	},
}
return Plugin
