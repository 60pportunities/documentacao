https://codefresh.io/learn/github-actions/working-with-github-actions-steps-options-and-code-examples/


https://learn.microsoft.com/pt-br/training/modules/authenticate-authorize-user-identities-github/5-team-synchronization


O que é o GitHub Actions?
GitHub Actions é uma plataforma para integração contínua/entrega contínua (CI/CD). Ela permite que você automatize pipelines de build, teste e implantação. Ela também permite que você execute código arbitrário em um repositório especificado quando um evento ocorre. Actions usa pacotes de código em contêineres Docker que são executados em servidores GitHub. Eles são compatíveis com todas as linguagens de programação para garantir que você possa executá-los em nuvens públicas, bem como em servidores locais. Isso faz parte de uma extensa série de guias sobre CI/CD .

Arquitetura e conceitos de ações do GitHub
O GitHub Actions permite que você configure seu fluxo de trabalho para ser acionado quando um evento específico ocorrer no repositório. Por exemplo, quando um problema é criado ou quando um pull request é aberto.

Um fluxo de trabalho contém um ou vários trabalhos em execução em ordem paralela ou sequencial. Cada trabalho é executado dentro de um contêiner ou em um executor de máquina virtual (VM) separado. Além disso, cada trabalho inclui uma ou várias etapas que executam um script predefinido ou uma ação, uma extensão reutilizável que simplifica seu fluxo de trabalho.

![](img/GitHub-Actions-workflow-structure.png)

Fluxos de trabalho de ações do GitHub
Um fluxo de trabalho do GitHub Actions é um processo automatizado que executa um ou vários trabalhos. Você pode configurar fluxos de trabalho definindo um arquivo YAML, que é verificado no repositório. Este arquivo é executado quando:

Acionado por um evento específico no repositório
Disparado manualmente
Em um cronograma predefinido
Você pode encontrar definições de fluxo de trabalho no diretório .github/workflows de cada repositório. Um repositório pode incluir vários fluxos de trabalho, cada um executando tarefas diferentes. Você pode usar, por exemplo, um fluxo de trabalho para construir e testar solicitações de pull, outro fluxo de trabalho para implantar o aplicativo sempre que uma versão for criada e um fluxo de trabalho adicional para adicionar um rótulo sempre que um novo problema for aberto.

Saiba mais em nosso guia detalhado sobre fluxos de trabalho do GitHub Actions (em breve)

Eventos de ações do GitHub
Um evento é uma atividade específica em um repositório que aciona uma execução de fluxo de trabalho. Por exemplo, a atividade pode se originar do GitHub quando alguém cria uma solicitação de pull, abre um problema ou envia um commit para um repositório. Você também pode acionar uma execução de fluxo de trabalho em uma programação, postando em uma API REST ou manualmente.

Gatilhos de fluxo de trabalho
Um gatilho de fluxo de trabalho é um evento que faz com que um fluxo de trabalho seja executado. Aqui estão alguns exemplos de gatilhos de fluxo de trabalho:

Eventos que ocorrem no repositório do fluxo de trabalho
Eventos que ocorrem fora do GitHub e acionam um evento repository_dispatch no GitHub
Manual
Horários agendados
Por exemplo, você pode configurar um fluxo de trabalho para ser executado assim que um push for feito para uma ramificação de repositório padrão, assim que um problema for aberto e assim que uma versão for criada.

Trabalhos de ações do GitHub
Um trabalho no GitHub Actions é uma série de etapas de fluxo de trabalho que são executadas em um único executor. As etapas podem incluir ações para executar ou scripts de shell para execução. As ações executam cada etapa em ordem, pois todas as etapas em um trabalho são interdependentes. Ele executa cada etapa no mesmo executor, permitindo o compartilhamento de dados entre as etapas. Por exemplo, se você tiver uma etapa para criar um aplicativo, pode haver uma etapa subsequente para testar o aplicativo recém-criado.

Os trabalhos não têm dependências por padrão, mas você pode configurar os trabalhos para serem dependentes de outros trabalhos e executados em sequência. Caso contrário, os trabalhos serão executados em paralelo. Se um trabalho tiver uma dependência de outro trabalho, ele deverá aguardar a conclusão desse trabalho antes de ser executado. Pode haver vários trabalhos de compilação, cada um para uma arquitetura diferente, sem nenhuma dependência — no entanto, um trabalho de empacotamento seria dependente desses trabalhos. Os trabalhos de compilação não dependentes são executados simultaneamente, mas o trabalho de empacotamento só pode ser executado quando todos os trabalhos de compilação forem concluídos.

