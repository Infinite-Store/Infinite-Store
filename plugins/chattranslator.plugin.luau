local Plugin = {
	["PluginName"] = "Chat Translator By Butterfly3ffect#7960",
	["PluginDescription"] = "Translate Chat",
	["Commands"] = {
		["translate"] = {
			["ListName"] = "translate [translate chat]",
			["Description"] = "If you want to respond then type /e [target language code] [message here] (Without the brackets",
			["Aliases"] = { "translate" },
			["Function"] = function(args, speaker)
				print("executing")
				local HttpService = game:GetService("HttpService")
				local Players = game:GetService("Players")
				ChatMode = "private"
				DeviceSpoofing = "Redmi Note 8 Pro"
				local source_languages = {
					["de"] = true,
					["ru"] = true,
					["fr"] = true,
					["es"] = true,
					["tr"] = true,
					["ja"] = true,
					["no"] = true,
					["ro"] = true,
					["pt"] = true,
					["zh"] = true,
					["ko"] = true,
					["ar"] = true,
					["sq"] = true,
					["it"] = true,
					["el"] = true,
					["vi"] = true,
					["he"] = true,
					["da"] = true,
					["pl"] = true,
					["sv"] = true,
				}
				local blacklisted_words = {
					["axe"] = true,
				}
				local blacklisted_players = {
					["mk15ru6l3g"] = true,
					["Loostys"] = true,
					["vintaqeo"] = true,
				}
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "In-Line ChatTranslator",
					Text = "Loaded",
					Duration = 5,
				})
				local request = request
				if syn then
					request = syn.request
				elseif SENTINEL_V2 then
					function http_request(tb)
						return {
							Body = request(tb.Url, tb.Method, (tb.Body or "")),
						}
					end
				end
				Translate = function(plr)
					plr.Chatted:Connect(function(Message)
						local detect_lan = game:HttpGet(
							"https://translate.yandex.net/api/v1/tr.json/translate?srv=android&lang=en&text="
								.. HttpService:UrlEncode(Message)
						)
						local translate = detect_lan --.Body
						local decoded = HttpService:JSONDecode(translate)
						local detect_lan_fixed = decoded.lang:split("-")
						if
							Message:sub(1, 2) == "/e"
							or Message:sub(1, 2) == "/w"
							or Message:sub(1, 2) == "/t" and not plr.Name == game.Players.LocalPlayer.Name
						then
						else
							if
								source_languages[detect_lan_fixed[1]]
								and not blacklisted_words[Message]
								and not blacklisted_players[plr.Name]
							then
								if detect_lan_fixed[1] == "de" then
									detect_lan_fixed[1] = "German"
								elseif detect_lan_fixed[1] == "ru" then
									detect_lan_fixed[1] = "Russian"
								elseif detect_lan_fixed[1] == "fr" then
									detect_lan_fixed[1] = "French"
								elseif detect_lan_fixed[1] == "es" then
									detect_lan_fixed[1] = "Spanish"
								elseif detect_lan_fixed[1] == "tr" then
									detect_lan_fixed[1] = "Turkish"
								elseif detect_lan_fixed[1] == "ja" then
									detect_lan_fixed[1] = "Japanese"
								elseif detect_lan_fixed[1] == "no" then
									detect_lan_fixed[1] = "Norwegian"
								elseif detect_lan_fixed[1] == "ro" then
									detect_lan_fixed[1] = "Romanian"
								elseif detect_lan_fixed[1] == "pt" then
									detect_lan_fixed[1] = "Portuguese"
								elseif detect_lan_fixed[1] == "zh" then
									detect_lan_fixed[1] = "Chinese"
								elseif detect_lan_fixed[1] == "ko" then
									detect_lan_fixed[1] = "Korean"
								elseif detect_lan_fixed[1] == "ar" then
									detect_lan_fixed[1] = "Arabic"
								elseif detect_lan_fixed[1] == "sq" then
									detect_lan_fixed[1] = "Albanian"
								elseif detect_lan_fixed[1] == "it" then
									detect_lan_fixed[1] = "Italian"
								elseif detect_lan_fixed[1] == "el" then
									detect_lan_fixed[1] = "Greek"
								elseif detect_lan_fixed[1] == "vi" then
									detect_lan_fixed[1] = "Vietnamese"
								elseif detect_lan_fixed[1] == "he" then
									detect_lan_fixed[1] = "Hebrew"
								elseif detect_lan_fixed[1] == "da" then
									detect_lan_fixed[1] = "Danish"
								elseif detect_lan_fixed[1] == "pl" then
									detect_lan_fixed[1] = "Polish"
								elseif detect_lan_fixed[1] == "sv" then
									detect_lan_fixed[1] = "Swedish"
								end
								local response = request({
									["Url"] = "https://translate.google.com/m?hl=en&sl=auto&tl=en&ie=UTF-8&prev=_m&q="
										.. HttpService:UrlEncode(Message),
									["Method"] = "GET",
									["Headers"] = { ["Accept-Charset"] = "utf-8" },
								})
								local translate = response.Body
								local t_start = translate:find('class="result-') + 25
								local t_end = translate:find('class="links-') - 12
								local trimmed = translate:sub(t_start, t_end) --Translated message
								if ChatMode == "private" then
									game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
										Text = "["
											.. plr.Name
											.. "] ["
											.. detect_lan_fixed[1]
											.. "]"
											.. ": "
											.. trimmed:gsub("(&#39;)", "'"):gsub("(&quot;)", '"'),
										Color = Color3.new(1, 0, 0),
									})
								elseif ChatMode == "public" then
									local A_1 = "["
										.. plr.Name
										.. "] ["
										.. detect_lan_fixed[1]
										.. "]"
										.. ": "
										.. trimmed:gsub("(&#39;)", "'"):gsub("(&quot;)", '"')
									local A_2 = "All"
									local Event =
										game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
									Event:FireServer(A_1, A_2)
								end
							end
						end
						if Message:sub(1, 2) == "/e" and plr.Name == game.Players.LocalPlayer.Name then
							local target_lan = Message:sub(4, 5, #Message)
							local tMessage = Message:sub(7, #Message)
							local response = request({
								["Url"] = "https://translate.google.com/m?hl=en&sl=auto&tl="
									.. target_lan
									.. "&ie=UTF-8&prev=_m&q="
									.. HttpService:UrlEncode(tMessage),
								["Method"] = "GET",
								["Headers"] = { ["Accept-Charset"] = "utf-8" },
							})
							local translate = response.Body
							local t_start = translate:find('class="result-') + 25
							local t_end = translate:find('class="links-') - 12
							local trimmed = translate:sub(t_start, t_end) --Translated message
							local A_1 = trimmed:gsub("(&#39;)", "'"):gsub("(&quot;)", '"')
							local A_2 = "All"
							local Event =
								game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
							Event:FireServer(A_1, A_2)
						end
					end)
				end
				for _, plr in pairs(game.Players:GetChildren()) do
					Translate(plr)
				end
				game.Players.PlayerAdded:connect(function(player)
					Translate(player)
					print("executed")
				end)
			end,
		},
	},
}
return Plugin
