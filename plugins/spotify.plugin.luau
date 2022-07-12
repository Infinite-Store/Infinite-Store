-- https://v3rmillion.net/showthread.php?tid=1008910
-- https://developer.spotify.com/console/get-users-currently-playing-track/
local request = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
local token = ""
local Plugin = {
	["PluginName"] = "spotify",
	["PluginDescription"] = "does basic stuff",
	["Commands"] = {
		["setoauth"] = {
			["ListName"] = "setoauth [spotify oauth]",
			["Description"] = "sets your spotify ouath",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				token = getstring(1)
			end,
		},

		["play"] = {
			["ListName"] = "play",
			["Description"] = "starts playing the currently track thats paused",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				local response = request({
					Url = "https://api.spotify.com/v1/me/player/play",
					Method = "PUT",
					Headers = {
						Authorization = "Bearer " .. token,
					},
				})
			end,
		},

		["pause"] = {
			["ListName"] = "pause / stop",
			["Description"] = "stops playing the currently track thats playing",
			["Aliases"] = { "stop" },
			["Function"] = function(args, speaker)
				local response = request({
					Url = "https://api.spotify.com/v1/me/player/pause",
					Method = "PUT",
					Headers = {
						Authorization = "Bearer " .. token,
					},
				})
			end,
		},

		["setspotifyvolume"] = {
			["ListName"] = "setspotifyvolume / ssvolume [number 0-100]",
			["Description"] = "changes volume",
			["Aliases"] = { "ssvolume" },
			["Function"] = function(args, speaker)
				volume = getstring(1)
				local response = request({
					Url = "https://api.spotify.com/v1/me/player/volume?volume_percent=" .. volume,
					Method = "PUT",
					Headers = {
						Authorization = "Bearer " .. token,
					},
				})
			end,
		},

		["next"] = {
			["ListName"] = "next",
			["Description"] = "plays next track",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				local response = request({
					Url = "https://api.spotify.com/v1/me/player/next",
					Method = "POST",
					Headers = {
						Authorization = "Bearer " .. token,
					},
				})
			end,
		},

		["previous"] = {
			["ListName"] = "previous / prev",
			["Description"] = "plays last track of curr track",
			["Aliases"] = { "prev" },
			["Function"] = function(args, speaker)
				local response = request({
					Url = "https://api.spotify.com/v1/me/player/previous",
					Method = "POST",
					Headers = {
						Authorization = "Bearer " .. token,
					},
				})
			end,
		},

		["spotifygui"] = {
			["ListName"] = "spotifygui",
			["Description"] = "gui from v3rm",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				local Spotify = Instance.new("ScreenGui")
				local RequestToken = Instance.new("Frame")
				local continuebutton = Instance.new("TextButton")
				local tokentext = Instance.new("TextBox")
				local Top = Instance.new("Frame")
				local tokenname = Instance.new("TextLabel")
				local Keybinds = Instance.new("Frame")
				local continuebutton_2 = Instance.new("TextButton")
				local Top_2 = Instance.new("Frame")
				local tokenname_2 = Instance.new("TextLabel")
				local Features = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local pauseresume = Instance.new("TextLabel")
				local keybindbutton = Instance.new("TextButton")
				local skip = Instance.new("TextLabel")
				local keybindbutton_2 = Instance.new("TextButton")
				local previous = Instance.new("TextLabel")
				local keybindbutton_3 = Instance.new("TextButton")
				local Spotify_2 = Instance.new("Frame")
				local Background = Instance.new("Frame")
				local back = Instance.new("Frame")
				local playing = Instance.new("TextLabel")
				local time = Instance.new("TextLabel")
				local time2 = Instance.new("TextLabel")
				local progressbar = Instance.new("ImageLabel")
				local progresssize = Instance.new("ImageLabel")
				local buttons = Instance.new("Frame")
				local previous_2 = Instance.new("ImageButton")
				local skip_2 = Instance.new("ImageButton")
				local pauseresume_2 = Instance.new("ImageButton")
				local artist = Instance.new("TextLabel")
				local volumeslider = Instance.new("TextButton")
				local volumeslider_Roundify_12px = Instance.new("ImageLabel")
				local volumesize = Instance.new("ImageLabel")
				local Top_3 = Instance.new("Frame")
				local name = Instance.new("TextLabel")
				local togglebutton = Instance.new("ImageButton")
				local Features_2 = Instance.new("Frame")
				local UIListLayout_2 = Instance.new("UIListLayout")
				local resettoken = Instance.new("TextButton")
				local keybinds = Instance.new("TextButton")
				local error = Instance.new("TextLabel")

				--Properties:

				Spotify.Name = "Spotify"
				Spotify.Parent = game.CoreGui

				RequestToken.Name = "RequestToken"
				RequestToken.Parent = Spotify
				RequestToken.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				RequestToken.BorderSizePixel = 0
				RequestToken.Position = UDim2.new(0.5, -210, 0.5, -103)
				RequestToken.Size = UDim2.new(0, 420, 0, 206)

				continuebutton.Name = "continuebutton"
				continuebutton.Parent = RequestToken
				continuebutton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				continuebutton.BorderSizePixel = 0
				continuebutton.Position = UDim2.new(0, 25, 1, -35)
				continuebutton.Size = UDim2.new(0.880952358, 0, 0.146341458, 0)
				continuebutton.Font = Enum.Font.Gotham
				continuebutton.Text = "Continue"
				continuebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
				continuebutton.TextSize = 14.000

				tokentext.Name = "tokentext"
				tokentext.Parent = RequestToken
				tokentext.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				tokentext.BorderSizePixel = 0
				tokentext.ClipsDescendants = true
				tokentext.Position = UDim2.new(0, 25, 0, 5)
				tokentext.Size = UDim2.new(0.880952358, 0, 0.780487776, 0)
				tokentext.Font = Enum.Font.Gotham
				tokentext.PlaceholderText = "Token"
				tokentext.Text = ""
				tokentext.TextColor3 = Color3.fromRGB(255, 255, 255)
				tokentext.TextSize = 14.000
				tokentext.TextWrapped = true

				Top.Name = "Top"
				Top.Parent = RequestToken
				Top.BackgroundColor3 = Color3.fromRGB(30, 215, 96)
				Top.BorderSizePixel = 0
				Top.Position = UDim2.new(0, 0, 0, -25)
				Top.Size = UDim2.new(1, 0, 0, 25)

				tokenname.Name = "tokenname"
				tokenname.Parent = Top
				tokenname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				tokenname.BackgroundTransparency = 1.000
				tokenname.Size = UDim2.new(1, 0, 0, 25)
				tokenname.Font = Enum.Font.Gotham
				tokenname.Text = "Spotify Token"
				tokenname.TextColor3 = Color3.fromRGB(0, 0, 0)
				tokenname.TextSize = 14.000

				Keybinds.Name = "Keybinds"
				Keybinds.Parent = Spotify
				Keybinds.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				Keybinds.BorderSizePixel = 0
				Keybinds.Position = UDim2.new(0.5, -130, 0.5, -82)
				Keybinds.Size = UDim2.new(0, 260, 0, 164)

				continuebutton_2.Name = "continuebutton"
				continuebutton_2.Parent = Keybinds
				continuebutton_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				continuebutton_2.BorderSizePixel = 0
				continuebutton_2.Position = UDim2.new(-0.0390000008, 25, 1, -27)
				continuebutton_2.Size = UDim2.new(0.880999982, 0, 0.145999998, 0)
				continuebutton_2.Font = Enum.Font.Gotham
				continuebutton_2.Text = "Continue"
				continuebutton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				continuebutton_2.TextSize = 14.000

				Top_2.Name = "Top"
				Top_2.Parent = Keybinds
				Top_2.BackgroundColor3 = Color3.fromRGB(30, 215, 96)
				Top_2.BorderSizePixel = 0
				Top_2.Position = UDim2.new(0, 0, 0, -25)
				Top_2.Size = UDim2.new(1, 0, 0, 25)

				tokenname_2.Name = "tokenname"
				tokenname_2.Parent = Top_2
				tokenname_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				tokenname_2.BackgroundTransparency = 1.000
				tokenname_2.Size = UDim2.new(1, 0, 0, 25)
				tokenname_2.Font = Enum.Font.Gotham
				tokenname_2.Text = "Keybinds"
				tokenname_2.TextColor3 = Color3.fromRGB(0, 0, 0)
				tokenname_2.TextSize = 14.000

				Features.Name = "Features"
				Features.Parent = Keybinds
				Features.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Features.BackgroundTransparency = 1.000
				Features.Position = UDim2.new(0.0539999641, 0, 0, 5)
				Features.Size = UDim2.new(0, 227, 0, 132)

				UIListLayout.Parent = Features
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 5)

				pauseresume.Name = "pauseresume"
				pauseresume.Parent = Features
				pauseresume.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				pauseresume.BackgroundTransparency = 1.000
				pauseresume.ClipsDescendants = true
				pauseresume.Size = UDim2.new(1, 0, 0, 25)
				pauseresume.Font = Enum.Font.Gotham
				pauseresume.Text = "Pause / Resume"
				pauseresume.TextColor3 = Color3.fromRGB(255, 255, 255)
				pauseresume.TextSize = 14.000
				pauseresume.TextWrapped = true
				pauseresume.TextXAlignment = Enum.TextXAlignment.Left

				keybindbutton.Name = "keybindbutton"
				keybindbutton.Parent = pauseresume
				keybindbutton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				keybindbutton.BorderSizePixel = 0
				keybindbutton.Position = UDim2.new(0.555502176, 0, 0, 0)
				keybindbutton.Size = UDim2.new(0.444497794, 0, -0.200000003, 30)
				keybindbutton.Font = Enum.Font.Gotham
				keybindbutton.Text = ""
				keybindbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
				keybindbutton.TextSize = 10.000

				skip.Name = "skip"
				skip.Parent = Features
				skip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				skip.BackgroundTransparency = 1.000
				skip.ClipsDescendants = true
				skip.Size = UDim2.new(1, 0, 0, 25)
				skip.Font = Enum.Font.Gotham
				skip.Text = "Skip song"
				skip.TextColor3 = Color3.fromRGB(255, 255, 255)
				skip.TextSize = 14.000
				skip.TextWrapped = true
				skip.TextXAlignment = Enum.TextXAlignment.Left

				keybindbutton_2.Name = "keybindbutton"
				keybindbutton_2.Parent = skip
				keybindbutton_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				keybindbutton_2.BorderSizePixel = 0
				keybindbutton_2.Position = UDim2.new(0.555502176, 0, 0, 0)
				keybindbutton_2.Size = UDim2.new(0.444497794, 0, -0.200000003, 30)
				keybindbutton_2.Font = Enum.Font.Gotham
				keybindbutton_2.Text = ""
				keybindbutton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				keybindbutton_2.TextSize = 10.000

				previous.Name = "previous"
				previous.Parent = Features
				previous.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				previous.BackgroundTransparency = 1.000
				previous.ClipsDescendants = true
				previous.Size = UDim2.new(1, 0, 0, 25)
				previous.Font = Enum.Font.Gotham
				previous.Text = "Previous song"
				previous.TextColor3 = Color3.fromRGB(255, 255, 255)
				previous.TextSize = 14.000
				previous.TextWrapped = true
				previous.TextXAlignment = Enum.TextXAlignment.Left

				keybindbutton_3.Name = "keybindbutton"
				keybindbutton_3.Parent = previous
				keybindbutton_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				keybindbutton_3.BorderSizePixel = 0
				keybindbutton_3.Position = UDim2.new(0.555502176, 0, 0, 0)
				keybindbutton_3.Size = UDim2.new(0.444497794, 0, -0.200000003, 30)
				keybindbutton_3.Font = Enum.Font.Gotham
				keybindbutton_3.Text = ""
				keybindbutton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
				keybindbutton_3.TextSize = 10.000

				Spotify_2.Name = "Spotify"
				Spotify_2.Parent = Spotify
				Spotify_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Spotify_2.BackgroundTransparency = 1.000
				Spotify_2.ClipsDescendants = true
				Spotify_2.Position = UDim2.new(0.0335917324, 0, 0.0528255515, 0)
				Spotify_2.Size = UDim2.new(0, 306, 0, 300)

				Background.Name = "Background"
				Background.Parent = Spotify_2
				Background.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				Background.BorderSizePixel = 0
				Background.ClipsDescendants = true
				Background.Size = UDim2.new(1, 0, 1, -25)

				back.Name = "back"
				back.Parent = Background
				back.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				back.BorderSizePixel = 0
				back.Position = UDim2.new(0, 0, 1, -100)
				back.Size = UDim2.new(1, 0, 0, 100)

				playing.Name = "playing"
				playing.Parent = back
				playing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				playing.BackgroundTransparency = 1.000
				playing.Size = UDim2.new(1, 0, 0, 25)
				playing.Font = Enum.Font.Gotham
				playing.Text = "   NULL"
				playing.TextColor3 = Color3.fromRGB(255, 255, 255)
				playing.TextSize = 14.000
				playing.TextWrapped = true
				playing.TextXAlignment = Enum.TextXAlignment.Left

				time.Name = "time"
				time.Parent = back
				time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				time.BackgroundTransparency = 1.000
				time.Position = UDim2.new(0, 0, 0, 50)
				time.Size = UDim2.new(1, 0, 0, 25)
				time.Font = Enum.Font.Gotham
				time.Text = "   NULL"
				time.TextColor3 = Color3.fromRGB(255, 255, 255)
				time.TextSize = 14.000
				time.TextXAlignment = Enum.TextXAlignment.Left

				time2.Name = "time2"
				time2.Parent = back
				time2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				time2.BackgroundTransparency = 1.000
				time2.Position = UDim2.new(0, 0, 0, 50)
				time2.Size = UDim2.new(1, 0, 0, 25)
				time2.Font = Enum.Font.Gotham
				time2.Text = "NULL   "
				time2.TextColor3 = Color3.fromRGB(255, 255, 255)
				time2.TextSize = 14.000
				time2.TextXAlignment = Enum.TextXAlignment.Right

				progressbar.Name = "progressbar"
				progressbar.Parent = back
				progressbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				progressbar.BackgroundTransparency = 1.000
				progressbar.Position = UDim2.new(0.188999996, 0, 0, 60)
				progressbar.Size = UDim2.new(0.625, 0, 0, 6)
				progressbar.Image = "rbxassetid://3570695787"
				progressbar.ImageColor3 = Color3.fromRGB(24, 24, 24)
				progressbar.ScaleType = Enum.ScaleType.Slice
				progressbar.SliceCenter = Rect.new(100, 100, 100, 100)
				progressbar.SliceScale = 0.120

				progresssize.Name = "progresssize"
				progresssize.Parent = progressbar
				progresssize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				progresssize.BackgroundTransparency = 1.000
				progresssize.Size = UDim2.new(0, 0, 0, 6)
				progresssize.Image = "rbxassetid://3570695787"
				progresssize.ImageColor3 = Color3.fromRGB(30, 215, 96)
				progresssize.ScaleType = Enum.ScaleType.Slice
				progresssize.SliceCenter = Rect.new(100, 100, 100, 100)
				progresssize.SliceScale = 0.120

				buttons.Name = "buttons"
				buttons.Parent = back
				buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				buttons.BackgroundTransparency = 1.000
				buttons.Position = UDim2.new(0.416000009, -11, 0, 75)
				buttons.Size = UDim2.new(0, 75, 0, 20)

				previous_2.Name = "previous"
				previous_2.Parent = buttons
				previous_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				previous_2.BackgroundTransparency = 1.000
				previous_2.Size = UDim2.new(0, 20, 0, 20)
				previous_2.Image = "rbxassetid://4458878865"

				skip_2.Name = "skip"
				skip_2.Parent = buttons
				skip_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				skip_2.BackgroundTransparency = 1.000
				skip_2.Position = UDim2.new(0, 50, 0, 0)
				skip_2.Size = UDim2.new(0, 20, 0, 20)
				skip_2.Image = "rbxassetid://4458877936"

				pauseresume_2.Name = "pauseresume"
				pauseresume_2.Parent = buttons
				pauseresume_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				pauseresume_2.BackgroundTransparency = 1.000
				pauseresume_2.Position = UDim2.new(0, 25, 0, 0)
				pauseresume_2.Size = UDim2.new(0, 20, 0, 20)
				pauseresume_2.Image = "rbxassetid://4458863290"

				artist.Name = "artist"
				artist.Parent = back
				artist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				artist.BackgroundTransparency = 1.000
				artist.Position = UDim2.new(0, 0, 0, 25)
				artist.Size = UDim2.new(1, 0, 0, 25)
				artist.Font = Enum.Font.Gotham
				artist.Text = "   NULL"
				artist.TextColor3 = Color3.fromRGB(255, 255, 255)
				artist.TextSize = 14.000
				artist.TextWrapped = true
				artist.TextXAlignment = Enum.TextXAlignment.Left

				volumeslider.Name = "volumeslider"
				volumeslider.Parent = back
				volumeslider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				volumeslider.BackgroundTransparency = 1.000
				volumeslider.BorderSizePixel = 0
				volumeslider.ClipsDescendants = true
				volumeslider.Position = UDim2.new(0.620000005, 0, 0.819999993, 0)
				volumeslider.Size = UDim2.new(0.349999994, 0, 0, 6)
				volumeslider.ZIndex = 5
				volumeslider.Font = Enum.Font.SourceSans
				volumeslider.Text = ""
				volumeslider.TextColor3 = Color3.fromRGB(0, 0, 0)
				volumeslider.TextSize = 14.000

				volumeslider_Roundify_12px.Name = "volumeslider_Roundify_12px"
				volumeslider_Roundify_12px.Parent = volumeslider
				volumeslider_Roundify_12px.Active = true
				volumeslider_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
				volumeslider_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				volumeslider_Roundify_12px.BackgroundTransparency = 1.000
				volumeslider_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
				volumeslider_Roundify_12px.Selectable = true
				volumeslider_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
				volumeslider_Roundify_12px.Image = "rbxassetid://3570695787"
				volumeslider_Roundify_12px.ImageColor3 = Color3.fromRGB(24, 24, 24)
				volumeslider_Roundify_12px.ScaleType = Enum.ScaleType.Slice
				volumeslider_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
				volumeslider_Roundify_12px.SliceScale = 0.120

				volumesize.Name = "volumesize"
				volumesize.Parent = volumeslider
				volumesize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				volumesize.BackgroundTransparency = 1.000
				volumesize.Size = UDim2.new(0, 0, 0, 6)
				volumesize.Image = "rbxassetid://3570695787"
				volumesize.ImageColor3 = Color3.fromRGB(30, 215, 96)
				volumesize.ScaleType = Enum.ScaleType.Slice
				volumesize.SliceCenter = Rect.new(100, 100, 100, 100)
				volumesize.SliceScale = 0.120

				Top_3.Name = "Top"
				Top_3.Parent = Background
				Top_3.BackgroundColor3 = Color3.fromRGB(30, 215, 96)
				Top_3.BorderSizePixel = 0
				Top_3.Size = UDim2.new(1, 0, 0, 25)
				Top_3.ZIndex = 100

				name.Name = "name"
				name.Parent = Top_3
				name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				name.BackgroundTransparency = 1.000
				name.Size = UDim2.new(1, 0, 1, 0)
				name.ZIndex = 100
				name.Font = Enum.Font.Gotham
				name.Text = "Spotify"
				name.TextColor3 = Color3.fromRGB(0, 0, 0)
				name.TextSize = 14.000

				togglebutton.Name = "togglebutton"
				togglebutton.Parent = Top_3
				togglebutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				togglebutton.BackgroundTransparency = 1.000
				togglebutton.Size = UDim2.new(0, 25, 0, 25)
				togglebutton.ZIndex = 150
				togglebutton.Image = "http://www.roblox.com/asset/?id=1086988282"

				Features_2.Name = "Features"
				Features_2.Parent = Background
				Features_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Features_2.BackgroundTransparency = 1.000
				Features_2.Position = UDim2.new(0, 10, 0, 30)
				Features_2.Size = UDim2.new(0.943391144, 0, 0.732523978, 0)

				UIListLayout_2.Parent = Features_2
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.Padding = UDim.new(0, 5)

				resettoken.Name = "resettoken"
				resettoken.Parent = Features_2
				resettoken.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				resettoken.BorderSizePixel = 0
				resettoken.Size = UDim2.new(1, 0, 0, 30)
				resettoken.Font = Enum.Font.Gotham
				resettoken.Text = "Reset Token"
				resettoken.TextColor3 = Color3.fromRGB(255, 255, 255)
				resettoken.TextSize = 14.000

				keybinds.Name = "keybinds"
				keybinds.Parent = Features_2
				keybinds.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				keybinds.BorderSizePixel = 0
				keybinds.Size = UDim2.new(1, 0, 0, 30)
				keybinds.Font = Enum.Font.Gotham
				keybinds.Text = "Set Keybinds"
				keybinds.TextColor3 = Color3.fromRGB(255, 255, 255)
				keybinds.TextSize = 14.000

				error.Name = "error"
				error.Parent = Spotify_2
				error.BackgroundColor3 = Color3.fromRGB(204, 26, 43)
				error.BorderSizePixel = 0
				error.Position = UDim2.new(0, 0, 0.800000012, 0)
				error.Size = UDim2.new(1, 0, 0, 25)
				error.Visible = false
				error.ZIndex = 0
				error.Font = Enum.Font.Gotham
				error.Text = "error: no kanker hjakfhuasjkf hsnajkfsahjnkfsahnjkfhnjksa"
				error.TextColor3 = Color3.fromRGB(255, 255, 255)
				error.TextScaled = true
				error.TextSize = 14.000
				error.TextWrapped = true

				-- Scripts:

				local function PLHTDN_fake_script() -- Spotify.SpotifyHandler
					local script = Instance.new("LocalScript", Spotify)

					local TweenService = game:GetService("TweenService")
					local UserInputService = game:GetService("UserInputService")

					local draggable = function(gui)
						local UserInputService = game:GetService("UserInputService")
						local dragging
						local dragInput
						local dragStart
						local startPos

						local function update(input)
							if not scrollon then
								local delta = input.Position - dragStart
								gui.Position = UDim2.new(
									startPos.X.Scale,
									startPos.X.Offset + delta.X,
									startPos.Y.Scale,
									startPos.Y.Offset + delta.Y
								)
							end
						end

						gui.InputBegan:Connect(function(input)
							if
								input.UserInputType == Enum.UserInputType.MouseButton1
								or input.UserInputType == Enum.UserInputType.Touch
							then
								dragging = true
								dragStart = input.Position
								startPos = gui.Position

								input.Changed:Connect(function()
									if input.UserInputState == Enum.UserInputState.End then
										dragging = false
									end
								end)
							end
						end)

						gui.InputChanged:Connect(function(input)
							if
								input.UserInputType == Enum.UserInputType.MouseMovement
								or input.UserInputType == Enum.UserInputType.Touch
							then
								dragInput = input
							end
						end)

						UserInputService.InputChanged:Connect(function(input)
							if input == dragInput and dragging then
								update(input)
							end
						end)
					end

					function Format(Int)
						return string.format("%02i", Int)
					end
					function convertToHMS(Seconds)
						local Minutes = (Seconds - Seconds % 60) / 60
						Seconds = Seconds - Minutes * 60
						local Hours = (Minutes - Minutes % 60) / 60
						Minutes = Minutes - Hours * 60
						return Format(Minutes) .. ":" .. Format(Seconds)
					end
					local spotify = function(url, method, token)
						local success, res = pcall(syn.request, {
							Url = url,
							Method = method,
							Headers = {
								["Accept"] = "application/json",
								["Authorization"] = "Bearer " .. token,
								["Content-Type"] = "application/json",
							},
						})
						if success == true and type(res) == "table" and #res.Body > 0 then
							local parsed = game.HttpService:JSONDecode(res.Body)
							return {
								artist = parsed["item"]["artists"][1]["name"],
								title = parsed["item"]["name"],
								current = parsed["progress_ms"],
								maximum = parsed["item"]["duration_ms"],
								playing = parsed["is_playing"],
							}
						else
							return {
								artist = "Failed to get artist",
								title = "Failed to get song name",
								current = "nil",
								maximum = "nil",
							}
						end
					end
					local Spotify = script.Parent.Spotify
					local Background = script.Parent.Spotify.Background
					draggable(Spotify)
					draggable(script.Parent.RequestToken)
					draggable(script.Parent.Keybinds)

					Background.Visible = false
					script.Parent.Keybinds.Visible = false
					local token = ""

					script.Parent.RequestToken.continuebutton.MouseButton1Click:Connect(function()
						token = script.Parent.RequestToken.tokentext.Text
						Background.Visible = true
						script.Parent.RequestToken.Visible = false
						Spotify.error.Visible = true
						script.Parent.RequestToken.tokentext.Text = ""
						Background.back.playing.Text = "   NULL"
						Background.back.artist.Text = "   NULL"
						Background.back.time.Text = "   NULL"
						Background.back.time2.Text = "NULL   "
						Background.back.progressbar.progresssize.Size = UDim2.new(0, 0, 1, 0)
					end)

					Background.Features.resettoken.MouseButton1Click:Connect(function()
						Background.Visible = false
						script.Parent.RequestToken.Visible = true
						Spotify.error.Visible = false
						script.Parent.RequestToken.tokentext.Text = ""
						Background.back.playing.Text = "   NULL"
						Background.back.artist.Text = "   NULL"
						Background.back.time.Text = "   NULL"
						Background.back.time2.Text = "NULL   "
						Background.back.progressbar.progresssize.Size = UDim2.new(0, 0, 1, 0)
					end)

					Background.Features.keybinds.MouseButton1Click:Connect(function()
						script.Parent.Keybinds.Visible = true
					end)

					script.Parent.Keybinds.continuebutton.MouseButton1Click:Connect(function()
						script.Parent.Keybinds.Visible = false
					end)

					Background.back.buttons.skip.MouseButton1Click:Connect(function()
						pcall(spotify, "https://api.spotify.com/v1/me/player/next", "POST", token)
					end)

					Background.back.buttons.previous.MouseButton1Click:Connect(function()
						pcall(spotify, "https://api.spotify.com/v1/me/player/previous", "POST", token)
					end)

					Background.back.buttons.pauseresume.MouseButton1Click:Connect(function()
						if Background.back.buttons.pauseresume.Image == "rbxassetid://4458862490" then
							pcall(spotify, "https://api.spotify.com/v1/me/player/pause", "PUT", token)
						else
							pcall(spotify, "https://api.spotify.com/v1/me/player/play", "PUT", token)
						end
					end)

					local keybindchange = false
					local keybindchange2 = false
					local keybindchange3 = false
					local pause
					local skip
					local previous
					local UserInputService = game:GetService("UserInputService")
					UserInputService.InputBegan:connect(function(key, processed)
						if processed then
							return
						end
						local z = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
						if not string.find(tostring(z), "MouseButton1") then
							if z == pause then
								if Background.back.buttons.pauseresume.Image == "rbxassetid://4458862490" then
									pcall(spotify, "https://api.spotify.com/v1/me/player/pause", "PUT", token)
								else
									pcall(spotify, "https://api.spotify.com/v1/me/player/play", "PUT", token)
								end
							elseif z == skip then
								pcall(spotify, "https://api.spotify.com/v1/me/player/next", "POST", token)
							elseif z == previous then
								pcall(spotify, "https://api.spotify.com/v1/me/player/previous", "POST", token)
							end
							if keybindchange then
								keybindchange = false
								pause = z
								local textcool = string.find(tostring(z), "UserInputType") and 20 or 14
								script.Parent.Keybinds.Features.pauseresume.keybindbutton.Text =
									string.sub(tostring(z), textcool)
								if key.KeyCode == Enum.KeyCode.Backspace then
									pause = nil
									script.Parent.Keybinds.Features.pauseresume.keybindbutton.Text = ""
								end
							end
							if keybindchange2 then
								keybindchange2 = false
								skip = z
								local textcool = string.find(tostring(z), "UserInputType") and 20 or 14
								script.Parent.Keybinds.Features.skip.keybindbutton.Text =
									string.sub(tostring(z), textcool)
								if key.KeyCode == Enum.KeyCode.Backspace then
									skip = nil
									script.Parent.Keybinds.Features.skip.keybindbutton.Text = ""
								end
							end
							if keybindchange3 then
								keybindchange3 = false
								previous = z
								local textcool = string.find(tostring(z), "UserInputType") and 20 or 14
								script.Parent.Keybinds.Features.previous.keybindbutton.Text =
									string.sub(tostring(z), textcool)
								if key.KeyCode == Enum.KeyCode.Backspace then
									previous = nil
									script.Parent.Keybinds.Features.previous.keybindbutton.Text = ""
								end
							end
						end
					end)

					script.Parent.Keybinds.Features.pauseresume.keybindbutton.MouseButton1Click:Connect(function()
						keybindchange = true
					end)

					script.Parent.Keybinds.Features.skip.keybindbutton.MouseButton1Click:Connect(function()
						keybindchange2 = true
					end)

					script.Parent.Keybinds.Features.previous.keybindbutton.MouseButton1Click:Connect(function()
						keybindchange3 = true
					end)

					while wait(0.25) do
						pcall(function()
							if token ~= "" then
								local comply2, returns = pcall(
									spotify,
									"https://api.spotify.com/v1/me/player/currently-playing",
									"GET",
									token
								)
								if comply2 then
									local currentsec = math.floor(returns.current / 1000)
									local maximumsec = math.floor(returns.maximum / 1000)
									Background.back.playing.Text = "   " .. returns.title
									Background.back.artist.Text = "   " .. returns.artist
									Background.back.time.Text = "   " .. convertToHMS(currentsec)
									Background.back.time2.Text = convertToHMS(maximumsec) .. "   "
									Background.back.progressbar.progresssize:TweenSize(
										UDim2.new(currentsec / maximumsec, 0, 1, 0),
										Enum.EasingDirection.Out,
										Enum.EasingStyle.Quad,
										0.25
									)
									if returns.playing then
										Background.back.buttons.pauseresume.Image = "rbxassetid://4458862490"
									else
										Background.back.buttons.pauseresume.Image = "rbxassetid://4458863290"
									end
									if returns.artist == "" then
										Background.back.artist.Text = "   No artist found"
									end
									Spotify.error:TweenPosition(
										UDim2.new(0, 0, 0.8, 0),
										Enum.EasingDirection.In,
										Enum.EasingStyle.Sine,
										1
									)
									Spotify.error.Text = ""
									pcall(
										spotify,
										"https://api.spotify.com/v1/me/player/volume?volume_percent="
											.. tostring(Background.back.volumeslider.volume.Value),
										"PUT",
										token
									)
								else
									Background.back.playing.Text = "   NULL"
									Background.back.artist.Text = "   NULL"
									Background.back.time.Text = "   NULL"
									Background.back.time2.Text = "NULL   "
									Background.back.progressbar.progresssize:TweenSize(
										UDim2.new(0, 0, 1, 0),
										Enum.EasingDirection.Out,
										Enum.EasingStyle.Quad,
										0.25
									)
									Background.back.buttons.pauseresume.Image = "rbxassetid://4458863290"
									Spotify.error:TweenPosition(
										UDim2.new(0, 0, 1, -25),
										Enum.EasingDirection.In,
										Enum.EasingStyle.Sine,
										1
									)
									Spotify.error.Text =
										"Error: The Spotify API returned an error, please reset your token."
								end
							elseif not script.Parent.RequestToken.Visible then
								Spotify.error:TweenPosition(
									UDim2.new(0, 0, 1, -25),
									Enum.EasingDirection.In,
									Enum.EasingStyle.Sine,
									1
								)
								Spotify.error.Text =
									"Error: The Spotify API returned an error, please reset your token."
							end
						end)
					end
					--[[
                --get song, artist, length, duration, playing
                local comply2, returns = pcall(spotify,'https://api.spotify.com/v1/me/player/currently-playing','GET',token)
                for i,v in next, returns do print(i,v) end
                print(returns.title)
                --set volume
                pcall(spotify,'https://api.spotify.com/v1/me/player/volume?volume_percent=100','PUT',token)]]
				end
				coroutine.wrap(PLHTDN_fake_script)()
				local function YKZJVV_fake_script() -- volumeslider.LocalScript
					local script = Instance.new("LocalScript", volumeslider)

					local scrollon = false
					local UserInputService = game:GetService("UserInputService")

					local mouse = game:GetService("Players").LocalPlayer:GetMouse()
					local heartbeat = game:GetService("RunService").Heartbeat

					local scroll = script.Parent
					local cfgValue = Instance.new("IntValue", script.Parent)
					cfgValue.Name = "volume"
					local max = 100
					local actualscroll = script.Parent.volumesize

					cfgValue:GetPropertyChangedSignal("Value"):Connect(function()
						local a = cfgValue.Value > max and max or cfgValue.Value
						cfgValue.Value = cfgValue.Value > max and max or cfgValue.Value
						actualscroll:TweenSize(
							UDim2.new(a / max, 0, 1, 0),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quad,
							0.05
						)
						if a < 1 then
							actualscroll.Size = UDim2.new(0, 1, 1, 0)
						end
					end)

					local s, event = pcall(function()
						return scroll.MouseEnter
					end)

					if s then
						scroll.Active = true
						event:connect(function()
							local input = scroll.InputBegan:connect(function(key)
								if key.UserInputType == Enum.UserInputType.MouseButton1 then
									local objectPosition = mouse.X
									while
										heartbeat:wait()
										and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
									do
										scrollon = true
										local yes = mouse.X - actualscroll.AbsolutePosition.x
										if 0 > yes then
											cfgValue.Value = 0
										elseif 110 >= yes then
											cfgValue.Value = math.floor((yes / 110) * max)
										else
											cfgValue.Value = max
										end
									end
									scrollon = false
								end
							end)
							local leave
							leave = scroll.MouseLeave:connect(function()
								input:disconnect()
								leave:disconnect()
							end)
						end)
					end
				end
				coroutine.wrap(YKZJVV_fake_script)()
				local function PSRQWF_fake_script() -- togglebutton.LocalScript
					local script = Instance.new("LocalScript", togglebutton)

					local open = true
					local tweening = false
					local TweenService = game:GetService("TweenService")
					script.Parent.MouseButton1Click:Connect(function()
						if not tweening then
							tweening = true
							if open then
								script.Parent.Parent.Parent:TweenSize(
									UDim2.new(1, 0, 0, 25),
									Enum.EasingDirection.Out,
									Enum.EasingStyle.Quad,
									0.5
								)
								script.Parent.Parent.Parent.back.ZIndex = 5
								script.Parent.Parent.Parent.Parent.error.Visible = false
							end
							if not open then
								script.Parent.Parent.Parent:TweenSize(
									UDim2.new(1, 0, 1, -25),
									Enum.EasingDirection.Out,
									Enum.EasingStyle.Quad,
									0.5
								)
								script.Parent.Parent.Parent.back.ZIndex = 5
							end
							open = not open
							spawn(function()
								wait(0.5)
								script.Parent.Parent.Parent.back.ZIndex = 1
								if open then
									script.Parent.Parent.Parent.Parent.error.Visible = true
								end
								wait(0.25)
								tweening = false
							end)
						end
					end)
				end
				coroutine.wrap(PSRQWF_fake_script)()
			end,
		},
	},
}
return Plugin
