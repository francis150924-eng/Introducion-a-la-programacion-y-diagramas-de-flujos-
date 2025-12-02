import tkinter as tk

ventana = tk.Tk()
ventana.title("Gestor de Lista")
ventana.geometry("360x340")
ventana.config(bg="#D9E1F2")

frame = tk.Frame(ventana, bg="#FFFFFF", bd=2, relief="groove")
frame.place(relx=0.5, rely=0.5, anchor="center", width=310, height=280)

titulo = tk.Label(frame, text="Lista de elementos", font=("Arial", 14, "bold"), bg="#FFFFFF")
titulo.grid(row=0, column=0, pady=12)

listbox = tk.Listbox(frame, font=("Arial", 12), width=25, height=7)
listbox.grid(row=1, column=0, pady=5)

entrada = tk.Entry(frame, font=("Arial", 12), width=23)
entrada.grid(row=2, column=0, pady=10)

def agregar():
    elemento = entrada.get().strip()
    if elemento:
        listbox.insert(tk.END, elemento)
        entrada.delete(0, tk.END)

# BOTÓN GRANDE Y CLARO
boton = tk.Button(
    frame,
    text="AGREGAR ELEMENTO",
    font=("Arial", 12, "bold"),
    bg="#2A72B5",
    fg="white",
    activebackground="#1E4F7A",
    width=18,
    command=agregar
)
boton.grid(row=3, column=0, pady=10)

ventana.mainloop()
