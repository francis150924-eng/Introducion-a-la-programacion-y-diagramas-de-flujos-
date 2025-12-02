import tkinter as tk

ventana = tk.Tk()
ventana.title("Visor de Texto")
ventana.geometry("380x220")
ventana.config(bg="#F2F2F2")

marco = tk.Frame(ventana, bg="#FFFFFF", bd=2, relief="groove")
marco.place(relx=0.5, rely=0.5, anchor="center", width=300, height=160)

tk.Label(marco, text="Ingresa un texto:", font=("Arial", 12), bg="#FFFFFF").grid(row=0, column=0, pady=10)

entrada = tk.Entry(marco, font=("Arial", 12), width=22)
entrada.grid(row=1, column=0, padx=10)

resultado = tk.Label(marco, text="", font=("Arial", 14), bg="#FFFFFF", fg="#333333")
resultado.grid(row=3, column=0, pady=15)

def mostrar_texto():
    resultado.config(text=entrada.get())

boton = tk.Button(marco, text="Mostrar", font=("Arial", 11), width=12, command=mostrar_texto)
boton.grid(row=2, column=0, pady=10)

ventana.mainloop()
