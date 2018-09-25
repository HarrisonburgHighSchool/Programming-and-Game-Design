--function blocktemplate()
--[[function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animation.duration = duration or 1
    animation.currentTime = 0

    return animation
end



BLOCKRED.anim.currentTime = BLOCKRED.anim.currentTime + dt
if BLOCKRED.anim.currentTime >= BLOCKRED.anim.duration then
    BLOCKRED.anim.currentTime = BLOCKRED.anim.currentTime - BLOCKRED.anim.duration
end

local BLOCKREDNum = math.floor(BLOCKRED.anim.currentTime / BLOCKRED.anim.duration * #BLOCKRED.anim.quads) + 1]]



Block = {}
Block.__index = Block



function Block:SetValues(blockType, xCoord, yCoord, imgImport, width, height)
  local block = {
    type = blockType,
    x = xCoord,
    y = yCoord,
    img = love.graphics.newImage(imgImport),
    w = width,
    h = height,
    anim,
  }
--[[
  for y = 0, self.img:getHeight() - height, height do
      for x = 0, self.img:getWidth() - width, width do
          table.insert(self.anim.quads, love.graphics.newQuad(self.x, self.y, self.width, self.height, self.img:getDimensions()))
      end
  end
  self.duration = duration or 1
  self.anim.currentTime = 0
  ]]

  setmetatable(block, Block)
  return block

end




function Block:Timeupdate(dt)
  self.anim.currentTime = self.anim.currentTime + love.timer.getDelta()
  if self.anim.currentTime >= self.anim.duration then
      self.anim.currentTime = self.anim.currentTime - self.anim.duration
  end
end

function Block:Draw()
  local blockNum = math.floor(self.anim.currentTime / self.anim.duration * #self.anim.quads) + 1
  love.graphics.draw(self.img, self.anim.quads[blockNum], self.x, self.y, 0, 1)
end

--[[block.type = {
normal,
receiver,
}

-- X value ; 0 is moving, 1 is when block has set--
block.x = {
  player,
  blockset
}

-- Y value ; 0 is moving, 1 is when block has set--
block.y = {
  player = {
    y,
    x
  }
}
--red is 0, green is 1, purple is 2, orange is 3--
--[[block.img = {
redblockanimation = newAnimation(love.graphics.newImage("imageassets/block_red(NEW).png"),32, 32, 1),
greenblockanimation = newAnimation(love.graphics.newImage("imageassets/block_green(NEW).png"),32, 32, 1),
purpleblockanimation = newAnimation(love.graphics.newImage("imageassets/block_purple(NEW).png"),32, 32, 1),
orangeblockanimation = newAnimation(love.graphics.newImage("imageassets/block_orange(NEW).png"),32, 32, 1),
--
--Receiver blocks, red is 4, green is 5, purple is 6, orange is 7--
--
Rredblockanimation = newAnimation(love.graphics.newImage("imageassets/block_red(NEW).png"),32, 32, 1),
Rgreenblockanimation = newAnimation(love.graphics.newImage("imageassets/block_green(NEW).png"),32, 32, 1),
Rpurpleblockanimation = newAnimation(love.graphics.newImage("imageassets/block_purple(NEW).png"),32, 32, 1),
Rorangeblockanimation = newAnimation(love.graphics.newImage("imageassets/block_orange(NEW).png"),32, 32, 1)
}]]
--end]]
--return block
