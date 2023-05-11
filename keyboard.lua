direction = 1
require "character"

offsetX = -64
offsetY = -64
moving = false

function generalKeyBind()
  function love.keypressed(key)
    if inCreationGame == true then
      if key == "backspace" then
        local byteoffset = utf8.offset(graine, -1)
        if byteoffset then
          graine = string.sub(graine, 1, byteoffset - 1)
        end
      end
    end
    if key == "escape" then
      love.event.quit()
    end
    if inGame == true then
      if key == "z" or key == "Z" then
        offsetY = offsetY + 64
        playerPositionX = playerPositionX + 64
        moving = true
        direction = 2
      elseif key == "s" or key == "S" then
        offsetY = offsetY - 64
        playerPositionY = playerPositionY - 64
        moving = true
        direction = 1
      elseif key == "q" or key == "Q" then
        offsetX = offsetX + 64
        playerPositionX = playerPositionX + 64
        moving = true
        direction = 3
      elseif key == "d" or key == "S" then
        offsetX = offsetX - 64
        playerPositionY = playerPositionY + 64
        moving = true
        direction = 4
      elseif key == "i" or key == "I" then
        if inInventory == false then
          inInventory = true
        elseif inInventory == true then
          inInventory = false
        end
      elseif inInventory then
        if key == "up" then
          flecheSelectionPosition = flecheSelectionPosition - 30
        elseif key == "down" then
          flecheSelectionPosition = flecheSelectionPosition + 30
        elseif key == "return" then
          interectionMenu()
        end
      end
    end
  end

  function love.keyreleased(key)
    if inGame == true then
      if key == "z" or key == "Z" then
        moving = false
        direction = 2
      elseif key == "s" or key == "S" then
        moving = false
        direction = 1
      elseif key == "q" or key == "Q" then
        moving = false
        direction = 3
      elseif key == "d" or key == "S" then
        moving = false
        direction = 4
      end
    end
  end
end