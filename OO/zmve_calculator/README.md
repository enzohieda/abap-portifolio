# ZMVE_CALCULATOR — Calculadora ABAP OO

Exercício prático de orientação a objetos em ABAP, desenvolvido para reforçar fundamentos de estruturação de aplicações no ecossistema SAP.

---

## Sobre o projeto

O objetivo não é a lógica matemática em si, mas sim a organização de uma aplicação ABAP utilizando os principais conceitos de OO: encapsulamento, separação de responsabilidades e tratamento de erros.

O programa recebe dois valores e uma operação via `SELECTION-SCREEN`, valida a entrada contra o domínio SAP `ZMVED_OPERACAO` na tabela `DD07V`, instancia a classe `ZMVECL_CALCULADORA` e exibe o resultado — ou uma mensagem de erro específica para entradas inválidas (como divisão por zero).

---

## Estrutura do código

### `ZMVE_CALCULATOR` — Report (controlador)

Classe local `LCL_MAIN` com responsabilidades bem definidas:

| Método | Responsabilidade |
|---|---|
| `MAIN` | Ponto de entrada; orquestra o fluxo |
| `INSTANCE_CALCULATOR` | Instancia `ZMVECL_CALCULADORA` com os valores da tela |
| `CHECK_OPERATION` | Valida a operação informada via consulta à `DD07V` |
| `PROCESS_CALCULATOR` | Executa a operação correta via `CASE` |
| `DISPLAY_RESULT` | Exibe o resultado ou a mensagem de erro |

### `ZMVECL_CALCULADORA` — Classe global

| Método | Tipo | Descrição |
|---|---|---|
| `CONSTRUCTOR` | Instance Method | Recebe e armazena os dois operandos |
| `SOMAR` | Instance Method | Retorna a soma |
| `SUBTRAIR` | Instance Method | Retorna a subtração |
| `MULTIPLICAR` | Instance Method | Retorna a multiplicação |
| `DIVIDIR` | Instance Method | Retorna o resultado + mensagem (tratamento de divisão por zero) |

---

## Conceitos aplicados

- **Encapsulamento** — atributos e lógica da calculadora isolados na classe global `ZMVECL_CALCULADORA`
- **Separação de responsabilidades** — cada método do controlador `LCL_MAIN` tem uma única função
- **Métodos estáticos (`CLASS-METHODS`)** — usados no controlador para organizar o fluxo sem necessidade de instância
- **Validação via dicionário SAP** — operações válidas definidas no domínio `ZMVED_OPERACAO`, consultado em tempo de execução na view `DD07V`
- **Tratamento de mensagens** — `DIVIDIR` exporta tanto o resultado quanto uma mensagem, permitindo feedback específico para entradas inválidas

---

## Pré-requisitos

- Domínio `ZMVED_OPERACAO` ativo no sistema com os valores `+`, `-`, `*`, `/`
- Tipo de dados `ZMVEE_VALORES_CALC` criado no SE11
- Classe global `ZMVECL_CALCULADORA` ativa no SE24

---

## Como executar

1. Executar a transação `SE38` e abrir o report `ZMVE_CALCULATOR`
2. Na tela de seleção, informar:
   - **Operação**: `+`, `-`, `*` ou `/`
   - **Valor 1** e **Valor 2**
3. Executar (F8)

---

## Exemplo de saída