Matriz de ações do GitHub
Você pode usar uma estratégia de matriz para executar vários trabalhos relacionados com base na mesma definição de trabalho. Diferentes combinações de variáveis ​​na definição de trabalho criam automaticamente diferentes execuções de trabalho. Por exemplo, uma matriz pode ser útil para testar código em diferentes sistemas operacionais ou em diferentes versões de uma linguagem de programação.

Ações
Ações são aplicativos personalizados para GitHub Actions que realizam tarefas complexas, mas repetitivas. Você pode usar ações para evitar escrever muito código repetitivo em um fluxo de trabalho. Uma ação pode extrair um repositório do GitHub, configurar medidas de autenticação para o provedor de nuvem ou configurar a cadeia de ferramentas correta para o ambiente de desenvolvimento.

Você pode escrever uma ação do zero ou usar uma ação existente disponível no GitHub Marketplace em seu fluxo de trabalho.

Corredores
Os executores são máquinas que têm o aplicativo executor GitHub Actions instalado. Eles aguardam os trabalhos disponíveis para serem executados. Depois que um executor pega um trabalho, ele executa as ações especificadas pelo trabalho e relata os resultados ao Github. Você pode hospedar executores em seu próprio servidor ou máquina ou usar executores hospedados no GitHub.

Cache de dependência de fluxo de trabalho
Uma execução de fluxo de trabalho pode reutilizar as saídas e dependências de outras execuções. Ferramentas de gerenciamento de dependências e pacotes como Maven, npm, Yarn e Gradle mantêm caches locais de todas as dependências baixadas.

Cada trabalho em um executor hospedado no GitHub começa em um ambiente novo, então é necessário baixar as dependências para cada novo trabalho. Esses downloads podem prolongar o tempo de execução, aumentar a utilização da rede e aumentar os custos. O GitHub permite que você acelere o processo de recriação de arquivos de dependência armazenando em cache os arquivos usados ​​com frequência em um fluxo de trabalho.

Você pode armazenar em cache dependências de trabalho usando a ação cache no GitHub. Essa ação cria e restaura caches identificados usando chaves exclusivas.

CI/CD com ações do GitHub
O GitHub Action oferece suporte à integração e implantação contínuas.

Integração contínua com ações do GitHub
Integração contínua é uma prática de desenvolvimento de software que envolve commits frequentes para um repositório de código compartilhado. O GitHub Actions fornece fluxos de trabalho de integração contínua (CI) que podem criar código no repositório e executar testes. Um fluxo de trabalho pode ser executado em uma VM hospedada no GitHub ou em uma máquina auto-hospedada.

Você configura fluxos de trabalho de CI para serem executados em resposta a eventos específicos do GitHub — por exemplo, quando um desenvolvedor envia um novo código para o repositório. Você também pode usar o webhook de despacho do repositório para agendar fluxos de trabalho ou definir gatilhos com base em eventos externos.

O GitHub executa os testes de CI, fornecendo os resultados para todos os testes em uma solicitação de pull. Ele permite que você visualize quaisquer erros introduzidos na ramificação por cada alteração. Depois que uma alteração tiver passado em todos os testes de CI no fluxo de trabalho, ela estará pronta para revisão pelos membros da equipe, e você poderá mesclá-la no repositório. Se o commit falhar em um teste, é uma indicação de uma alteração de quebra.

Ao configurar a integração contínua no repositório Git, o GitHub analisará seu código e recomendará fluxos de trabalho de CI específicos com base na estrutura e na linguagem do seu repositório. Por exemplo, o GitHub sugere fluxos de trabalho iniciais que instalam os pacotes apropriados e executam os testes (ou seja, um pacote Node.js se você estiver usando Node.js). Você pode usar o fluxo de trabalho inicial recomendado pelo GitHub como está, personalizá-lo de acordo com suas necessidades ou criar um novo fluxo de trabalho personalizado para executar os testes de integração contínua.

![](img/Selecting-a-workflow-in-GitHub-Actions.png)

