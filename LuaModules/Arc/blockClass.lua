Block = {}

Block.__index = Block

function Block:CreateBlock()
  local block = {
    type = "normal",
    img,
    x = player.x,
    y = player.y,
    h = 32,
    w = 32,
    anim,
  }
  setmetatable(block, Block)
  return block
end
