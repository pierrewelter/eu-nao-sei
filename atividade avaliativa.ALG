Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 30/09/2024
// Definindo a estrutura de dados para armazenar os clientes
const
    MAX_CLIENTES = 10

var
    clientes: vetor[1..MAX_CLIENTES] de registro
        nome: caractere
        email: caractere
        telefone: caractere
    fimregistro
    totalClientes: inteiro

// Função para adicionar um novo cliente
procedimento adicionar_cliente()
var
    nome, email, telefone: caractere
inicio
    se totalClientes < MAX_CLIENTES entao
        escreval("Digite o nome do cliente: ")
        leia(nome)
        escreval("Digite o email do cliente: ")
        leia(email)
        escreval("Digite o telefone do cliente: ")
        leia(telefone)
        totalClientes := totalClientes + 1
        clientes[totalClientes].nome := nome
        clientes[totalClientes].email := email
        clientes[totalClientes].telefone := telefone
        escreval("Cliente adicionado com sucesso!")
    senao
        escreval("Limite de clientes atingido.")
    fimse
fimalgoritmo

// Função para listar todos os clientes
procedimento listar_clientes()
var
    i: inteiro
inicio
    se totalClientes > 0 entao
        para i de 1 ate totalClientes faca
            escreval("Cliente ", i, ": Nome: ", clientes[i].nome, ", Email: ", clientes[i].email, ", Telefone: ", clientes[i].telefone)
        fimpara
    senao
        escreval("Nenhum cliente cadastrado.")
    fimse
fimalgoritmo

// Função para editar um cliente existente
procedimento editar_cliente()
var
    indice: inteiro
    nome, email, telefone: caractere
inicio
    listar_clientes()
    escreval("Digite o número do cliente que deseja editar: ")
    leia(indice)
    se (indice > 0) e (indice <= totalClientes) entao
        escreval("Digite o novo nome do cliente: ")
        leia(nome)
        escreval("Digite o novo email do cliente: ")
        leia(email)
        escreval("Digite o novo telefone do cliente: ")
        leia(telefone)
        clientes[indice].nome := nome
        clientes[indice].email := email
        clientes[indice].telefone := telefone
        escreval("Cliente editado com sucesso!")
    senao
        escreval("Cliente não encontrado.")
    fimse
fimalgoritmo

// Função para remover um cliente
procedimento remover_cliente()
var
    indice, i: inteiro
inicio
    listar_clientes()
    escreval("Digite o número do cliente que deseja remover: ")
    leia(indice)
    se (indice > 0) e (indice <= totalClientes) entao
        para i de indice ate totalClientes - 1 faca
            clientes[i] := clientes[i + 1]
        fimpara
        totalClientes := totalClientes - 1
        escreval("Cliente removido com sucesso!")
    senao
        escreval("Cliente não encontrado.")
    fimse
fimalgoritmo

// Função para exibir o menu e executar as operações
procedimento menu()
var
    opcao: inteiro
inicio
    totalClientes := 0
    enquanto verdadeiro faca
        escreval("\nMenu:")
        escreval("1. Adicionar Cliente")
        escreval("2. Listar Clientes")
        escreval("3. Editar Cliente")
        escreval("4. Remover Cliente")
        escreval("5. Sair")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha opcao
            caso 1
                adicionar_cliente()
            caso 2
                listar_clientes()
            caso 3
                editar_cliente()
            caso 4
                remover_cliente()
            caso 5
                escreval("Saindo do programa...")
                interrompa
            outrocaso
                escreval("Opção inválida. Tente novamente.")
        fimescolha
    fimenquanto
fimalgoritmo

// Executando o menu
inicio
    menu()
fimalgoritmo
