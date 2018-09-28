Enemies = {}
Enemies.__index = Enemies

function Enemies:Create()
  local enemy = {
    health = 100,
    attack = 1
  }
  setmetatable(enemy, Enemies)
  return enemy
end

function Enemies:Fight(target)
  target.health = target.health - self.attack
end
