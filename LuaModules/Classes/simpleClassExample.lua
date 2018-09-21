
Tile = {}

function Tile:Create()
  local tile = {
    id,
    x = 0,
    y = 0,
    img = love.graphics.newImage("Grass Tile Placeholder.png"),
    type = "grass"
  }
  return tile
end
