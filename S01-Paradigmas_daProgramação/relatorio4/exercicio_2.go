
package main

import "fmt"

func main() {
    var trimestre1 int
    var trimestre2 int
    var trimestre3 int

    fmt.Println("Digite as vendas do 1º trimestre:")
    fmt.Scanln(&trimestre1)

    fmt.Println("Digite as vendas do 2º trimestre:")
    fmt.Scanln(&trimestre2)

    fmt.Println("Digite as vendas do 3º trimestre:")
    fmt.Scanln(&trimestre3)

    total := trimestre1 + trimestre2 + trimestre3

    fmt.Printf("Total de vendas: %d unidades\n", total)

    if total < 100 {
        fmt.Println("Meta mínima anual não atingida!")
    } else {
        switch {
        case total >= 250:
            fmt.Println("Classificação: Categoria Top Seller")
        case total >= 180:
            fmt.Println("Classificação: Categoria Sênior")
        default:
            fmt.Println("Classificação: Categoria Pleno")
        }
    }
}
