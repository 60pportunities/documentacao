 A Arquitetura de Referência IT4IT do Open Group é uma arquitetura de referência padrão e um modelo operacional baseado na cadeia de valor para gerir o negócio de TI.

Utiliza uma abordagem de cadeia de valor para criar um modelo das funções que a TI desempenha para ajudar as organizações a identificar as atividades que contribuem para a competitividade do negócio.

A cadeia de valor de TI: Uma cadeia de valor é uma série de atividades que uma organização realiza para entregar algo valioso, como um produto ou serviço.

Independência e Eficiência: A arquitetura foi projetada por profissionais para ser independente de indústria, produto e fornecedor, permitindo que a TI alcance previsibilidade e eficiência semelhantes à gestão da cadeia de suprimentos nos negócios.

A cadeia de valor de TI está agrupada em duas categorias principais de atividades:

- [x] Atividades primárias: Incluem planeamento, produção, consumo, cumprimento e suporte;
- [x] Atividades de apoio: Incluem finanças, recursos humanos, governação e gestão de fornecedores;

Fluxos de valor de TI: O framework IT4IT descreve quatro fluxos de valor (Estratégia para Portfólio, Requisito para Implementação, Solicitação para Atender, Detecção para Correcção). Os fluxos de valor primários na cadeia de valor de TI são:

- [x] Estratégia para Portfólio (S2P): Fornece às organizações de TI o framework ideal para interconectar as diferentes funções envolvidas na gestão do portfólio de serviços entregues à empresa;
    - [x] Objetivo: Alinhar a TI com os planos de negócios, otimizar os serviços e criar uma estrutura de portfólio de TI.
    - [x] Componentes Funcionais Chave: Arquitetura Empresarial, Política, Proposta, Demanda do Portfólio e Portfólio de Serviços.
    - [x] Políticas de TI: Devem estar alinhadas e mapeadas para Arquiteturas de Serviço, com histórico de revisão completo, e devem gerenciar políticas gerais de governança de TI.
    - [x] Proposta: Avalia as mudanças de escopo e atualiza os acordos de escopo, serve como a fonte autoritativa para listas de entregas de TI ou serviços durante o ciclo de vida do projeto, gerando relatórios para o portfólio de investimentos para rastrear com precisão o progresso e os resultados de um determinado Acordo de Escopo.
    - [x] Portfolio Backlog Item: Um Serviço Conceitual pode estar relacionado a um ou mais Itens de Backlog do Portfólio e, ao mesmo tempo, este último é mapeado para um ou mais Requisitos que precisam ser entregues para atender com sucesso à demanda.
    - [x] Service Portfolio: Avalia a eficácia dos serviços atuais e compara serviços semelhantes para identificar oportunidades de racionalização. "Shall manage all inventory information about services or applications; including business benefits, risk, quality, fit to purpose, etc."
    - [x] IT Investment Portfolio: Toma as propostas/solicitações orçamentárias para as aprovações necessárias com o respectivo comitê de governo, comunicando o status das decisões finais de investimento para as partes interessadas.

