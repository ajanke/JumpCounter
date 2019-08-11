-- File: JumpCounter.lua
-- Name: JumpCounter
-- Author: Aic
-- Description: Counts the number of times you jump
-- Version: 0.1

hooksecurefunc( "JumpOrAscendStart", function()
  if JumpCounter == nil then
    JumpCounter = 0
  else
    JumpCounter = JumpCounter + 1
  end
end );

-- slash command
for i, v in ipairs({"jc", "jumpcounter", "jumpcount"}) do
  _G["SLASH_JUMPCOUNTER" .. i] = "/" .. v
end

SlashCmdList.JUMPCOUNTER = function()
    if JumpCounter == nil then
        JumpCounter = 0
    end
  DEFAULT_CHAT_FRAME:AddMessage("You have jumped " .. JumpCounter .. " times.");
end