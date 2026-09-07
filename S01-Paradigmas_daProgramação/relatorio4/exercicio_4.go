package main

import "fmt"

func validarIngresso(setor string, codigo int) bool {
    if setor == "VIP" && codigo == 2026 {
        return true
    }

    return false
}

func main() {
    var setor string
    var codigo int

    for {
        fmt.Println("Digite o setor do ingresso:")
        fmt.Scanln(&setor)

        fmt.Println("Digite o código do ingresso:")
        fmt.Scanln(&codigo)

        valido := validarIngresso(setor, codigo)

        if valido {
            fmt.Println("Acesso liberado à área VIP!")
            break
        } else {
            fmt.Println("Ingresso ou setor inválido. Tente novamente.")
        }
    }
}