O GitHub Actions ajuda você a configurar um fluxo de trabalho de CI para seu projeto de desenvolvimento e pode criar fluxos de trabalho para todo o SDLC. Você pode configurar ações para empacotar, implantar e liberar um projeto.

Implantação contínua com ações do GitHub
A implantação contínua é uma extensão da integração e entrega contínuas que automatiza o processo de publicação e implantação de lançamentos de software. Uma ferramenta de CI/CD normalmente cria e testa o código automaticamente antes de implantá-lo como parte do processo de implantação contínua.

Você pode configurar fluxos de trabalho do GitHub Actions para implantar produtos de software. Um fluxo de trabalho pode verificar se o código funciona conforme o esperado ao construir o código no repositório e executar testes antes da implantação.

Você pode agendar fluxos de trabalho de CD para execução em resposta a eventos específicos do GitHub, como um desenvolvedor enviando código para o branch padrão do repositório do seu repositório. Como alternativa, as cargas de trabalho podem ser executadas em agendamentos definidos, quando acionadas manualmente ou em resposta a eventos externos.

O GitHub Actions oferece vários recursos para ajudar você a controlar suas implantações. Os ambientes permitem que você bloqueie trabalhos até que eles recebam aprovação, restrinja as ramificações que podem disparar fluxos de trabalho ou restrinja o acesso a segredos. A simultaneidade permite que você limite o pipeline de CD a uma implantação em andamento e uma pendente por vez.

Conteúdo relacionado: Leia nosso guia sobre GitHub Actions vs. CircleCI (em breve)

Tutorial de início rápido do GitHub Actions
Usar GitHub Actions requer um repositório GitHub. Os trabalhos em um fluxo de trabalho podem executar automaticamente ações relacionadas ao repositório e interagir com o código do repositório também.

Criar fluxo de trabalho
Para criar fluxos de trabalho no GitHub Actions:

Crie um novo diretório em seu repositório e nomeie-o.github/fluxos de trabalho se tal diretório ainda não existir.
No novo diretório, clique no botão Adicionar arquivo no canto superior direito da janela e selecione Criar novo arquivo . Nomeie o arquivo recém-criadodemonstração-github-ações-fluxo de trabalho. yml
Cole o seguinte código nodemonstração-github-ações-fluxo de trabalho. yml


```
name: Demo GitHub Actions Workflow
on: [push]
jobs:
  Discover-GitHub-Actions-Workflows:
    runs-on: ubuntu-latest
    steps:
     —run: echo "${{ github.event_name }} event automatically triggered this job."
     —run: echo " A ${{ runner.os }} server hosted by GitHub has this job running"
     —run: echo "Details of your repository: repo-name: ${{ github.repository }} and branch name is${{ github.ref }} and your repository is ${{ github.repository }}."
     —name: Checking out the repository’s code
        uses: actions/checkout@v4
     —run: echo "The runner has cloned your ${{ github.repository }} repository."
     —run: echo "The workflow can now test your code with the runner."
     —name: List files in the repository
        run: |
          ls ${{ github.workspace }}
     —run: echo " This job has a ${{ job.status }} status."
```

Clique em Propor novo arquivo para criar uma solicitação pull para enviar este arquivo ao repositório.
 Vá até o final da página e selecione a opção Criar uma nova ramificação para este commit e iniciar uma solicitação de pull .
Quando o arquivo yml é confirmado, o evento push aciona o fluxo de trabalho descrito nele. Os resultados do fluxo de trabalho são mostrados em uma opção diferente.

Ver resultados do fluxo de trabalho
Para ver os resultados após executar um fluxo de trabalho do GitHub Actions:

Vá para a página principal do repositório e clique em Ações na barra abaixo do nome do repositório.
Uma barra lateral à esquerda mostra todos os fluxos de trabalho na página que abre. Clique na que exibe Demo-GitHub-Actions-Workflow, o nome do fluxo de trabalho criado para este tutorial.
A lista no centro mostra os fluxos de trabalho que foram executados. Selecione aquele que exibe Create demo-github-actions-workflow.yml para ver os resultados do criado na seção anterior, Create Workflow.
Na barra lateral à esquerda que exibe Jobs, selecione aquela que exibe Discover-GitHub-Actions-Workflows.
O log que é aberto mostra cada etapa do fluxo de trabalho e qual saída ela causou.
Os passos para as instruções echo no fluxo de trabalho mostram as variáveis ​​substituídas por seus respectivos valores. Clique em um passo que exibe List files in the repository, e ele mostra os arquivos presentes no repositório.
Nota : O GitHub fornece fluxos de trabalho pré-construídos que os usuários podem usar como um modelo e personalizar conforme suas necessidades. O GitHub sugere o fluxo de trabalho inicial correto com base em quais bibliotecas, linguagens e frameworks estão no código do repositório.

