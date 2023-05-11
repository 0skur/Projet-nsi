nouvellePartie = love.graphics.newImage("Graphics/nouvGame.png")
quitterJeu = love.graphics.newImage("Graphics/quitter.png")
retour = love.graphics.newImage("Graphics/retour.png")
creerPartie = love.graphics.newImage("Graphics/creerNouvGame.png")

mouseX = 0
mouseY = 0

inMenu = true
inCreationGame = false
inGame = false
inInventory = false

font = love.graphics.newFont(25)
love.graphics.setFont(font)
graine = ""
texteInputTrigger = false
utf8 = require("utf8")

function menu()
  love.graphics.setBackgroundColor(love.math.colorFromBytes(230,230,230))
  love.graphics.setColor(love.math.colorFromBytes(230,230,230))
  love.graphics.draw(nouvellePartie,200,200)
  love.graphics.draw(quitterJeu,200,300)

  if love.mouse.isDown(1) then
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
    if mouseX >= 200 and mouseX <= 600 and mouseY >= 200 and mouseY <= 260 then
      inMenu, inCreationGame = false, true
    end
  elseif mouseX >= 200 and mouseX <= 600 and mouseY >= 300 and mouseY <= 360 then
    love.event.quit()
  end
end

function newGame()
  love.graphics.clear(love.math.colorFromBytes(230,230,230))
  love.graphics.setColor(love.math.colorFromBytes(171,179,199))
  love.graphics.rectangle("line", 50, 100 , width-100, height-150,30,30,20)
  love.graphics.setColor(love.math.colorFromBytes(216,220,230,125))
  love.graphics.rectangle("fill", 51, 101, width-101, height-151, 30, 30,20)
  love.graphics.setColor(love.math.colorFromBytes(230,230,230))
  love.graphics.draw(retour,60,20)
  love.graphics.draw(creerPartie, width-500, height-125)
  love.graphics.setColor(love.math.colorFromBytes(30,30,30))
  love.graphics.print("Graine de génération :", 90, 120)
  love.graphics.rectangle("line",400,120,150,35,05,05,20)
  love.graphics.setColor(love.math.colorFromBytes(230,230,230))
  love.graphics.rectangle("fill",401,121,148,33,05,05,20)
  love.graphics.setColor(love.math.colorFromBytes(30,30,30))
  love.graphics.print(graine, 405, 125)

  if love.mouse.isDown(1) then
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
    if mouseX >=  60 and mouseX <= 460 and mouseY >= 20 and mouseY <= 80 then
      love.graphics.clear()
      inCreationGame = false
      inMenu = true
      texteInputTrigger = false
      graine =""
    elseif mouseX >= 400 and mouseX <= 650 and mouseY >= 120 and mouseY <= 155 then
      texteInputTrigger = true
    elseif mouseX >= width-500 and mouseX <= width-100 and mouseY >= height-125 and mouseY <= height-65 then
      inCreationGame = false
      texteInputTrigger = false
      inGame = true
    else
      texteInputTrigger = false
    end
  end

  function love.textinput(t)
    if texteInputTrigger then
      graine = graine..t
    end
  end
end