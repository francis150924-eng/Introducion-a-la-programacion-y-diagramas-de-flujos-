import tkinter as tk

ventana = tk.Tk()
ventana.title("Área de Dibujo")
ventana.geometry("520x420")
ventana.config(bg="#DDE6F2")

frame = tk.Frame(ventana, bg="#2A4D69", bd=3, relief="ridge")
frame.place(relx=0.5, rely=0.5, anchor="center", width=480, height=360)

canvas = tk.Canvas(frame, bg="white", cursor="cross")
canvas.pack(fill="both", expand=True)

# Variables para almacenar posición
x, y = 0, 0

def iniciar_dibujo(event):
    global x, y
    x, y = event.x, event.y

def dibujar(event):
    global x, y
    canvas.create_line(x, y, event.x, event.y, width=3)  # línea más gruesa
    x, y = event.x, event.y

canvas.bind("<Button-1>", iniciar_dibujo)
canvas.bind("<B1-Motion>", dibujar)

ventana.mainloop()
