#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    float capacidade_maxima = 0.0;
    float carga_atual = 0.0;
    int opcao = 0;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidade_maxima;

    do {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1) {
            cout << "\n" << fixed << setprecision(2);
            cout << "Carga Atual: " << carga_atual << " kg / " << capacidade_maxima << " kg" << endl;
            cout << "Espaco Disponivel: " << capacidade_maxima - carga_atual << " kg" << endl;
        } 
        else if (opcao == 2) {
            float peso_pacote = 0.0;
            cout << "\nDigite o peso do pacote a ser carregado (kg): ";
            cin >> peso_pacote;

            if (carga_atual + peso_pacote > capacidade_maxima) {
                cout << "\nAlerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
            } else {
                carga_atual += peso_pacote;
                cout << "Pacote adicionado com sucesso!" << endl;
            }
        } 
        else if (opcao == 3) {
            float peso_remover = 0.0;
            cout << "\nDigite o peso do pacote a ser descarregado (kg): ";
            cin >> peso_remover;

            if (peso_remover > carga_atual) {
                cout << "\nAlerta: Nao e possivel remover mais peso do que o carregado!" << endl;
            } else {
                carga_atual -= peso_remover;
                cout << "Pacote removido com sucesso!" << endl;
            }
        } 
        else if (opcao == 4) {
            cout << "\nEncerrando sistema de telemetria..." << endl;
        }
    } while (opcao != 4);

    return 0;
}
