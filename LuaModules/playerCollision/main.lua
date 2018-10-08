local bump       = require 'bump'


local cols_len = 0 -- how many collisions are happening

-- World creation
local world = bump.newWorld()



-- Player functions
local player = { x=50,y=50,w=20,h=20, speed = 80 }

--Player control function
local function updatePlayer(dt)
  local speed = player.speed

  local dx, dy = 0, 0
  if love.keyboard.isDown('right') then
    dx = speed * dt
  elseif love.keyboard.isDown('left') then
    dx = -speed * dt
  end
  if love.keyboard.isDown('down') then
    dy = speed * dt
  elseif love.keyboard.isDown('up') then
    dy = -speed * dt
  end

  if dx ~= 0 or dy ~= 0 then
    local cols
    player.x, player.y, cols, cols_len = world:move(player, player.x + dx, player.y + dy)
  end
end

local block = {
  x = 400,
  y = 300,
  w = 25,
  h = 300
}

-- Main LÖVE functions

function love.load()
  world:add(player, player.x, player.y, player.w, player.h)

  world:add(block, block.x,block.y,block.w,block.h)
end

function love.update(dt)
  cols_len = 0
  updatePlayer(dt)
end

function love.draw()
  love.graphics.rectangle("line", block.x, block.y, block.w, block.h)
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end
