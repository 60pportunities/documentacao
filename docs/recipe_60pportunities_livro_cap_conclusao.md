O Ciclo de Vida de Desenvolvimento de Software (SDLC) é uma metodologia estruturada que descreve as etapas envolvidas no desenvolvimento de aplicações de software. Ele fornece uma estrutura para as equipes de software planejarem, projetarem, desenvolverem, testarem e manterem produtos de software de forma eficiente. 

O SDLC oferece uma abordagem sistemática que minimiza riscos, melhora a qualidade e garante que os projetos de software sejam entregues no prazo e dentro do orçamento. As fases do SDLC geralmente incluem:

- [x] Coleta de requisitos: Envolve a compreensão das necessidades e expectativas das partes interessadas, capturando requisitos funcionais e não funcionais e definindo o escopo do projeto.
- [x] Design do sistema: Nesta fase, a arquitetura do software e o design do sistema são estabelecidos, incluindo a definição da estrutura geral, componentes, interfaces e fluxo de dados do sistema.
- [x] Implementação: A fase de implementação envolve a codificação e o desenvolvimento do software, com os desenvolvedores escrevendo código com base nas especificações de design e implementando a funcionalidade necessária.
- [x] Teste: O software é submetido a testes para verificar sua funcionalidade e garantir que atenda aos requisitos especificados.
- [x] Implantação: O software é preparado e liberado para uso em produção.
- [x] Manutenção: A fase final envolve a manutenção e o suporte contínuos do software.

Baseamos nossa abordagem na seguinte filosofia de design:

- [x] Privilégio mínimo: Conceda apenas o acesso e as permissões necessárias para realizar um trabalho e nada mais.
- [x] Imutabilidade: artefatos e infraestrutura não são modificados após a implantação em um ambiente. Se uma alteração for necessária, ela será feita na imagem ou no script no ambiente de desenvolvimento e, em seguida, promovida por meio dos ambientes superiores.
- [x] Tudo como código (DaC,IaC): Além dos artefatos de software(código de negócios ou infraestrutura), documentação, políticas de segurança também são implementadas como código e sujeitas aos mesmos controles dos artefatos de software.
- [x] Rastreabilidade: todas as alterações, seja na infraestrutura ou no código de negócios, são controladas por versão.

| Restringir    | Entenda                                                  |
| ---------     | --------------------                                     |
| Restringir    | Apenas pessoas autorizadas possam fazer alterações administrativas no sistema CI/CD. |
| Assinatura    | Apenas commits assinados com uma chave GPG de desenvolvedor. |
| Secrets       | As chaves de acesso de automação expiram automaticamente.    |
|               | Os acesso de automação para somente leitura, os sistemas de CI devem ter acesso  de leitura aos repositórios de código-fonte seguindo o princípio de acesso com privilégios. |
| Dependências de registro | Os gerenciadores de dependência de software modernos. |
| Vulnerabilidade crítica | Qq vulnarebilidade deve broker a compilação.      |
| Artefatos são armazenados em um repositório | Todos os artefatos devem ser armazenados em um repositório em cada estágio do pipeline de build para que haja uma rastreabilidade clara entre os resultados do teste e o artefato real que foi testado. |
| As solicitações de pull | As solicitações de pull exigem que dois revisores, duas revisões de código no momento das solicitações de pull, incluindo uma de um desenvolvedor que seja proprietário desse código. |
| Artefatos em repositórios superiores | Artefatos sejam assinados em um repositório durante todo o processo garante visibilidade e rastreabilidade para o que for implantado na produção. |
| Imagens de contêiner | As imagens de contêiner podem ser testadas com uma ferramenta de segurança de contêiner no pipeline. |
| Ambientes de compilação sejam efêmeros e imutáveis |  definidos em código com criação e desmontagem automatizadas, e que um novo ambiente seja criado para cada compilação. |

### Modelo em Cascata
O modelo em cascata é uma abordagem sequencial e linear ao desenvolvimento de software, onde as fases de desenvolvimento fluem de maneira linear, como uma cachoeira. Cada fase é concluída antes de passar para a seguinte, com pouca ou nenhuma sobreposição ou iteração entre as fases.