- [x] Requisito para Implementação (R2D): Fornece um modelo para gerir o ciclo de vida das versões de serviço, desde os requisitos até à implementação;
    - [x] Objetivo: Criar ou modificar aplicativos ou serviços de forma previsível e reutilizável, em ambientes multi-sourcing.
    - [x] Componentes Funcionais Chave: Projeto, Composição de Liberação, Requisito, Projeto de Serviço, Controle de Origem, Construção e Teste.
    - [x] Projeto: Receber Acordos de Escopo e coordenar a criação e fornecer supervisão contínua da execução de Iniciativas de TI destinadas à criação de novos serviços de TI ou aprimoramentos aos serviços existentes, mantendo as ligações de rastreabilidade entre os Acordos de Escopo, as Iniciativas de TI e as Versões de Serviço. (Seção 6.4.1)
    - [x] Release Composition: Acompanhar as diferentes versões de serviço, definindo a estrutura e o conteúdo da versão de serviço e seus componentes subjacentes, incluindo as instruções de como cada componente pode ser implantado.
    - [x] Requisito: Os requisitos devem ser gerenciados durante o ciclo de vida do serviço, mantendo a rastreabilidade de cada requisito para a solicitação original que gerou o Item de Backlog do Portfólio ao longo do ciclo de vida do serviço.
    - [x] Desenho do Serviço: Deve ser o sistema de registro (fonte autoritativa) para todos os Blueprints de Serviço Lógicos e pode receber as informações da Iniciativa de TI que incluem o escopo e algum conteúdo com base no qual o serviço é projetado.
    - [x] Source Control: Gerenciar todos os ativos relacionados aos recursos, como código-fonte, scripts, ativos de configuração, etc.
    - [x] Build: Automatizar o processo de construção e deve transformar o código-fonte em pacotes implantáveis.
    - [x] Teste: Planejar, armazenar e executar testes que garantam que o serviço oferecerá suporte aos requisitos do cliente nos níveis de serviço acordados.

- [x] Solicitação para Atender (R2F): Um framework que conecta os vários consumidores com bens e serviços que são usados para satisfazer as necessidades de produtividade e inovação;
    - [x] Objetivo: Conectar consumidores com bens e serviços para impulsionar a produtividade e a inovação.
        - [x] Componentes Funcionais Chave: Portal de Experiência de Engajamento, Gerenciamento de Ofertas, Atendimento de Solicitações, Execução de Atendimento, Uso, Cobrança/Showback e Conhecimento e Colaboração.
        - [x] Offer Consumption: Expor informações sobre o status do nível de serviço para os serviços aos quais o usuário se inscreveu e fornecer funcionalidade para pedir várias ofertas em uma transação.
       - [x]  Solicitação Racionalização: Garantir que as informações apropriadas de assinatura relacionadas ao atendimento sejam mantidas atualizadas e que os padrões de consumo de serviço que podem ser usados para moldar a demanda por serviços novos e/ou aprimorados possam ser registrados.
        - [x] Fulfillment Execution: Orquestrar a entrega das várias solicitações entre (um ou mais) mecanismos de atendimento para entregar o serviço de TI e gerar as Solicitações de Atendimento relevantes, a fim de realizar/atender à solicitação original do consumidor e ao objeto de dados Modelo de Serviço Desejado, que representa o Modelo de Serviço em seu estado pré-configurado ou configurado pelo consumidor.
        - [x] Usage: Rastrear o uso real dos serviços de TI subscritos, reunindo métricas de uso do serviço de TI, atividade e histórico para serviços de TI de origem interna e externa.
        - [x] Chargeback/Showback: Fornecer o preço de consumir/subscrever um serviço e pode levar em consideração o uso real ao calcular o preço de consumir um serviço.
        - [x] Conhecimento & Colaboração: Consumidores de serviços de TI e equipe de TI consomem conhecimento de terceiros através da mesma experiência que as formas formais e informais de conhecimento que a empresa fornece e devem fornecer funcionalidade para permitir que os consumidores de serviços de TI participem de Conversas relacionadas aos serviços de TI que consomem (colaboração).

