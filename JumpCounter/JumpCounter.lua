-- File: JumpCounter.lua
-- Name: JumpCounter
-- Author: Aic
-- Description: Counts the number of times you jump
-- Version: 2.0

local ADDON_NAME = ...

local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local dataObj = ldb:NewDataObject("Jump Counter", {
	type = "data source",
	text = "0 Jumps",
	icon = "Interface\\Icons\\INV_Gizmo_supersappercharge",
})

local function updateDisplay()
	dataObj.text = string.format("%d Jumps", JumpCounter or 0)
end

local function isMilestone(count)
	return count == 10 or count == 100 or count == 1000 or count % 5000 == 0
end

-- Data broker tooltip
function dataObj.OnTooltipShow(tooltip)
	tooltip:AddLine("Jump Counter")
	tooltip:AddDoubleLine("Total jumps", JumpCounter or 0, 1, 1, 1, 1, 1, 1)
end

-- Count jumps. JumpOrAscendStart is called by the jump key binding.
hooksecurefunc("JumpOrAscendStart", function()
	JumpCounter = (JumpCounter or 0) + 1
	updateDisplay()
	if isMilestone(JumpCounter) then
		-- Formatting taken from JumpsCount addon by boolbazaur https://www.curseforge.com/wow/addons/jumps-count
		DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\Icons\\INV_Gizmo_supersappercharge:32|t |cFFDAA520 Congratulations, It's your " .. JumpCounter .. "th Jump! |TInterface\\Icons\\INV_Gizmo_supersappercharge:32|t")
	end
end)

-- Saved variables are only available once the addon has loaded
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
	if addonName ~= ADDON_NAME then return end
	JumpCounter = JumpCounter or 0
	updateDisplay()
	self:UnregisterEvent("ADDON_LOADED")
end)

-- Confirmation dialog for /jc clear
StaticPopupDialogs["JUMPCOUNTER_CONFIRM_CLEAR"] = {
	text = "Reset your jump count? You have jumped %s times.",
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function()
		JumpCounter = 0
		updateDisplay()
		DEFAULT_CHAT_FRAME:AddMessage("Jump count reset to 0.")
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
	showAlert = 1,
}

-- Slash commands
SLASH_JUMPCOUNTER1 = "/jc"
SLASH_JUMPCOUNTER2 = "/jumpcounter"
SLASH_JUMPCOUNTER3 = "/jumpcount"

SlashCmdList.JUMPCOUNTER = function(msg)
	msg = strtrim(msg or ""):lower()
	if msg == "" then
		DEFAULT_CHAT_FRAME:AddMessage("You have jumped " .. (JumpCounter or 0) .. " times.")
	elseif msg == "clear" then
		StaticPopup_Show("JUMPCOUNTER_CONFIRM_CLEAR", JumpCounter or 0)
	else
		DEFAULT_CHAT_FRAME:AddMessage("Usage: /jc [clear]")
	end
end
