function love.load()
  require "enemies"

  bob = Enemies:Create()

  kate = Enemies:Create()

end


function love.update()
  if love.keyboard.isDown('b') then
    bob:Fight(kate)
  end
  if love.keyboard.isDown('k') then
    kate:Fight(bob)
  end

end


function love.draw()
  love.graphics.print("Bob Health: " .. bob.health, 400, 300)
  love.graphics.print("Kate Health: " .. kate.health, 400, 350)

end
