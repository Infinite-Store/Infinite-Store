-- Instances --------------------------------------

local Blur = Instance.new("BlurEffect")
Blur.Name = "Blur [Shader Mod]"
Blur.Parent = game.Lighting
Blur.Size = 4
Blur.Enabled = false

local DepthOfField = Instance.new("DepthOfFieldEffect")
DepthOfField.Name = "Depth Of Field [Shader Mod]"
DepthOfField.Parent = game.Lighting
DepthOfField.FarIntensity = 0.75
DepthOfField.FocusDistance = 0.05
DepthOfField.InFocusRadius = 10
DepthOfField.NearIntensity = 0.75
DepthOfField.Enabled = false

-- Variables --------------------------------------

local ShaderEnabled = false

-- Plugin -----------------------------------------

local Plugin = {
	["PluginName"] = "Shader Mod",
	["PluginDescription"] = "Plugin by WeAreRump",

	["Commands"] = {
		["toggleshader"] = {
			["ListName"] = "toggleshader / ts",
			["Description"] = "Toggles shader.",
			["Aliases"] = { "ts" },
			["Function"] = function(args, speaker)
				if not ShaderEnabled then
					Blur.Enabled = true
					DepthOfField.Enabled = true
					ShaderEnabled = true
					notify("Shader Mod", "ShaderEnabled: true")
				else
					Blur.Enabled = false
					DepthOfField.Enabled = false
					ShaderEnabled = false
					notify("Shader Mod", "ShaderEnabled: false")
				end
			end,
		},
	},
}

return Plugin
