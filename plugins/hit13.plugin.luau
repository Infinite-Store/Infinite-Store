return {
	["PluginName"] = "Anime Hit",
	["PluginDescription"] = "Hit animation",
	["Commands"] = {
		["hit"] = {
			["ListName"] = "hit [1-3]",
			["Description"] = "Hit animation",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				for i, track in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
					track:Stop()
				end
				if args[1] == "1" then
					hitAnim = Instance.new("Animation")
					hitAnim.AnimationId = "rbxassetid://3334832150"
					hit = speaker.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(hitAnim)
					hit:Play(0.1, 1, 2)
					wait(0.5)
					hit:AdjustSpeed(0)
					wait(0.3)
					execCmd("refreshanim")
				elseif args[1] == "2" then
					hitAnim = Instance.new("Animation")
					hitAnim.AnimationId = "rbxassetid://3334832150"
					hit = speaker.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(hitAnim)
					hit:Play(0.1, 1, 10)
					wait(0.1)
					hit:AdjustSpeed(0)
					wait(0.3)
					execCmd("refreshanim")
				elseif args[1] == "3" then
					hit2Anim = Instance.new("Animation")
					hit2Anim.AnimationId = "rbxassetid://3334968680"
					hit2 = speaker.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(hit2Anim)
					hit2:Play(0.1, 1, 12)
					wait(0.1)
					hit2:AdjustSpeed(1)
					wait(0.4)
					hit2:AdjustSpeed(0)
					wait(0.3)
					execCmd("refreshanim")
				end
			end,
		},
	},
}