Fases do Modelo em Cascata:

- [X] Coleta de Requisitos: Envolve coletar e documentar os requisitos do software, envolvendo as partes interessadas.
- [X] Design do Sistema: O foco está em projetar o sistema de software com base nos requisitos, incluindo design de alto nível, baixo nível e banco de dados.
- [X] Implementação: Envolve traduzir o design do sistema em código real.
- [X] Teste: O software é testado para verificar sua funcionalidade.
- [X] Implantação: O software é liberado.
- [X] Manutenção: O software é mantido e recebe suporte contínuo.

- [X] Vantagens do Modelo em Cascata:
      
    - [X] Requisitos bem definidos e documentados.
    - [X] Gerenciamento de projeto mais fácil devido à sua natureza sequencial.
    - [X] Ambiguidade reduzida por meio de planejamento e documentação completos.
    - [X] Marcos e entregas claros para cada fase.
    - [X] Adequado para projetos pequenos com escopo bem definido.
    - [X] Documentação abrangente em cada fase.
    - [X] Cronogramas e custos de projeto mais previsíveis.
- [X] Desvantagens do Modelo em Cascata:
    - [X] Pouca flexibilidade para lidar com mudanças.
    - [X] Não adequado para projetos com requisitos incertos.

### Metodologia Ágil
A metodologia ágil é uma abordagem iterativa e colaborativa para o desenvolvimento de software que prioriza a satisfação do cliente e a aceitação da mudança. Metodologias ágeis enfatizam flexibilidade, colaboração e adaptabilidade.

- [X] Princípios Ágeis:
    - [X] Indivíduos e interações sobre processos e ferramentas.
    - [X] Software funcionando sobre documentação abrangente.
    - [X] Colaboração com o cliente sobre negociação de contrato.
    - [X] Responder à mudança em vez de seguir um plano.
    - [X] Equipes multifuncionais e auto-organizadas.

- [X] Melhoria contínua.
    - [X] Valorização da autonomia e conhecimento de indivíduos dentro da equipe.
    - [X] Comunicação direta e aberta.
    - [X] Manutenção de um ritmo de trabalho sustentável.

#### Desenvolvimento Iterativo e Incremental:
Desenvolvimento iterativo envolve o desenvolvimento e a entrega de software em iterações ou ciclos sucessivos.
Desenvolvimento incremental foca na entrega de funcionalidades de software em incrementos de valor de negócio.

- [X] Metodologias Ágeis:
    - [X] Scrum: Uma estrutura ágil que enfatiza flexibilidade, colaboração e melhoria contínua. O Scrum envolve papéis definidos, como Product Owner, Scrum Master e equipe de desenvolvimento. O trabalho é organizado em sprints, e eventos como planejamento de sprint, daily standup, revisão de sprint e retrospectiva de sprint são usados para gerenciar o processo de desenvolvimento.
    - [X] Kanban: Uma estrutura visual que se concentra no gerenciamento do fluxo de trabalho, limitando o trabalho em andamento e otimizando a eficiência. Ele usa um quadro Kanban para visualizar o fluxo de trabalho. O Kanban enfatiza entrega contínua, otimização de fluxo de trabalho e redução de desperdício.
    - [X] Lean: Uma metodologia que enfatiza a redução de desperdícios, melhoria contínua e entrega de valor aos clientes. Busca eliminar desperdícios, como funcionalidades desnecessárias, documentação excessiva e defeitos. O mapeamento do fluxo de valor é usado para identificar desperdícios e oportunidades de melhoria.
    - [X] DevOps: Uma abordagem colaborativa que combina desenvolvimento de software (Dev) e operações (Ops) para permitir integração contínua, implantação e entrega. Ele usa práticas como Integração Contínua e Implantação Contínua (CI/CD) e Infraestrutura como Código (IaC).
