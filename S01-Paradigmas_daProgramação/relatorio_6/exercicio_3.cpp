#include <iostream>
#include <string>

using namespace std;

class MembroInatel {

protected:
    string nome;

public:

    MembroInatel(string n) : nome(n) {}

    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: "
             << nome << "." << endl;
    }
};

class Aluno : public MembroInatel {

private:
    string curso;

public:

    Aluno(string n, string c)
        : MembroInatel(n), curso(c) {}

    void seApresentar() override {
        cout << "Meu nome e " << nome
             << " e estudo no curso de "
             << curso << "." << endl;
    }
};

class Professor : public MembroInatel {

private:
    string disciplina;

public:

    Professor(string n, string d)
        : MembroInatel(n), disciplina(d) {}

    void seApresentar() override {
        cout << "Meu nome e " << nome
             << " e leciono a disciplina de "
             << disciplina << "." << endl;
    }
};

int main() {

    Aluno aluno("Igor", "Engenharia de Software");

    Professor professor("Pedro", "Programacao");

    aluno.seApresentar();

    professor.seApresentar();

    return 0;
}
