//Para executar no CMD windows
// swiftc main.swift -o filme.exe
// filme.exe

import Foundation

// Estrutura para representar um filme
struct Filme {
    let nome: String //Nome do filme
    let ano: Int //Ano de publicação do filme
    let sinopse: String // Sinopse do filme
    let genero: String // Gênero do filme
    let diretor: String // Diretor do filme
    let valor: Double // Valor de aluguel do filme
}


// Lista para armazenar os filmes cadastrados
var filmes: [Filme] = []

// Função para cadastrar um filme
// Lê o valor digitado em cada variável e verifica se está vazia,
// caso o usuário não tenha digitado nada, ele entra no else e imprime erro

func cadastrarFilme() {
    print("Nome:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Erro no nome!")
        return
    }

    print("Ano:")
    guard let anoStr = readLine(), let ano = Int(anoStr) else {
        print("Erro no ano!")
        return
    }

    print("Sinopse:")
    guard let sinopse = readLine(), !sinopse.isEmpty else {
        print("Erro na sinopse!")
        return
    }

    print("Gênero:")
    guard let genero = readLine(), !genero.isEmpty else {
        print("Erro no gênero!")
        return
    }

    print("Diretor:")
    guard let diretor = readLine(), !diretor.isEmpty else {
        print("Erro no diretor!")
        return
    }

    print("Valor:")
    guard let valorStr = readLine(), let valor = Double(valorStr) else {
        print("Erro no valor!")
        return
    }

    filmes.append(Filme(nome: nome, ano: ano, sinopse: sinopse, genero: genero, diretor: diretor, valor: valor))
    print("Filme cadastrado!")
}    

func listarFilme(){
    print("Filmes Cadastrados na Plataforma")
    for elemento in filmes {
        print(elemento)
    }
    print("Você Deseja")
    print("1 - Procurar um filme")
    print("0 - retornar ao menu")
    

    while true{
        print("Escolha 1 para procurar um filme ou 0 para voltar:")
        guard let input = readLine(), let escolha = Int(input) else {
            print("Entrada inválida. Tente novamente.")
            continue
        }

        if escolha == 0 {
            // Voltar para o menu
            return
        } else if escolha == 1 {
            procurarFilme()
        } else {
            print("Número inválido. Tente novamente.")
        }
    } 
}

func procurarFilme() {
    print("Digite o nome do filme para buscar:")
    guard let nomeBusca = readLine(), !nomeBusca.isEmpty else {
        print("Nome inválido!")
        return
    }

     // .filter { ... } é um método que filtra o array, retornando apenas os elementos que satisfazem uma condição.
    let encontrados = filmes.filter { $0.nome.lowercased().contains(nomeBusca.lowercased()) }
    /*
    $0 representa cada filme dentro do array enquanto o filtro passa por eles
    $0.nome pega o nome do filme atual.
    .lowercased() transforma o nome para letras minúsculas
    .contains(nomeBusca.lowercased()) verifica se o nome do filme contém o texto buscado
    Ignorando maiúsculas e minúsculas.
    */

    if encontrados.isEmpty {
        print("Nenhum filme encontrado com esse nome.")
        return
    }

    print("Filmes encontrados:")
    for (index, filme) in encontrados.enumerated() {
        print("\(index + 1). \(filme.nome) (\(filme.ano))")
    }  //O resultado só mostra o ano e o filme, para mais informações o usuário deve seleciona-ló
    print("0. Voltar ao menu")

    while true {
        print("Escolha o número do filme para ver detalhes ou 0 para voltar:")
        guard let input = readLine(), let escolha = Int(input) else {
            print("Entrada inválida. Tente novamente.")
            continue
        }

        if escolha == 0 {
            // Voltar para o menu
            return
        } else if escolha > 0 && escolha <= encontrados.count {
            let filmeEscolhido = encontrados[escolha - 1]
            print("\nDetalhes do filme:")
            print("Nome: \(filmeEscolhido.nome)")
            print("Ano: \(filmeEscolhido.ano)")
            print("Sinopse: \(filmeEscolhido.sinopse)")
            print("Gênero: \(filmeEscolhido.genero)")
            print("Diretor: \(filmeEscolhido.diretor)")
            print("Valor do aluguel: R$ \(String(format: "%.2f", filmeEscolhido.valor))\n")
            // Depois de mostrar detalhes, volta para a lista
        } else {
            print("Número inválido. Tente novamente.")
        }
    }
}


// Função principal
func menu() {
    filmes.append(Filme(nome: "Titanic", ano: 1997, sinopse: "Um navio que afunda", genero: "Drama", diretor: "James Cameron", valor: 12.99))
    
    while true {
        print("\n--- Menu ---")
        print("1. Cadastrar filme")
        print("2. Procurar filme")
        print("3. Listar todos os filme")
        print("4. Sair")
        print("Escolha uma opção:")

        guard let opcao = readLine() else { continue }

        switch opcao {
        case "1":
            cadastrarFilme()
        case "2":
            procurarFilme()
        case "3":
            listarFilme()
        case "4":
            print("Saindo...")
            return
        default:
            print("Opção inválida.")
        }
    }
}

// Iniciar o menu
menu()