Conteúdo relacionado: Vá além do básico com nosso tutorial completo do GitHub Actions (em breve)

Melhores práticas de ações do GitHub
Aqui estão algumas dicas para usar o GitHub Actions.

Use ações mínimas
A máquina virtual de uma ação tem alta largura de banda e é relativamente rápida, mas ações complexas levam mais tempo para serem configuradas e executadas, resultando em mais tempo gasto esperando. O GitHub Actions tem planos de máquina virtual limitados — o plano gratuito tem um limite de 2000 minutos gratuitos em um determinado mês.

Ao configurar um fluxo de trabalho ou ação, você pode não sentir que alguns segundos fazem uma grande diferença — no entanto, esses segundos se somam dependendo dos eventos que acionam as ações e fluxos de trabalho. Uma prática recomendada importante ao criar novas ações é tentar mantê-las o mais mínimas possível.

Por exemplo, você deve usar imagens leves do Docker para ações que rodam em contêineres — por exemplo, alpine, alpine-node. Mantenha as instalações no mínimo para reduzir o tempo de execução da ação, da inicialização até a conclusão.

Manter as ações leves é importante, independentemente de você criar uma ação autônoma ou um fluxo de trabalho CI/CD completo. O GitHub Actions configura e executa cada ação em um ambiente limpo para cada execução, então ele tem que baixar e instalar todas as dependências todas as vezes.

Evite downloads de dependência desnecessários
Outra maneira de reduzir o tempo de execução é evitar instalar ou baixar dependências sempre que possível. Você pode usar vários métodos para minimizar os downloads de dependências, embora todos eles sejam baseados em duas estratégias principais.

A primeira abordagem é publicar uma pasta inteira de módulo de nó. Essa estratégia é adequada para publicar ações autônomas em projetos baseados em nó. A segunda abordagem é aproveitar o mecanismo de cache no GitHub sempre que possível. Essa estratégia é adequada para ações autônomas, bem como ações em execução dentro de um fluxo de trabalho de CI.

Evite segredos de codificação rígida
Um recurso importante do GitHub Actions é o gerenciamento de segredos. Você armazena segredos criptografados dentro das configurações do repositório, fornecendo-os como variáveis ​​de ambiente ou entradas para suas ações sempre que escolher. O GitHub Actions redige automaticamente segredos registrados acidentalmente ou intencionalmente. No entanto, a documentação do GitHub também recomenda que você evite registrar segredos porque esse recurso de redação automática não é totalmente eficaz, especialmente para segredos que contêm dados estruturados.

A principal lição dessa abordagem é evitar codificar manualmente quaisquer segredos em fluxos de trabalho públicos ou privados. Você deve definir segredos manualmente nas configurações do seu repositório e usar entradas de etapas ou variáveis ​​de ambiente para acessá-los.

Armazene detalhes de autoria nos metadados de ação
Você pode incentivar autores de ações a assumir a propriedade de seu código especificando o autor da ação nos metadados — esses dados residem em um arquivo YML que define a ação. Esses metadados podem incluir muitos detalhes sobre cada ação, incluindo suas entradas necessárias, marca, ponto de entrada, saídas e autor.

Há dois casos de uso principais para incluir o autor da ação no arquivo de metadados. Primeiro, quando você tem ações públicas, é importante atribuir cada ação ao autor correto. Além de dar crédito aos autores por seu trabalho, isso permite que outros que estão usando as ações identifiquem e consultem o autor com quaisquer perguntas.

O segundo caso de uso se aplica a ações privadas com uma organização. A questão do crédito é menos relevante porque ninguém de fora da empresa verá. No entanto, a equipe interna ainda precisa saber quem é responsável por cada ação — o autor mantém e responde perguntas sobre a ação.

