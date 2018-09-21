function love.load()
  --Load the hero animation
  hero = newAnimation(love.graphics.newImage("oldHero.png"), 16, 18, 1) --The frames in oldHero.png is 16 pixels wide and 18 pixels tall
end

function love.update(dt)

  --Animation code
  hero.currentTime = hero.currentTime + dt
   if hero.currentTime >= hero.duration then
       hero.currentTime = hero.currentTime - hero.duration
   end

end

function love.draw()


  --Draw the hero
  local spriteNum = math.floor(hero.currentTime / hero.duration * #hero.quads) + 1
  love.graphics.draw(hero.spriteSheet, hero.quads[spriteNum], 0, 0, 0, 4)

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
