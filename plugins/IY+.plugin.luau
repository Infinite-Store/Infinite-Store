--version
IYver = "1.4"
--[[
TODO:
Migrate to new host
Add funcs to _G?
replace heartbeat connection with funcs that autodisconnect





]]

--pre-plugin code

--fix for loading the plugin too fast (which shouldn't even be possible but ¯\_(ツ)_/¯)
repeat
	wait()
until speaker

--delete cmds that have conflicting names
for i, v in pairs({ "tpposition", "offset", "kill", "bring", "attach" }) do
	execCmd("deletecmd " .. v)
end
--table.foreach({"tpposition","offset","kill","bring","attach"},function(_,v) execCmd("deletecmd "..v) end)

--easier than doing pcall on everything and notifies errors
local unnamed = 0
function catch(func, name)
	if type(func) == "function" then
		if name == nil then
			unnamed = unnamed + 1
			name = "unnamed func #" .. tostring(unnamed)
		end
		if type(name) ~= "string" then
			name = tostring(name)
		end
		local _, err = pcall(func)
		if err then
			warn("function " .. name .. " caused an exception: " .. err)
			notify("function " .. name .. " caused an exception: " .. err)
		end
	end
end

--[[essential functions]]

--loadstring replacement
function ls(str)
	if type(str) == "string" then
		local a, e = loadstring(str:sub(0, 4):lower() == "http" and game:HttpGet(str, false) or str)
		if e then
			warn(
				"Original error:\n"
					.. tostring(e)
					.. "\nString attempting to be loaded: "
					.. (#str > 100 and str:sub(0, 100) .. "..." or str)
			)
			notify("loadstring failed, check the console for more info")
		else
			return a()
		end
	end
end
--announcements
function announcements()
	ls("http://plugins.x10.bz/plugins/annoucements.txt")
end
catch(announcements, "announcements")

--titlebar 😎
catch(function()
	Title.Text = Title.Text .. " (IY+" .. IYver .. ")"
end)

--readsave and writesave used for storing saved things neatly
function readsave(key)
	local s = game:GetService("HttpService"):JSONDecode(readfile("IY_FE.iy"))
	if key ~= nil then
		return s[key]
	else
		return s
	end
end
function writesave(key, value)
	if key ~= nil and value ~= nil then
		local save = game:GetService("HttpService"):JSONDecode(readfile("IY_FE.iy"))
		save[key] = value
		writefile("IY_FE.iy", game:GetService("HttpService"):JSONEncode(save))
	else
		notify("Invalid key/value specified to writesave")
	end
end

--track when players respawn (for tool related things)
plrspawntime = {}
function spawned(plr)
	plrspawntime[plr.Name] = os.time()
	plr.CharacterAdded:connect(function()
		plrspawntime[plr.Name] = os.time()
	end)
end
for i, v in pairs(Players:GetPlayers()) do
	spawned(v)
end
Players.PlayerAdded:connect(function(plr)
	spawned(plr)
end)

--helps massively to prevent errors with parts being missing by returning any body part
function gethrp(plr)
	plr = plr or speaker
	return plr.Character:FindFirstChild("HumanoidRootPart")
		or plr.Character:FindFirstChild("Torso")
		or plr.Character:FindFirstChild("UpperTorso")
		or plr.Character:FindFirstChildWhichIsA("BasePart")
end

--why doesn't roblox have this by default?? (Instance:WaitForChildOfClass())
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
	if checkcaller() and getnamecallmethod() == "WaitForChildOfClass" then
		local args = { ... }
		local path, class, timeout = args[1], tostring(args[2]) or "", tonumber(args[3]) or false
		local Return = path:FindFirstChildWhichIsA(class)
		if Return then
			return Return
		end
		local got, event, connection = false, Instance.new("BindableEvent")
		connection = path.ChildAdded:Connect(function(obj)
			if obj:IsA(class) then
				got = true
				Return = obj
				event:Fire()
				connection:Disconnect()
			end
		end)
		spawn(function()
			if not timeout then
				wait(5)
				if not got then
					warn(
						"Infinite yield possible on '" .. tostring(path) .. ':WaitForChildOfClass("' .. class .. "\")'"
					)
				end
			else
				wait(timeout)
				if not got then
					connection:Disconnect()
					event:Fire()
				end
			end
		end)
		event.Event:Wait()
		event:Destroy()
		args, got, event = nil, nil, nil
		return Return
	end
	return old(...)
end)
setreadonly(mt, true)

--simple check for r6/r15
function isr15(plr)
	local hum = plr and plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid")
	if hum then
		if hum.RigType == Enum.HumanoidRigType.R15 then
			return true
		end
	end
	return false
end

--locals
local stopsitting = false
local followed = false
local distance = -3
local walking = false
local tooldrop = false
local orbit2 = false
local RotStep = 0
local char = speaker.Character or speaker.CharacterAdded:Wait()
local hum = char:WaitForChildOfClass("Humanoid")
speaker.CharacterAdded:Connect(function(chr)
	char = chr
	hum = char:WaitForChildOfClass("Humanoid")
end)

--heartbeat connections
game:GetService("RunService").Heartbeat:Connect(function(step)
	if step < 0.3 then --don't run if client is lagging too bad
		if walking then
			local hrp = gethrp()
			if hrp then
				pcall(function()
					speaker.Character.walk.Position = hrp.CFrame.Position + hrp.CFrame.lookVector * 40
					speaker.Character:FindFirstChildWhichIsA("Humanoid"):MoveTo(speaker.Character.walk.Position)
				end)
			end
		end

		if orbit2 then
			RotStep = RotStep + orbitspeed
			pcall(function()
				gethrp().CFrame = CFrame.new(gethrp(orbitplr).CFrame.Position)
					* CFrame.Angles(0, math.rad(RotStep), 0)
					* CFrame.new(orbitoffset)
			end)
		end

		if staring then
			pcall(function()
				gethrp().CFrame = CFrame.new(gethrp().Position, gethrp(stareplr).Position)
			end)
		end

		if followed then
			if speaker.Character:FindFirstChildWhichIsA("Humanoid").Sit then
				speaker.Character:FindFirstChildWhichIsA("Humanoid").Sit = false
			end
			pcall(function()
				if gethrp() and gethrp(plrtofollow) then
					gethrp().CFrame = gethrp(plrtofollow).CFrame + gethrp(plrtofollow).CFrame.lookVector * distance
				end
			end)
		end

		if tooldrop then
			if
				speaker.Character:FindFirstChildWhichIsA("Tool")
				and not speaker.Character:FindFirstChildWhichIsA("Tool").CanBeDropped
			then
				speaker.Character:FindFirstChildWhichIsA("Tool").CanBeDropped = true
			end
		end
	end
end)

--[[update checker]]
--fix update loop
function fixme()
	local a
	spawn(function()
		for i, v in pairs(readsave("PluginsTable")) do
			if readfile(v):sub(0, 9) == "--version" and v ~= "IY+.iy" then
				a = true
				deletePlugin(badplugin)
			end
		end
		if a then
			wait(1)
			notify("Removed " .. badplugin .. " from your plugins list because of a conflicting filename.")
		end
	end)
end
--put this in a pcall cuz http can be gay sometimes, put it in a catcher just in case something else goes wrong, and put in a spawn because it can potentially loop indefinitely
spawn(function()
	catch(function()
		local retry = 2
		repeat
			local _, error = pcall(function()
				--local update = game:HttpGet("https://pastebin.com/raw/d6fdWksH",false)
				loadstring(game:HttpGet("http://plugins.x10.bz/IYver", false))()
				coroutine.resume(coroutine.create(function()
					if update["IY+"] ~= nil and update["IY+"] ~= IYver then
						notify("Updating...", "Updating to IY+ " .. update["IY+"])
						writefile("IY+.iy", game:HttpGet("http://plugins.x10.bz/plugins/IY+.IY"))
						--writefile("IY+.iy",game:HttpGet("https://pastebin.com/raw/ZG5GgEgk",false))
						fixme()
						deletePlugin("IY+.iy")
						wait(0.2)
						addPlugin("IY+.iy")
						updatelog()
					end
					coroutine.yield()
				end))
			end)
			if error and retry == 2 or retry >= 16 then
				notify(
					"Update check failed! Original error: "
						.. tostring(error)
						.. " Retrying in "
						.. tostring(retry)
						.. "seconds."
				)
			end
			wait(retry)
			retry = retry * 2
		until not error
	end, "update checker")
end)

--dependencies
local site = "http://plugins.x10.bz/deps/"
local dependencies = {
	["playerinfo.dep"] = "player info gui dependency", -- functions: age(NUMBER:num), createINFO(INSTANCETYPEPLAYER:player)
	["updatelog.dep"] = "update log gui dependency", -- functions: updatelog(void)
	["attach.dep"] = "tool attach dependency", -- functions: attach(INSTANCETYPEPLAYER:target,BOOL:norespawn)
	["insults.txt"] = "insult table", -- functions: insult(STRING:plr)
	["compliments.txt"] = "compliment table", -- functions: compliment(STRING:plr)
}
local depver = "1.0"
spawn(function()
	if isfolder and not isfolder("deps") then
		makefolder("deps")
	end
	function getdep(name)
		if update["depver"] ~= depver then
			if isfolder then
				writefile("/deps/" .. name, game:HttpGet(site .. name, true))
			end
			return game:HttpGet(site .. name, true) or false
		elseif update["depver"] == depver and isfolder then
			if not pcall(function()
				readfile("/deps/" .. name)
			end) then
				writefile("/deps/" .. name, game:HttpGet(site .. name, true))
			end
			return readfile("/deps/" .. name)
		else
			return game:HttpGet(site .. name, true)
		end
	end
	catch(function()
		repeat
			wait()
		until update
		pcall(function()
			if not readsave("depver") then
				writesave("depver", depver)
			else
				depver = readsave("depver") or depver
			end
		end)
		for k, v in pairs(dependencies) do
			catch(loadstring(getdep(k)), v)
		end
	end, "dependency check")
end)
--added a wait cuz iy is bad at removing cmds before it loads plugins 🙄
wait(0.3)
--begin the actual plugin now retard
local BetterIY = {
	["PluginName"] = "Infinite Yield+",
	["PluginDescription"] = "Adds some cool extra cmds to the base IY",
	["Commands"] = {
		["compliment"] = {
			["ListName"] = "compliment [plr]",
			["Description"] = "Compliments a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					for i, v in pairs(getPlayer(args[1], speaker)) do
						if Players[v] == speaker then
							notify("No need to compliment yourself sir/ma'am")
						else
							game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
								:FireServer(compliment(Players[v].Name), "All")
						end
					end
				end)
			end,
		},
		["insult"] = {
			["ListName"] = "insult [plr]",
			["Description"] = "Insults a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					local players = getPlayer(args[1], speaker)
					for i, v in pairs(players) do
						if Players[v] == speaker then
							notify("No need to insult yourself sir/ma'am")
						else
							game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
								:FireServer(insult(Players[v].Name), "All")
						end
					end
				end)
			end,
		},
		["follow"] = {
			["ListName"] = "follow [plr] [distance]",
			["Description"] = "Follows a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					plrtofollow = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					plrtofollow.Character:FindFirstChildWhichIsA("Humanoid").Died:Connect(function()
						if followed then
							followed = false
							plrtofollow.CharacterAdded:wait()
							followed = true
						end
					end)
					if not args[1] then
						notify("Error", "No player specified")
					else
						distance = tonumber(args[2]) or -3
						plrtofollow = Players[getPlayer(args[1], speaker)[1]] or nil
						followed = true
						Players.PlayerRemoving:Connect(function(plr)
							if plr == plrtofollow then
								followed = false
							end
						end)
						Players.PlayerAdded:Connect(function(plr)
							if plr == plrtofollow then
								followed = true
							end
						end)
					end
				end)
			end,
		},
		["unfollow"] = {
			["ListName"] = "unfollow",
			["Description"] = "unfollows a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					followed = false
					plrtofollow = nil
				end)
			end,
		},
		--rewrite this to be cleaner sometime
		["tpposition"] = {
			["ListName"] = "tpposition/tppos [X Y Z]",
			["Description"] = "Teleports you or another player to certain coordinates",
			["Aliases"] = { "tppos" },
			["Function"] = function(args, speaker)
				catch(function()
					local tpX, tpY, tpZ
					local target
					--local _, count = string.gsub(tostring(args[1]), ",", "")
					local _, count = string.gsub(tostring(GetString(1)), ",", "")
					if #args == 2 and count == 3 then
						local pos = args[2]:split(",")
						tpX, tpY, tpZ = tonumber(pos[1]), tonumber(pos[2]), tonumber(pos[3])
						target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					elseif #args == 1 and count == 3 then
						local pos = args[1]:split(",")
						tpX, tpY, tpZ = tonumber(pos[1]), tonumber(pos[2]), tonumber(pos[3])
					elseif #args == 3 then
						tpX, tpY, tpZ = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
					elseif #args == 4 then
						tpX, tpY, tpZ = tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
						target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					end
					if not target then
						gethrp().CFrame = CFrame.new(tpX, tpY, tpZ)
					else
						local pos = gethrp(target).CFrame
						if attach(target) then
							gethrp().CFrame = CFrame.new(tpX, tpY, tpZ)
						end
					end
				end)
			end,
		},
		--rewrite this to be cleaner sometime
		["offset"] = {
			["ListName"] = "offset [X Y Z] [plr optional]",
			["Description"] = "Offsets you or another player by certain coordinates",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					local tpX, tpY, tpZ
					local target
					--local _, count = string.gsub(tostring(args[1]), ",", "")
					local _, count = string.gsub(tostring(GetString(1)), ",", "")
					if #args == 2 and count == 3 then
						local pos = args[2]:split(",")
						tpX, tpY, tpZ = tonumber(pos[1]), tonumber(pos[2]), tonumber(pos[3])
						target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					elseif #args == 1 and count == 3 then
						local pos = args[1]:split(",")
						tpX, tpY, tpZ = tonumber(pos[1]), tonumber(pos[2]), tonumber(pos[3])
					elseif #args == 3 then
						tpX, tpY, tpZ = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
					elseif #args == 4 then
						tpX, tpY, tpZ = tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
						target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					end
					if not target then
						gethrp().CFrame = gethrp().CFrame + Vector3.new(tpX, tpY, tpZ)
					else
						local pos = gethrp(target).CFrame
						if attach(target) then
							gethrp().CFrame = pos + Vector3.new(tpX, tpY, tpZ)
						end
					end
				end)
			end,
		},
		["spamkill"] = {
			["ListName"] = "spamkill/skill",
			["Description"] = "repeatedly kills a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					spamkilling = true
					if getPlayer(args[1], speaker)[1] then
						local target = Players[getPlayer(args[1], speaker)[1]]
						repeat
							execCmd("kill " .. target.Name)
							target.CharacterAdded:wait()
							repeat
								wait()
							until gethrp(target)
						until not spamkilling
					else
						notify("No player found")
					end
				end)
			end,
		},
		["unspamkill"] = {
			["ListName"] = "unspamkill/unskill",
			["Description"] = "stops the loop",
			["Aliases"] = { "unskill" },
			["Function"] = function(args, speaker)
				catch(function()
					spamkilling = false
				end)
			end,
		},
		["tp"] = {
			["ListName"] = "tp [plr] [plr] (TOOL)",
			["Description"] = "teleports plr1 to plr2",
			["Aliases"] = { "teleport" },
			["Function"] = function(args, speaker)
				catch(function()
					if not args[2] then
						notify("need a second player to tp to!")
					else
						target1 = getPlayer(args[1], speaker)[1]
						target1 = game:GetService("Players")[target1]
						target2 = getPlayer(args[2], speaker)[1]
						target2 = game:GetService("Players")[target2]
						oldpos = gethrp().CFrame
						if target1 == speaker then
							notify("Use goto instead!")
							execCmd("goto " .. target2.Name)
						elseif target2 == speaker then
							notify("Use bring instead!")
							execCmd("bring " .. target1.Name)
						else
							if attach(target1) then
								gethrp().CFrame = gethrp(target2).CFrame
								wait(2)
								speaker.CharacterAdded:wait()
								repeat
									wait()
								until speaker.Character and getpart(speaker)
								speaker.Character:WaitForChild("HumanoidRootPart").CFrame = oldpos
							else
								notify("Failed to attach to plr!")
							end
						end
					end
				end)
			end,
		},
		["bring"] = {
			["ListName"] = "bring [plr] (TOOL)",
			["Description"] = "brings a player (TOOL)",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					local target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					local oldpos = gethrp().CFrame
					if attach(target) then
						gethrp().CFrame = oldpos
						speaker.CharacterAdded:wait()
						repeat
							wait()
						until getpart(speaker)
						getpart(speaker).CFrame = oldpos
					else
						notify("Failed to attach to the player!")
					end
				end)
			end,
		},
		["kill"] = {
			["ListName"] = "kill [plr] [optional tool]",
			["Description"] = "kills a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					if
						speaker.Backpack:FindFirstChildWhichIsA("Tool")
						or speaker.Character:FindFirstChildWhichIsA("Tool")
					then
						oldpos = gethrp().CFrame
						if attach(target) then
							gethrp().CFrame = CFrame.new(9223372036854775807, 9223372036854775807, 9223372036854775807)
							speaker.CharacterAdded:wait()
							repeat
								wait()
							until getpart(speaker)
							getpart(speaker).CFrame = oldpos
						else
							notify("Failed to attach to plr!")
						end
					else
						execCmd("kill2 " .. target.Name)
					end
				end)
			end,
		},
		["attach"] = {
			["ListName"] = "attach [plr] (TOOL)",
			["Description"] = "attaches your plr to the other plr",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					if not attach(target, true) then
						notify("Failed to attach to plr!")
					end
				end)
			end,
		},
		["orbit"] = {
			["ListName"] = "orbit [plr]",
			["Description"] = "orbits a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					function RocketPropulsion(maxthrust, maxspeed, thrustp, targetplr, name)
						local l = Instance.new("RocketPropulsion")
						l.Parent = gethrp()
						l.CartoonFactor = 1
						l.MaxThrust = maxthrust
						l.MaxSpeed = maxspeed
						l.ThrustP = thrustp
						l.Name = name
						l.Target = gethrp(targetplr)
						l:Fire()
					end

					local target = game:GetService("Players")[getPlayer(args[1], speaker)[1]]
					orbital = true
					speaker.Character:FindFirstChildWhichIsA("Humanoid").Sit = true
					RocketPropulsion(5000, 100, 5000, target, "OrbitMove")
					local vdied
					vdied = target.Character:FindFirstChildWhichIsA("Humanoid").Died:Connect(function()
						if orbital then
							execCmd("unorbit")
							target.CharacterAdded:wait()
							repeat
								wait()
							until gethrp(target)
							execCmd("orbit " .. target.Name)
						else
							vdied:Disconnect()
						end
					end)
					speaker.Character:FindFirstChildWhichIsA("Humanoid"):GetPropertyChangedSignal("Sit"):Wait()
					execCmd("unorbit")
				end)
			end,
		},
		["orbit2"] = {
			["ListName"] = "orbit2 [plr] [speed] [offset x,y,z]",
			["Description"] = "orbits a player",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if not args[1] then
					notify("Invalid player specified")
				else
					local asd = getPlayer(args[1], speaker)
					local x, y, z = 0, 0, 0
					if args[3] then
						x = args[3]
					else
						x = 6
					end
					if args[4] and args[5] then
						y, z = args[4], args[5]
					end
					for i, v in pairs(asd) do
						execCmd("stare " .. Players[v].Name)
						--view(Players[v])
						execCmd("view " .. Players[v].Name)
						orbit2 = true
						orbitplr = Players[v]
						if args[2] then
							orbitspeed = args[2]
						else
							orbitspeed = 0.5
						end
						orbitoffset = Vector3.new(x, y, z)
						RotStep = 0
						speaker.Character:FindFirstChildOfClass("Humanoid").Sit = true
						spawn(function()
							repeat
								wait()
							until not speaker.Character:FindFirstChildOfClass("Humanoid").Sit
							execCmd("unorbit")
							execCmd("view " .. Players[v].Name)
						end)
					end
				end
			end,
		},
		["unorbit"] = {
			["ListName"] = "unorbit",
			["Description"] = "unorbits a player",
			["Aliases"] = { "noorbit" },
			["Function"] = function(args, speaker)
				catch(function()
					if orbit2 then
						local pos = gethrp()
						execCmd("unstare")
						orbit2 = false
						for i = 1, 30 do
							game.RunService.Heartbeat:Wait()
							gethrp().Velocity = Vector3.new(0, 0, 0)
						end
					end
					for i, v in pairs(speaker.Character:GetDescendants()) do
						if v.Name == "OrbitMove" then
							v:Destroy()
						end
					end
					orbital = false
				end)
			end,
		},
		["equiptools"] = {
			["ListName"] = "equiptools/etools",
			["Description"] = "equips all the tools in your backpack",
			["Aliases"] = { "etools" },
			["Function"] = function(args, speaker)
				catch(function()
					for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						if tool:IsA("Tool") then
							tool.Parent = game:GetService("Players").LocalPlayer.Character
						end
					end
				end)
			end,
		},
		["pinfo"] = {
			["ListName"] = "playerinfo/pinfo [plr]",
			["Description"] = "shows information about a player",
			["Aliases"] = { "playerinfo" },
			["Function"] = function(args, speaker)
				catch(function()
					catch(function()
						if createINFO then
							if args[1] then
								for i, v in pairs(getPlayer(args[1], speaker)) do
									createINFO(Players[v])
								end
							else
								createINFO(speaker)
							end
						else
							notify(
								"Error",
								"Player info dependency appears to have failed loading, attempting to reload."
							)
							catch(loadstring(getdep("playerinfo.dep")()), "player info gui")
							args[1] = args[1] or ""
							execCmd("pinfo " .. args[1])
						end
					end, "Player info cmd")
				end)
			end,
		},
		["toolsdrop"] = {
			["ListName"] = "toolsdrop",
			["Description"] = "Makes your tools droppable",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					if tooldrop then
						tooldrop = false
					else
						tooldrop = true
					end
				end)
			end,
		},
		["trip"] = {
			["ListName"] = "trip [num] [power]",
			["Description"] = "whoops I slipped!",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					local Humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
					local body = Instance.new("BodyAngularVelocity", gethrp())
					body.AngularVelocity = Vector3.new(-10, -10, -10)
					Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
					wait(0.1)
					body:Destroy()
					if args[1] then
						wait(tonumber(args[1]))
					else
						wait(2)
					end
					Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
				end)
			end,
		},
		["walk"] = {
			["ListName"] = "walk",
			["Description"] = "Makes you walk forward",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					local char = speaker.Character
					if char:FindFirstChild("walk") then
						char.walk:Destroy()
					end
					hum = char:FindFirstChildOfClass("Humanoid")
					local part = Instance.new("Part")
					part.Name = "walk"
					part.Parent = char
					part.Position = gethrp().CFrame.Position + gethrp().CFrame.lookVector * 4
					part.CanCollide = false
					part.Transparency = 1
					walking = true
				end)
			end,
		},
		["unwalk"] = {
			["ListName"] = "unwalk/nowalk",
			["Description"] = "Stops you from walking forward",
			["Aliases"] = { "nowalk" },
			["Function"] = function(args, speaker)
				catch(function()
					walking = false
					if char:FindFirstChild("walk") then
						char.walk:Destroy()
					end
				end)
			end,
		},
		["stopsit"] = {
			["ListName"] = "stopsit/nosit (toggle)",
			["Description"] = "keeps you from sitting",
			["Aliases"] = { "nosit" },
			["Function"] = function(args, speaker)
				catch(function()
					if stopsitting then
						stopsitting = false
					else
						stopsitting = true
					end
				end)
			end,
		},
		["inviscam"] = {
			["ListName"] = "inviscam/invisiblecam",
			["Description"] = "Makes your camera go through objects always keeping the humanoid visible (use fixcam to disable)",
			["Aliases"] = { "invisiblecam" },
			["Function"] = function(args, speaker)
				catch(function()
					speaker.DevCameraOcclusionMode = "Invisicam"
				end)
			end,
		},
		["stare"] = {
			["ListName"] = "stare [plr]",
			["Description"] = "O.O",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					local asd = getPlayer(args[1], speaker)
					for i, v in pairs(asd) do
						local asdf = Players[v]
						stareplr = asdf
						staring = true
					end
				end)
			end,
		},
		["unstare"] = {
			["ListName"] = "unstare/nostare",
			["Description"] = "un-O.O",
			["Aliases"] = { "nostare" },
			["Function"] = function(args, speaker)
				catch(function()
					staring = false
				end)
			end,
		},
		["boostfps"] = {
			["ListName"] = "boostfps/fpsboost",
			["Description"] = "Adds frames to your frames so you can have more frames",
			["Aliases"] = { "fpsboost" },
			["Function"] = function(args, speaker)
				catch(function()
					if args[1] then
						decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
					else
						decalsyeeted = false
					end
					local g = game
					local w = g.Workspace
					local l = g.Lighting
					local t = w.Terrain
					t.WaterWaveSize = 0
					t.WaterWaveSpeed = 0
					t.WaterReflectance = 0
					t.WaterTransparency = 0
					l.GlobalShadows = false
					l.FogEnd = 9e9
					l.Brightness = 0
					settings().Rendering.QualityLevel = "Level01"
					for i, v in pairs(g:GetDescendants()) do
						if v:IsA("BasePart") then
							v.Material = "Plastic"
							v.Reflectance = 0
						elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
							v.Transparency = 1
						elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
							v.Lifetime = NumberRange.new(0)
						elseif v:IsA("Explosion") then
							v.BlastPressure = 1
							v.BlastRadius = 1
						elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
							v.Enabled = false
						elseif v:IsA("MeshPart") then
							v.Material = "Plastic"
							v.Reflectance = 0
							v.TextureID = 10385902758728957
						end
					end
					for i, e in pairs(l:GetChildren()) do
						if
							e:IsA("BlurEffect")
							or e:IsA("SunRaysEffect")
							or e:IsA("ColorCorrectionEffect")
							or e:IsA("BloomEffect")
							or e:IsA("DepthOfFieldEffect")
						then
							e.Enabled = false
						end
					end
				end)
			end,
		},
		["die"] = {
			["ListName"] = "die/oof",
			["Description"] = "kills u",
			["Aliases"] = { "oof" },
			["Function"] = function(args, speaker)
				catch(function()
					speaker.Character:BreakJoints()
					speaker.Character:FindFirstChildWhichIsA("Humanoid").Health = 0
				end)
			end,
		},
		["kill2"] = {
			["ListName"] = "kill2 [plr]",
			["Description"] = "kill using fling",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					local timeout = false
					spawn(function()
						wait(5)
						timeout = true
					end)
					oldpos = gethrp().CFrame
					local p = getPlayer(args[1], speaker)
					p = p and game:GetService("Players")[p[1]]
					if not p then
						return
					end
					execCmd("spin 3000")
					execCmd("noclip nonotify")
					repeat
						game:GetService("RunService").Heartbeat:wait()
						print(gethrp():GetFullName())
						gethrp().CFrame = gethrp(p).CFrame
							* CFrame.new(math.random(-2, 2), math.random(-2, 2), math.random(-2, 2))
						ve = p.Character:FindFirstChild("HumanoidRootPart").Velocity
					until ve.y > 100
						or ve.x > 100
						or ve.z > 100
						or p.Character:FindFirstChildOfClass("Humanoid").Health == 0
						or speaker.Character:FindFirstChildWhichIsA("Humanoid").Health == 0
						or timeout
					execCmd("unspin")
					execCmd("clip nonotify")
					repeat
						gethrp().CFrame = oldpos
						gethrp().Velocity = Vector3.new(0, 0, 0)
						wait()
						local velo = gethrp().Velocity
					until (velo.y < 1 and velo.x < 1 and velo.z < 1)
						and wait()
						and (velo.y < 1 and velo.x < 1 and velo.z < 1)
					wait()
					gethrp().CFrame = oldpos
					gethrp().Velocity = Vector3.new(0, 0, 0)
				end)
			end,
		},
		["tricktools"] = {
			["ListName"] = "tricktools/tricks",
			["Description"] = "gives you trick tools",
			["Aliases"] = { "tricks" },
			["Function"] = function(args, speaker)
				catch(function()
					spawn(function()
						pl = game:GetService("Players").LocalPlayer
						me = pl.Character
						xl = me.Torso["Right Shoulder"]
						t = Instance.new("HopperBin", pl.Backpack)
						t.Name = "360"
						local debounce = false
						function _restoreproperties()
							Holder = player.Character
							Torso = Holder:FindFirstChild("Torso")
							RightS = Torso:FindFirstChild("Right Shoulder")
							LeftS = Torso:FindFirstChild("Left Shoulder")
							RightH = Torso:FindFirstChild("Right Hip")
							LeftH = Torso:FindFirstChild("Left Hip")
							RightS.MaxVelocity = 0.15
							LeftS.MaxVelocity = 0.15
							RightH.MaxVelocity = 0.1
							LeftH.MaxVelocity = 0.1
							RightS.DesiredAngle = 0
							LeftS.DesiredAngle = 0
							LeftH.DesiredAngle = 0
							RightH.DesiredAngle = 0
						end
						function ManageAnimation(value)
							Holder = player.Character
							Player = player
							if value == "no anim" then
								Anim = Holder:FindFirstChild("Animate")
								if Anim ~= nil then
									Anim.Disabled = true
									Anim.Parent = Player
								end
							elseif value == "re-anim" then
								Anim = Player:FindFirstChild("Animate")
								if Anim ~= nil then
									Anim.Disabled = false
									Anim.Parent = Holder
								end
							end
						end
						function Down(ml)
							for i = 1, ml.velocity.y / 3 do
								ml.velocity = ml.velocity + Vector3.new(0, -4.25, 0)
								wait()
							end
							ml:Remove()
						end
						function Flip()
							if debounce == true then
								return
							end
							debounce = true
							Char = player.Character
							Human = Char.Humanoid
							Torso = Char.Torso
							CF = Torso.CFrame
							Human.PlatformStand = true
							VelUp = Instance.new("BodyVelocity")
							VelUp.velocity = Vector3.new(0, 50, 0) + Torso.CFrame.lookVector * 26 --Middle (0,0,0). Change for height.
							VelUp.P = VelUp.P * 2
							VelUp.maxForce = Vector3.new(10000, 10000, 10000) * 999
							VelUp.Parent = Torso
							coroutine.resume(coroutine.create(Down), VelUp)
							Gyro = Instance.new("BodyGyro")
							Gyro.P = Gyro.P * 10
							Gyro.maxTorque = Vector3.new(100000, 100000, 100000) * 999
							Gyro.cframe = CF
							Gyro.Parent = Torso
							for i = 1, 5 do --The amount of time your guy flips.
								Gyro.cframe = Gyro.cframe * CFrame.fromEulerAnglesXYZ(math.pi / -5, 0, 0) --The amount of flips. 1 = -16, 2 = -8
								wait()
							end
							wait(0)
							for i = 1, 9 do --The amount of time your guy flips.
								Gyro.cframe = Gyro.cframe * CFrame.fromEulerAnglesXYZ(0, math.pi / 4.5, 0) --The amount of flips. 1 = -16, 2 = -8
								wait()
							end
							for i = 1, 5 do --The amount of time your guy flips.
								Gyro.cframe = Gyro.cframe * CFrame.fromEulerAnglesXYZ(math.pi / -5, 0, 0) --The amount of flips. 1 = -16, 2 = -8
								wait()
							end
							Gyro.cframe = CF
							wait()
							Gyro:Remove()
							Human.PlatformStand = false
							_restoreproperties()
							debounce = false
						end
						function onActive(mouse)
							player = game.Players.LocalPlayer
							if player == nil then
								return
							end
							mouse.Button1Down:connect(function()
								Flip()
							end)
						end
						script.Parent = t.Selected:connect(onActive)
					end)
				end)
			end,
		},
		["update"] = {
			["ListName"] = "updatelog/update",
			["Description"] = "shows information about the latest update",
			["Aliases"] = { "updates", "updatelog", "updatelogs" },
			["Function"] = function(args, speaker)
				catch(function()
					catch(updatelog, "Update log")
				end)
			end,
		},
		["trampoline"] = {
			["ListName"] = "trampoline [plr] [power]",
			["Description"] = "makes the player go flying into the air",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				catch(function()
					if not isr15() then
						local timeout = false
						spawn(function()
							wait(5)
							timeout = true
						end)
						oldpos = gethrp().CFrame
						for i, v in pairs(getPlayer(args[1], speaker)) do
							v = Players[v]
							local oldhh = speaker.Character:FindFirstChildWhichIsA("Humanoid").HipHeight or 0
							execCmd("carpet1 " .. p.Name)
							--[[local asd = getPlayer(args[1], speaker)
					for i,v in pairs(asd) do
						local p = Players[v]
						local oldhh = speaker.Character:FindFirstChildWhichIsA("Humanoid").HipHeight
						execCmd("carpet "..p.Name)
						execCmd("float")
						spawn(function() wait(0.5) if args[2] then execCmd("hipheight "..tostring(args[2])) else execCmd("hipheight 50") end end)
						repeat
							game:GetService("RunService").Heartbeat:wait()
							ve = gethrp().Velocity
						until ve.y > 50 or ve.x > 50 or ve.z > 50 or p.Character:FindFirstChildOfClass("Humanoid").Health == 0 or speaker.Character:FindFirstChildWhichIsA("Humanoid").Health == 0 or timeout
						execCmd("uncarpet")
						execCmd("unfloat")
						execCmd("hipheight "..tostring(oldhh))
						repeat
							gethrp().CFrame = oldpos
							gethrp().Velocity = Vector3.new(0,0,0)
							wait()
						until gethrp().Velocity <= Vector3.new(1,1,1) and wait() and gethrp().Velocity <= Vector3.new(1,1,1)
					end]]
						end
					else
						notify("This command requires R6!")
					end
				end)
			end,
		},
	},
}

return BetterIY
