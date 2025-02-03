## Teorema CAP (Consistency vs. Availability vs. Partition Tolerance)
Consistência vs. Disponibilidade vs. Tolerância de Partição
Escolha dois => Dados consistentes, alta disponibilidade ou tolerância a falhas de rede.

## Latência vs. Taxa de Transferência(Throughput)
Tempos de resposta rápidos vs. alto volume de processamento de dados

## ACID vs. BASE
Garantias de transação rígidas versus modelos de consistência flexíveis

## Monolítico vs. Microsserviços
Aplicativo único e unificado versus serviços distribuídos e independentes

## SQL vs. NoSQL
Dados estruturados e consultas complexas vs. esquemas flexíveis e escalabilidade

## Empurrar(Push) vs. Puxar(Pull)
Entrega de dados iniciada pelo servidor vs. solicitada pelo cliente

## Estratégias de cache
Compensações entre diferentes políticas de remoção de cache (LRU, LFU, etc.)
Equilibrando o acesso mais rápido aos dados com potencial desatualização e maior complexidade.

## Statefulness vs. Statelessness
Manter o estado da sessão versus interações sem estado para escalabilidade

## Bloqueio otimista vs. pessimista
O bloqueio otimista não pressupõe conflitos, favorecendo a velocidade e a simultaneidade.
O bloqueio pessimista evita conflitos adquirindo bloqueios antecipadamente, sacrificando o desempenho pela integridade dos dados.

## Data Locality vs. Data Distribution
Manter os dados próximos para acesso mais rápido versus distribuição para resiliência e processamento paralelo

## Segurança vs. Desempenho
A implementação de medidas de segurança robustas, como criptografia e autenticação, pode causar sobrecarga e afetar o desempenho do sistema. Encontrar o equilíbrio certo é crucial.

## Escalabilidade vs. Resiliência
À medida que os sistemas crescem, eles se tornam mais complexos e propensos a falhas. Equilibrar a necessidade de escalar com a capacidade de se recuperar rapidamente de falhas é um desafio crítico de design.

## Centralização vs. Descentralização
Escolha a centralização para controle e eficiência, a descentralização para resiliência e adaptabilidade.

##  Data Duplication vs. Data Normalization
Duplique dados para leituras mais rápidas em vez de normalize os dados para eficiência de armazenamento e integridade de dados.

## Resiliência vs. Custo
Investir em mecanismos robustos de tolerância a falhas e redundância aumenta a confiabilidade, mas também aumenta os custos do sistema.

## Processamento em lote vs. processamento em tempo real
Escolha o processamento em lote para lidar com eficiência de grandes conjuntos de dados e processamento em tempo real quando os resultados imediatos são essenciais, mesmo com um custo de recursos mais alto.

## Long Polling vs WebSockets
Escolha  Long Polling para simplicidade e compatibilidade, ou WebSockets para comunicação eficiente e bidirecional em tempo real.

## REST vs. GraphQL
Simplicidade padronizada com vários endpoints (REST) versus consultas flexíveis e eficientes com um único endpoint (GraphQL).

## TCP vs. UDP
Escolha TCP para confiabilidade e ordem, UDP para velocidade.

## Armazenamento em cache vs. dados em tempo real
Priorizar o acesso mais rápido a dados potencialmente obsoletos em um cache versus garantir que os dados mais recentes sejam recuperados diretamente da fonte.

##  Armazenamento
◾ Bancos de dados - SQL, NoSQL (chave-valor, documento, colunar, gráfico), NewSQL
Armazenamento de objetos - Amazon S3, Armazenamento em nuvem do Google, Armazenamento de Blobs do Azure
Armazenamento em bloco - Armazenamento conectado à rede (NAS), redes de área de armazenamento (SAN)
Sistemas Arquivos - Sistemas de arquivos distribuídos (HDFS, Ceph), Sistema de arquivos de rede (NFS)
◾ Cache - Redis, Memcached, Varnish, CDN caches de borda

## Servidores
Servidores Servers- Bare metal, máquinas virtuais (VMs)
◾ Containers - Docker, Kubernetes, orquestração de contêineres
Sem servidor - AWS Lambda, Funções do Azure, Google Cloud Functions
◾ FaaS - Function-as-a-Service (em inglês)
◾ PaaS - Plataforma como um serviço

##  Comunicação
◾ APIs - REST, GraphQL, SOAP, gRPC
◾ Filas de mensagens - RabbitMQ, Kafka, ActiveMQ, Amazon SQS
◾ WebSockets - Comunicação em tempo real, full-duplex
◾ RPC - Chamada de Procedimento Remoto, XML-RPC, JSON-RPC
◾ Pub/Sub - Publicar-subscrever o padrão de mensagens
- Rede de serviço - Istio, Linkerd

