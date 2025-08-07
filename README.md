# Projeto: Aluguel de Filmes em Swift (CLI)

Este projeto é um sistema simples de cadastro de filmes desenvolvido em **Swift** para ser executado via terminal (CLI – Command Line Interface).

O sistema permite
- Cadastrar e logar usuários
- Verificar credenciais antes de acessar o sistema
- Cadastrar filmes com dados detalhados
- Buscar por nome de filme
- Listar todos os filmes cadastrados
- Vizualizar detalhes de um filme específico
- Salvamento automático de usuários e filmes usando arquivos `.json`

---

## Menu Principal

Após login bem- sucedido, será exibido:

--- Menu ---
1. Fazer Login
2. Cadastrar novo usuário
3. Cadastrar filme
4. Procurar filme
5. Listar todos os filmes
6. Sair
Escolha uma opção

## 1 Fazer Login
- E-mail
- Senha
```
[
  {
    "email": "teste@exemplo.com",
    "senha": "123456"
  }
]
````
O Sistema verifica os dados no arquivo usuarios.json. Se os dados estiverem corretos, o acesso é liberado. Caso contrário, uma mensagem de erro é exibida.

## 2 Cadastrar novo usuário
Permite adicionar um novo usuário ao sistema.

Campos exibidos:
- E-mail
- Senha
Esse dados são armazenados no arquivo usuarios.json, que se gerencia os dados dos usuários registrados.

## 3 Cadastrar filme
O usuário informa os seguintes dados do filme:

Nome

Ano

Gênero

Diretor

Sinopse

Valor

### Filme
```
[
  {
    "nome": "Titanic",
    "ano": 1997,
    "sinopse": "Romance em meio a tragédia",
    "genero": "Drama",
    "diretor": "James Cameron",
    "valor": 9.90
  }
]
```

Esses dados são armazenados em um arquivo filmes.json para manter o histórico, mesmo após fechar o programa.

## 4 Procurar filme
Permite buscar um filme pelo nome.
O sistema verifica o arquivo filmes.json e retorna:

Informações detalhadas do filme (nome, ano, gênero, diretor, sinopse, valor)

Se o filme não for encontrado, uma mensagem é exibida informando que ele não está cadastrado.

## 5 Listar todos os filmes
Exibe uma lista de todos os filmes cadastrados no sistema, mostrando os principais dados de cada um deles.

## 6 Sair
Encerra a execução do programa.

---
## Autor

Projeto desenvolvido por [Anna Ruth e Antoniza]