- [X] Gerenciamento de Requisitos: A coleta de requisitos é uma fase crítica no SDLC que envolve a coleta, análise e documentação das necessidades e expectativas das partes interessadas. A coleta completa de requisitos garante que o software atenda às necessidades dos negócios e dos usuários e reduz a necessidade de retrabalho durante o desenvolvimento. As técnicas para coleta de requisitos incluem entrevistas, análise de documentos, casos de uso e histórias de usuários.
- [X] Design de Sistemas e Arquitetura: O design do sistema define a estrutura e o comportamento de um sistema de software. Ele inclui princípios de design, padrões de design e estilos arquitetônicos. O design da interface do usuário (IU) é focado na criação de uma experiência intuitiva e amigável. O design do banco de dados define a estrutura do banco de dados, incluindo tabelas, relacionamentos e mecanismos de armazenamento de dados. Modelar e documentar a arquitetura do sistema é essencial para comunicação, análise de sistemas, design e manutenção eficazes.
- [X] Codificação e Implementação: A codificação e a implementação envolvem seguir as melhores práticas de codificação, usar controle de versão e realizar revisões de código. O código limpo é fácil de ler, entender e modificar. As práticas de controle de versão e revisão de código ajudam a garantir a qualidade do código e detectar problemas antecipadamente. É essencial escrever comentários claros, lidar com erros e exceções de forma eficaz, planejar extensibilidade e otimizar para legibilidade.
- [X] Teste de Software:  O teste é uma parte crucial do SDLC que garante a qualidade e a confiabilidade do software. Ele inclui vários tipos de testes, como testes de unidade, testes de integração, testes de sistema e testes de aceitação. O planejamento de testes, a execução de testes e a criação de relatórios são essenciais para garantir uma avaliação abrangente do software. A criação de casos de teste eficazes, configuração de ambientes de teste e acompanhamento de defeitos são as atividades principais durante os testes.
- [X] Implantação e Gerenciamento de Liberação: A fase de implantação envolve a preparação e liberação do software para uso em produção. Isso inclui a configuração do ambiente, migração de dados, planejamento de reversão e planejamento de contingência. O gerenciamento de liberação define objetivos claros para cada liberação, embalagem e versionamento de software. A documentação completa e o suporte pós-liberação são essenciais para os usuários finais. Reversões e hotfixes são importantes para resolver problemas durante a implantação e manter a estabilidade do sistema.
- [X] Documentação no SDLC:  A documentação é essencial em todo o SDLC. Vários tipos de documentação são usados, incluindo requisitos, design, usuário, técnico e gerenciamento de projetos. A documentação eficaz garante compreensão, colaboração e manutenabilidade. A escrita de manuais de usuário e documentação técnica deve ser clara, concisa e amigável. Documentar as decisões de design e as mudanças no sistema ajuda a manter um registro histórico e facilita a manutenção futura.
- [X] Segurança e Otimização de Desempenho: A segurança deve ser considerada em todo o SDLC. Práticas de codificação seguras, testes de segurança e modelagem de ameaças ajudam a prevenir vulnerabilidades e proteger os sistemas de software. Otimizar o desempenho envolve identificar e perfilar gargalos e empregar técnicas para melhorar o código e o desempenho do sistema. Ferramentas de gerenciamento de desempenho de aplicativos (APM) ajudam a obter insights sobre o desempenho do aplicativo.
- [X] Métricas Ágeis e Relatórios: Em projetos ágeis, o rastreamento do progresso é essencial. O uso de métricas ágeis como gráficos de burndown e velocidade ajudam a monitorar o progresso e o desempenho. Gráficos de burndown visualizam o trabalho restante ao longo do tempo, enquanto a velocidade mede a quantidade de trabalho que uma equipe conclui em um determinado período. Os relatórios ágeis fornecem insights sobre o desempenho da equipe e o progresso do projeto. As retrospectivas são essenciais para a melhoria contínua.
- [X] Transformação e Escalabilidade Ágil: A transformação ágil envolve a adaptação de metodologias ágeis em projetos e organizações maiores. Frameworks de escalabilidade, como SAFe (Scaled Agile Framework), ajudam as organizações a expandir as práticas ágeis. Existem desafios associados à transformação e à escalabilidade ágil que requerem uma abordagem ponderada.
- [X] Outsourcing e Offshoring: O outsourcing e o offshoring no SDLC envolvem terceirizar o desenvolvimento de software para fornecedores externos. Existem prós e contras nessa abordagem, como economia de custos versus desafios de comunicação. O gerenciamento de equipes distribuídas e centros de desenvolvimento offshore requer comunicação clara, processos de transferência de conhecimento e mitigação de barreiras de idioma.
- [X] Entrega Contínua e Metodologias em Evolução: A entrega contínua (CD) é uma prática de desenvolvimento de software que automatiza todo o processo de entrega, desde o commit do código até a implantação em produção. Isso inclui pipelines de entrega contínua e metodologias de evolução. Metodologias em evolução, como Lean, DevOps e SRE, integram-se à entrega contínua para aumentar a eficiência do processo de desenvolvimento.



