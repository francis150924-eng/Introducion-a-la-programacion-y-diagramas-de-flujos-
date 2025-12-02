# Gestor de contraseñas
import re
import secrets
import string

usuarios = []
contraseñas = []

# Función para registrar usuario y contraseña
def registrar_usuario():
    usuario = input("Ingrese el nombre de usuario: ")
    contraseña = input("Ingrese la contraseña: ")
    usuarios.append(usuario)
    contraseñas.append(contraseña)
    print("Usuario registrado correctamente.\n")

# Función para verificar la fuerza de una contraseña
def verificar_contraseña(contraseña):
    longitud = len(contraseña) >= 8
    mayuscula = re.search(r"[A-Z]", contraseña)
    minuscula = re.search(r"[a-z]", contraseña)
    numero = re.search(r"[0-9]", contraseña)
    simbolo = re.search(r"[!@#$%^&*(),.?\":{}|<>]", contraseña)
    return all([longitud, mayuscula, minuscula, numero, simbolo])

# Función para generar alertas sobre la seguridad de las contraseñas
def generar_alertas():
    print("\nVerificando contraseñas...")
    for i in range(len(usuarios)):
        fuerza = verificar_contraseña(contraseñas[i])
        if fuerza:
            print(f"La contraseña de {usuarios[i]} es segura.")
        else:
            print(f"La contraseña de {usuarios[i]} es débil. Considere usar al menos 8 caracteres, mayúsculas, minúsculas, números y símbolos.")

# Menú principal del programa
def menu():
    while True:
        print("\n--- Gestor de Contraseñas ---")
        print("1. Registrar usuario")
        print("2. Verificar contraseñas")
        print("3. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            registrar_usuario()
        elif opcion == "2":
            generar_alertas()
        elif opcion == "3":
            print("Saliendo del programa.")
            break
        else:
            print("Opción inválida. Intente de nuevo.")

# Punto de entrada del programa
if __name__ == "__main__":
    menu()
