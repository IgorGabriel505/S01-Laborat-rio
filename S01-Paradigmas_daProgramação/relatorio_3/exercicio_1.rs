use std::io;

fn validar_placa(placa: &str) -> bool {
    let mut maiusculas = 0;
    let mut numeros = 0;

    if placa.len() < 7 {
        return false;
    }

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            maiusculas += 1;
        }

        if c.is_numeric() {
            numeros += 1;
        }
    }

    maiusculas >= 4 && numeros >= 2
}

fn main() {
    loop {
        let mut entrada = String::new();

        println!("Digite a placa do veiculo:");

        let leitura = io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        if leitura == 0 {
            break;
        }

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