| Times                 | Entenda | 
| -----                 | ------- |
| Alinhadas ao fluxo    | Alinhado a um único domínio de negócios ou capacidade organizacional (PeopleSoft, e-Business, Supravizio). Não deve haver transferências para outras equipes para concluir partes do trabalho. Eles o “possuem” do começo ao fim. (Sonia, Celso, Gerson, Leonam, Daniella, Cristiane, Gengis, Marco Aurelio e etc) |
| Capacitadora          | São compostas por especialistas em um determinado domínio de conhecimento, que pode ser mais técnico, ou mais focado no produto, ou qualquer outro domínio em que haja uma lacuna de habilidades na organização. Deve ser fortemente colaborativa por natureza. (Luciano, Sonia, Daniella e etc.) |
| Subsistema Complicado | É responsável por construir e manter um sistema que requer conhecimento especializado pesado. É reduzir a carga cognitiva das equipes alinhadas ao fluxo que trabalham no sistema. (Davi, Guilherme, Matheus, Jose Marcelo, Antonio, Denis...)   |
| Plataforma            | Uma equipe de plataforma permite que uma equipe alinhada ao fluxo entregue trabalho com autonomia substancial, fornecendo serviços internos para reduzir sua carga cognitiva. (???...???...???)       |

Ao restringir as equipes a apenas quatro tipos, a organização pode concentrar seu tempo nos **padrões de interação da equipe** que são conhecidos por promover o fluxo e agregar valor mais rapidamente.
# Voltemos a CHAMADA...
## A arte de resolver trade-off
Na década de 1990, a Arquitetura de Software emergiu como um subcampo explícito da engenharia de software. O que se seguiu foi uma estonteante variedade de propostas de notações, ferramentas,
técnicas e processos para apoiar o projeto arquitetônico e integrá-lo às práticas de desenvolvimento de software existentes.
## Arquitetura
**Temos** que garantir que os obbetivos do negócio, atributos de qualidade, restrição sejam atendidos. **Temos** que ponderar entre os objetivos, qualidade e restrições. 

* Componentes + Responsabilidades + Relacionamentos definem uma Estratégia, logo : _**Todo software possui uma arquitetura, mas nem todo time possui um arquiteto.**_

### Collection of Recipes
Normalmente seguimos uma receita... 

