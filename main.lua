width, height = love.window.getDesktopDimensions(1)
love.window.setMode(width, height, {resizable=false, vsync=true, minwidth=800, minheight=800})
love.keyboard.setKeyRepeat(true)

require("creationCarte")
require("menu")
require("inventaire")
require("keyboard")
require("character")

function display()
  --print("inMenu:",inMenu,"inCreationGame:",inCreationGame,"inGame:",inGame)
  if inMenu == true then
    menu()
  elseif inCreationGame == true then
    newGame()
  elseif inGame == true then
    love.graphics.setColor(love.math.colorFromBytes(255,255,255))
    if isMapCreated == false then
      generateNoiseGrid()
      generateMap()
    else
      displayMap()
    end
    character1:setFrames()
    character1:display()
    inventoryDisplay()
  end
end

function love.draw()
  generalKeyBind()
  display()
end