-- ! Set getgenv().preloadAnimations = true before launching Infinite Yield and this Plugin
-- ! If you wish to preload Animations (it will lag / freeze upon launch) so that using any emote wont lag a bit

local client = game:GetService("Players").LocalPlayer
function StopAnims()
	client.Character.Animate.Disabled = false
	for _, track in
		ipairs(
			(client.Character.Humanoid:FindFirstChildOfClass("Animator") or client.Character.Humanoid):GetPlayingAnimationTracks()
		)
	do
		track:Stop()
	end
end
function PlayAnim(AnimationId)
	client.Character.Animate.Disabled = false
	for _, track in
		ipairs(
			(client.Character.Humanoid:FindFirstChildOfClass("Animator") or client.Character.Humanoid):GetPlayingAnimationTracks()
		)
	do
		track:Stop()
	end
	client.Character.Animate.Disabled = true
	local Anim = Instance.new("Animation")
	Anim.AnimationId = AnimationId
	local loadanim = (client.Character.Humanoid:FindFirstChildOfClass("Animator") or client.Character.Humanoid):LoadAnimation(
		Anim
	)
	loadanim:Play()
	loadanim:AdjustSpeed(1)
	loadanim.Stopped:Once(StopAnims)
end

local https = game:GetService("HttpService")
local commands = {}
if
	not pcall(function()
		local nextPageCursor
		repeat
			local body = https:JSONDecode(
				game:HttpGet(
					nextPageCursor
							and "https://catalog.roblox.com/v1/search/items/details?category=12&includeNotForSale=true&limit=30&subcategory=39&cursor=" .. nextPageCursor
						or "https://catalog.roblox.com/v1/search/items/details?category=12&includeNotForSale=true&limit=30&subcategory=39",
					true
				)
			)
			nextPageCursor = body.nextPageCursor
			for _, internals in ipairs(body.data) do
				local converted = internals.name:gsub("[^%a%d]", ""):lower()
				converted = "e_" .. converted
				local alias = internals.name:gsub("[^%a%d ]", ""):split(" ")
				if #alias > 1 then
					table.remove(alias, #alias)
					alias = "e_" .. table.concat(alias):lower()
				else
					alias = nil
				end
				if preloadAnimations then
					internals.id = game:GetObjects("rbxassetid://" .. internals.id)[1].AnimationId
				end
				if commands[converted] then
					converted = converted .. 2
				end
				commands[converted] = {
					ListName = converted,
					Description = internals.description,
					Aliases = { alias or converted },
					Function = function()
						client.Character.Animate.Disabled = false
						for _, track in ipairs(client.Character.Humanoid:GetPlayingAnimationTracks()) do
							track:Stop()
						end
						client.Character.Animate.Disabled = true
						local Anim = Instance.new("Animation")
						Anim.AnimationId = preloadAnimations and internals.id
							or game:GetObjects("rbxassetid://" .. internals.id)[1].AnimationId
						local loadanim = client.Character.Humanoid:LoadAnimation(Anim)
						loadanim:Play()
						loadanim:AdjustSpeed(1)
						loadanim.Stopped:Once(StopAnims)
					end,
				}
			end

		until nextPageCursor == nil or nextPageCursor == "null"
	end)
then
	print("FAILED TO FETCH EMOTES")
end
commands["stop"] = {
	ListName = "stop / e_stop / e_stopanim / noemotes / stopemotes",
	Description = "stop all animation",
	Aliases = { "e_stopanim", "noemotes", "stopemotes" },
	Function = StopAnims,
}
local Plugin = {
	PluginName = "R15 EMOTES (UPGRADED 😎) BY deuces#1961 & phoriah",
	PluginDescription = "Now Auto Updates",
	Commands = commands,
}
return Plugin
