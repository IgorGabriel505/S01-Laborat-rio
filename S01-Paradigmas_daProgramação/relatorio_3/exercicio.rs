use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    let diferenca;

    if palpite > numero_secreto {
        diferenca = palpite - numero_secreto;
    } else {
        diferenca = numero_secreto - palpite;
    }

    diferenca <= 5
}

fn main() {
    let numero_secreto: i32 = 42;

    loop {
        let mut entrada = String::new();

        println!("Digite seu palpite:");

        let leitura = io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler");

        if leitura == 0 {
            break;
        }

        let palpite: i32 = entrada.trim().parse().unwrap_or(0);

        if acertou_o_alvo(palpite, numero_secreto) {
            let diferenca;

            if palpite > numero_secreto {
                diferenca = palpite - numero_secreto;
            } else {
                diferenca = numero_secreto - palpite;
            }

            println!("Parabens, voce acertou o alvo!");
            println!(
                "Voce ficou a apenas {} unidade(s) do numero secreto ({}).",
                diferenca, numero_secreto
            );

            break;
        } else {
            println!("Voce passou longe! Tente novamente.");
        }
    }
}
