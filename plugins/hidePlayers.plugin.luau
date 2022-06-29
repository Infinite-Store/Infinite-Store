local hidden = {}
local new = false

local PluginAPI = loadstring(game:HttpGet("https://pastebin.com/raw/u7HEbm8q"))()
local Plugin = PluginAPI:CreatePlugin("Hiding", "Hide players! By Trollfoxx.")
Plugin.Functions:AddCommand("hideplrs", "hideplrs [name]", "Hides players.", {}, function(args, speaker)
	for k, v in pairs(getPlayer(args[1], speaker)) do
		if game.Players[v] ~= game.Players.LocalPlayer and table.find(hidden, v) == nil then
			table.insert(hidden, v)
		end
	end
end)

Plugin.Functions:AddCommand(
	"showplrs",
	"showplrs [name]",
	"Shows players.",
	{ "reveal", "unhide" },
	function(args, speaker)
		for k, v in pairs(getPlayer(args[1], speaker)) do
			print(game.Players[v], table.find(hidden, v) ~= nil)
			if table.find(hidden, v) ~= nil then
				table.remove(hidden, table.find(hidden, v))
				if game.Players[v].Character ~= nil and game.Players.LocalPlayer.Character ~= nil then
					game.Players[v].Character.Parent = game.Players.LocalPlayer.Character.Parent
				end
			end
		end
	end
)

game:GetService("RunService").RenderStepped:Connect(function()
	for _, v in pairs(game.Players:GetPlayers()) do
		if table.find(hidden, v.Name) ~= nil then
			if v.Character and workspace:IsAncestorOf(v.Character) then
				v.Character.Parent = game:GetService("TestService")
			end
		end
	end
end)

return Plugin.PluginTable
