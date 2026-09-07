package main

import "fmt"

func gerarEscalaPlantao(n int) {
    dia := 1

    fmt.Println("--- Escala de Plantão Técnico ---")

    for i := 1; i <= n; i++ {
        fmt.Printf("Plantão %d: Dia %d do mês\n", i, dia)
        dia = dia + 4
    }
}

func main() {
    var quantidade int

    fmt.Print("Digite a quantidade de plantões necessários: ")
    fmt.Scanln(&quantidade)

    gerarEscalaPlantao(quantidade)
}
