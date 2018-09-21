--[[
INSTRUCTIONS: PLEASE READ

This code is supposed to let a character walk all the way across the screen, but it doesn't work! Fix it so it runs successfully.

You can look at your project or at online examples/resources for help, but you may not work together.

If you need a hint, raise your hand

MINIMUM REQUIREMENT:  Edit the code so it runs correctly
MEETS EXPECTATIONS:   Edit the code so it meets the design parameters (see above)
EXCEEDS EXPECTATIONS: Edit the code so it runs correctly, meets design specifications, and improves upon them

]]

player = {}
function love.load()
  --Load the hero animation
  hero = newAnimation(love.graphics.newImage("oldHero.png"), 16, 14, 1) --The frames in oldHero.png is 16 pixels wide and 18 pixels tall

  --Load the cactus asset
  cactus = love.graphics.newImage(Cactus.png)

  --Set the hero's coordinates
  player.x = 392
	player.y = 403
  player.speed = 20
end

function love.update(dt)
  --Animation code
  hero.currentTime = hero.currentTime + dt
   if hero.currentTime >= hero.duration then
       hero.currentTime = hero.currentTime - hero.duration
   end

   --Movement code
   if love.keyboard.isDown('d') and player.x < 500 then
    player.x = player.x + (player.speed * dt)

  elseif love.keyboard.isDown('a') and player.x > 200 then
    player.x = player.x - (player.speed * dt)
  end
end

function love.draw()
  --Draw the ground
  love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', 0, 470, 800, 130)

  --Draw the hero
  local spriteNum = math.floor(hero.currentTime / hero.duration * #hero.quads) + 1
  love.graphics.draw(hero.spriteSheet, hero.quads[spriteNum], player.x, player.y, 0, 4)

  --Draw the Cactus
  love.graphics.draw("Cactus.png", 500, 350, 0, 5)
end

function newAnimation(image, width, height, duration)
    local hero = {}
    hero.spriteSheet = image;
    hero.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(hero.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    hero.duration = duration or 1
    hero.currentTime = 0

    return hero
end
