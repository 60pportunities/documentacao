## Saga Pattern
O padrão Saga é uma maneira de gerenciar transações distribuídas em sistemas, onde uma série de transações menores são realizadas e podem ser revertidas caso algo falhe.

```mermaid
sequenceDiagram
    participant S as Serviço A
    participant B as Serviço B
    participant C as Serviço C
    participant T as Serviço de Transações

    S->>T: Iniciar Transação
    T->>S: Confirma Início
    S->>B: Enviar Requisição para Serviço B
    B->>S: Confirma Ação de B
    S->>C: Enviar Requisição para Serviço C
    C->>S: Confirma Ação de C
    S->>T: Concluir Transação
    T->>S: Confirma Conclusão
```
Em caso de falha em um dos serviços, há um processo de compensação para reverter as ações anteriores:

```mermaid
sequenceDiagram
    participant S as Serviço A
    participant B as Serviço B
    participant T as Serviço de Transações
    participant R as Reversão

    S->>T: Iniciar Transação
    T->>S: Confirma Início
    S->>B: Enviar Requisição para Serviço B
    B->>S: Falha em B
    S->>R: Reverter Transações
    R->>S: Confirma Reversão
```

## CQRS (Command Query Responsibility Segregation)
O CQRS separa as responsabilidades de leitura e escrita. Os comandos são usados para alterar o estado, enquanto as consultas (queries) são usadas para leitura.

```mermaid
sequenceDiagram
    participant C as Cliente
    participant S as Serviço de Comandos
    participant R as Serviço de Leitura
    participant DB as Banco de Dados

    C->>S: Enviar Comando
    S->>DB: Modificar Dados
    DB->>S: Confirma Modificação
    S->>C: Resposta ao Comando

    C->>R: Enviar Consulta
    R->>DB: Consultar Dados
    DB->>R: Retorna Dados
    R->>C: Retorna Resposta
```

## Event Sourcing
Event Sourcing envolve armazenar todos os eventos que alteram o estado do sistema, ao invés de armazenar o estado atual. O sistema reconstruí o estado através desses eventos.

```mermaid
sequenceDiagram
    participant C as Cliente
    participant ES as Event Store
    participant S as Serviço

    C->>S: Enviar Comando
    S->>ES: Armazenar Evento (evento 1)
    ES->>S: Evento Armazenado
    S->>ES: Armazenar Evento (evento 2)
    ES->>S: Evento Armazenado
    S->>C: Resposta ao Cliente

    C->>S: Consultar Estado
    S->>ES: Recuperar Todos os Eventos
    ES->>S: Retorna Eventos
    S->>S: Reconstruir Estado
    S->>C: Retorna Estado
```
## Arquitetura Orientada a Eventos (Event-Driven Architecture - EDA)
Na Arquitetura Orientada a Eventos, o sistema reage aos eventos em vez de realizar chamadas diretas entre os serviços.

```mermaid
sequenceDiagram
    participant P as Publisher
    participant E as Event Bus
    participant C as Consumer

    P->>E: Publica Evento
    E->>C: Entrega Evento
    C->>C: Processa Evento
```

Aqui, o Publisher envia eventos para um barramento de eventos (Event Bus), que então entrega esses eventos aos consumidores interessados.

## Transações Distribuídas
Em um sistema distribuído, as transações podem ser complexas devido à latência e à falha de serviços. Aqui, você pode usar abordagens como o Two-Phase Commit (2PC) ou o Three-Phase Commit (3PC).

### Two-Phase Commit (2PC):

```mermaid
sequenceDiagram
    participant C as Coordenador
    participant S1 as Serviço 1
    participant S2 as Serviço 2

    C->>S1: Solicitar Prepare
    S1->>C: Aceitar Prepare
    C->>S2: Solicitar Prepare
    S2->>C: Aceitar Prepare
    C->>S1: Solicitar Commit
    S1->>C: Confirmar Commit
    C->>S2: Solicitar Commit
    S2->>C: Confirmar Commit
    C->>C: Transação Concluída
```
### Compensação de Transações
Quando há falha em uma transação e a reversão das etapas anteriores é necessária, pode-se usar a compensação para desfazer as ações.

```mermaid
sequenceDiagram
    participant T as Serviço de Transações
    participant S as Serviço

    T->>S: Enviar Comando A
    S->>T: Comando A Aceito
    T->>S: Enviar Comando B
    S->>T: Comando B Aceito
    T->>S: Enviar Comando C
    S->>T: Comando C Falhou
    T->>S: Reverter Comando B
    S->>T: Reversão B Completa
    T->>S: Reverter Comando A
    S->>T: Reversão A Completa
```
