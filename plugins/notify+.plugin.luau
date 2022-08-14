-- fuck you Edge and Toon for not merging #67, despite it not having any issues

-- `getgenv().IY.PARENT` is for the cool kids using Infinite Store
local Notification = getgenv().IY.PARENT:FindFirstChild(Notification.Name) or PARENT:FindFirstChild(Notification.Name)

-- enable RichText for notification title and body
Notification.Title.RichText = true
Notification.Text.RichText = true

-- plugin shit, no commands
local notify+ = {
	["PluginName"] = "Notify+",
	["PluginDescription"] = "Enhances Infinite Yield notifications",
}; return notify+
