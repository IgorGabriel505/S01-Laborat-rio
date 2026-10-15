# COMPOSIÇÃO: a Persona é criada DENTRO do __init__ do Lider.
# Ela nasce junto com o Joker e só existe enquanto ele existir.
#
# AGREGAÇÃO: os Aliados são criados FORA do Lider (antes dele, no main)
# e apenas recebidos como parâmetro em recrutar(). O Lider só guarda
# uma referência a eles na _equipe, e eles continuam existindo
# independentemente do Lider.


class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona invocada: {self.nome} | Arcano: {self.arcano}")


class Aliado:

    def __init__(self, nome: str, codinome: str):
        self.nome = nome
        self.codinome = codinome


class Lider:

    def __init__(self, codinome: str):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"-> {aliado.nome} ({aliado.codinome}) entrou para os Phantom Thieves.")

    def infiltrar(self, palacio):
        print(f"\n--- {self.codinome} invade o Palácio de {palacio} ---")
        self.persona.invocar()
        print(f"Equipe ({len(self._equipe)} aliados):")
        for aliado in self._equipe:
            print(f"  {aliado.codinome} ({aliado.nome})")


if __name__ == "__main__":
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("Kamoshida")
