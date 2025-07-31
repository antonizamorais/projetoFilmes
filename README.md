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

## Sistema de Login

Antes de acessar o menu principal, o sistema pergunta:

Deseja fazer login ou cadastro? (login/cadastro):


- Caso **cadastro**, o sistema solicita um novo e-mail e senha e os salva em `usuarios.json`
- Caso **login**, o sistema valida e-mail e senha com os dados já salvos
- Se o login for bem-sucedido, o usuário acessa o menu de filmes

---

## Estrutura dos Arquivos

- `usuarios.json`: salva os dados de login (e-mail e senha)
- `filmes.json`: salva os filmes cadastrados

### Exemplo de dados salvos:
#### Usuário
```
[
  {
    "email": "teste@exemplo.com",
    "senha": "123456"
  }
]
````

## Filme
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
---

## Menu Principal

Após login bem- sucedido, será exibido:

--- Menu ---
1. Fazer Login
2. Cadastrar novo usuário
3.  Cadastrar filme
4.  Procurar filme
5.  Listar todos os filmes
6.  Sair
Escolha uma opção:

## 1 Cadastrar filme
O usuário informa os seguintes dados do filme:

Nome

Ano

Gênero

Diretor

Sinopse

Valor

Esses dados são armazenados em um arquivo filmes.json para manter o histórico, mesmo após fechar o programa.

## 2 Procurar filme
Permite buscar um filme pelo nome.
O sistema verifica o arquivo filmes.json e retorna:

Informações detalhadas do filme (nome, ano, gênero, diretor, sinopse, valor)

Se o filme não for encontrado, uma mensagem é exibida informando que ele não está cadastrado.

## 3 Listar todos os filmes
Exibe uma lista de todos os filmes cadastrados no sistema, mostrando os principais dados de cada um deles.

## 4 Sair
Encerra a execução do programa.

---
## Autor

Projeto desenvolvido por [Anna Ruth e Antoniza]




