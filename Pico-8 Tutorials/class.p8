pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init()
	pl = player:create()
	en = player:create()
end


function _update()

end


function _draw()
	cls()
	spr(pl.sp, 64, 52)
	spr(en.sp, 40, 52)
	print(pl.hp, 62, 64)
	print(en.hp, 38, 64)
end
-->8
player = {}
player.__index = player

function player:create()
	local pl = {
		x = 10,
		y = 10,
		hp = 100,
		sp = 1
	}
	setmetatable(pl, player)
	return pl
end
__gfx__
00000000cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccceeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000