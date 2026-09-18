#include <iostream>
#include <string>

using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << nome << " esta duelando contra " << rival.nome << "!" << endl;

        rival.energia = rival.energia - potenciaSom;
    }

    void mostrarStatus() {
        cout << "Nome: " << nome << endl;
        cout << "Integrantes: " << integrantes << endl;
        cout << "Potencia de Som: " << potenciaSom << endl;
        cout << "Energia: " << energia << endl;
        cout << endl;
    }
};

int main() {

    Banda banda1;
    Banda banda2;

    banda1.nome = "Metal Force";
    banda1.integrantes = 4;
    banda1.potenciaSom = 20;
    banda1.energia = 100;

    banda2.nome = "Rock Stars";
    banda2.integrantes = 5;
    banda2.potenciaSom = 25;
    banda2.energia = 100;

    banda1.duelar(banda2);

    cout << endl;

    banda1.mostrarStatus();
    banda2.mostrarStatus();

    return 0;
}
