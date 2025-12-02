import tkinter as tk

ventana = tk.Tk()
ventana.title("Bienvenida")
ventana.geometry("320x180")
ventana.config(bg="#DDE6F2")

contenedor = tk.Frame(ventana, bg="#FFFFFF", bd=3, relief="ridge")
contenedor.place(relx=0.5, rely=0.5, anchor="center", width=260, height=120)

mensaje = tk.Label(
    contenedor,
    text="¡Bienvenido!",
    font=("Verdana", 14, "bold"),
    fg="#2A4D69",
    bg="#FFFFFF"
)
mensaje.grid(row=0, column=0, padx=10, pady=30)

ventana.mainloop()
