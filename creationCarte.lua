require "keyboard"

tailleBlock = 64
tailleCarteX = 64
tailleCarteY = 64
isMapCreated = false
mapOriginX = 0
mapOriginY = 0
mapBorderX = {0,64}
mapBorderY = {0,64}

waterTexture = love.graphics.newImage("Graphics/Blocs/eau0.png")
wetSandTexture = love.graphics.newImage("Graphics/Blocs/sable1.png")
sandTexture = love.graphics.newImage("Graphics/Blocs/sable0.png")
rockFloorTexture = love.graphics.newImage("Graphics/Blocs/montagne0.png")
snowFloorTexture = love.graphics.newImage("Graphics/Blocs/neige0.png")
grassFloorTexture = {
  love.graphics.newImage("Graphics/Blocs/herbe0.png"),
  love.graphics.newImage("Graphics/Blocs/herbe1.png"),
  love.graphics.newImage("Graphics/Blocs/herbe2.png")
}
water = love.graphics.newSpriteBatch(waterTexture,1)
wetSand = love.graphics.newSpriteBatch(wetSandTexture,1)
sand = love.graphics.newSpriteBatch(sandTexture,1)
grassFloor = {
  love.graphics.newSpriteBatch(grassFloorTexture[1],1),
  love.graphics.newSpriteBatch(grassFloorTexture[2],1),
  love.graphics.newSpriteBatch(grassFloorTexture[3],1)
}
rockFloor = love.graphics.newSpriteBatch(rockFloorTexture,1)
snowFloor = love.graphics.newSpriteBatch(snowFloorTexture,1)

noiseGrid = {}
function generateNoiseGrid()
  local baseX = graine
  local baseY = graine
  for y = mapOriginY, tailleCarteY do
    noiseGrid[y] = {}
    for x = mapOriginX, tailleCarteX do
      noiseGrid[y][x] = love.math.noise(baseX+0.01*x, baseY+0.01*y)
    end
  end
end

function generateMap()
  for y=mapOriginY,#noiseGrid do
    for x=mapOriginX,tailleCarteX do
      noise = noiseGrid[y][x]
      if noise < 0.3 then
        water:add(x*tailleBlock,y*tailleBlock)
      elseif noise > 0.3 and noise < 0.33 then
        wetSand:add(x*tailleBlock,y*tailleBlock)
      elseif noise > 0.33 and noise < 0.38 then
        sand:add(x*tailleBlock, y*tailleBlock)
      elseif noise > 0.38 and noise < 0.8 then
        randomizer = love.math.random(1,3)
        grassFloor[randomizer]:add(x*tailleBlock,y*tailleBlock)
      elseif noise > 0.8 and noise < 0.94 then
        rockFloor:add(x*tailleBlock,y*tailleBlock)
      elseif noise > 0.94 then
        snowFloor:add(x*tailleBlock,y*tailleBlock)
      end
    end
  end
  isMapCreated = true
end

function otherChunksCreator()
  print("not moving")
  if moving then
    print(playerPositionX, mapBorderX[1], mapBorderX[2], playerPositionY, mapBorderY[1], mapBorderY[2])
    test = true
    if playerPositionX == mapBorderX[1] and test then
      noiseGrid = {}
      print("new chunk generated")
      test = false
      isMapCreated = false
      graine = love.math.random(1,1000)
      print(graine)
      mapOriginX = mapOriginX - 64
      mapBorderX[1] = mapBorderX[1] - 64
      mapOriginY = 0
    elseif playerPositionX == mapBorderX[2] and test then
      noiseGrid = {}
      print("new chunk generated")
      test = false
      isMapCreated = false
      graine = love.math.random(1,1000)
      print(graine)
      mapOriginX = mapOriginX + 64
      mapBorderX[2] = mapBorderX[2] + 64
      mapOriginY = 0
    elseif playerPositionY == mapBorderY[1] and test then
      noiseGrid = {}
      print("new chunk generated")
      test = false
      isMapCreated = false
      graine = love.math.random(1,1000)
      print(graine)
      mapOriginX = 0
      mapBorderY[1] = mapBorderY[1] - 64
      mapOriginY = mapOriginY - 64
    elseif playerPositionY == mapBorderY[2] and test then
      noiseGrid = {}
      print("new chunk generated")
      test = false
      isMapCreated = false
      graine = love.math.random(1,1000)
      print(graine)
      mapOriginX = 0
      mapBorderY[2] = mapBorderY[2] + 64
      mapOriginY = mapOriginY + 64
    end
  end
end

function displayMap()
  love.graphics.draw(water, offsetX, offsetY)
  love.graphics.draw(wetSand, offsetX, offsetY)
  love.graphics.draw(sand, offsetX, offsetY)
  love.graphics.draw(grassFloor[1], offsetX, offsetY)
  love.graphics.draw(grassFloor[2], offsetX, offsetY)
  love.graphics.draw(grassFloor[3], offsetX, offsetY)
  love.graphics.draw(rockFloor, offsetX, offsetY)
  love.graphics.draw(snowFloor, offsetX, offsetY)
  otherChunksCreator()
end