import tkinter as tk

ventana = tk.Tk()
ventana.title("Mini Calculadora")
ventana.geometry("320x200")
ventana.config(bg="#E8E8E8")

tk.Label(ventana, text="Número 1:", font=("Arial", 12), bg="#E8E8E8").grid(row=0, column=0, padx=10, pady=10, sticky="w")
entrada1 = tk.Entry(ventana, font=("Arial", 12), width=15)
entrada1.grid(row=0, column=1)

tk.Label(ventana, text="Número 2:", font=("Arial", 12), bg="#E8E8E8").grid(row=1, column=0, padx=10, pady=10, sticky="w")
entrada2 = tk.Entry(ventana, font=("Arial", 12), width=15)
entrada2.grid(row=1, column=1)

resultado = tk.Label(ventana, text="Resultado: ", font=("Arial", 14), bg="#E8E8E8")
resultado.grid(row=3, column=0, columnspan=2, pady=15)

def sumar():
    try:
        n1 = float(entrada1.get())
        n2 = float(entrada2.get())
        resultado.config(text=f"Resultado: {n1 + n2}")
    except ValueError:
        resultado.config(text="Error: solo números")

boton_sumar = tk.Button(ventana, text="Sumar", font=("Arial", 12), width=12, command=sumar)
boton_sumar.grid(row=2, column=0, columnspan=2, pady=5)

ventana.mainloop()
