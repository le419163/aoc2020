# import secrets
# import tkinter as tk

# slot1 = [1,1,1,2,2,3,3,4,4,4,4]
# slot2 = [1,1,2,2,2,3,3,4,4,4,4]
# slot3 = [1,1,1,2,3,3,3,4,4,4,4]
# v1 = 0
# v2 = 0
# v3 = 0
# result = ''
# label = tk.Label()

# def spin():
#     # spin each slot with spinning animation
#     # decide a random spot to stop on each slot
#     # display each result on the screen
#     v1 = secrets.choice(slot1)
#     v2 = secrets.choice(slot2)
#     v3 = secrets.choice(slot3)
#     result ='||' + str(v1) + '||' + str(v2) + '||' + str(v3) + '||'
#     label["text"] = result

# def gui():
#     v1 = secrets.choice(slot1)
#     v2 = secrets.choice(slot2)
#     v3 = secrets.choice(slot3)
#     result = str(v1) + ' ' + str(v2) + '' + str(v3)
    
#     window = tk.Tk()
#     frame = tk.Frame()
#     frame.pack()
#     button = tk.Button(text="Spin!",width=25,height=5,master=frame,command=spin)
#     button.pack()
#     label = tk.Label(master=frame, text=str(result))
#     label.pack()
#     window.mainloop()


# gui()

import random
import tkinter as tk

def roll():
    lbl_result["text"] = str(random.randint(1, 6))

window = tk.Tk()
window.columnconfigure(0, minsize=150)
window.rowconfigure([0, 1], minsize=50)

btn_roll = tk.Button(text="Roll", command=roll)
lbl_result = tk.Label()

btn_roll.grid(row=0, column=0, sticky="nsew")
lbl_result.grid(row=1, column=0)

window.mainloop()
