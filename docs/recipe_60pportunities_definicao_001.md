!!! note "Conceituação, Fatos e Idéias"

    === "Conceituação"
        | Significado  | Entenda                                             |
        | -----        | -----                                               |
        | Tecnologia da Informação  | Um conjunto de software e hardware que fornece a base sobre a qual outras aplicações ou serviços podem ser executados.              |
        | Computação                | constante expansão de suas funcionalidades conforme cada novo app é integrado.                                                      |
        | Marketing                 | Uma estrutura estratégica que permite a criação de ecossistemas de produtos e serviços interconectados.                             |
        | P & D                     | Uma estrutura ou conjunto de recursos que permitem a execução de experimentos, coleta de dados ou análise de informações.           |
        | Negócio                   | Uma estrutura ou conjunto de modelo de negócio, viabilizar o encontro entre demanda e oferta, quem quer comprar e quem quer vender. |
        | Plataformas Digitais      | Serviços digitais que conectam diferentes usuários ou entidades para facilitar transações, comunicação ou colaboração.              |
        | Produto                   | Um conceito estratégico usado para descrever um conjunto de tecnologias, ferramentas, infraestruturas e processos interconectados que facilitam a criação, desenvolvimento, entrega e manutenção de um produto ou serviço. (Mobile, APPs). |
        | Industria                 | Um conceito estratégico onde atende a dois segmentos de clientes (mercado bilateral — bilateral market), desenvolvedores de apps e usuários dos apps. |
        | Serviço                   | Aciona operações dentro do EMPRESA ao longo do ciclo de vida do pedido/chamado, assim o ESTABELECIMENTO é avisado de que chegou um pedido/chamado e é possível alocar uma pessoa/técnico para a entrega/visita, além de outras atividades para que o pedido ocorra com sucesso. |
        | Dados                     | Local onde os dados são armazenados para análise histórica, fornecer insights e predições, treinar modelos de machine learning e alimentar dashboards de negócio. |
        | Métricas | São valores numéricos que representam e descrevem o comportamento geral de um serviço ou componente medido aolongo do tempo.  |
        | Rastreamento | Usado para entender como os diferentes serviços de um aplicativo se conectam e como os recursos fluem através deles, ajudando a analisar o fluxo de solicitações e a compreender todo o ciclo de vida de uma solicitação emum aplicativo. (Jaeger e Zipkin) |
        | Logging  | Registros imutáveis ​​de eventos discretos que aconteceram durante algum tempo em um aplicativo. Elasticsearch,Fluentd e Kibana. |
        | Camada de infraestrutura   | Fornece funcionalidades que qualquer serviço ou funcionalidade da sua organização pode usar. Esta camada não está diretamente ligada ao negócio da empresa. Pode ser vista como bancos de dados, VPC, instâncias, redes, etc.|
        | Camada de negócios         | Fornece funcionalidades de negócios que qualquer produto pode usar. Ou seja, é uma funcionalidade que faz parte da base do negócio da empresa. Serviços pertencentes a essa camada devem ser estrategicamente projetados para dar suporte à expansão do produto. |
        | Camada de produto | Fornece uma funcionalidade específica de uma categoria de produto, independentemente de como ela será apresentada (mobile, web, API,…). |
        | Apresentação | Esta camada tem como objetivo proporcionar uma experiência para os usuários finais. Para isso, utiliza as funcionalidades da camada de negócios, mas cria diferentes formas de apresentação que dependerão da pessoa que você deseja atender. |
        | Camada de Borda   |  Responsável por expor serviços com segurança ao mundo externo. |
        | Portais           | Um gateway é uma entrada única para um conjunto de serviços que fazem parte de um domínio. |
        | Extensão          | Extensões são maneiras de estender um domínio sem alterar sua implementação e confiabilidade. |
        |                   | Extensões lógicas são destinadas a permitir a extensão lógica de um serviço subjacente.  |
        |                   | Extensões de dados fornecem uma maneira de anexar novos dados a uma interface ao inchar os modelos de dados da plataforma. |

        ### Classificação de Sistemas
        | Tipo                                                                           | Descrição                                                                          |
        | -----                                                                          | --------                                                                           |
        | Desenvolvidos Internamente (Sistemas Internos  SI)                            | São desenvolvidos dentro da empresa.                                               |
        | Prontos para uso (Components off-the-shelf-COTS/Modifiable off-the-shelf-MOTS) | São adquiridos externamente de outra empresa/fornecedor.                           |
        | Software de código aberto (Open Source Software (OSS))                         | São obtidos externamente da comunidade OSS. [OpenSource](https://opensource.org/history), [gnu.org](https://www.gnu.org/philosophy/free-sw.pt-br.html#History) e [hacktoberfest](https://hacktoberfest.digitalocean.com/) |
        | Componentes Terceirizados (Desenvolvidos por subcontratação)                   | São obtidos por um processo de subcontrato ou de terceirizado. |
        | Mobile COTS	                                                                 | São softwares SoE, que são liberados em função de um COTS.     |
        | [Digital Public Goods Standard (DPG)](https://www.digitalpublicgoods.net/digital-public-goods)                                           | São softwares de código aberto, padrões abertos, dados abertos, sistemas de IA abertos e coleções de conteúdo aberto que respeitam a privacidade e outras leis e práticas recomendadas aplicáveis, não causam danos e ajudam a atingir os Objetivos de Desenvolvimento Sustentável (ODS). |

        | Tipo De Sistema                       |  Objetivo |
        | ----                                  | -----     |
        | Sistemas de Registro (SoR)            | Estes sistemas incluem um sistema de armazenamento e acesso de dados e são a fonte oficial de dados corporativos. Idealmente, para integridade de dados, governança e segurança, tenha uma única fonte de dados em um sistema de registro para quaisquer dados específicos. Essa configuração oferece o que é conhecido como **versão única da verdade**, um recurso muito procurado que garante que a entrada para a tomada de decisão seja a mais precisa possível. Para dados **_históricos e estáticos_**, os sistemas de registro oferecem um caminho rastreável para os dados originais. Para dados que **_continuam a mudar_**, como níveis de estoque e saldos de contas bancárias, os sistemas de registro fornecem as informações mais recentes. |
        | Sistemas de Engajamento (SoE)         | Esses sistemas usam tecnologias que se comunicam com eficiência entre várias organizações e redes dentro da empresa para fornecer a experiência colaborativa necessária para que os negócios tenham sucesso no ambiente competitivo. Os sistemas de engajamento referem-se a sistemas centrados no cliente que incentivam ativamente as interações e a colaboração entre pares. Portais web para interações com clientes; e acesso a dispositivos móveis para clientes e funcionários. Um requisito fundamental do sistema de engajamento é a integração entre aplicativos como gerenciamento da cadeia de suprimentos, ERP, sistemas de RH e gerenciamento de produtos. |
        | Sistemas de Interaction/Insight (SoI) |  Integram dados do engajamento e de registros para encontrar novos relacionamentos e padrões analisando dados históricos, avaliando a situação atual, aplicando regras de negócios, prevendo resultados e propondo a próxima melhor ação. São sistemas de análise que facilitam a coleta, mineração, organização, transformação, consumo e análise de diversos conjuntos de dados com ferramentas de modelagem estatística para detectar padrões, relatar o que aconteceu, prever resultados com alto grau de confiança, aplicar regras de negócios e políticas, além de fornecer insights acionáveis. |

        ### Segregação de Ambientes Operacionais
        A segregação consiste na disponibilidade de bases distintas para cada ambiente. Esta segregação tem como objetivo **isolar** as diversas alterações solicitadas de modo diminuir riscos de novas implementações com isso gerando impactos menores nos processos já funcionais.

        Entender que as práticas convencionais para definição e documentação total da arquitetura e design antes do início da codificação, já se provaram ineficazes, por isso devemos estabelecer claramente estes ambientes para que consigamos entregar no período correto, um produto estável e necessário.

        Elaborado um quadro abaixo com o objetivo de fornecer uma maneira clara a identificação e responsabilidade de cada área.

        - [x] Os ambientes na qual não se desenvolve, apenas para aplicação de atualizações disponibilizadas pelo Fornecedor, só terão a **HOMOLOGAÇÃO**.
        - [x] Os Sistemas Internos, que não possuam volumetria e não apresentem riscos operacionais, deverão possuir apenas o ambiente de **DESENVOLVIMENTO**.
        - [x] Salvo contrário, os demais ambiente possuirão **DESENVOLVIMENTO** e **HOMOLOGAÇÃO**.
        - [x] Ambientes de **PROJETO** deverão ser disponibilizados através de solicitação e com data de término ativada. Não poderá haver **2(duas) prorrogações** na continuidade do ambiente operacional.
        - [x] Deverá haver uma ambiente de **SIT**, para que os dados de **PRODUÇÃO**, sejam mascarados e purgados por um período máximo de 12 meses (**1 ano**).
        - [x] Para a PORTA quanto **mais alta**, mais longe da produção e sufixo do servidor não há regras.

        |  Ambiente         | Definição                  |
        | -----             | -----                      |
        | Development (DEV) | Ambiente de Desenvolvimento;        |
        |                   | História do Usuário atribuídas ao desenvolvedor;        |
        |                   | Código completo e de acordo com os padrões;        |
        |                   | Repositório Central atualizado com a última versão do código;        |
        |                   | **Testes Unitários** executados pelo time de desenvolvimento;        |
        |                   | Estimamos que em breve estaremos liberando **Plataforma do Dsenvolvedor Interno/Internal Developer Platforms (IDP)** que será o conjunto de tecnologias, ferramentas e amostragem de dados que as equipes de  desenvolvimento utilizarão.|
        | System Integration Test (SIT) | Desenvolvedores e/ou Tester/Qualidade; |
        |                               | Planilha de Teste de Aceitação preenchida e atualizada no Repositório Central; |
        | User Acceptance Test (UAT) |  Clientes, Donos do Produto ou Gerente de Produto; |
        |                            |  Implantado e configurado no ambiente de Homologação; |
        |                            |  Testes de Aceitação executados e validados pelo cliente;  |
        |                            |  Realização da Revisão da Sprint: demonstração pelo time de desenvolvimento; |
        |                            |  Implantado e configurado no ambiente de Produção; |
        | Production(PROD)           |  Ambiente Público, controlodo por perfil de acesso.
        |                            |  Documentação do usuário entregue;
        |                            |  Release criada e armazenada no Repository Management. |

    === "Fatos"
        ![](img/remote-hibrido-001.png)

        Para promover o trabalho em equipe eficaz em ambientes distribuídos, os líderes devem priorizar a **comunicação contínua**, ferramentas digitais robustas e uma cultura de equipe **inclusiva**.

        Em qualquer equipe, a clareza em relação aos objetivos, funções e planos de execução é fundamental para o sucesso.

        | Estrutura           | Objetivo |
        | -----               | ----     |
        | Aumento da Eficiência |  Com objetivos claros, funções bem definidas e planos transparentes, a equipe pode trabalhar de maneira mais eficiente, evitando retrabalhos e mal-entendidos. |
        | Melhoria na Comunicação | A transparência na estrutura da equipe promove uma comunicação mais aberta. Os membros se sentem mais à vontade para compartilhar ideias e informações, contribuindo para um ambiente colaborativo. |
        |                         | As ferramentas digitais desempenham um papel central na conexão de membros remotos da equipe, permitindo uma colaboração eficiente no projeto: Microsoft Teams, Planner ou Azure-Devops. |
        |                         | Check-ins regulares da equipe, agendas claras para reuniões e o uso de canais de bate-papo para tópicos específicos contribuem para uma comunicação mais suave e melhor transparência. |
        | Redução de Conflitos | Uma compreensão clara dos papéis e responsabilidades diminui a probabilidade de conflitos dentro da equipe.  |
        |                | Cada membro sabe o que esperar dos outros, criando um ambiente mais harmonioso. |
        | Maior Inovação | Com uma estrutura bem definida, os membros da equipe podem se concentrar mais em aspectos inovadores de seu trabalho, sabendo que suas contribuições estão alinhadas aos objetivos globais. |
        | Promova a confiança | Quando os membros da equipe são confiáveis, cria-se uma atmosfera de confiança.  |
        |                     | Se cada membro da equipe sabe que pode contar com os outros para cumprir suas responsabilidades, o nível de confiança aumenta. |
        |                     | Isso, por sua vez, pode levar a uma colaboração mais eficaz e produtiva.        |
        | Cultive uma cultura de inclusão | priorizar a experiência dos participantes remotos, com práticas como uso de vídeo, designação de facilitadores e uso de ferramentas como o [Front Row](https://learn.microsoft.com/en-us/microsoftteams/rooms/manage-front-row) no Microsoft Teams. |
        | Facilita o planejamento | Se todos os membros da equipe são confiáveis, fica mais fácil planejar e alocar recursos, pois você pode ter certeza de que as tarefas serão concluídas conforme planejado. |
        | Melhora a produtividade | Equipes com alto nível de confiabilidade são mais produtivas, pois menos tempo é gasto verificando o trabalho uns dos outros e mais tempo é gasto na execução eficaz do trabalho. |
        | Cria um ambiente positivo | A confiabilidade contribui para um ambiente de trabalho positivo, pois reduz a incerteza e o estresse relacionado ao cumprimento de prazos e à qualidade do trabalho. |
        |                           | Evite expectativas de trabalho sempre ativo definindo limites. |
        | Motivação Sustentável | A convicção de que o trabalho importa alimenta uma motivação intrínseca mais sustentável, permitindo que os colaboradores superem desafios com resiliência. |
        | Engajamento Elevado | Colaboradores que acreditam no impacto de seu trabalho tendem a se envolver mais ativamente nas tarefas, buscando constantemente maneiras de melhorar e inovar. |
        | Superando sentimentos de isolamento | Check-ins regulares, atividades de formação de equipe e encontros virtuais informais (como coffee breaks ou happy hours) ajudam a manter um senso de pertencimento.|
        | Acesso consistente aos recursos | Priorizar a disponibilidade de recursos, seja por meio de espaços de trabalho digitais ou equipes de suporte remoto, para garantir que todos os funcionários possam acessar ferramentas e informações essenciais. |
        |                       | Os gerentes devem incentivar os funcionários a usar ferramentas que acomodam horários flexíveis, como o recurso de mensagem de status do Microsoft Teams, permitindo que os membros da equipe sinalizem sua disponibilidade. |
        | Cultura de Alto Desempenho | A crença coletiva no impacto do trabalho contribui para uma cultura de alto desempenho, onde os membros da equipe se esforçam para alcançar objetivos comuns. |

        - [x] A estrutura e clareza são elementos essenciais para o sucesso de uma equipe.

        | Time de sucesso | Essência | Objeto |
        | ----            | ----     | ---    |
        | Indicadores de Impacto no Trabalho | Conexão com Objetivos Organizacionais | A compreensão clara de como as tarefas individuais contribuem para os objetivos organizacionais é fundamental para perceber o impacto do trabalho. |
        | | Feedback Positivo | O reconhecimento e o feedback positivo sobre as contribuições dos colaboradores reforçam a crença no impacto do trabalho, alimentando uma cultura de apreciação. |
        | | Alinhamento com Valores Pessoais | Projetos que ressoam com os valores pessoais de cada membro da equipe são mais propensos a serem percebidos como significativos. |
        | Benefícios | Motivação Sustentável | A convicção de que o trabalho importa alimenta uma motivação intrínseca mais sustentável, permitindo que os colaboradores superem desafios com resiliência. |
        |            | Engajamento Elevado | Colaboradores que acreditam no impacto de seu trabalho tendem a se envolver mais ativamente nas tarefas, buscando constantemente maneiras de melhorar e inovar. |
        |            | Cultura de Alto Desempenho | A crença coletiva no impacto do trabalho contribui para uma cultura de alto desempenho, onde os membros da equipe se esforçam para alcançar objetivos comuns. |

    === "Idéias"
        Temos que enviar produtos com mais rapidez para acompanhar as crescentes necessidades dos clientes, sobreviver à concorrência e impulsionar a redução de custo, para tal, espera-se que o time seja dividido em duas partes:

        - [x] Uma parte deve se concentrar na configuração do processo adequado de desenvolvimento de software;
        - [x] Uma parte deve se aproveitar das ferramentas e tecnologias corretas para impulsionar a produtividade.

        !!! note "Técnicas a Aplicar"

            === "Driven Development/Design"
                - [x] **Cognitive-Driven Development (CDD);**
                - [x] **Career Driven Design (Carreia Orientado ao Domínio (CDD - IA))**;
                - [x] **Domain-Driven Design (Design Orientado ao Domínio - DDD)**;
                - [x] **Test-Driven Development (Desenvolvimento Orientado a Testes - TDD)**;
                - [x] **Behavior-Driven Development (Desenvolvimento Orientado ao Comportamento - BDD)**;
                - [x] **Feature-driven development (Desenvolvimento Orientado a Funcionalidades - FDD)**;
                - [x] **DOMA (Domain-Oriented Microservices Architecture)**;

            === "Lean"
                - [x] **Planejamento de Valor (Value Stream Mapping)**: Mapear todos os passos do processo de desenvolvimento para identificar desperdícios e melhorar o fluxo de trabalho.
                - [x] **Entrega Contínua de Valor (Continuous Delivery of Value)**: Entregar valor de forma incremental e contínua para o cliente, em ciclos rápidos.
                - [x] **Just-in-Time (JIT)**: Minimizar o trabalho em progresso e evitar a sobrecarga, garantindo que o time desenvolva apenas o que é necessário no momento.
                - [x] **Kaizen (Melhoria Contínua)**: Melhorar constantemente o processo de desenvolvimento, buscando eficiência e qualidade em todas as áreas.
                - [x] **Pull System (Sistema de Requisição)**: Evitar a sobrecarga da equipe e garantir que o trabalho só seja iniciado quando houver capacidade para completá-lo.
                - [x] **Feedback Rápido (Fast Feedback)**: Feedback rápido sobre o produto ou processo para tomar decisões mais informadas e ajustar rapidamente.
                - [x] **Eliminação de Desperdício (Waste Elimination)**: Eliminar desperdícios no processo de desenvolvimento para aumentar a eficiência.
                - [x] **Empoderamento das Equipes (Empowered Teams)**: Equipes a autoridade para tomar decisões rapidamente, sem bloqueios.
                - [x] **Desenvolvimento Contínuo de Habilidades (Continuous Learning)**: Fomentar uma cultura de aprendizado contínuo e adaptação ao longo do tempo.
                - [x] **Desdobramento de Objetivos (Goal Deployment)**: Garantir que todos os membros da equipe e a organização estejam alinhados com os objetivos estratégicos.
                - [x] Alguns termos:
                      - [x] GEMBA é "lugar real", ou seja, onde a ação da empresa acontece.
                      - [x] OBEYA é "lugar físico" ou virtual onde a geração de conhecimento acontece.
                      - [x] HEIJUNKA é um método Lean para a redução de desigualdade no processo de produção e minimização da chance de sobrecarga, ou seja, NIVELAMENTO.
                      - [x] Reduzir continuamente o lead time;
                      - [x] Produzir em lote cada vez menor;
                      - [x] Questionar sempre e não concordar com estoque;
                      - [x] Ajustar e controlar a capacidade com produção mix;
                      - [x] Atribuir aos processos anteriores uma carga balanceada
                      - [x] ANDON Ele cria alertas visuais por meio de luzes que destacam onde é necessário agir. Corda de Andon.

            === "Kanban"
                - [x] Reunião de Planejamento de Iteração (ou Reunião de Planejamento de Trabalho);
                - [x] Reunião de Reavaliação (ou Revisão de Trabalho);
                - [x] Reunião de Retrospectiva;
                - [x] Gestão Visual (ou Monitoramento Visual);

            === "XP"
                - [x] **Planejamento de Iteração (Iteration Planning)**: Define o trabalho que será feito durante o próximo ciclo de desenvolvimento;
                - [x] **Programação em Par (Pair Programming)**: Dois desenvolvedores trabalham juntos no mesmo computador para escrever código;
                - [x] **Reuniões de Revisão de Código (Code Reviews)**: A revisão constante de código no XP é uma prática diária e importante para garantir que o código esteja sempre limpo e sem erros.
                - [x] **Integração Contínua (Continuous Integration): Envolve a integração constante de código ao repositório compartilhado, várias vezes ao dia.
                - [x] **Refatoração (Refactoring)**: Envolve melhorar o design e a estrutura do código sem alterar seu comportamento.
                - [x] **Jogos de Planejamento (Planning Game)**: Envolve uma colaboração entre o cliente e a equipe de desenvolvimento para definir quais funcionalidades devem ser implementadas.
                - [x] **Release Planning (Planejamento de Release)**: Definição das versões do produto e como as funcionalidades serão entregues ao longo do tempo.
                - [x] **Feedback do Cliente (Customer Feedback)**: O cliente está envolvido o tempo todo para fornecer insights e aprovar funcionalidades à medida que são desenvolvidas.

            === "Scrum"
                - [x] **Sprint**: Representa um ciclo de trabalho de tempo fixo.
                - [x] **Sprint Planning (Planejamento da Sprint)**: Reunião onde toda a equipe Scrum (Scrum Master, Product Owner e o time de desenvolvimento) planeja o trabalho a ser realizado.
                - [x] **Daily Scrum (Reunião Diária)**: Reunião rápida de 15 minutos onde a equipe de desenvolvimento sincroniza suas atividades e discute os progressos.
                - [x]** Sprint Review (Revisão da Sprint)**: Equipe de desenvolvimento demonstra o trabalho realizado para o Product Owner e outras partes interessadas.
                - [x] **Sprint Retrospective (Retrospectiva da Sprint)**; Equipe reflete sobre o que aconteceu durante o Sprint e como melhorar os processos no futuro.

            === "DevOps"

                === "Anti-Padrão"
                    - [x] Punição pelos Erros;
                    - [x] Omissão das Informações;
                    - [x] Disputa entre as áreas e equipes;
                    - [x] Medo de arriscar gera pouca inovação;

                    === "Silos"
                        - [x] Equipes Isoladas;
                        - [x] Informação Centralizadas;
                        - [x] Ferramentas e Processos Diferentes;
                        - [x] Gestores precisam ser escalados sempre;

                    === "Implantação Manual"
                        - [x] Execução fora da ordem;
                        - [x] Esquecimento;
                        - [x] Falhas Humanas;
                        - [x] Demora;
                        - [x] Gargalo;

                === "Padrão"
                    - [x] Comunica;cão Eficaz;
                    - [x] GesTão de Pessoas;
                    - [x] Empatia;

                    === "Cultura"
                        Construir uma cultura de responsabilidade compartilhada, com transparência e feedback mais rápido é a base de toda equipe de DevOps que deseja ter um alto desempenho.
                        - [x] Baseie-se nos conceitos de "liberar cedo - liberar frequentemente" e "falhar rápido";

                    === "Foco"
                        - [x] Usar a exibição de atividade para ver as alterações em um repositório. Repositório de código DEVE SER a rede social do Developer;
                        - [x] Um bom programador Sênior,  entende a intensão.
                        - [x] Um bom programador Pleno, entende de design;
                        - [x] Um bom programador
                        - [x] Dizem: Que apenas 5% 5% dos artefatos de um repositório de um software, recebem 90% das alterações.
                        - [x] Reconheça apenas 5% devemos nos preocupar de forma MASSIVA.

            === "DevSecOps"
                - [x] Planejamento de Desenvolvimento Seguro (Secure Development Planning): Os requisitos de segurança sejam considerados desde o início do projeto.
                - [x] Análise Estática de Código (Static Application Security Testing - SAST): A análise estática de segurança verifica o código-fonte para identificar vulnerabilidades antes da execução.
                - [x] Integração Contínua com Segurança (CI + Security): Realizar verificações de segurança em cada build e automação do processo de segurança.
                - [x] Testes Dinâmicos de Aplicação (Dynamic Application Security Testing - DAST): Identificar vulnerabilidades que podem não ser detectadas apenas pela análise estática, como falhas que ocorrem enquanto o aplicativo está sendo executado em um ambiente de teste.
                - [x] Gerenciamento de Configuração Segura: Minimizar a superfície de ataque da infraestrutura e garantir que a configuração da infraestrutura seja segura.
                - [x] Automatização de Testes de Segurança no Pipeline (Security as Code)
                - [x] Análise de Vulnerabilidades em Imagens de Containers: Garantir que as imagens de containers não contenham vulnerabilidades de segurança.
                - [x] Controle de Acesso e Autenticação: Garantir que apenas usuários autorizados tenham acesso a recursos sensíveis.
                - [x] Monitoramento Contínuo e Resposta a Incidentes (Monitoring & Incident Response): Detectar vulnerabilidades, anomalias ou ataques enquanto o software está em produção.
                - [x] Avaliação Pós-Implantação (Post-Deployment Assessment): Garantir que a segurança esteja sendo mantida após a implantação de novas funcionalidades.

            === "Automatização"
                A automação também realiza a documentação de cada processo, auxiliando na padronização dos passos, sendo extremamente vantajosa para a empresa não só pela redução dos erros humanos, mas também porque o trabalho manual custa tempo e dinheiro.

                ![](img/time-001.png){width="850" height="950" style="display: block; margin: 0 auto"}
