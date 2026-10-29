class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} lança um ataque genérico de aura contra ${alvo.nome}!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} fortalece o próprio corpo e acerta um soco devastador em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma a aura em eletricidade e dá um choque em ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializa correntes de aura e prende ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhasIniciais = []) {
        this.cidade = cidade;
        this.#aranhas = aranhasIniciais;
    }

    revelarAranhas() {
        console.log(`\n--- A TRUPE FANTASMA FOI AVISTADA EM ${this.cidade}! ---`);
        this.#aranhas.forEach(a => console.log(`Nº ${a.numero} — ${a.nome}`));
    }

    buscarAranha(numero) {
        return this.#aranhas.find(a => a.numero === numero);
    }
}

const nobunaga = new Aranha('Nobunaga', 1);
const uvogin   = new Aranha('Uvogin', 11);

const trupe = new TrupeFantasma('Yorknew', [nobunaga, uvogin]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(11);

if (alvo) {
    console.log(`\nAranha encontrada: ${alvo.nome}\n`);

    const hunters = [
        new Intensificador('Gon'),
        new Transmutador('Killua'),
        new Materializador('Kurapika')
    ];

    hunters.forEach(h => h.atacar(alvo));
}