Combine GitHub Actions com Codefresh para dar suporte a implantações GitOps e Kubernetes
GitHub actions é uma plataforma muito poderosa, mas é focada principalmente em CI e não suporta GitOps e implantações nativas do Kubernetes. O Codefresh é criado especificamente para GitOps e aplicativos nativos da Cloud e inclui suporte nativo para usar GitHub Actions para a parte de CI do ciclo de vida do Software.

Isso significa que você pode obter o melhor dos dois mundos mantendo todos os seus fluxos de trabalho de CI no GitHub Actions, enquanto usa o Codefresh para recursos avançados, como:

Painéis de aplicação
Gerenciamento de fontes Git
Gerenciamento de desvio de configuração
Painéis do ambiente Kubernetes
Vistas de topologia
Caso você seja novo no Codefresh, nossa missão desde 2014 é ajudar equipes a acelerar seu ritmo de inovação. O Codefresh lançou recentemente um conjunto de ferramentas GitOps CI/CD completamente reconstruído. Desenvolvido pela Argo, o Codefresh agora combina o melhor do código aberto com um tempo de execução de nível empresarial, permitindo que você aproveite totalmente o poder dos fluxos de trabalho, eventos, CD e rollouts do Argo. Ele fornece às equipes uma experiência GitOps unificada para criar, testar, implantar e dimensionar seus aplicativos.

Veja nossos guias adicionais sobre os principais tópicos de CI/CD
Juntamente com nossos parceiros de conteúdo, criamos guias detalhados sobre vários outros tópicos que também podem ser úteis à medida que você explora o mundo de CI/CD .


O que é a implantação de ações do GitHub?
O GitHub fornece o GitHub Actions , uma plataforma CI/CD (Continuous Integration/Continuous Deployment) que automatiza a implantação de aplicativos. Ele se integra ao seu repositório de código do GitHub, permitindo que você defina fluxos de trabalho em arquivos YAML que executam etapas predefinidas quando acionados. Essas ações podem implantar código em vários ambientes, incluindo servidores VM, infraestruturas de nuvem e clusters Kubernetes.

O GitHub Actions oferece suporte à implantação contínua (CD), que é a prática de implantar cada alteração de código na produção, após testes automatizados. Você pode usar o GitHub Actions para garantir que cada alteração na base de código seja automaticamente criada, testada e implantada sem intervenção manual, acelerando assim o processo de entrega de software.

O GitHub Actions permite que você configure fluxos de trabalho personalizados que podem ser acionados por vários eventos, como pushes de código, pull requests ou horários agendados. Cada fluxo de trabalho é definido em um arquivo YAML dentro do repositório, especificando as etapas necessárias para construir, testar e implantar o aplicativo.

Configurando um fluxo de trabalho de implantação contínua no GitHub Actions
Para configurar um fluxo de trabalho de CD com GitHub Actions, comece definindo um arquivo YAML de fluxo de trabalho no seu repositório. Este arquivo descreverá as etapas para construir, testar e implantar seu aplicativo.

Observação: o exemplo a seguir pressupõe que você tenha o Kubernetes em execução no seu sistema. Você pode executar um cluster Kubernetes mínimo usando o minikube.

Suponha que você tenha um script Python chamado app.py que chama uma API para obter os preços atuais do ouro. Você pode configurar o fluxo de trabalho para disparar em eventos específicos, como enviar código para o branch principal:


O que é a implantação de ações do GitHub?
O GitHub fornece o GitHub Actions , uma plataforma CI/CD (Continuous Integration/Continuous Deployment) que automatiza a implantação de aplicativos. Ele se integra ao seu repositório de código do GitHub, permitindo que você defina fluxos de trabalho em arquivos YAML que executam etapas predefinidas quando acionados. Essas ações podem implantar código em vários ambientes, incluindo servidores VM, infraestruturas de nuvem e clusters Kubernetes.

O GitHub Actions oferece suporte à implantação contínua (CD), que é a prática de implantar cada alteração de código na produção, após testes automatizados. Você pode usar o GitHub Actions para garantir que cada alteração na base de código seja automaticamente criada, testada e implantada sem intervenção manual, acelerando assim o processo de entrega de software.

O GitHub Actions permite que você configure fluxos de trabalho personalizados que podem ser acionados por vários eventos, como pushes de código, pull requests ou horários agendados. Cada fluxo de trabalho é definido em um arquivo YAML dentro do repositório, especificando as etapas necessárias para construir, testar e implantar o aplicativo.

