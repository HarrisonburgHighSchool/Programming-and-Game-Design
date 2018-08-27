from Tkinter import *

def callback():
    w.coords(rect, 75, 75, 200, 200)

root = Tk()

b = Button(root, text="OK", command=callback)
w = Canvas(root, width=1080, height=720)
b = Button(root, text = "Quit", command = callback, anchor = W)
b.configure(width = 10)
b_window = w.create_window(10, 10, anchor=NW, window=b)
w.pack()



rect = w.create_rectangle(25, 25, 0, 0, fill="black")



mainloop()
