-- File: JumpCounter.lua
-- Name: JumpCounter
-- Author: Aic
-- Description: Counts the number of times you jump
-- Version: 1.1

hooksecurefunc( "AscendStop", function()
  if JumpCounter == nil then
    JumpCounter = 0
  else
    JumpCounter = JumpCounter + 1
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