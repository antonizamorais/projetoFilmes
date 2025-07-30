// Para executar no CMD windows
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

// Estrutura do login
struct Usuario {
    let nome: String
    let email: String
    let cpf: String
    let senha: String
    let isAdmin: Bool
}

// Lista para armazenar os filmes cadastrados
var filmes: [Filme] = []

// Lista de usuários cadastrados
var usuarios: [Usuario] = []

// Função para cadastrar um filme
// Lê o valor digitado em cada variável e verifica se está vazia,
// caso o usuário não tenha digitado nada, ele entra no else e imprime erro

func cadastrarFilme() {
    guard let usuario = usuarioLogado, usuario.isAdmin else {
    print("Apenas administradores podem cadastrar filmes.")
    return
    }

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

// Função para cadastrar usuario
func cadastrarUsuario() {
    print("Nome:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Nome inválido.")
        return
    }

    print("E-mail:")
    guard let email = readLine(), !email.isEmpty, validarEmail(email) else {
        print("E-mail inválido. Certifique-se de que contém '@' e '.'")
        return
    }

    // Verifica se e-mail já existe
    if usuarios.contains(where: { $0.email == email }) {
        print("E-mail já cadastrado.")
        return
    }

    print("CPF (apenas números):")
    guard let cpf = readLine(), validarCPF(cpf) else {
        print("CPF inválido. Deve conter exatamente 11 dígitos numéricos.")
        return
    }

    print("Senha:")
    guard let senha = readLine(), !senha.isEmpty else {
        print("Senha inválida.")
        return
    }

    let novoUsuario = Usuario(nome: nome, email: email, cpf: cpf, senha: senha, isAdmin: false)
    usuarios.append(novoUsuario)
    print("Usuário cadastrado com sucesso!")
}

// Função auxiliar para validar email
func validarEmail(_ email: String) -> Bool {
    return email.contains("@") && email.contains(".")
}

// Função auxiliar para validar cpf
func validarCPF(_ cpf: String) -> Bool {
    let apenasNumeros = cpf.allSatisfy { $0.isNumber }
    return apenasNumeros && cpf.count == 11
}

// Função auxiliar para Exibir os detalhes de um filme
func detalhesDoFilme(filme: Filme) {
    print("\nDetalhes do filme:")
    print("Nome: \(filme.nome)")
    print("Ano: \(filme.ano)")
    print("Sinopse: \(filme.sinopse)")
    print("Gênero: \(filme.genero)")
    print("Diretor: \(filme.diretor)")
    print("Valor do aluguel: R$ \(String(format: "%.2f", filme.valor))\n")
}

func listarFilme() {
    print("\n Filmes Cadastrados na Plataforma:\n")

    if filmes.isEmpty {
        print("Nenhum filme cadastrado ainda.\n")
        return
    }

    for (index, filme) in filmes.enumerated() {
        print("\(index + 1). \(filme.nome) (\(filme.ano)) - \(filme.genero)")
    }

    print("\nVocê deseja:")
    print("Digite o número do filme para ver detalhes")
    print("Ou digite 0 para procurar um filme")
    print("Ou digite -1 para voltar ao menu")

    while true {
        print("Sua escolha:")
        guard let input = readLine(), let escolha = Int(input) else {
            print("Entrada inválida. Tente novamente.")
            continue
        }

        if escolha == -1 {
            return // Voltar ao menu
        } else if escolha == 0 {
            procurarFilme() // Ir para a busca
            return
        } else if escolha > 0 && escolha <= filmes.count {
            let filmeEscolhido = filmes[escolha - 1]
            detalhesDoFilme(filme: filmeEscolhido) // <- Aqui está o uso da nova função
            return
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
            detalhesDoFilme(filme: filmeEscolhido)
            return
            // Depois de mostrar detalhes, volta para a lista
        } else {
            print("Número inválido. Tente novamente.")
        }
    }
}

// Função de Login
func loginUsuario() {
    print("Digite seu nome de usuário:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Nome inválido.")
        return
    }

    print("Digite sua senha:")
    guard let senha = readLine(), !senha.isEmpty else {
        print("Senha inválida.")
        return
    }

    if let usuario = usuarios.first(where: { $0.nome == nome && $0.senha == senha }) {
        usuarioLogado = usuario
        print("Login realizado com sucesso! Bem-vindo, \(usuario.nome).")
    } else {
        print("Usuário ou senha incorretos.")
    }
}

// Função para alugar filme
func alugarFilme() {
    guard let usuario = usuarioLogado else {
        print("Você precisa estar logado para alugar um filme.")
        return
    }

    if filmes.isEmpty {
        print("Nenhum filme disponível para aluguel.")
        return
    }

    print("Filmes disponíveis para aluguel:")
    for (index, filme) in filmes.enumerated() {
        print("\(index + 1). \(filme.nome) - R$ \(String(format: "%.2f", filme.valor))")
    }

    print("Digite o número do filme que deseja alugar ou 0 para cancelar:")
    guard let input = readLine(), let escolha = Int(input), escolha > 0, escolha <= filmes.count else {
        print("Operação cancelada.")
        return
    }

    let filmeEscolhido = filmes[escolha - 1]
    print("Você alugou o filme: \(filmeEscolhido.nome) por R$ \(String(format: "%.2f", filmeEscolhido.valor))")
}

// Função principal
func menu() {
    filmes.append(Filme(nome: "Titanic", ano: 1997, sinopse: "Um navio que afunda", genero: "Drama", diretor: "James Cameron", valor: 12.99))
    
    while true {
        print("\n--- Menu ---")
        print("Escolha uma opção:")
        print("1. Fazer login")
        print("2. Cadastrar novo usuário")
        print("3. Cadastrar filme")
        print("4. Procurar filme")
        print("5. Listar todos os filme")
        print("6. Alugar um filme")
        print("0. Sair")

        guard let opcao = readLine() else { continue }

        switch opcao {
        case "1":
            loginUsuario()
        case "2":
            cadastrarUsuario()
        case "3":
            cadastrarFilme()
        case "4":
            procurarFilme()
        case "5":
            listarFilme()
        case "6":
            alugarFilme()
        case "0":
            print("Saindo...")
            return
        default:
            print("Opção inválida.")
        }
    }
}

// Iniciar o menu
menu()