/*
   COMPOSIÇÃO (relação forte, "TEM UM"):
   O DiarioMisterioso TEM fichas. Cada FichaDeCriatura é criada com new
   DENTRO do método anotar() do próprio diário e só existe nele, guardada
   no atributo privado #fichas. A ficha nasce dentro do diário e "morre"
   junto com ele.

   AGREGAÇÃO (relação fraca, "TEM UM"):
   A CabanaDoMisterio TEM funcionários. Cada Funcionario é criado FORA da
   Cabana, no programa principal, e chega pronto por parâmetro no método
   contratar(). A Cabana apenas guarda uma referência a ele: os funcionários
   já existiam antes de serem contratados e continuam existindo fora dela.
*/

class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} — nível de perigo ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`\n--- DIÁRIO Nº ${this.numero} ---`);
        this.#fichas.forEach(f => console.log(f.descrever()));
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- A CABANA DO MISTÉRIO DE ${this.dono} ABRE AS PORTAS! ---`);
        this.#funcionarios.forEach(f => console.log(`${f.nome} — ${f.cargo}`));
    }
}

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 2);
diario.anotar('Multiurso', 4);
diario.anotar('Gideon Gleeful', 5);
diario.exibirFichas();

const wendy = new Funcionario('Wendy', 'Caixa');
const soos  = new Funcionario('Soos', 'Faz-tudo');

const cabana = new CabanaDoMisterio('Tio Stan');
cabana.contratar(wendy);
cabana.contratar(soos);
cabana.abrirAsPortas();