- [x] Detecção para Correcção (D2C): Permite que a TI responda e corrija proativamente os problemas em todo o panorama de serviços;
    - [ ] Objetivo: Gerenciar eficientemente as operações de TI através do monitoramento de serviços, escalonamento de eventos, gerenciamento de incidentes/problemas e controle de mudanças automatizado.
    - [ ] Componentes Funcionais Chave: Monitoramento de Serviços, Evento, Incidente, Problema, Controle de Mudanças e Gerenciamento de Configuração. (Seção 8.4)
    - [ ] Service Monitoring: Executar a medição de todos os aspectos de um serviço de TI, armazenando os resultados e calculando os resultados de monitores de serviço compostos a partir de uma ou mais medições simples.
    - [ ] Problema, Erro Conhecido: Permite a criação de Defeitos quando correções de emergência/específicas exigem desenvolvimento e permite o rastreamento e resolução reativa e proativa de problemas recorrentes ou emergentes em um produto de TI, incluindo deficiências de design, consumo excessivo de recursos ou requisitos emergentes.
    - [ ] Configuration Management: Rastrear o ciclo de vida dos CIs e o histórico de seus relacionamentos, calcular e fornecer o impacto da mudança com base na mudança proposta e nos relacionamentos do CI.
    - [ ] Diagnóstico & Remediação: Pode permitir que um Evento acione um Run Book principalmente para fins de diagnóstico ou que um Incidente acione um Run Book para fins de diagnóstico ou remediação (remediação que não exige RFCs).
    - [ ] Service Level: Mede a qualidade dos serviços sendo fornecidos e pode enviar dados de relatório sobre o status do Nível de Serviço.

Destina-se a ajudar as organizações a adaptar-se às mudanças na tecnologia, processo e métodos, sem ter que refatorar a arquitetura de gestão para acomodar cada mudança

A Arquitetura de Referência IT4IT é comunicada usando múltiplos níveis de abstração. Cada nível de abstração expande o anterior para expor mais detalhes e orientação prescritiva. A Arquitetura de Referência IT4IT define cinco níveis de abstração :

- [x] Nível 1: Visão geral de ponta a ponta. (Conceitual): Define os fluxos de valor e os modelos de serviço.
- [x] Nível 2: Documentação do fluxo de valor. (Lógico): Refina os modelos com componentes funcionais e objetos de dados.
- [x] Nível 3: Arquitetura independente do fornecedor. (Vendor-Independent): Arquitetura independente de fornecedor.
- [x] Níveis 4 e 5: Extensões do fornecedor. (Vendor Extensions): Notação e nomenclatura específicas do fornecedor, mas alinhadas com a arquitetura de base.

Componentes Funcionais: Um componente funcional é a menor unidade de tecnologia que pode ser independente e útil como um todo para um profissional de TI (ou fornecedor de serviços de TI).

Deve ter entradas e saídas definidas que são objetos de dados e deve ter um impacto em um objeto de dados chave; por exemplo, criar, atualizar, apagar. Os componentes funcionais podem ser logicamente associados a capacidades de TI para clareza organizacional e serão sustentados com processos para impulsionar a uniformidade e consistência.

- [x] Componente Funcional Primário: Um componente funcional primário é representado usando um retângulo colorido de azul e é fundamental para um fluxo de valor específico.
- [x] Componente Funcional Secundário: Um componente funcional secundário é representado usando retângulos cinzentos

Objetos de Dados do Ciclo de Vida do Serviço: Um objeto de dados do ciclo de vida do serviço (objeto de dados do ciclo de vida) representa dados (registos, informações, etc.) que anotam ou modelam um aspecto de um serviço que está a ser oferecido pela TI.

- [x] Relações: As relações são primariamente usadas para descrever as conexões entre (ou interações com) objetos de dados.

Na Arquitetura de Referência IT4IT, as relações são baseadas em três princípios de design:

- [x] Sistema de registo: Usado para descrever as relações usadas para controlar dados de origem autoritários através de uma interface de sistema para sistema
- [x] Sistema de envolvimento: Usado para descrever as relações entre objetos de dados e humanos ou componentes funcionais através de uma interface de experiência do utilizador
- [x] Sistema de insight: Usado para descrever a informação de gestão que é combinada, agregada e analisada para fins de tomada de decisão.
- [x] Conformidade: Os leitores são aconselhados a verificar o site do Open Group para quaisquer requisitos de conformidade e certificação que referenciem esta norma.
- [x] Esta norma fornece um modelo repetível para criar um ecossistema de gestão de TI e serve como orientação de design para fornecedores de produtos e serviços de gestão de TI.
