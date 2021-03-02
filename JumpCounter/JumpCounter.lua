-- File: JumpCounter.lua
-- Name: JumpCounter
-- Author: Aic
-- Description: Counts the number of times you jump
-- Version: 1.1

local UPDATE_PERIOD = 0.5
local elapsed = 0
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local dataObj = ldb:NewDataObject("Jump Counter", {type = "data source", text = "0 Jumps"})
local frame = CreateFrame("frame")

-- Write jumps to data broker
frame:SetScript("OnUpdate", function(self, elap)
	elapsed = elapsed + elap
  if elapsed < UPDATE_PERIOD then
    return
  end

	elapsed = 0
	local fps = GetFramerate()
	dataObj.text = string.format("%d Jumps", JumpCounter)
end)

-- Write data broker tool tip
function dataObj:OnTooltipShow()
  self:AddLine("Total Jumps")
end

function dataObj:OnEnter()
  GameTooltip:SetOwner(self, "ANCHOR_NONE")
  GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
  GameTooltip:ClearLines()
  dataObj.OnTooltipShow(GameTooltip)
  GameTooltip:Show()
end

function dataObj:OnLeave()
  GameTooltip:Hide()
end

hooksecurefunc( "JumpOrAscendStart", function()
  if JumpCounter == nil then
    JumpCounter = 0
  else
    if not IsFalling() then
      JumpCounter = JumpCounter + 1
    end
    if JumpCounter == 10 or JumpCounter == 100 or JumpCounter == 1000 or mod(JumpCounter, 5000) == 0 then
      -- Formatting taken from JumpsCount addon by boolbazaur https://www.curseforge.com/wow/addons/jumps-count
      DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\Icons\\INV_Gizmo_supersappercharge:32|t |cFFDAA520 Congratulations, It's your " .. JumpCounter .. "th Jump! |TInterface\\Icons\\INV_Gizmo_supersappercharge:32|t")
    end
  end
end );

-- slash command
for i, v in ipairs({"jc", "jumpcounter", "jumpcount"}) do
  _G["SLASH_JUMPCOUNTER" .. i] = "/" .. v
end

SlashCmdList.JUMPCOUNTER = function(msg)
  if not msg or msg == "" then
    if JumpCounter == nil then
      JumpCounter = 0
    end
    DEFAULT_CHAT_FRAME:AddMessage("You have jumped " .. JumpCounter .. " times.");
  elseif ( msg == "clear") then
    JumpCounter = 0
  end
end