* Front-End (JavaScript, ViewJS,Angular, React, PHP), Back-end (Java, PHP, Node) e um Banco de Dados (Normalmente Relacional).
* Quando a aplicação é bem sucedida..Algo vem a mente, e voi-lá...Uma solução de cache (mencache, redis)..
* E também surge a ideia de colocar um banco de dados full-text, nasce a necessidade de se implantar algum mecanismo de sincronização.
* Escuta o transacional e popula o full-text (ElasticSearch) ou NoSQL (Colunar, Documento, Chave-Valor e assim vai)..
* Novamente, se os arquivos forem grande... iremos fazer criar um Worker.. e novamente...
* E se continuarmos, assim... vamos receber uma demanda para implementar um Kafka ou RabbitMQ.
* Quanto mais componentes, mais complexidade... e podemos ter um vazamento
* Times com DEVs experientes, passam a ser os Arquitetos, ou seja, geramos mais uma confusão ou DEVs Senniors passam a ser Arquitetos de Softwares ou [Staff Enginners](https://staffeng.com/book).

## Lembrando os Princípios do Manifesto Ágil
* As melhores arquiteturas, requisitos e designs emergem de equipes auto-organizáveis.
* Simplicidade: A arte de maximizar a quantidade de trabalho não realizado--é essencial.
* Os processos ágeis promovem desenvolvimento sustentável. Os patrocinadores, desenvolvedores e usuários devem ser capazes de manter um ritmo constante indefinidamente.
* Entregar frequentemente software funcionando, de poucas semanas a poucos meses, com preferência à menor escala de tempo.
* Contínua atenção à excelência técnica e bom design aumenta a agilidade.
* Nossa maior prioridade é satisfazer o cliente através da entrega contínua e adiantada de software com valor agregado.
* Mudanças nos requisitos são bem-vindas, mesmo tardiamente no desenvolvimento. Processos ágeis tiram vantagem das mudanças visando vantagem competitiva para o cliente.
* Pessoas de negócio e desenvolvedores devem trabalhar diariamente em conjunto por todo o projeto.
* Construa projetos em torno de indivíduos motivados.  Dê a eles o ambiente e o suporte necessário e confie neles para fazer o trabalho.
* O método mais eficiente e eficaz de transmitir informações para e entre uma equipe de desenvolvimento é através de conversa face a face.
* Software funcionando é a medida primária de progresso.
* Em intervalos regulares, a equipe reflete sobre como  se tornar mais eficaz e então refina e ajusta seu comportamento de acordo. 

# Estratégia organizacional
É um conceito de origem **militar** relacionado ao uso de meios e planos para atingir objetivos.

| Tipo                   | Entenda |
| ------                 | ------- |
| Visão                  | Onde a empresa deseja chegar, qual o seu "sonho", qual é a inspiração que direciona os esforços; |
| Missão                 | O que a empresa se propõe a fazer (qual a sua finalidade) e para quem (público-alvo);            |
| Objetivos              | O que deve ser alcançado para suportar a missão;                                                 |
| Metas                  | O alvo dos objetivos ou parâmetros normalmente mensuráveis.                                      |

## Pergunta: Como a TI se torna estratégica?
| Centro de Custo      | Centro de Resultado |
| -------              | --------            |
| Custo                | Investimento        |
| Cara                 | Compensa            |
| Estritamente Técnica | Parte do Negócio |
| Não entende o que o negócio quer | Interage e troca feedback com o negócio |
| Preciso saber quanto o **Projeto** irá custar. |  Preciso saber quanto o **Projeto** irá valer. |

# Governança x Arquitetura x Engenharia?

![](img/cesuc_rfc_back_to_the_future_012.png)

| Tipo        | Mundo Real  | Mundo TI |
| -----       | -------     | -------- |
| Governança  | A raiz da palavra governança vem de uma vocábulo grego que significa direção. Governança Corporativa - Sistema pelo qual as empresas e demais organizações são dirigidas, monitoradas e incentivadas, envolvendo os relacionamentos entre sócios, conselho de administração, diretoria, órgãos de fiscalização e controle e demais partes interessadas. | Governança de TI São ações, políticas, regras e processos direcionados ao uso de softwares, sistemas e infraestrutura de TI.  |
| Gestão      | Gestão executa processos alinhados a esse direcionamento. | - | 
| [Arquitetura](http://www.iso-architecture.org/ieee-1471/docs/all-about-ieee-1471.pdf) | É o processo artístico e técnico que envolve a elaboração de espaços organizados e criativos para abrigar diferentes tipos de atividades humanas. | Conceito abstrato, que se refere à organização de um sistema. Ela é responsável por definir os componentes que farão parte de um projeto, suas características, funções e a forma como devem interagir entre si e com outros softwares.  |
| Engenharia  | Conjunto de técnicas e métodos para aplicar o conhecimento técnico e científico na planificação, criação e manutenção de estruturas, máquinas e sistemas para benefício do ser humano.  |  É a área da ciência da computação que trata da especificação, arquitetura, desenvolvimento, manutenção e criação de software. Requisitos de Software, Antecipação a Mudanças, Abstração, Generalidade, Modularidade e etc. |
| Arquétipo   | É um termo usado em várias áreas do conhecimento, como psicologia, literatura, arte e computação. Refere-se a um modelo ou padrão de projeto que descreve as características e comportamentos comuns de um determinado tipo de sistema, processo ou objeto. |
