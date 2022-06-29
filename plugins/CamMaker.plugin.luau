if not isfolder("CAMS") then
	makefolder("CAMS")
end

local Plugin = {
	PluginName = "Cam Maker v1.2",
	PluginDescription = "CamMaker but better!",
	Commands = {
		makecam = {
			ListName = "makecam / mc [Name]",
			Description = "Creates a camera to view.",
			Aliases = { "mc" },
			Function = function(args, speaker)
				local CamDir = "CAMS\\" .. getstring(1)
				local HRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
				makefolder(CamDir)
				writefile(CamDir .. "\\X.txt", HRP.CFrame.X)
				writefile(CamDir .. "\\Y.txt", HRP.CFrame.Y)
				writefile(CamDir .. "\\Z.txt", HRP.CFrame.Z)
				notify("CamMaker", "Camera successfully created!")
			end,
		},
		viewcam = {
			ListName = "viewcam / vc [Name]",
			Description = "Views a camera.",
			Aliases = { "vc" },
			Function = function(args, speaker)
				if not isfolder("CAMS\\" .. getstring(1)) then
					notify("CamMaker", "Camera not found.")
				else
					local TempDir = "CAMS\\" .. getstring(1)
					local TempPart = Instance.new("Part")
					TempPart.CanCollide = false
					TempPart.Transparency = 1
					TempPart.Anchored = true
					TempPart.CFrame = CFrame.new(
						Vector3.new(
							readfile(TempDir .. "\\X.txt"),
							readfile(TempDir .. "\\Y.txt"),
							readfile(TempDir .. "\\Z.txt")
						)
					)
					math.randomseed(os.time())
					TempPart.Name = math.random(0, 99999)
					TempPart.Parent = game:GetService("Workspace")
					writefile("CAMS\\CurrentCamName.txt", TempPart.Name)
					game.Workspace.Camera.CameraSubject = TempPart
				end
			end,
		},
		delcam = {
			ListName = "delcam / dc [Name]",
			Description = "Deletes a camera.",
			Aliases = { "dc" },
			Function = function(args, speaker)
				if not isfolder("CAMS\\" .. getstring(1)) then
					notify("CamMaker", "Camera not found.")
				else
					delfolder("CAMS\\" .. getstring(1))
				end
			end,
		},
		listcams = {
			ListName = "listcams / lc",
			Description = "Lists cameras.",
			Aliases = { "lc" },
			Function = function(args, speaker)
				local Items = ""
				for i, v in pairs(listfiles("CAMS")) do
					Items = Items .. ", " .. string.sub(v, 6)
				end
				notify("CamMaker", string.sub(Items, 3))
			end,
		},
		unviewcam = {
			ListName = "unviewcam / unvc",
			Description = "Return to original camera position.",
			Aliases = { "unvc" },
			Function = function(args, speaker)
				local TWS = game:GetService("Workspace")
				if TWS.Camera.CameraSubject ~= speaker then
					TWS.Camera.CameraSubject = speaker.Character
					local TempPartName = readfile("CAMS\\CurrentCamName.txt")
					TWS[TempPartName]:Destroy()
					delfile("CAMS\\CurrentCamName.txt")
				end
			end,
		},
	},
}
return Plugin