Configurando um fluxo de trabalho de implantação contínua no GitHub Actions
Para configurar um fluxo de trabalho de CD com GitHub Actions, comece definindo um arquivo YAML de fluxo de trabalho no seu repositório. Este arquivo descreverá as etapas para construir, testar e implantar seu aplicativo.

Observação: o exemplo a seguir pressupõe que você tenha o Kubernetes em execução no seu sistema. Você pode executar um cluster Kubernetes mínimo usando o minikube.

Suponha que você tenha um script Python chamado app.py que chama uma API para obter os preços atuais do ouro. Você pode configurar o fluxo de trabalho para disparar em eventos específicos, como enviar código para o branch principal:

Agora navegue até a página Ações do seu repositório do GitHub, você verá que uma ação é acionada automaticamente:


```
DICAS DO ESPECIALISTA
Na minha experiência, aqui estão algumas dicas que podem ajudar você a aproveitar melhor a implantação do GitHub Actions:

- [x] Aproveite fluxos de trabalho reutilizáveis: Utilize fluxos de trabalho reutilizáveis ​​para DRY (Don't Repeat Yourself) suas configurações de pipeline. Essa abordagem modular permite que você defina etapas comuns em um só lugar e faça referência a elas em vários fluxos de trabalho, melhorando a manutenibilidade e a consistência.
- [x] Criação de ambiente dinâmico: crie ambientes dinâmicos para branches de recursos usando ferramentas como Terraform ou Pulumi em seus fluxos de trabalho. Isso pode ajudar a isolar alterações e conduzir testes completos antes de mesclar para o branch principal, garantindo estabilidade em ambientes de produção.
- [x] Use builds de matriz para suporte multiplataforma: configure builds de matriz para testar seu aplicativo em diferentes ambientes e configurações simultaneamente. Isso garante que seu aplicativo funcione corretamente em todas as plataformas pretendidas e reduz o tempo necessário para testes abrangentes.
- [x] Monitore o tempo de execução do fluxo de trabalho: rastreie o tempo de execução dos seus fluxos de trabalho para identificar gargalos e otimizar etapas que consomem tempo. O GitHub Actions fornece logs e métricas detalhados que podem ajudar a analisar e melhorar a eficiência do seu pipeline.
- [x] Utilize etapas de execução compostas: Use etapas de execução compostas para agrupar vários comandos em uma única etapa em seus fluxos de trabalho. Isso pode simplificar tarefas complexas, tornando suas definições de fluxo de trabalho mais limpas e fáceis de entender e gerenciar.
```

O que são fluxos de trabalho reutilizáveis ​​do GitHub Actions?
GitHub Actions é a plataforma CI/CD do GitHub, integrada ao repositório GitHub e ao sistema de controle de versão. Os fluxos de trabalho reutilizáveis ​​são fluxos de trabalho modulares predefinidos que podem ser invocados em outros fluxos de trabalho para aumentar a eficiência e a manutenibilidade. Eles eliminam o código repetitivo, permitindo que você crie componentes que podem ser utilizados em vários repositórios ou em diferentes fluxos de trabalho no mesmo repositório.

