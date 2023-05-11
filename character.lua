character = {}
metaCharacter = {}
metaCharacter.__index = character

function character.create()
  local instance = setmetatable({}, metaCharacter)
  instance.positionX = 0
  instance.positionY = 0
  instance.type = "normal"
  instance.image = nil
  instance.health = 10
  instance.stamina = 25
  instance.mana = 25
  return instance
end

function character:position()
  playerPositionX = self.positionX
  playerPositionY = self.positionY
end

normalFramesFront = {"Graphics/Personnage/Front/normalFront0.png","Graphics/Personnage/Front/normalFront1.png","Graphics/Personnage/Front/normalFront2.png","Graphics/Personnage/Front/normalFront3.png"}
normalFramesBack = {"Graphics/Personnage/Back/normalBack0.png","Graphics/Personnage/Back/normalBack1.png","Graphics/Personnage/Back/normalBack2.png","Graphics/Personnage/Back/normalBack3.png"}
normalFramesLeft = {"Graphics/Personnage/Left/normalLeft0.png","Graphics/Personnage/Left/normalLeft1.png","Graphics/Personnage/Left/normalLeft2.png","Graphics/Personnage/Left/normalLeft3.png"}
normalFramesRight = {"Graphics/Personnage/Right/normalRight0.png","Graphics/Personnage/Right/normalRight1.png","Graphics/Personnage/Right/normalRight2.png","Graphics/Personnage/Right/normalRight3.png"}
normalFramesList = {normalFramesFront,normalFramesBack,normalFramesLeft,normalFramesRight}

frame = 1
elapsedFrames = 0
function character:setFrames()
  if self.type == "normal" then
    if moving then
      self.image = love.graphics.newImage(normalFramesList[direction][frame])
      elapsedFrames = elapsedFrames + 1
      if elapsedFrames % 20 == 0 then
        frame = frame +1
        elapsedFrames = 0
      end
      if frame == 5 then
        frame = 1
      end
    else
      self.image = love.graphics.newImage(normalFramesList[direction][1])
    end
  end
end

function character:display()
  love.graphics.draw(self.image, self.positionX, self.positionY)
end
character1 = character.create()
character1:setFrames()
character1:display()
character1:position()
print(playerPositionX, playerPositionY)