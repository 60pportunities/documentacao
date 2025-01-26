        ## Branding, Marca, Persona e Arquétipo
        <div class="center-table" markdown>
        ```mermaid
        flowchart LR
            id1((Propósito)) --> id2((Conhecimento))
            id2 --> id3((Método)) --> id4((estrutura))
            id4 --> id5((Indicadores)) --> id6((Governança)) -->id7((Execução))
            id7 --> id8((Relaxamento)) --> id1
        ```
        </div>

                ```mermaid
        flowchart LR
            A(Meus Dados</br>são...) -->|Dados| B{Regulamentados}
            B --> |Sim| C(PCI DSS) & D(LGPD) & E(HIPAA) & F(SOX)
            B --> |Não| G{Retível?}
            G --> H{Necessita</br>Criptografia?}
            H --> |Sim| H0(Criptografa)
            H --> H1(Tag de</br>Retenção)
            H0 --> H1 --> RETER[(Retenção)]
            C --> H0 --> ARQUIVA[(Arquiva)]
            D --> H0
            E --> H0
            F --> H0
        ```

        ```mermaid
        flowchart TD
            A[Complexidade] --> B0[Comunicação] & B1[Enumerar Estados] & B2[Visão Geral] & B3[Efeitos Colaterais] & B4[Mudança</br>de Pessoal]
            B0 --> B01[Falhas] & B02[Excesso</br>de Custo] & B03[Atraso]
            B2 --> B21[Falha de</br>Integridade</br>Conceitual]
        ```

Arquitetura
- Serviços
- Event-Driven
- Web-Services
- Driva as coisas
  - Preciso ser mais eficiente
  - Diminuiçao da Carga Cognitiva, em função da diminuição de time'
    - Motivação, Reuso, DevEx, DevRel,
    - XP, Ágel, Devops, DevSecOps, Finops

    === "Prev vs Flex"
        Os gastos com nuvem são altamente flexíveis.
        Você não está mais incorrendo em grandes despesas de capital iniciais (CapEx) para comprar e manter sua própria infraestrutura de TI.

        Os gastos com serviços de nuvem podem ser incrementais

        Mudar de compras centralizadas e totalmente iniciais para um modelo de custo compartilhado incremental leva todos a assumir a responsabilidade por seus gastos com a nuvem e os capacita a otimizar esses gastos.

O objetivo do FinOps nem sempre é fazer as coisas da maneira mais barata, mas fazê-las da maneira que gere mais valor.

O objetivo do FinOps nem sempre é fazer as coisas da maneira mais barata, mas fazê-las da maneira que gere mais valor.

- [x] As equipes precisam colaborar: O FinOps exige que equipes multifuncionais trabalhem juntas em direção a um objetivo comum; A responsabilidade fiscal da nuvem é compartilhada entre as  equipes de engenharia, finanças, tecnologia e negócios.
- [x] As decisões são orientadas pelo valor comercial da nuvem
- [x] Todos assumem a responsabilidade pelo uso da nuvem
- [x] Os relatórios do FinOps devem ser acessíveis e oportunos
- [x] Uma equipe centralizada impulsiona o FinOps.
- [x] Aproveite o modelo de custo variável da nuvem


A primeira chave é o produto em si: A chave é identificar e comunicar o que torna seu produto significativo, seja qual for esse significado. Quando os desenvolvedores entendem completamente essa responsabilidade e importância, isso geralmente leva a um engajamento e dedicação mais profundos ao seu trabalho. Eu vi equipes transformarem sua atitude quando realmente entenderam como seu código impacta a vida de pessoas reais.

A segunda chave é o artesanato técnico: Equipes se orgulham de construir um código excelente. Resolvendo problemas algorítmicos complexos ou implementando soluções arquitetônicas elegantes, a excelência técnica.

A terceira chave é o espírito de equipe: Senso de pertencimento a algo especial. Envolve construir uma cultura onde a participação na equipe seja significativa e valorizada.

Essas três chaves não são mutuamente exclusivas - na verdade, elas frequentemente se reforçam.

Três principais observações dos desafios:
As organizações devem determinar seus produtos e quanto investir neles;
Cada produto pode ter um modelo operacional diferente; Todos os processos ágeis devem ser de propriedade das equipes que os usam.
A Autoridade do Produto é distribuída: Há muitas nuances em torno do título, autoridade e posição. Se você quer uma tomada de decisão mais rápida, ela precisa estar mais próxima da entrega (onde as coisas são aprendidas) e envolver menos pessoas (idealmente uma). Guard rails como meta e pequenos incrementos podem reduzir o risco. Não importa qual seja o título, desde que tenham autoridade para tomar decisões.


Uma visão de produto bem elaborada define o que você pretende alcançar e inspira e alinha todos os envolvidos na jornada em direção à criação de algo notável.

Clareza e Foco:  Auxilia a  priorização de recursos, fazer concessões e manter o foco em objetivos de longo prazo.
Alinhamento: Garante que todos estejam na mesma página, trabalhando em direção aos mesmos objetivos e motivados pelo mesmo propósito.
    - [x] Reúna Insights: identifique necessidades não atendidas e explore oportunidades de inovação.
    - [x] Envolva sua equipe; Organize workshops ou sessões de brainstorming ;
    - [x] Defina o Propósito Central: Por que seu produto existe? Que problema ele resolve?
    - [ ] Rascunhe e refine: Compartilhe, colete feedback e refine-o até que ele capture a essência do seu produto e ressoe com seu público.
    - [ ]  Comunique e Reforce: Comunicação regular, reuniões de equipe e processos de tomada de decisão.
