require "camera"

function love.load()

end

function love.update(dt)
  --Here are some example functions
  camera.x = 50
  camera.y = 100
  camera:scale(3) -- zoom by 3
end


function love.draw()
  --When using a camera, always start your draw function with setting the camera
  camera:set()

  -- draw stuff

  --Then, unset the camera so you can update its attributes
  camera:unset()
end
