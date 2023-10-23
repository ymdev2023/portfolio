import tkinter as tk
import time
from datetime import datetime
import pygame.mixer
import random
import pyautogui


def show_label():
    global show_time
    show_time = time.time()
    root.attributes('-topmost', True)
    root.deiconify()
    label.pack()


def play_sound():
    pygame.mixer.init()
    sound = pygame.mixer.Sound("sound.mp3")
    sound.play()


def hide_window(event):
    global show_time
    hide_time = time.time()
    time_diff = hide_time - show_time
    round_time_diff = round(time_diff, 5)
    with open(f"{username}.txt", "a", encoding='utf-8') as f:
        f.write(f"{round_time_diff}\n")
    root.withdraw()
    pyautogui.moveTo(screen_width/2, screen_height/2)
    pyautogui.click()


def show_label_periodically(interval, repetitions, random_range):
    random_time = []
    for i in range(repetitions):
        random_time.append(random.randint(1, random_range))
    sum_time = sum(random_time)
    for i in range(1, repetitions+1):
        # root.after(interval * i * 1000, lambda: root.deiconify())
        root.after(((interval * i)+random_time[i-1]) * 1000, play_sound)
        time.sleep(0.5)
        root.after(((interval * i)+random_time[i-1]) * 1000, show_label)
        # root.after(interval * i * 1000, lambda: root.withdraw())
        if i == 1:
            root.after((interval*repetitions+sum_time+5)
                       * 1000, lambda: [root.destroy()])


def bind_hide_window(event):
    root.bind("<Button-1>", lambda event: hide_window(event))
    root.bind("<space>", lambda event: hide_window(event))


# main 함수
username = "username_3reps"
root = tk.Tk()
root.withdraw()
root.overrideredirect(True)
root.geometry("+%d+%d" % ((root.winfo_screenwidth() - 150) / 2,
                          (root.winfo_screenheight() - 130) / 2))

# 화면 크기 가져오기
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()


# root.after(5000, lambda: root.deiconify())

label = tk.Label(root, text="비상", bg='white',
                 font=('Helvetica', 60))

show_label_periodically(25, 3, 10)

bind_hide_window(root)

root.mainloop()
