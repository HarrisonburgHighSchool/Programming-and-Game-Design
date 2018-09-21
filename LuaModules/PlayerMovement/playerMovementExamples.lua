--NOTE: THIS CODE DOES NOT WORK BY ITSELF. YOU MUST INTEGRATE IT INTO YOUR GAME

player = {} --this variable needs to be created before you can set the player position. Make one for every character that moves on screen.
            --You can also put it in a separate module if you want (see Classes tutorial)

function love.load()

  --These functions are attributes stored inside "player". 
  --They need to be stored in love.load() so that the player has a starting point in the game.
  --You can change it later, though.
  
  player.x = 400      --set starting x
  player.y = 300      -- set starting y
  player.speed = 200  --this is how fast the player will move when the movement buttons are pressed
  
end

function love.update(dt) --Bring in dt to keep track of how much time has passed since the last update

  --This code senses what buttons are being pressed, and then changes the attributes stored inside "player"
  
  if love.keyboard.isDown('d') then              -- Listening for "d"
    player.x = player.x + (player.speed * dt)    -- The player moves to the right.
  elseif love.keyboard.isDown('a') then          -- Listening for "a"
  	player.x = player.x - (player.speed * dt)    -- The player moves to the left.
  end

end

function love.draw()

  --Then, we take the new "player" values and use them to draw the sprite
  love.graphics.draw(sprite, player.x, player.y)
  
end
