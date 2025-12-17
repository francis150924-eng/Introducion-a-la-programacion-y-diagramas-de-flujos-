#include <iostream>
#include <vector>
#include <string>
#include <regex>
#include <fstream>

using namespace std;

vector<string> users;
vector<string> passwords;

string makeHash(const string& text) {
    hash<string> h;
    return to_string(h(text));
}

bool checkPassword(const string& pass) {
    return pass.length() >= 8 &&
           regex_search(pass, regex("[A-Z]")) &&
           regex_search(pass, regex("[a-z]")) &&
           regex_search(pass, regex("[0-9]")) &&
           regex_search(pass, regex("[@$!%*?]"));
}

void showResult(const string& pass) {
    if (checkPassword(pass)) {
        cout << "Contrasena aceptada.\n";
    } else {
        cout << "Contrasena invalida.\n";
    }
}

void saveFile() {
    ofstream file("usuarios.txt");
    for (size_t i = 0; i < users.size(); i++) {
        file << users[i] << ";" << passwords[i] << endl;
    }
}

void loadFile() {
    ifstream file("usuarios.txt");
    if (!file) return;

    string line;
    while (getline(file, line)) {
        size_t p = line.find(";");
        if (p != string::npos) {
            users.push_back(line.substr(0, p));
            passwords.push_back(line.substr(p + 1));
        }
    }
}

void registerUser() {
    string u, p;

    cout << "Usuario: ";
    getline(cin, u);

    cout << "Contrasena: ";
    getline(cin, p);

    showResult(p);

    users.push_back(u);
    passwords.push_back(makeHash(p));

    saveFile();
    cout << "Registro completado.\n";
}

int main() {
    loadFile();
    string option;

    do {
        cout << "\n===== MENU =====\n";
        cout << "1. Registrar usuario\n";
        cout << "2. Salir\n";
        cout << "Opcion: ";
        getline(cin, option);

        if (option == "1") {
            registerUser();
        }
    } while (option != "2");

    return 0;
}
