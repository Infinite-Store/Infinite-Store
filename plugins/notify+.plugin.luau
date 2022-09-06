-- fuck you Edge and Toon for not merging #67, despite it not having any issues

-- `getgenv().IY.Notification` is for the cool kids using Infinite Store
local Notification = (getgenv().IY and getgenv().IY.Notification) or PARENT:FindFirstChild(Notification.Name)

-- enable RichText for notification title and body
Notification.Title.RichText = true
Notification.Text.RichText = true

-- plugin shit, no commands
local notifyplus = {
	["PluginName"] = "Notify+",
	["PluginDescription"] = "Enhances Infinite Yield notifications",
}
return notifyplus
