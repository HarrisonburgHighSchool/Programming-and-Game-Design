

function love.load()
  require "Block"
    -- TITLE SCREEN / MENU --
    titlebg = love.graphics.newImage("imageassets/desktop.png")

    BLOCKRED = Block:SetValues("normal", 0, 0,"imageassets/block_red(NEW).png",32,32)
    BLOCKRED.anim = newAnimation(BLOCKRED.img, BLOCKRED.w, BLOCKRED.h, 1)

end










function love.update(dt)
  BLOCKRED:Timeupdate(dt)

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



    BLOCKRED:Draw()

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
