deckFight = {"","","","","","","","","",""}
flecheSelection = love.graphics.newImage("Graphics/flecheSelection.png")
flecheSelectionPosition = height-275

function inventoryDisplay()
  if inInventory then
    print(height-300)
    love.graphics.setColor(love.math.colorFromBytes(255,171,179,199))
    love.graphics.rectangle("line", 0, height-300 , 150, height-300)
    love.graphics.setColor(love.math.colorFromBytes(216,220,230,125))
    love.graphics.rectangle("fill", 0, height-300 , 149, height-299)
    love.graphics.setColor(love.math.colorFromBytes(0,0,0))
    love.graphics.print("Cartes", 30, height-280)
    love.graphics.print("Stats", 30, height-250)
    love.graphics.print("Quitter", 30, height-220)
    love.graphics.draw(flecheSelection, 10, flecheSelectionPosition)
  end
end

function cartes()
  
end
function stats()
  
end
function quitter()
  inInventory = false
  inGame = false
  inMenu = true
end
function interectionMenu()
  if flecheSelectionPosition == height-215 then
    quitter()
  end
end