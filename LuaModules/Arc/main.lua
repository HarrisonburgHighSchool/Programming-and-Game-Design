

function love.load()
  require "Block"
  require "blockClass"
    -- TITLE SCREEN / MENU --
    titlebg = love.graphics.newImage("imageassets/desktop.png")
    --title = love.graphics.newImage("imageassets/Title (1).png")
    --playb = love.graphics.newImage("imageassets/Play_button.png")
    --blockanimation = newAnimation(love.graphics.newImage("imageassets/block_red(NEW).png"),32, 32, 1)

    --circleanimation = newAnimation(love.graphics.newImage("imageassets/circleanimm.png"),55, 30, 1)
    --celanimation = newAnimation(love.graphics.newImage("imageassets/Celeste(moving).png"),128, 128, 1)
    --vivianimation = newAnimation(love.graphics.newImage("imageassets/sprite_Vivi1.png"),128, 128, 2)
    -- PLAYER AND BOARD --
    blank_spot = {}
    blank_spot.x = 0
    blank_spot.y = 0
    -- PLAYER CONTROLLED BLOCK--
    player = {}
    player.x = love.graphics.getWidth() / 3.5
    player.y = love.graphics.getHeight() / 8

    -- BLOCK set coordinates --
    blockset = {}
    blockset.x = 0
    blockset.y = 0


    --BOARD--
    board = {}
      board.img = love.graphics.newImage("imageassets/BOARD.png")
      board.x = love.graphics.getWidth() / 3.5
      board.y = love.graphics.getHeight() / 8
    player.img = love.graphics.newImage("imageassets/block_green.png")

    BLOCKRED = Block:SetValues("normal", 0, 0,"imageassets/block_red(NEW).png")
    BLOCKRED.anim = newAnimation(BLOCKRED.img, BLOCKRED.w, BLOCKRED.h, 1)




    --world = block:drop(0, 0)
    --testBlock = Block:CreateBlock()

    --BLOCKRED.quad = newAnimation(BLOCKRED.img,32, 32, 1)

    --[[require "block"
    world = block:drop(0, 0)
    BLOCKGREEN = block:SetValues("normal", 0, 0, love.graphics.newImage("imageassets/block_green(NEW).png"),32, 32, 1)
    BLOCKGREENANIM = newAnimation(BLOCKGREEN.img,32, 32, 1)

    require "block"
    world = block:drop(0, 0)
    BLOCKORANGE = block:SetValues("normal", 0, 0, love.graphics.newImage("imageassets/block_orange(NEW).png"),32, 32, 1)
    BLOCKORANGEANIM = newAnimation(BLOCKORANGE.img,32, 32, 1)

    require "block"
    world = block:drop(0, 0)
    BLOCKPURPLE = block:SetValues("normal", 0, 0, love.graphics.newImage("imageassets/block_purple(NEW).png"),32, 32, 1)
    BLOCKPURPLEANIM = newAnimation(BLOCKPURPLE.img,32, 32, 1)]]
end









--animation funcs
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
function animationUpdate(animation, dt)
  animation.currentTime = animation.currentTime + dt
  if animation.currentTime >= animation.duration then
      animation.currentTime = animation.currentTime - animation.duration
  end
end
function animationDraw(animation, x, y, r, s)
  local animationNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
  love.graphics.draw(animation.spriteSheet, animation.quads[animationNum], x, y, r, s)
end]]









function love.update(dt)
  BLOCKRED:Timeupdate(dt)
  --  celanimation.currentTime = celanimation.currentTime + dt
  --  if celanimation.currentTime >= celanimation.duration then
  --      celanimation.currentTime = celanimation.currentTime - celanimation.duration
  --  end
  --  vivianimation.currentTime = vivianimation.currentTime + dt
  --  if vivianimation.currentTime >= vivianimation.duration then
  --      vivianimation.currentTime = vivianimation.currentTime - vivianimation.duration
  --  end
  --  circleanimation.currentTime = circleanimation.currentTime + dt
  --  if circleanimation.currentTime >= circleanimation.duration then
  --      circleanimation.currentTime = circleanimation.currentTime - circleanimation.duration
  --  end
  --  blockanimation.currentTime = blockanimation.currentTime + dt
  --  if blockanimation.currentTime >= blockanimation.duration then
  --      blockanimation.currentTime = blockanimation.currentTime - blockanimation.duration
  --  end

    --[[BLOCKRED.quad.currentTime = BLOCKRED.quad.currentTime + dt
    if BLOCKRED.quad.currentTime >= BLOCKRED.quad.duration then
        BLOCKRED.quad.currentTime = BLOCKRED.quad.currentTime - BLOCKRED.quad.duration
    end]]

end
--MOVEMENT--


function love.keypressed(key)
    if key == "down" then
      player.y = player.y + 32

    elseif key == "left" then
      player.x = player.x - 32
    elseif key == "right" then
      player.x = player.x + 32
    end
end



function love.draw()



    love.graphics.draw(titlebg)
    --love.graphics.draw(playb, 265, 360, 0, 1.1)
    --love.graphics.draw(title, 200, 40, 0, .75)

    love.graphics.draw(board.img, board.x, board.y)

    --love.graphics.draw(BLOCKRED.img, 400, 300)

    --Class implementation
    BLOCKRED:Draw()
    --BLOCKGREEN:draw()

    --love.graphics.draw(BLOCKRED.img, 400, 300)

end

function newAnimation(image, width, height, duration)
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
