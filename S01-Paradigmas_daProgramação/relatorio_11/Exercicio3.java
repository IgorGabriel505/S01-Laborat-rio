import java.util.HashMap;

public class Exercicio3 {
    public static void main(String[] args) {
        Alienigena serpo = new Alienigena("Serpoian");
        EspiritoYoukai turboVovo = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Prédio abandonado", serpo);
        mapa.registrar("Túnel da estrada", turboVovo);

        mapa.investigar("Prédio abandonado");
        mapa.investigar("Túnel da estrada");
        mapa.investigar("Escola");
    }
}

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {

    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O alienígena " + nome + " desce de um disco voador e tenta abduzir quem está no local!");
    }
}

class EspiritoYoukai implements Sobrenatural {

    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O espírito " + nome + " aparece do nada e começa a assombrar quem está no local!");
    }
}

class MapaDeAvistamentos {

    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        System.out.println("Investigando: " + local);
        Sobrenatural ser = avistamentos.get(local);

        if (ser == null) {
            System.out.println("O local " + local + " está tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}