Ao encapsular tarefas comuns, os fluxos de trabalho reutilizáveis ​​permitem que os desenvolvedores se concentrem nos aspectos únicos de seus projetos, ao mesmo tempo em que garantem que as operações padrão sejam executadas de forma confiável. Essa abordagem se alinha com as melhores práticas em desenvolvimento de software, como o princípio DRY (Don't Repeat Yourself).

Quais são os benefícios dos fluxos de trabalho reutilizáveis?
Aqui estão alguns benefícios principais do recurso de fluxos de trabalho reutilizáveis ​​no GitHub Actions:

Evite redundância: fluxos de trabalho reutilizáveis ​​podem simplificar a manutenção. Se vários projetos exigirem uma sequência semelhante de etapas de CI/CD, você pode encapsular essa sequência em um fluxo de trabalho reutilizável. Em vez de duplicar essas etapas no fluxo de trabalho de cada projeto, você faz referência ao fluxo de trabalho reutilizável, garantindo que as alterações sejam feitas apenas uma vez.
Acelere a criação de fluxos de trabalho: Ao configurar fluxos de trabalho para novos projetos, em vez de escrever cada etapa do zero, você pode recorrer a esses fluxos de trabalho reutilizáveis. Isso também promove um ambiente em que os fluxos de trabalho são aprimorados iterativamente.
Aumente a segurança: fluxos de trabalho reutilizáveis ​​podem ser protegidos implementando controles de acesso rigorosos, e esses controles são replicados para cada projeto que usa os fluxos de trabalho. Ao definir um conjunto de ações ou fluxos de trabalho reutilizáveis ​​e limitar quem pode editá-los, as organizações podem instituir um ambiente de CI/CD controlado e seguro.
Automatizando a conformidade: fluxos de trabalho reutilizáveis ​​podem encapsular as melhores práticas e verificações obrigatórias que garantem que o código e as implantações atendam aos critérios de conformidade predefinidos. Por exemplo, um fluxo de trabalho reutilizável pode incluir etapas para verificações de qualidade de código, varredura de segurança, verificação de conformidade de licença e registro de auditoria.
Conteúdo relacionado: Leia nosso guia para o fluxo de trabalho de ações do GitHub

Ação composta vs. fluxos de trabalho reutilizáveis: quais são as diferenças?
Embora tanto as ações compostas quanto os fluxos de trabalho reutilizáveis ​​tenham como objetivo modularizar e simplificar as Ações do GitHub, eles atendem a propósitos diferentes e oferecem vantagens distintas.

Ações compostas agrupam várias etapas em uma única ação. Isso permite que você crie ações complexas a partir de outras mais simples. Ações compostas são armazenadas em um repositório e podem ser referenciadas como qualquer outra ação do GitHub. Elas são adequadas para empacotar sequências repetíveis de etapas que você deseja reutilizar em diferentes fluxos de trabalho.

Os fluxos de trabalho reutilizáveis ​​permitem que fluxos de trabalho inteiros sejam reutilizados em outros fluxos de trabalho. Esse recurso é particularmente útil para padronizar pipelines complexos de CI/CD em vários projetos. Os fluxos de trabalho reutilizáveis ​​são definidos em um arquivo YAML e podem ser invocados de outros fluxos de trabalho no mesmo repositório ou até mesmo em repositórios diferentes.

Embora as ações compostas sejam melhores para criar conjuntos reutilizáveis ​​de etapas, os fluxos de trabalho reutilizáveis ​​são mais adequados para padronizar pipelines CI/CD inteiros em vários projetos. Cada um desses recursos opera em um nível diferente da arquitetura do GitHub Actions.

Componentes de um fluxo de trabalho reutilizável
Evento de disparo
O evento de disparo é um componente crucial de um fluxo de trabalho reutilizável, pois determina quando o fluxo de trabalho deve ser executado. Eventos de disparo comuns incluem eventos push, solicitações pull e intervalos programados. Ao definir esses disparos com precisão, os desenvolvedores podem garantir que os fluxos de trabalho sejam executados em momentos apropriados, como após confirmações de código ou em horários específicos do dia.

Definição de entrada
A definição de entrada inclui parâmetros que podem ser passados ​​para o fluxo de trabalho quando ele é invocado, permitindo personalização sem alterar o código interno do fluxo de trabalho. Essas entradas podem ser qualquer coisa, desde números de versão até sinalizadores de recursos específicos que podem precisar ser alternados durante a execução do fluxo de trabalho.

Definir entradas em um fluxo de trabalho reutilizável concede maior flexibilidade e controle sobre como o fluxo de trabalho opera. Ele permite que os desenvolvedores adaptem o comportamento do fluxo de trabalho com base nos requisitos específicos de cada projeto ou cenário.

Passando segredos nomeados
Passar segredos nomeados com segurança dentro de fluxos de trabalho reutilizáveis ​​é crucial para manter a segurança e a integridade de informações confidenciais do projeto. Os segredos nomeados normalmente incluem tokens, chaves de API e credenciais necessárias durante a execução do fluxo de trabalho. O GitHub fornece mecanismos para armazenar esses segredos com segurança e acessá-los quando necessário em um fluxo de trabalho.

Usar segredos nomeados garante que dados sensíveis permaneçam confidenciais e não sejam expostos na base de código. Ao configurar fluxos de trabalho reutilizáveis, é essencial definir como esses segredos serão passados ​​e acessados, garantindo que eles permaneçam protegidos, mas acessíveis quando necessário, aumentando assim a segurança dos seus processos de CI/CD.

```
Controle de versão de seus fluxos de trabalho reutilizáveis : trate seus fluxos de trabalho reutilizáveis ​​como críticos quanto seu código de aplicativo, versionando-os. Use versionamento semântico (semver) para rastrear alterações e garantir compatibilidade entre projetos.
Otimize para reutilização com parâmetros : Projete seus fluxos de trabalho com parâmetros flexíveis e valores padrão. Isso os tornará adaptáveis ​​a vários cenários sem modificações extensas.
Implemente um registro robusto : garanta que seus fluxos de trabalho reutilizáveis ​​tenham registro abrangente para auxiliar na solução de problemas e depuração. Use formatos de registro padronizados e inclua registros em cada etapa para rastrear o progresso da execução do fluxo de trabalho.
Aplicar configurações específicas do ambiente : Use variáveis ​​de ambiente e arquivos de configuração para gerenciar configurações específicas do ambiente dentro dos seus fluxos de trabalho. Isso ajudará a implantar a mesma base de código em diferentes ambientes (desenvolvimento, preparação, produção) com configurações apropriadas.
Centralize o gerenciamento de segredos : use o gerenciamento de segredos do GitHub ou integre-se com ferramentas externas de gerenciamento de segredos (como HashiCorp Vault) para centralizar e gerenciar com segurança os segredos usados ​​em seus fluxos de trabalho. Isso simplificará o manuseio de informações confidenciais em vários fluxos de trabalho.
```

Compreendendo GitHub Actions Jobs vs. Etapas

No GitHub Actions, os fluxos de trabalho são estruturados em tarefas e etapas, cada uma desempenhando funções distintas no processo de automação.

Jobs são uma coleção de etapas que são executadas no mesmo runner, fornecendo um nível mais alto de organização. Cada job é executado em uma instância nova do ambiente do runner, o que significa que o job tem seu próprio conjunto isolado de recursos. Os jobs podem ser configurados para serem executados sequencialmente ou em paralelo, e as dependências entre os jobs podem ser definidas usando a palavra-chave needs.

```
name: Example Workflow

on: push

jobs:
  build:
runs-on: ubuntu-latest
steps:
  - name: Checkout code
    uses: actions/checkout@v2
  - name: Build the project
    run: make build
 test:
runs-on: ubuntu-latest
needs: build
steps:
  - name: Checkout code
    uses: actions/checkout@v2
  - name: Run tests
    run: make test
```
Veja como uma definição de tarefa aparece na interface do usuário do GitHub Actions:

Neste exemplo, o trabalho de teste depende do trabalho de compilação e só será executado depois que o trabalho de compilação for concluído com sucesso.

Etapas são as tarefas individuais dentro de um trabalho, como executar um comando ou usar uma ação. As etapas são executadas sequencialmente dentro do contexto de seu trabalho e compartilham o mesmo ambiente de execução, o que permite que elas passem dados entre si usando o sistema de arquivos ou variáveis ​​de ambiente.

Aqui, o trabalho de exemplo consiste em quatro etapas que verificam o código, configuram o Node.js, instalam dependências e executam testes sequencialmente.

Opções de etapas comuns de ações do GitHub com exemplos
Abaixo discutiremos as seguintes opções de etapas:

jobs.<job_id>.steps[*].if: Permite a execução condicional de uma etapa com base na avaliação de uma expressão, habilitando ou ignorando etapas.
jobs.<job_id>.steps[*].uses: Especifica uma ação a ser executada como parte de uma etapa. Ações são unidades reutilizáveis ​​de código que podem ser extraídas de repositórios ou imagens Docker.
jobs.<job_id>.steps[*].run: Usado para executar scripts de linha de comando dentro do ambiente do executor como etapas separadas, geralmente para instalar dependências, executar testes ou realizar compilações.
jobs.<job_id>.steps[*].shell: Especifica o ambiente de shell que deve ser usado para executar os comandos de execução.
jobs.<job_id>.steps[*].with: Permite que você passe parâmetros de entrada para uma ação, definidos como variáveis ​​de ambiente dentro da ação. Isso é útil para especificar um número de versão ou fornecer credenciais de autenticação.
jobs.<job_id>.steps[*].env: Define variáveis ​​de ambiente para uma etapa específica, substituindo variáveis ​​definidas no nível do trabalho ou do fluxo de trabalho. Isso é frequentemente usado para passar dados confidenciais.
