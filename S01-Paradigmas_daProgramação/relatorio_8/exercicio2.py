class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa uma suprema genérica!")


class HeroiTanque(HeroiOverwatch):

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa a suprema: TERREMOTO! "
              f"Derruba todos os inimigos à frente.")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa a suprema: VALQUÍRIA! "
              f"Voa e fortalece os aliados.")

    def curar_equipe(self):
        print(f"<{self.codinome}> cura toda a equipe!")


if __name__ == "__main__":
    soldado = HeroiOverwatch("Soldado: 76", "Dano")
    reinhardt = HeroiTanque("Reinhardt", "Tanque")
    mercy = HeroiSuporte("Mercy", "Suporte")

    equipe: list[HeroiOverwatch] = [soldado, reinhardt, mercy]

    print("--- Supremas da Equipe ---")
    for heroi in equipe:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
