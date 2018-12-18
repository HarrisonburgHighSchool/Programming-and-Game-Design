# Roguelike Tutorial
###### Note: most code here is written in pseudocode, unless otherwise indicated. It will often not run if you copy and paste.
### Day 1: Character Movement & Asset Creation
Okay, so first step is to set up character movement. This should be pretty easy for you by this point, but here are some resources just in case you need a refresher.

1.) Set up a file. Every file has three functions:

```lua
function load()

end

function update()

end

function draw()

end
```

Then, you need to draw your sprite to the screen. Just put random coordinates in for now.

```lua
draw(1, 64, 64)
```
The first argument is the sprite number, the last two are 'x' and 'y' position on the screen, respectively.

Except, we don't want to have the sprite in one spot the whole time. We want to set it up so I can change the x and y coordinates using a button. First, create a variables in the 'load' function:

```lua
x = 64
y = 64
```

This code stores the number '64' in the variables 'x' and 'y'. Now, whenever you write 'x' or 'y', the code will interpret it as if you wrote '64'.

Test this out by replacing the numbers in your `draw()` function:

```lua
draw(1, x, y)
```

If you change `x = 64` to `x = 100` and run the code, you will see that your sprite moves to the right. Almost there! Now we just have to make it so that the code will change the number by itself when we hit a button. To start, add 1 to `x` whenever `update()` runs.

```lua
function update()
  x = x + 1
end
```

We know that `update()` runs every frame, so `x` will go up by 1 every frame. `x` starts at one number, but that number changes over time. Run the code to test it out.

The final step is to make it so that this update code only runs every once in a while. Namely, only when we press a button. So we need to write an `if` statement:

```lua
if button(0) then
  --increase x
end
```

You'll notice that I just put a comment in the above snippet. Go ahead and fill in the blank yourself.

So now you have a sprite that moves left! Repeat three more times changing the `x` and `y` values as needed, and you're good to go!

## Day 2a: Stats
Stats are really important in a roguelike, if for no other reason than we need to keep track of HP so that we can start the game over at some point. You can also use stats to keep track of all sorts of things. They are really easy to make. Inside your `load()` function, create a variable:

```lua
hp = 100
```

