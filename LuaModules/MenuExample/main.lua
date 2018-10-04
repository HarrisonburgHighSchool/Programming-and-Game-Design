function love.load()
  items = {"Attack", "Block"}
  font = love.graphics.newFont(28)
  love.graphics.setFont(font)
end


function love.update()

end


function love.draw()
  menuDraw(items)
end

function menuDraw(item)
  local size = table.getn(item)

  for i = 1, size, 1 do
    love.graphics.print(item[i], 400, (i*50))
  end
  --[[love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", 350, 280, 300, 100)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(item[1], 400, 300)
  love.graphics.print(item[2], 400, 350)
  love.graphics.print(item[3], 400, 400)
  love.graphics.print(item[4], 400, 450)]]

end