Inspiração:  Cria um senso de propósito, convincente inspiração,levando-os a ultrapassar limites e inovar.




        ### Perguntas

        - [x] Como fazer discovery?
        - [x] Como priorizar diante de tantas demandas de diferentes stakeholders?
        - [x] Como conectar aos objetivos do negócio?
        - [x] Qual valor que plataforma entrega?
        - [x] Como provar o valor aos stakeholders de negócio?
        - [x] Quais são as métricas de sucesso?
        - [x] Como definir o domínio: até onde o produto vai e depois disso é responsabilidade de outro produto?
        - [x] Como lidar com a dependência entre produtos e times?
        - [x] Como definir o domínio: até onde o produto vai e depois disso é responsabilidade de outro produto?
        - [x] Como lidar com a dependência entre produtos e times? Como fazer discovery?
        - [x] Como o Developer Experience (DEVEX - Preparação) influencia no Customer-Facing (Apresentação), entregues de maneira satisfatória ao cliente final?
        - [x] O que é preciso saber sobre a tecnologia?

        ### Papel da TI
        Uma característica importante a observar é que o **produto ou serviço não pertence a TI** [^1], pertence aos usuários. A TI viabiliza as interações entre a necessidade e o valor, que pode ser B2B (Business to Business),  B2C (Business to Customer) ou B2W (Business to World/Web).
        A verdade é que exige uma operação parruda e, claro, muitas tecnologias! E daí, podemos dizer que entra em cena plataforma de produto (product platform) entra como estratégia.

        - [x] **Redução de time-to-market**: Há menos a ser desenvolvido para novos produtos entrarem no mercado; a empresa consegue responder mais rápido quando percebe oportunidades em novos nichos;
        - [x] **Redução de custos**: Elimina desperdício de tempo em aprendizado e dinheiro para desenvolver um recurso que já existe na empresa;
        - [x] **Redução de riscos**: Quanto mais se usa a plataforma, mais problemas podem ser identificados e, portanto, corrigidos, o que aumenta a qualidade.

        - [x] Plataforma de produto digital[^2] é o compartilhamento de recursos já existentes na empresa, como componentes, design e infraestrutura, elaborados de modo que possam ser reutilizados internamente em diferentes produtos — building blocks.
        - [x] Plataforma de produto depende da Plataforma de tecnologia.
        - [x] Plataformas de produtos precisam de altíssima disponibilidade para se manterem acessíveis a dezenas ou, quem sabe, centenas de aplicações e de produtos que derivam delas.
        - [x] Plataforma de negócio

        Então, para evitar confusão, convencionei o uso de certos termos:

        - [x] App para me referir a produtos customer-facing, seja aplicativos web ou mobile;
        - [x] Plataforma quando trato dos assuntos acerca da plataforma de produto;
        - [x] Produto expressa conceitos genéricos que englobam apps, produtos e plataformas.

        Plataforma de serviço segue o estilo de arquitetura de microsserviços baseada em nuvem (instância), composta por:

        - [x] **Interfaces assíncronas e síncronas**: A forma de interagir com os demais serviços;
        - [x] **Back-end**: Os recursos de computação que executam as regras de negócio;
        - [x] **Banco de Dados**: Onde são persistidos (salvos) os dados realtime que viabilizam a operação do negócio — por isso chamados de dados operacionais ou transacionais;
        - [x] **Microsserviços**: São limitados a um único propósito, a exemplo da Order Platform, que só processa pedidos;
        - [X] **Interface**: Usuário final utiliza a interface visual para interagir no app mobile ou web, os códigos das aplicações, frontend ou back-end, precisam de uma interface para facilitar a interação com a plataforma, mais precisamente a Interface de Programação de Aplicações (API).Tecnicamente, as APIs são categorizadas em:
              - [x] **API Privada**: É disponibilizada apenas internamente para interações entre sistemas da empresa;
              - [x] **API Pública**: É disponibilizada no mercado para uso fora da empresa e pode ter alguma forma de monetização, como a plataforma Google Maps, ou pode ser gratuita com a opção de logar com os dados do Facebook ou do Google, por exemplo.
              - [x] **API de Parceiros**: É semelhante à API pública, com a diferença de que o acesso externo é restrito aos parceiros da empresa.
        - [X] Para suportar os aplicativos/produtos, a plataforma de produto depende da plataforma de tecnologia, é onde se hospeda tudo o que é necessário para a execução e o acesso — código, arquivos, dados, configurações. Por isso, além de alta performance, as plataformas de produtos precisam de altíssima disponibilidade para se manterem acessíveis a dezenas ou, quem sabe, centenas de aplicações e de produtos que derivam delas.
        - [X] A ascensão da IA e do SaaS, fez com que houvesse uma expansão de APIs, e não apenas dentro da própria empresa.
        - [x] Um Product Manager, você deve conhecer as características do seu produto e responsabilizar pela qualidade, consequências, aprender sobre as características o potencial e as limitações do uso dele.

        [^1]: Deixo aqui um lembrete para a minha amiga: Cristiane Silva
        [^2]: Plataformas
            [The Power of Product Platforms](https://www.productbookshelf.com/2011/08/the-power-of-product-platforms/)
            [Volkswagen Platform Business](https://www.vw-platform-business.com/en.html)
            [OpenMotors](https://www.openmotors.co/evplatform/)
