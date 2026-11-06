import java.util.ArrayList;

/*
   COMPOSIÇÃO (relação forte, "TEM UM"):
   O Cozinheiro TEM uma Panela. A Panela é criada com new DENTRO do
   construtor do próprio Cozinheiro, com o material recebido. Ela é dele,
   nasce junto com ele e "morre" junto com ele.

   AGREGAÇÃO (relação fraca, "TEM UM"):
   O Cozinheiro TEM ingredientes. Os monstros (Slime e Mandragora) são
   criados FORA do Cozinheiro, no programa principal, antes dele, e chegam
   prontos pelo método adicionarIngrediente(). O Cozinheiro apenas guarda
   uma referência a eles na lista.
*/

public class Exercicio4 {
    public static void main(String[] args) {
        Slime slime = new Slime("Slime Gigante");
        Mandragora mandragora = new Mandragora("Mandrágora Gritadora");

        Cozinheiro senshi = new Cozinheiro("Senshi", "ferro");
        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();
    }
}

abstract class Monstro {

    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {

    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Secar a gelatina ao sol e servir em fatias, como uma sobremesa.";
    }
}

class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Arrancar da terra, cortar em rodelas e refogar com legumes.";
    }
}

class Panela {

    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {

    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("--- Banquete do cozinheiro " + nome + " (panela de " + panela.getMaterial() + ") ---");
        for (Monstro monstro : ingredientes) {
            System.out.println(monstro.getNome() + ": " + monstro.receita());
        }
    }
}
