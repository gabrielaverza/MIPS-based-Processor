# ⚙️ Projeto de um Sistema Computacional com OS Simples em FPGA baseado em MIPS / FPGA Computing System with Simple OS Based on MIPS Architecture

## 🇧🇷 Descrição (Português)

Este projeto consiste em um **sistema computacional desenvolvido para FPGA**, composto por:

- Um **processador baseado na arquitetura MIPS**, descrito em Verilog.
- Um **sistema operacional simples**, capaz de executar algoritmos com e sem preempção.
- Programas escritos em **C-** (linguagem fictícia inspirada em C) e compilados para código binário.

O **compilador para a linguagem C-** está disponível neste repositório:  
👉 [Link para o compilador](https://github.com/gabrielaverza/cminus-compiler)

### 🔧 Funcionamento

1. O sistema solicita uma entrada via **painel LCD**:
   - Digite `0` (sem preempção) ou `1` (com preempção), utilizando os **switches SW0–SW15**.
   - Deixe o **SW17 (Enter)** em nível alto para confirmar cada entrada.
2. Se escolher `0` (sem preempção):
   - Informe um número de `1` a `10`, correspondente ao **índice do algoritmo** a ser executado.
3. Se escolher `1` (com preempção):
   - Informe um número de `1` a `10`, que indica a **quantidade de programas** que deseja executar com preempção.
   - Em seguida, entre com `x` valores (de `1` a `10`), um por um, com o índice dos algoritmos desejados.

Cada entrada deve ser **confirmada deixando o SW17 (Enter) em nível alto por um instante**.  
Fazer isso também é necessário após cada saída exibida — esse comportamento pode ser modificado facilmente na **Unidade de Controle**.

### ♻️ Reset

Existe uma opção de **reset** para retornar o sistema ao estado inicial.  
Essa funcionalidade está planejada para ser ativada ao **pressionar e segurar um botão físico por alguns segundos**.

### 📺 Interface de Hardware

- **LCD**: mostra mensagens de controle, como entrada esperada, troca de contexto e programa em execução.
- **Display de 7 segmentos**: exibe os valores de entrada e saída dos programas.
- **LEDs**: indicam o valor binário do registrador **PC (Program Counter)**.
- **Switches**:
  - **SW0–SW15**: entrada de dados (valores de 0 a 65535) — deve ser inserida a **representação binária do número** desejado.
  - **SW17**: confirma a entrada ao ser deixado em **nível lógico alto (Enter)**.

### 🧩 Organização do Código

- O arquivo `Processor.v` integra todos os módulos do sistema (CPU, memória, unidade de controle, etc).
- A pasta `Binary Codes` contém os **códigos binários dos 10 algoritmos**, organizados separadamente para facilitar a leitura.

> 💡 **Obs.:** Para executar o sistema na FPGA, foi utilizado o **software Quartus** da Intel, realizando a pinagem, compilação e upload do projeto para a placa.

### 📚 Programas disponíveis

| Índice | Descrição                          |
|--------|------------------------------------|
| 1      | Contador crescente                 |
| 2      | Contador decrescente              |
| 3      | Verifica se um número é par        |
| 4      | Verifica se um número é primo      |
| 5      | Cálculo de fatorial                |
| 6      | Cálculo de Fibonacci               |
| 7      | Cálculo de média entre dois números|
| 8      | Cálculo de potência                |
| 9      | Cálculo do resto de uma divisão    |
| 10     | Cálculo da área de um triângulo    |

---

## 🇺🇸 Description (English)

This project consists of a **computing system implemented on FPGA**, composed of:

- A **MIPS-based processor**, written in Verilog.
- A **simple operating system**, capable of executing algorithms with and without preemption.
- Programs written in **C-**, a fictional language based on C, compiled to binary code.

The **C- compiler** is available in this repository:  
👉 [Link to the compiler](https://github.com/gabrielaverza/cminus-compiler)

### 🔧 How It Works

1. The system prompts the user through the **LCD panel**:
   - Input `0` (non-preemptive) or `1` (preemptive) using **switches SW0–SW15**.
   - Set **SW17 (Enter)** to a high logic level to confirm each input.
2. If `0` (non-preemptive) is selected:
   - Enter a number between `1` and `10`, referring to the **index of the algorithm** to run.
3. If `1` (preemptive) is selected:
   - Enter a number between `1` and `10` to indicate the **number of programs** to run.
   - Then, input `x` values (1–10), one by one, each referring to an algorithm index.

Each input must be **confirmed by setting SW17 (Enter) to a high level momentarily**.  
Pressing Enter is also required after each output — this behavior can be changed in the **Control Unit**.

### ♻️ Reset

A **reset option** is available to bring the system back to its initial state.  
It is designed to be activated by **pressing and holding a physical button for a few seconds**.

### 📺 Hardware Interface

- **LCD**: shows system messages such as input requests, context switches, and currently running program.
- **7-segment display**: shows the input and output values.
- **LEDs**: display the binary value of the **Program Counter (PC)**.
- **Switches**:
  - **SW0–SW15**: input data (values from 0 to 65535) — must match the **binary representation of the number**.
  - **SW17**: confirms input when set to **high logic level (Enter)**.

### 🧩 Code Organization

- The file `Processor.v` integrates all system components (CPU, memory, control unit, etc.).
- The folder `Binary Codes` contains the **binary programs** for each algorithm, separated for better organization.

> 💡 **Note:** The project was compiled, pinned, and uploaded to the FPGA using the **Intel Quartus** software.

### 📚 Available Programs

| Index | Description                         |
|-------|-------------------------------------|
| 1     | Increasing counter                  |
| 2     | Decreasing counter                  |
| 3     | Checks if a number is even          |
| 4     | Checks if a number is prime         |
| 5     | Factorial calculation               |
| 6     | Fibonacci calculation               |
| 7     | Average between two numbers         |
| 8     | Power calculation                   |
| 9     | Modulo operation                    |
| 10    | Triangle area calculation           |