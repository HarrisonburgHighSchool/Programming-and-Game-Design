game = 1
north = 0
south = 0
center = 1
while game == 1:
    while center == 1:
        print("You are in the center.")
        response = input("What would you like to do?")
        if response == "north":
            center = 0
            south = 0
            north = 1
        elif response == "south":
            center = 0
            north = 0
            south = 1
        elif response == "stay here":
            center = 1
            north = 0
            south = 0

    while south == 1:
        print("You are in the south.")
        response = input("What would you like to do?")
        if response == "north":
            center = 0
            south = 0
            north = 1
        elif response == "south":
            center = 0
            north = 0
            south = 1
        elif response == "stay here":
            center = 1
            north = 0
            south = 0
        
    
    while north == 1:
        print("You are in the north.")
        response = input("What would you like to do?")
        if response == "north":
            center = 0
            south = 0
            north = 1
        elif response == "south":
            center = 0
            north = 0
            south = 1
        elif response == "stay here":
            center = 1
            north = 0
            south = 0
        

print("Game Over")
