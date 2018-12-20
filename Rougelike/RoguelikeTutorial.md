# Roguelike Tutorial
###### Note: most code here is written in pseudocode, unless otherwise indicated. It will often not run if you copy and paste.
[Day 1: Character Movement & Asset Creation](#day-1-character-movement--asset-creation)

[Day 2a: Stats](#day-2a-stats)

[Day 2b: Maps in Love2D](#day-2b-maps-in-love2d)

[Day 3: Collision Detection](#day-3-collision-detection)

[Day 4: Spawning in Random Objects](#day-4-spawn-in-objects)

## Day 1: Character Movement & Asset Creation
Okay, so first step is to set up character movement. This should be pretty easy for you by this point, but here are some resources just in case you need a refresher.

Set up a file. Every file has three functions:

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
Click [here](https://drive.google.com/file/d/1JjHnQLFnDnwRbWBLSIqwUr55jVMjUHhU/view) to view the companion video.

Stats are really important in a roguelike, if for no other reason than we need to keep track of HP so that we can start the game over at some point. You can also use stats to keep track of all sorts of things. They are really easy to make. Inside your `load()` function, create a variable:

```lua
hp = 100
```

Remember: a variable is a `word` that stores a `number`. Just now, we stored the number `100` inside the word `hp`.

Now, print that variable to the screen using the appropriate `print()` function.

Let's add a label. To do this, we will combine a number with some words. We want this:

```lua
print(HP: + hp)
```

In other words, we want to print the words "HP: " and add whatever number is stored inside `hp` to the end of it. To do this, we will concatenate the two values. Concatenate is a fancy word for "combine". Lua uses the `..` operator to concatenate. The print statement will look something like this:

```lua
print("HP: "..hp)
```

Try it out! Run the code to make sure there aren't any mistakes in your version.

We can also represent the HP in different ways. For example, you might make a health bar that gets shorter as the `hp` goes down. For that, use a `rectangle()` function:

```lua
rectangle(0, 0, hp, 10)
```

The `rectangle` function takes for arguments: `x`, `y`, `width`, and `height` respectively. Instead of using a constant for width, we put in a variable `hp`. This means that as `hp` goes down, the rectangle gets shorter. Try it out! Change the value of `hp` and see what happens to the rectangle.

Now, you will probably have more stats than just `hp`. To make it easier in the future, it's a good idea to start organizing your stats into **tables**. Like this:

```lua
player = {
  hp = 100
}
```

First, we create a table called `player`. We set it equal to a table `{}` that has a variable called `hp` inside. `hp` is set to 100. If you try to print `hp`:

```lua
print(`hp`)
```

...it will no longer work. This is because now, the program needs to look _inside_ the `player` table in order to find the `hp` variable. To tell the program to do this, we call for `player.hp` instead of just player. Try it out:

```lua
print(player.hp)
```
You'll find that your code runs fine now. Try adding some more variables to the `player` table and print them to screen:

```lua
player = {
  hp = 100,
  str = 20,
  def = 20,
  x = 60, 
  y = 64
}
```

You can add as many as you want. Just make sure you use the `player.variable` format when you try to print them!

## Day 2b: Maps in Love2D
Click [here](https://drive.google.com/file/d/1acDQ9yGcQHdcfy4TbbooX33ZbA-D5Frk/view) to view the companion video.

Maps in Love2D are a little more complicated than in Pico-8, so this is a dedicated tutorial to help you figure it out.

###### Note: This code is written correctly to run in Love2D, so feel free to copy and paste as needed.

Before you get started, make sure you have created at least two map tiles and saved them to your directory as .png files.

Our goal here is to create a template for the map so we can easily draw grid-based rooms to the screen. Later, we will set it up so that we store tile objects into a table for use when figuring out collisions.

Our template will consist of a two-dimensional table: tables within a table. Put this code into your `love.load()` function:

```lua
map = {
  {1, 0, 1, 1, 1}
 }
 ```
 
 You can see that we have a table called `map`. Inside the first position of `map`, called `map[1]`, we have another table with five values stored inside. Test this out by running the following code snippets in your `love.draw()` function, one at a time:
 
 ```lua
 love.graphics.print(map)
 ```
 
 ```lua
 love.graphics.print(map[1])
 ```
 
 ```lua
 love.graphics.print(map[1][1])
 ```
 
 What did you expect to print? What ended up printing? What would you get if you printed `map[1][2]` to the screen?
 
 We are going to use the `map` table to control what tiles end up getting drawn to the screen. Here is a completed template:
 
 ```lua
 map = {
  {1, 1, 1, 1, 1},
  {1, 0, 0, 1, 1},
  {1, 0, 0, 1, 1},
  {1, 0, 1, 1, 1},
  {1, 1, 1, 1, 1}
}
```

You can see that the template is a numerical representation of a five-by-five grid. What I would like to do is draw a map tile if the grid position has a `1` in it, and leave the space empty if it has a `0`. We will do this with a `for` loop. Put this code in your `love.draw()` function.

###### Note: Be sure to load your image into a variable called `grass` before you run this code

```lua
for i = 1, 5 do
  if map[1][i] == 1 then
    love.graphics.draw(grass, (i-1)*48, 0)
  end
end
```

This code draws the first row of the `map`. Try changing the first row to `{1, 0, 0, 0, 1}`. What do you expect it to look like?

If we want to draw a 2-dimensional map, we need another `for` loop:

```lua
for y = 1, 5 do
  for x = 1, 5 do
    if map[y][x] == 1 then
      love.graphics.draw(grass, (x-1)*48, (y-1)*48)
     end
   end
end
```

Now we have drawn the whole map to the screen. If we want to add more kinds of tiles, all we have to do is add another number to the table, and add another `if` statement to the `love.draw()` code. Try to figure it out yourself!

## Day 3: Collision Detection

###### Note: Just a reminder that much of this code will not run correctly unless otherwise specified. Please translate the code snippets into the appropriate syntax based on your programming paradigm.

Click [here](https://drive.google.com/file/d/1Mo1fSmjF8qKv3bCf4EbD6vtoJ69oRyGZ/view) to view the companion video.

Collision detection will be the basis of all interactions in our game. Collision detection lets us fight enemies, pick up items, unlock doors, and do all sorts of other stuff. It is really important that you understand how this works so that you can set up these interactions in this and future games.

At this point, you should have a `player` table full of different attributes. Here is an example:
```lua
player = {
  x = 100,
  y = 100,
  w = 8, 
  h = 8,
  img = "filename"
}
```
Next, you need to create similar tables for all the other things in your game. Coins, items, enemies, and NPCs should all have their own table. Here's an example of a table for a coin:
```lua
coin = {
  x = 200,
  y = 100,
  w = 8,
  h = 8,
  value = 5,
  img = "filename"
}
```
I've added a `value` attribute which will be the number of points my coin is worth. Now the basic idea of collision detection is that we want to sense whether or not two rectangles are overlapping. If they are, we know that the two objects are overlapping. Then, we do something else based on this overlapping (make `player.hp` go down, make `player.score` go up, etc.).

To do this, we will use a special function:
###### Note: You may copy and paste this code after your `draw()` function.
```lua
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
```
This function takes in information from two rectangles (`x1`, `y1`, `w1`, `h1`, `x2`, `y2`, `w2`, `h2`) and then gives us a true or false answer. True if the rectangles are overlapping, and false if they aren't.

`CheckCollision()` is a function. This means that once we define it with the above code, we can type `CheckCollision(...)` and the program will jump down to the definition and run the code stored inside `CheckCollision`. Just like how variables are words that store numbers, functions are words that store snippets of code.

Because `CheckCollision()` returns `true` or `false` based on whether or not the two rectangles are overlapping, we can use it in an `if` statement. Put this code in your `draw()` function:
```lua
if CheckCollision(10, 10, 10, 10, 15, 15, 10, 10) then
  print("overlapping")
end
```
What do you think will happen when you run it? Can you make it return `false` by changing the arguments inside `CheckCollision()`?

Now our goal is to do something if the `player` and the `coin` are overlapping. This means two things: we need to write an `if` statement that checks if the `player` and `coin` are overlapping, and then we need to write some code that will enact what we want to happen. Here's step one:
```lua
if CheckCollision(player.x, player.y, player.w, player.h,   coin.x, coin.y, coin.w, coin.h) then
  --do something
end
```
What should we put inside the `if` statement? What do you want to happen if the `player` and `coin` are overlapping? Here's a hint, in the form of a new attribute inside `player`:
```lua
player = {
  x = 100, 
  y = 100, 
  w = 8, 
  h = 8,
  img = "filename",
  score = 0
}
```
Write some code and see if it works.

Now in most games, if you collect the coin it will disappear. In our game right now, it stays in place and the code inside the `if` statement will run over and over again. Instead, let's make the coin disappear. First, add a new attribute to `coin`:
```lua
coin = {
  x = 200, 
  ...
  ...
  exists = true
}
```
The attribute called `exists` will keep track of whether or not the coin should still appear on screen. Before we collect the coin, `exists` should be set to true. After we collect the coin, `exists` should flip to false.

Now let's write some code to make it work this way. First, we only want to draw the coin if `exists` is set to `true`.
```lua
function draw()
  if coin.exists == true then
    draw(coin.img, coin.x, coin.y)
  end
end
```
This `if` statement makes it so that if `coin.exists` is set to `false`, the coin will no longer be drawn to the screen.

Next, we only want to check for collisions if the coin is still on the screen. So we need to enclose the `CheckCollisions()` statement inside of another `if` statement. It will look something like this:
```lua
if coin.exists == true then
  if CheckCollision(...
    ...
    coin.exists = false
    --don't forget to set coin.exists to false after the player overlaps it!
  end
end
```
These two pieces of code work together to make it so that the coin "disappears" after the player overlaps it.

You will want to do something similar for enemies. However, instead of increasing a score, you probably want a value called `player.hp` to go down when the enemy is overlapping with the player. Start by making a new table:
```lua
enemy = {
  x = 20,
  y = 20,
  w = 8,
  h = 8, 
  img = "filename",
}
```
Next, add the appropriate code. Apply what you learned creating a `coin` so you can make `player.hp` decrease when `player` overlaps with `enemy`.

## Day 4: Spawn In Objects

Click [here](https://drive.google.com/file/d/1RNNRh1e7jT-t89Z4FTVYwvBac3r60rmJ/view) to view the companion video.

Now that you have created some coins and you know how to pick them up, it's time to start talking about spawning them in randomly. This is both pretty tricky to understand, and at the same time easy to set up. The first step is to find your `coin` object.

```lua
coin = {
  x = 64,
  y = 64,
  w = 3,
  h = 3,
  sp = 2
}
```

Your coin might look slightly different than mine. That's okay. The first step here is to make it so that the coin doesn't spawn in the same place every time. If I draw the coin right now:

```lua
spr(coin.sp, coin.x, coin.y)
```

It will always appear at 64, 64. Every time, no matter what. We want it to appear at a different spot every time we run the game. To do that, we need to set the coordinates of coin to a **random number**. Here's how to do it in Pico-8:

```lua
coin = {
  x = rnd(0, 128),
  y = rnd(0, 128)
}
```

...and here's how to do it in Love2D:

```lua
coin = {
  x - love.math.random(0, 800),
  y = love.math.random(0, 600)
}
```

Now run some code that draws your code to the screen. Observe where the coin is drawn, and then run the code again. It should be in a different place. Cool, right?

Now that's great for drawing one coin, but what if we wanted to draw more than one at a random location? That makes things a little more complicated. 

Right now, we are creating one `coin` object, with it's own set of attributes. What we need to do is make it so that we can make unlimited numbers of them without writing a large numbers of new coin tables. The first step to accomplish this is to create a function that creates a new coin. It's pretty straightforward:

```lua
function coinCreate()
  local coin = {
    x = rnd(0, 128),
    y = rnd(0, 128)
  }
  return coin
}
```

The middle part should look familiar: we are creating a table called `coin`, just the same as before. The stuff around it is new. What we are doing is **declaring a function**. A function is like a variable, but instead of storing a number it stores code. Inside the function called `coinCreate()`, we store the code that creates the coin and then we `return` the coin. This means that when we **call** `coinCreate()`, what we get is a table called `coin`. It's a little tricky to understand, but here's what it looks like in practice.

```lua
newCoin = coinCreate()
print(newCoin.x)
```

What does `newCoin.x` equal? Well, it equals the random number we created inside the `coinCreate()` function. Now we can create lots of coins by writing code like this in the `load()` function:

```lua
coin1 = coinCreate()
coin2 = coinCreate()
coin3 = coinCreate()
```

...and I can draw them to the screen by putting this code into my `draw()` function:

```lua
spr(coin1.img, coin1.x, coin1.y)
spr(coin2.img, coin2.x, coin2.y)
spr(coin3.img, coin3.x, coin3.y)
```

That works great. Run the code again, and your coins will be in different spots on the screen. Very awesome.

But we can do even better. Let's store 10 coins into their own table:

```lua
coins = {}
for i = 1, 10 do
  coins[i] = coinCreate()
end
```

Now we could draw one coin like this:

```lua
spr(coins[1].img, coins[1].x, coins[1].y)
```

Or we could draw all 10 coins at once like this:

```lua
for i = 1, 10 do
  spr(coins[i].img, coins[i].x, coins[i].y)
end
```

Now we are in a situation where we can easily create and draw as many randomly-placed coins as we like. Now that just leaves us with the not-small issue of collision detection on all of these coins. We should do it with another `for` loop like this:

```lua
for i = 1, 10 do
  if coin[i].exists == true then
    if CheckCollision(player.x, player.y, player.w, player.h, coin[i].x, coin[i].y, coin[i].w, coin[i].h) then
      coin[i].exists = false
      score = score + 1
     end
   end
 end
 ```
 
 And then, draw the coins like this (the same way we did in the collision detection tutorial, except with a `for` loop).
 
```lua
for i = 1, 10 do
  if coin[i].exists == true then
    spr(coin[i].img, coin[i].x, coin[i].y)
  end
end
```

So after all that, we can create any number of randomly placed coins, and we can also pick them up. Try it with enemies now!
