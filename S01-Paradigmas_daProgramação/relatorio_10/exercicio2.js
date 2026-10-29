class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;

        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(`O agente ${this.codinome} deve implementar o método 'usarHabilidade()'`);
    }

    entrarEmCombate() {
        console.log(`${this.codinome} entra em combate com a ${this.#pistola.modelo} | ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Lança cortinas de fumaça para bloquear a visão dos inimigos!';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Dispara um drone que revela os inimigos escondidos!';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Avança primeiro no combate para eliminar os inimigos!';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\n--- ESQUADRÃO ${this.nome} INICIA A PARTIDA! ---`);

        this.#agentes.forEach(a => a.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(a => a instanceof Controlador);
    }
}

const brimstone = new Controlador('Brimstone', 'Classic');
const omen      = new Controlador('Omen', 'Ghost');
const sova      = new Iniciador('Sova', 'Sheriff');
const jett      = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Protocolo Alfa', [brimstone, omen, sova, jett]);

esquadrao.iniciarPartida();

console.log('\nControladores do esquadrão:');
esquadrao.listarControladores().forEach(c => console.log(`- ${c.codinome}`));

const agenteGenerico = new AgenteProtocolo('Recruta', 'Shorty');
// agenteGenerico.entrarEmCombate();