## Padrões arquitetônicos
◾ Microsserviços - Design orientado a domínio (DDD), descoberta de serviço, gateways de API
◾ Monolítico - Arquitetura em camadas, MVC, MVP
? Event-driven - Tomada de eventos, CQRS
Sem servidor - FaaS, BaaS (Backend-as-a-Service)

## Escalabilidade e Confiabilidade
◾ Horizontal Scaling - Balanceadores de carga, grupos de escalonamento automático
◾ Vertical Scaling - instâncias maiores, mais recursos
◾ Replicação - Mestre-escravo, mestre-mestre
◾ Sharding - Particionamento de dados em vários bancos de dados
◾ Redundância - Múltiplas instâncias, mecanismos de failover
Tolerância falhas - Degradação graciosa, disjuntores
Recuperação Desastres - Backups, replicação, geo-redundância

## Segurança
◾ Autenticação - Autenticação multifator (MFA), logon único (SSO), OAuth, OpenID Connect
◾ Autorização - Controle de acesso baseado em função (RBAC), controle de acesso baseado em atributos (ABAC)
◾ Criptografia - Algoritmos simétricos, assimétricos, hashing
◾ Protocolos de segurança - TLS/SSL, HTTPS, SSH
Firewalls aplicativos da Web (WAF) - Proteja contra ataques na web
Sistemas de Detecção de Intrusão (IDS) - Identificar atividade maliciosa

##  Observabilidade em
◾ Monitoramento - Prometheus, Grafana, Datadog, New Relic
Registro Logging- ELK Stack (Elasticsearch, Logstash, Kibana), Splunk
◾ Rastreamento - Tracing distribuído (Jaeger, Zipkin)
◾ Métricas - Contadores, medidores, histogramas, resumos
◾ APM - Monitoramento de Desempenho de Aplicativos (Dynatrace, AppDynamics)

## Nomeação de Recursos
- Substantivos - Use substantivos para nomes de recursos ? /usentes, /produtos
◾ Plurals - Prefere substantivos plurais para coleções ? /usuários em vez de /user
◾ Hyphens - Use hífens para melhorar a legibilidade ? /product-categorias
- Lowercase - Use letras minúsculas para consistência.

## Segurança
◾ Autenticação (OAuth 2.0,JWT (JSON Web Tokens), API Keys)
◾ Autorização (RBAC (Controle de Acesso Baseado em Rolo),ABAC (Controle de Acesso Baseado em Atributos))
- Usar o HTTPS
- Validação de entrada

## Codificação de Saídas
- Limitação de Taxas e Limitação
◾ CORS (Cross-Origem Resource Sharing)
? Cabeçalhos de segurança
? Monitorização de Segurança

## Teste

```
flowchart LR
    A((Início)) --> B@{ shape: docs, label: "Lista dos cenários</br>de teste"}
    B --> C@{ shape: docs, label: "Transformar Lista em Teste Real"}
    C --> D[Altere o código para o teste]
    D --> E{Refatorar o Código}
    E --> C
    E --> |Sim| F[Refatoração do Código]
    F --> G{Lista Vazia?}
    G --> D
    G --> H((Término))
```

- [x] Escreva uma lista dos cenários de teste que você deseja cobrir
      - [ ] listar todas as variantes esperadas no novo comportamento;
- [x] Transforme exatamente um item da lista em um teste real, concreto e corcável
- [x] Altere o código para passar o teste (e todos os testes anteriores) (adicionar itens para a lista à medidaque você os descobre)
- [x] Fatoração opcional para melhorar o projeto de implementação
- [x] Até que a lista esteja vazia, volte para o 2o

##  Testes de Unidades
- [x] Menor unidade testável de código (funções, métodos, classes);
- [x] Verificar comportamento isolado e correção de componentes individuais;

## Testes de integração
- [x] Interação entre múltiplos componentes ou módulos
- [x] Garantir que os componentes trabalhem em conjunto corretamente, incluindo o fluxo de dados e a comunicação

## Testes de ponta a ponta (E2E)
- Todo o fluxo de aplicação, simulando interações reais do usuário
- Verifique se o aplicativo funciona como esperado a partir da perspectiva do usuário

## Testes de aceitação
- Requisitos de negócios de alto nível e expectativas do usuário
## Testes de Regressão
- Funcionalidade que funcionou corretamente
- Testes funcionais
- Funções específicas do sistema
## Testes de desempenho
- Desempenho do sistema sob várias condições de carga
## Testes de segurança
Identificar vulnerabilidades e potenciais ameaças de segurança
