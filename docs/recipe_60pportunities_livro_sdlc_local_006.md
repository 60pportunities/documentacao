Planejamento Ágil = Adaptável + Iterativo

5 níveis de planejamento ágil:

### Visão do produto
- [X] QUAL é o objetivo final?
- [X] Define o PORQUÊ por trás do produto.
- Finalidade de longo prazo do produto.
- Ajuda as partes interessadas a se alinharem ao panorama geral.
- Permanece estável, mesmo que os recursos evoluam.

### Roteiro do produto
- [X] COMO chegaremos lá?
- [X] Plano de alto nível dos principais objetivos do produto e CONQUISTAS.
- Prioriza os principais recursos e iniciativas.
- Alinha-se com a estratégia de negócios
- Ajuda as partes interessadas a definir expectativas

### Planejamento de liberação
- [X] QUANDO os recursos serão entregues?
- [X] Define o que será incluído nas próximas versões com base na prioridade e nas dependências
- Ajuda na previsão e coordenação.
- Alinha as necessidades do negócio com os esforços de desenvolvimento.
- Impulsionado pelo feedback do cliente e do mercado tendências;

### Planejamento de Iteração (Sprint)
- [X] NO QUE a equipe trabalhará em seguida?
- [X] As equipes ágeis decidem quais itens do backlog IRÃO COMPROMETER-SE;
- Concentra-se em trabalhos realizáveis dentro do prazo do sprint;
- Garante que a equipe tenha clareza sobre metas, tarefas e prioridades;
-
### Planejamento diário
- [X] O que está acontecendo HOJE?
- Foca na sincronização da equipe.
- Os membros da equipe respondem:
- O que eu completei ontem?
- No que vou trabalhar hoje?
- Existe algum IMPEDIMENTO?

Visão do produto – O PORQUÊ
Roteiro do produto – O COMO
Planejamento de liberação  - O QUANDO
Planejamento de Iteração (Sprint) – O QUE
Planejamento diário – O HOJE

## Processo
O processo de unir ambição com realidade, experimentar ideias e encontrar soluções criativas é o que torna essa profissão sempre gratificante.
A cada novo desafio que surge, mais limites são ultrapassados ​​e, ao descobrir o ainda não visto, algo notável pode ser criado.
Faça a coisa mais simples que possa funcionar (DTSTTCPW — Do The Simplest Thing That Could Possibly Work.)

O valor do poder computacional e do software explodiu desde que o mundo mudou de indústrias tradicionais para um sistema centrado em informações digitais. Já se passaram quase cinco décadas desde que Gordon Moore postulou sua famosa teoria sobre a tendência do poder computacional; e embora especialistas digam que a Lei de Moore provavelmente terminará nesta década, não há sinal de que o mundo deixará de funcionar com softwares de computador cada vez mais poderosos, flexíveis e utilizáveis.

É uma corrida armamentista: conforme o software fica mais complexo, o hardware precisa crescer uma quantidade proporcional para melhorar ou manter o desempenho.

A capacidade de resposta e a flexibilidade são essenciais em um espaço onde as demandas e os requisitos mudam a cada segundo.

O software deve ser capaz de entregar a saída necessária em tempo hábil.

Dois pontos de ênfase:

- [x] O código deve ser útil mesmo se os requisitos do projeto ou o ambiente mudarem;
- [x] Ele deve funcionar como pretendido;

Os requisitos do projeto inevitavelmente mudarão, e o código que funcionou perfeitamente bem ontem pode ficar obsoleto a qualquer momento.

- [x] More code and variables --> More chances for bugs

**Feature Creep** (termo usado para descrever a adição excessiva de funcionalidades a um produto) é um problema porque aumenta a manutenção de manter o código sem fornecer valor real.
Ele adiciona partes móveis a uma máquina para uma função que ela não precisa.

Para padronizar o uso do GitHub Actions em sua organização, é recomendável seguir as seguintes práticas:

Uso de Segredos: Armazene informações sensíveis, como tokens e chaves de acesso, utilizando o recurso de segredos do GitHub. Evite inserir esses dados diretamente nos arquivos de fluxo de trabalho.
DOCS.GITHUB.COM

Definição de Permissões Mínimas Necessárias: Configure o GITHUB_TOKEN com as permissões mínimas necessárias para a execução dos fluxos de trabalho, garantindo que cada ação tenha apenas o acesso estritamente necessário.
DOCS.GITHUB.COM

Uso de Revisores Necessários: Implemente revisores obrigatórios para proteger segredos e ambientes sensíveis, garantindo que alterações críticas sejam aprovadas por membros designados da equipe antes da execução.
DOCS.GITHUB.COM

Auditoria e Rotação de Segredos: Realize auditorias periódicas nos segredos utilizados e efetue a rotação regular desses valores para minimizar riscos de comprometimento.
DOCS.GITHUB.COM

Uso de Arquivo CODEOWNERS: Utilize o arquivo CODEOWNERS para especificar responsáveis por revisões de código em áreas específicas do repositório, assegurando que as alterações sejam aprovadas por pessoas qualificadas.
DOCS.GITHUB.COM

Mitigação de Riscos de Injeção de Scripts: Evite a inserção direta de dados não confiáveis em comandos de shell. Utilize ferramentas ou métodos que sanitizem as entradas para prevenir vulnerabilidades.
DOCS.GITHUB.COM

Uso de OpenID Connect (OIDC) para Autenticação: Implemente o OIDC para fornecer acesso seguro a recursos em nuvem, eliminando a necessidade de armazenar credenciais de longo prazo nos repositórios.
DOCS.GITHUB.COM

Avaliação Cuidadosa de Ações de Terceiros: Antes de incorporar ações de terceiros em seus fluxos de trabalho, revise o código-fonte e a reputação do autor para garantir a segurança e a confiabilidade da ação.
DOCS.GITHUB.COM

Atualização Regular de Dependências com Dependabot: Utilize o Dependabot para manter as ações e outras dependências sempre atualizadas, garantindo que sua base de código esteja protegida contra vulnerabilidades conhecidas.
DOCS.GITHUB.COM

Implementação de Code Scanning: Configure o Code Scanning para identificar vulnerabilidades e problemas de segurança no código, permitindo a detecção precoce e a correção de possíveis falhas.
DOCS.GITHUB.COM

Adotando essas práticas, sua organização poderá estabelecer um ambiente mais seguro e padronizado para o uso do GitHub Actions, promovendo a eficiência e a colaboração entre as equipes de desenvolvimento.


Sobre eventos que acionam fluxos de trabalho
branch_protection_rule
discussion
discussion_comment


page_build
public
pull_request
pull_request_comment (use issue_comment)
pull_request_review
pull_request_review_comment
pull_request_target
push
registry_package
release
repository_dispatch
schedule
status
watch
workflow_call
workflow_dispatch
workflow_run
Sobre eventos que acionam fluxos de trabalho
Os acionadores de fluxo de trabalho são eventos que fazem com que um fluxo de trabalho seja executado. Para obter mais informações sobre como usar gatilhos de fluxo de trabalho, confira Acionando um fluxo de trabalho.

Alguns eventos têm vários tipos de atividades. Para esses eventos, você pode especificar quais tipos de atividade ativarão a execução de um fluxo de trabalho. Para obter mais informações sobre o que significa cada tipo de atividade, confira Eventos e cargas de webhook.

Note

Nem todos os eventos de webhook disparam fluxos de trabalho.

branch_protection_rule
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
branch_protection_rule	- created
- edited
- deleted	Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando as regras de proteção de branch no repositório do fluxo de trabalho são alteradas. Para obter mais informações sobre as regras de proteção do branch, confira Sobre branches protegidos. Para obter informações sobre as APIs da regra de proteção de ramificação, confira Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para ramificações e suas configurações.

Por exemplo, você poderá executar um fluxo de trabalho quando uma regra de proteção de branch for created ou deleted:

on:
  branch_protection_rule:
    types: [created, deleted]
check_run
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
check_run	- created
- rerequested
- completed
- requested_action	Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando ocorre a atividade relacionada a uma execução de verificação. Uma execução de verificação é um teste individual que faz parte de um conjunto de verificações. Para obter mais informações, confira Como usar a API REST para interagir com verificações. Para obter informações sobre as APIs de execução de verificação, confira Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para execuções de verificação.

Por exemplo, você poderá executar um fluxo de trabalho quando uma execução de verificação for rerequested ou completed.

on:
  check_run:
    types: [rerequested, completed]
check_suite
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
check_suite	- completed	Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Embora apenas o tipo de atividade completed seja compatível, a especificação do tipo de atividade manterá o fluxo de trabalho específico se mais tipos de atividade forem adicionados no futuro. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Note

Para evitar fluxos de trabalho recursivos, esse evento não dispara fluxos de trabalho se o conjunto de verificações foi criado pelo GitHub Actions.

Executa o fluxo de trabalho quando ocorre a atividade do conjunto de verificações. Um conjunto de verificações é uma coleção das execuções de verificação criadas para um commit específico. O conjunto de verificações resumem o status e a conclusão das execuções de verificação que estão no conjunto. Para obter mais informações, confira Como usar a API REST para interagir com verificações. Para obter informações sobre as APIs de pacote de verificação, confira Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para pacotes de verificação.

Por exemplo, você poderá executar um fluxo de trabalho quando um conjunto de verificações for completed.

on:
  check_suite:
    types: [completed]
create
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
create	Não aplicável	Último commit no branch ou tag criado	Branch ou tag criado
Note

Um evento não será criado quando você criar mais de três tags de uma só vez.

Executa o fluxo de trabalho quando alguém cria uma referência Git (branch ou tag) no repositório do fluxo de trabalho. Para obter informações sobre as APIs usadas para criar uma referência do Git, confira Mutações na documentação da API do GraphQL ou Pontos de extremidade da API REST para referências Git.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento create ocorrer.

on:
  create
delete
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
delete	Não aplicável	Último commit no branch padrão	Branch padrão
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Note

Um evento não será criado quando você excluir mais de três tags de uma só vez.

Executa o fluxo de trabalho quando alguém exclui uma referência Git (branch ou tag) no repositório do fluxo de trabalho. Para obter informações sobre as APIs usadas para excluir uma referência do Git, confira Mutações na documentação da API do GraphQL ou Pontos de extremidade da API REST para referências Git.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento delete ocorrer.

on:
  delete
deployment
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
deployment	Não aplicável	Commit a ser implantado	Branch ou tag a ser implantado (vazio, se criado com o SHA de um commit)
Executa o fluxo de trabalho quando alguém cria uma implantação no repositório do fluxo de trabalho. Implantações criadas com um commit SHA podem não ter uma referência Git. Para obter informações sobre as APIs usadas para criar uma implantação, confira Mutações na documentação da API do GraphQL ou Pontos de extremidade da API REST para repositórios.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento deployment ocorrer.

on:
  deployment
deployment_status
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
deployment_status	Não aplicável	Commit a ser implantado	Branch ou tag a ser implantado (vazio se commit)
Note

Quando o estado de um status de implantação for definido como inactive, uma execução de fluxo de trabalho não será disparada.

Executa o fluxo de trabalho quando uma terceira parte fornece um status de implantação. Implantações criadas com um commit SHA podem não ter uma referência Git. Para obter informações sobre as APIs usadas para criar um status de implantação, confira Mutações na documentação da API do GraphQL ou Pontos de extremidade da API REST para implantações.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento deployment_status ocorrer.

on:
  deployment_status
discussion
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
discussion	- created
- edited
- deleted
- transferred
- pinned
- unpinned
- labeled
- unlabeled
- locked
- unlocked
- category_changed
- answered
- unanswered	Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Note

Atualmente, os eventos de webhook do GitHub Discussions estão em versão prévia pública e estão sujeitos a alterações.

Executa o fluxo de trabalho quando uma discussão no repositório do fluxo de trabalho é criada ou modificada. Para as atividades relacionadas a comentários sobre uma discussão, use o evento discussion_comment. Para obter mais informações sobre discussões, confira Sobre discussões. Para obter informações sobre a API do GraphQL, confira Objetos.

Por exemplo, você poderá executar um fluxo de trabalho quando uma discussão for created, edited ou answered.

on:
  discussion:
    types: [created, edited, answered]
discussion_comment
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
discussion_comment	- created
- edited
- deleted
Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Note

Atualmente, os eventos de webhook do GitHub Discussions estão em versão prévia pública e estão sujeitos a alterações.

Executa o fluxo de trabalho quando um comentário em uma discussão no repositório do fluxo de trabalho é criado ou modificado. Para as atividades relacionadas a uma discussão em vez de comentários sobre uma discussão, use o evento discussion. Para obter mais informações sobre discussões, confira Sobre discussões. Para obter informações sobre a API do GraphQL, confira Objetos.

Por exemplo, você poderá executar um fluxo de trabalho quando um comentário de discussão for created ou deleted.

on:
  discussion_comment:
    types: [created, deleted]
fork
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
fork	Não aplicável	Último commit no branch padrão	Branch padrão
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando alguém bifurca um repositório. Para obter informações sobre a API REST, confira Pontos de extremidade de API REST para forks.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento fork ocorrer.

on:
  fork
gollum
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
gollum	Não aplicável	Último commit no branch padrão	Branch padrão
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando alguém cria ou atualiza uma página wiki. Para saber mais, confira Sobre wikis.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento gollum ocorrer.

on:
  gollum
issue_comment
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
issue_comment	- created
- edited
- deleted
Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando um problema ou comentário de pull request é criado, editado ou excluído. Para obter informações sobre as APIs de comentários de problemas, confira Objetos na documentação da API do GraphQL ou Eventos e cargas de webhook na documentação da API REST.

Por exemplo, você poderá executar um fluxo de trabalho quando um comentário ou um problema de uma solicitação de pull for created ou deleted.

on:
  issue_comment:
    types: [created, deleted]
issue_comment apenas em problemas ou em solicitações de pull
O evento issue_comment ocorre em comentários sobre problemas e solicitações de pull. Você pode usar a propriedade github.event.issue.pull_request em um condicional para realizar uma ação diferente, dependendo se o objeto de gatilho foi um problema ou uma solicitação de pull.

Por exemplo, esse fluxo de trabalho executará o trabalho pr_commented somente se o evento issue_comment for originado de uma solicitação de pull. Ele executará o trabalho issue_commented somente se o evento issue_comment tiver se originado de um problema.

on: issue_comment

jobs:
  pr_commented:
    # This job only runs for pull request comments
    name: PR comment
    if: ${{ github.event.issue.pull_request }}
    runs-on: ubuntu-latest
    steps:
      - run: |
          echo A comment on PR $NUMBER
        env:
          NUMBER: ${{ github.event.issue.number }}

  issue_commented:
    # This job only runs for issue comments
    name: Issue comment
    if: ${{ !github.event.issue.pull_request }}
    runs-on: ubuntu-latest
    steps:
      - run: |
          echo A comment on issue $NUMBER
        env:
          NUMBER: ${{ github.event.issue.number }}
issues
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
issues	- opened
- edited
- deleted
- transferred
- pinned
- unpinned
- closed
- reopened
- assigned
- unassigned
- labeled
- unlabeled
- locked
- unlocked
- milestoned
- demilestoned	Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando um problema no repositório do fluxo de trabalho é criado ou modificado. Para as atividades relacionadas a comentários em um problema, use o evento issue_comment. Para obter mais informações sobre problemas, confira Sobre issues. Para obter informações sobre as APIs de problemas, consulte Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para issues.

Por exemplo, você poderá executar um fluxo de trabalho quando um problema for opened, edited ou milestoned.

on:
  issues:
    types: [opened, edited, milestoned]
label
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
label	- created
- edited
- deleted
Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando uma etiqueta no repositório do fluxo de trabalho é criada ou modificada. Para obter mais informações sobre rótulos, confira Gerenciar etiquetas. Para obter informações sobre as APIs de rótulo, consulte Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para rótulos.

Caso deseje executar seu fluxo de trabalho quando um rótulo for adicionado ou removido de um problema, uma solicitação de pull ou uma discussão, use os tipos de atividades labeled ou unlabeled para os eventos issues, pull_request, pull_request_target ou discussion.

Por exemplo, você poderá executar um fluxo de trabalho quando um rótulo for created ou deleted.

on:
  label:
    types: [created, deleted]
merge_group
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
merge_group	checks_requested	SHA do grupo de mesclagem	Referência do grupo de mesclagem
Note

Mais de um tipo de atividade aciona este evento. Embora apenas o tipo de atividade checks_requested tenha suporte, a especificação do tipo de atividade manterá seu fluxo de trabalho específico se mais tipos de atividade forem adicionados posteriormente. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.
Se o seu repositório usa o GitHub Actions para realizar verificações necessárias em solicitações pull em seu repositório, é necessário atualizar os fluxos de trabalho para incluir o evento merge_group como um gatilho adicional. Caso contrário, as verificações de status não serão disparadas quando você adicionar uma solicitação de pull a uma fila de mesclagem. A mesclagem falhará, pois o verificação de status obrigatória não será relatada. O evento merge_group é separado dos eventos pull_request e push.
Executa o fluxo de trabalho quando uma solicitação de pull é adicionada a uma fila de mesclagem, o que adiciona a solicitação de pull a um grupo de mesclagem. Para saber mais, confira Como mesclar uma solicitação de pull com uma fila de mesclagem.

Por exemplo, você poderá executar um fluxo de trabalho quando a atividade checks_requested tiver ocorrido.

on:
  pull_request:
    branches: [ "main" ]
  merge_group:
    types: [checks_requested]
milestone
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
milestone	- created
- closed
- opened
- edited
- deleted
Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando um marco no repositório do fluxo de trabalho é criado ou modificado. Para obter mais informações sobre marcos, confira Sobre marcos. Para obter informações sobre as APIs de etapas, consulte Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para marcos.

Caso deseje executar seu fluxo de trabalho quando um problema for adicionado ou removido de um marco, use os tipos de atividades milestoned ou demilestoned para o evento issues.

Por exemplo, você poderá executar um fluxo de trabalho quando um marco for opened ou deleted.

on:
  milestone:
    types: [opened, deleted]
page_build
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
page_build	Não aplicável	Último commit no branch padrão	Não aplicável
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando alguém faz push em um branch que é a fonte de publicação para GitHub Pages, se o GitHub Pages estiver habilitado no repositório. Para obter mais informações sobre as fontes de publicação do GitHub Pages, confira Configurar uma fonte de publicação para o site do GitHub Pages. Para obter informações sobre a API REST, confira Pontos de extremidade da API REST para repositórios.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento page_build ocorrer.

on:
  page_build
public
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
public	Não aplicável	Último commit no branch padrão	Branch padrão
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando o repositório do fluxo de trabalho é alterado de privado para público. Para obter informações sobre a API REST, confira Pontos de extremidade da API REST para repositórios.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento public ocorrer.

on:
  public
pull_request
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
pull_request	- assigned
- unassigned
- labeled
- unlabeled
- opened
- edited
- closed
- reopened
- synchronize
- converted_to_draft
- locked
- unlocked
- enqueued
- dequeued
- milestoned
- demilestoned
- ready_for_review
- review_requested
- review_request_removed
- auto_merge_enabled
- auto_merge_disabled	Último commit de mesclagem no branch GITHUB_REF	Branch de mesclagem de PR refs/pull/PULL_REQUEST_NUMBER/merge
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, um fluxo de trabalho só é executado quando o tipo de atividade de um evento pull_request é opened, synchronize ou reopened. Para disparar fluxos de trabalho em diferentes tipos de atividades, use a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.
Os fluxos de trabalho não serão executados na atividade pull_request se a solicitação de pull tiver um conflito de mesclagem. O conflito de merge tem de ser resolvido primeiro. Inversamente, os fluxos de trabalho com o evento pull_request_target serão executados mesmo que a solicitação de pull tenha um conflito de mesclagem. Antes de usar o gatilho pull_request_target, você deve estar ciente dos riscos de segurança. Para obter mais informações, consulte pull_request_target.
A carga do evento do webhook pull_request está vazia para solicitações pull mescladas e solicitações pull provenientes de repositórios bifurcados.
O valor de GITHUB_REF varia em uma solicitação de pull fechada, dependendo de se a solicitação de pull foi mesclada ou não. Se uma solicitação de pull foi fechada, mas não mesclada, ela será refs/pull/PULL_REQUEST_NUMBER/merge. Se uma solicitação de pull foi fechada como resultado de ter sido mesclada, ela será totalmente qualificada como ref da ramificação em que foi mesclada, por exemplo, /refs/heads/main.
Executa o fluxo de trabalho quando ocorre uma atividade em uma pull request no repositório do fluxo de trabalho. Por exemplo, se nenhum tipo de atividade for especificado, o fluxo de trabalho será executado quando uma pull request é aberta ou reaberta, ou quando o branch principal da pull request é atualizado. Para as atividades relacionadas a revisões de solicitação de pull, a comentários de revisão de uma solicitação de pull ou a comentários de uma pull request, use os eventos pull_request_review, pull_request_review_comment ou issue_comment. Para obter informações sobre as APIs de solicitação de pull, confira Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para pull requests.

Observe que o GITHUB_SHA desse evento é o último commit de mesclagem do branch de mesclagem da pull request. Caso deseje obter a ID de commit do último commit no branch principal da pull request, use github.event.pull_request.head.sha.

Por exemplo, você pode executar um fluxo de trabalho quando uma pull request for aberta ou reaberta.

on:
  pull_request:
    types: [opened, reopened]
Você pode usar o contexto do evento para controlar ainda mais quando os trabalhos no seu fluxo de trabalho serão executados. Por exemplo, esse fluxo de trabalho será executado quando uma revisão for solicitada em uma pull request, mas o trabalho specific_review_requested só será executado quando uma revisão por octo-team for solicitada.

on:
  pull_request:
    types: [review_requested]
jobs:
  specific_review_requested:
    runs-on: ubuntu-latest
    if: ${{ github.event.requested_team.name == 'octo-team'}}
    steps:
      - run: echo 'A review from octo-team was requested'
Executar o fluxo de trabalho de pull_request com base no branch de cabeçalho ou no branch base de uma pull request
Você pode usar o filtro branches ou branches-ignore para configurar seu fluxo de trabalho para que ele seja executado somente em solicitações de pull direcionadas a branches específicos. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Por exemplo, este fluxo de trabalho será executado quando alguém abrir uma solicitação de pull direcionada a um branch cujo nome começa com releases/:

on:
  pull_request:
    types:
      - opened
    branches:
      - 'releases/**'
Note

Se você usar os filtros branches e paths, o fluxo de trabalho só será executado quando os dois filtros forem atendidos. Por exemplo, o seguinte fluxo de trabalho só será executado quando uma pull request que inclui uma alteração em um arquivo JavaScript (.js) for aberta em uma branch cujo nome começa com releases/:

on:
  pull_request:
    types:
      - opened
    branches:
      - 'releases/**'
    paths:
      - '**.js'
Para executar um trabalho com base no nome do branch de cabeçalho da solicitação de pull (em vez do nome do branch base da solicitação de pull), use o contexto github.head_ref em um condicional. Por exemplo, este fluxo de trabalho será executado sempre que uma solicitação de pull for aberta, mas o trabalho run_if só será executado se o cabeçalho da solicitação de pull for um branch cujo nome começa com releases/:

on:
  pull_request:
    types:
      - opened
jobs:
  run_if:
    if: startsWith(github.head_ref, 'releases/')
    runs-on: ubuntu-latest
    steps:
      - run: echo "The head of this PR starts with 'releases/'"
Executar o fluxo de trabalho de pull_request com base em arquivos alterados em uma solicitação de pull
Também é possível configurar o fluxo de trabalho para ser executado quando uma pull request alterar arquivos específicos. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Por exemplo, este fluxo de trabalho será executado quando uma solicitação de pull incluir uma alteração em um arquivo JavaScript (.js):

on:
  pull_request:
    paths:
      - '**.js'
Note

Se você usar os filtros branches e paths, o fluxo de trabalho só será executado quando os dois filtros forem atendidos. Por exemplo, o seguinte fluxo de trabalho só será executado quando uma pull request que inclui uma alteração em um arquivo JavaScript (.js) for aberta em uma branch cujo nome começa com releases/:

on:
  pull_request:
    types:
      - opened
    branches:
      - 'releases/**'
    paths:
      - '**.js'
Executar o fluxo de trabalho de pull_request quando ocorrer uma mesclagem de solicitação de pull
Quando uma pull request faz merge, a pull request é automaticamente fechada. Para executar um fluxo de trabalho quando uma pull request é mesclada, use o tipo de evento pull_request closed com um condicional que verifica o valor merged do evento. Por exemplo, o fluxo de trabalho a seguir será executado sempre que uma pull request for fechada. O trabalho if_merged só será executado se a pull request também tiver sido mesclada.

on:
  pull_request:
    types:
      - closed

jobs:
  if_merged:
    if: github.event.pull_request.merged == true
    runs-on: ubuntu-latest
    steps:
    - run: |
        echo The PR was merged
Fluxos de trabalho em repositórios com fork
Por padrão, os fluxos de trabalho não são executados em repositórios com fork. É preciso habilitar o GitHub Actions na guia Actions do repositório com fork.

Com exceção do GITHUB_TOKEN, os segredos não são transmitidos para o executor quando um fluxo de trabalho é disparado de um repositório com fork. O GITHUB_TOKEN tem permissões somente leitura em solicitações de pull de repositórios com forks. Para saber mais, confira Autenticação automática de token.

Eventos de pull request para repositórios bifurcados
Para solicitações de pull de um repositório com fork para o repositório base, o GitHub envia os eventos pull_request, issue_comment, pull_request_review_comment, pull_request_review e pull_request_target para o repositório base. Nenhum evento de solicitação de pull ocorre no repositório com fork.

Quando um colaborador envia uma solicitação de pull para um repositório público pela primeira vez, um mantenedor com acesso de gravação pode precisar aprovar a execução de fluxos de trabalho na solicitação de pull. Para saber mais, confira Aprovando execuções de fluxo de trabalho das bifurcações públicas.

Para pull requests de um repositório com forks para um repositório privado, os fluxos de trabalho só são executados quando eles são habilitados, confira Gerenciando as configurações do GitHub Actions para um repositório.

Note

Os fluxos de trabalho disparados pelas pull requests do Dependabot são tratados como se fossem de um repositório com fork, também estando sujeitos a essas restrições.

pull_request_comment (use issue_comment)
Para executar o fluxo de trabalho quando um comentário em uma solicitação de pull (não na comparação de uma solicitação de pull) é criado, editado ou excluído, use o evento issue_comment. Para as atividades relacionadas a revisões de solicitação de pull ou a comentários de revisão de uma solicitação de pull, use os eventos pull_request_review ou pull_request_review_comment.

pull_request_review
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
pull_request_review	- submitted
- edited
- dismissed	Último commit de mesclagem no branch GITHUB_REF	Branch de mesclagem de PR refs/pull/PULL_REQUEST_NUMBER/merge
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Executa o fluxo de trabalho quando uma revisão de pull request é enviada, editada ou ignorada. Uma revisão de pull request é um grupo de comentários de revisão de pull request, além de um comentário e estado de texto. Para as atividades relacionadas a comentários de revisão de uma solicitação de pull ou a comentários de uma solicitação de pull, use os eventos pull_request_review_comment ou issue_comment. Para obter informações sobre as APIs de revisão de solicitação de pull, confira Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para pull requests.

Por exemplo, você poderá executar um fluxo de trabalho quando uma revisão de solicitação de pull for edited ou dismissed.

on:
  pull_request_review:
    types: [edited, dismissed]
Executando um fluxo de trabalho quando uma pull request é aprovada
Para executar o fluxo de trabalho quando uma solicitação de pull tiver sido aprovada, dispare o fluxo de trabalho com o tipo submitted de evento pull_request_review e verifique o estado de revisão com a propriedade github.event.review.state. Por exemplo, este fluxo de trabalho será executado sempre que uma revisão de solicitação de pull for enviada, mas o trabalho approved só será executado se a revisão enviada for uma revisão de aprovação:

on:
  pull_request_review:
    types: [submitted]

jobs:
  approved:
    if: github.event.review.state == 'approved'
    runs-on: ubuntu-latest
    steps:
      - run: echo "This PR was approved"
Fluxos de trabalho em repositórios com fork
Por padrão, os fluxos de trabalho não são executados em repositórios com fork. É preciso habilitar o GitHub Actions na guia Actions do repositório com fork.

Com exceção do GITHUB_TOKEN, os segredos não são transmitidos para o executor quando um fluxo de trabalho é disparado de um repositório com fork. O GITHUB_TOKEN tem permissões somente leitura em solicitações de pull de repositórios com forks. Para saber mais, confira Autenticação automática de token.

Eventos de pull request para repositórios bifurcados
Para solicitações de pull de um repositório com fork para o repositório base, o GitHub envia os eventos pull_request, issue_comment, pull_request_review_comment, pull_request_review e pull_request_target para o repositório base. Nenhum evento de solicitação de pull ocorre no repositório com fork.

Quando um colaborador envia uma solicitação de pull para um repositório público pela primeira vez, um mantenedor com acesso de gravação pode precisar aprovar a execução de fluxos de trabalho na solicitação de pull. Para saber mais, confira Aprovando execuções de fluxo de trabalho das bifurcações públicas.

Para pull requests de um repositório com forks para um repositório privado, os fluxos de trabalho só são executados quando eles são habilitados, confira Gerenciando as configurações do GitHub Actions para um repositório.

Note

Os fluxos de trabalho disparados pelas pull requests do Dependabot são tratados como se fossem de um repositório com fork, também estando sujeitos a essas restrições.

pull_request_review_comment
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
pull_request_review_comment	- created
- edited
- deleted	Último commit de mesclagem no branch GITHUB_REF	Branch de mesclagem de PR refs/pull/PULL_REQUEST_NUMBER/merge
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Executa o fluxo de trabalho quando um comentário de revisão de pull request é modificado. Um comentário de revisão de pull request é um comentário no diff de uma pull request. Para as atividades relacionadas a revisões de solicitação de pull ou a comentários de uma solicitação de pull, use os eventos pull_request_review ou issue_comment. Para obter informações sobre as APIs dos comentários da revisão de solicitação de pull, consulte Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para pull requests.

Por exemplo, você poderá executar um fluxo de trabalho quando um comentário de revisão de uma solicitação de pull for created ou deleted.

on:
  pull_request_review_comment:
    types: [created, deleted]
Fluxos de trabalho em repositórios com fork
Por padrão, os fluxos de trabalho não são executados em repositórios com fork. É preciso habilitar o GitHub Actions na guia Actions do repositório com fork.

Com exceção do GITHUB_TOKEN, os segredos não são transmitidos para o executor quando um fluxo de trabalho é disparado de um repositório com fork. O GITHUB_TOKEN tem permissões somente leitura em solicitações de pull de repositórios com forks. Para saber mais, confira Autenticação automática de token.

Eventos de pull request para repositórios bifurcados
Para solicitações de pull de um repositório com fork para o repositório base, o GitHub envia os eventos pull_request, issue_comment, pull_request_review_comment, pull_request_review e pull_request_target para o repositório base. Nenhum evento de solicitação de pull ocorre no repositório com fork.

Quando um colaborador envia uma solicitação de pull para um repositório público pela primeira vez, um mantenedor com acesso de gravação pode precisar aprovar a execução de fluxos de trabalho na solicitação de pull. Para saber mais, confira Aprovando execuções de fluxo de trabalho das bifurcações públicas.

Para pull requests de um repositório com forks para um repositório privado, os fluxos de trabalho só são executados quando eles são habilitados, confira Gerenciando as configurações do GitHub Actions para um repositório.

Note

Os fluxos de trabalho disparados pelas pull requests do Dependabot são tratados como se fossem de um repositório com fork, também estando sujeitos a essas restrições.

pull_request_target
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
pull_request	- assigned
- unassigned
- labeled
- unlabeled
- opened
- edited
- closed
- reopened
- synchronize
- converted_to_draft
- ready_for_review
- locked
- unlocked
- review_requested
- review_request_removed
- auto_merge_enabled
- auto_merge_disabled	Último commit no branch de base do PR	Branch-base da pull request
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, um fluxo de trabalho só é executado quando o tipo de atividade de um evento pull_request_target é opened, synchronize ou reopened. Para disparar fluxos de trabalho em diferentes tipos de atividades, use a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Executa o fluxo de trabalho quando ocorre uma atividade em uma pull request no repositório do fluxo de trabalho. Por exemplo, se nenhum tipo de atividade for especificado, o fluxo de trabalho será executado quando uma pull request é aberta ou reaberta, ou quando o branch principal da pull request é atualizado.

Esse evento é executado no contexto da base da pull request, em vez de no contexto do commit de mesclagem, como o evento pull_request faz. Isso impede a execução de código inseguro do cabeçalho da pull request que poderia alterar seu repositório ou roubar quaisquer segredos que você usa no fluxo de trabalho. Este evento permite que seu fluxo de trabalho faça coisas como etiquetar ou comentar nas pull requests a partir das bifurcações. Evite usar este evento se você precisar criar ou executar o código a partir da pull request.

Para garantir a segurança do repositório, branches com nomes que correspondem a determinados padrões (como aqueles que se parecem com SHAs) podem não disparar fluxos de trabalho com o evento pull_request_target.

Warning

Para os fluxos de trabalho que são disparados pelo evento pull_request_target, o GITHUB_TOKEN recebe a permissão de leitura/gravação no repositório, a menos que a chave permissions seja especificada e o fluxo de trabalho possa acessar segredos, mesmo quando ela for disparada em um fork. Embora o fluxo de trabalho seja executado no contexto da base da pull request, você deve certificar-se de que você não irá fazer checkout, construir ou executar o código não confiável da pull request com este evento. Além disso, qualquer cache compartilha o mesmo escopo do ramo de base. Para evitar envenenamento do cache, você não deve salvar o cache se houver a possibilidade de que o conteúdo do cache tenha sido alterado. Para obter mais informações, confira Como manter o GitHub Actions e seus fluxos de trabalho seguros: impedir solicitações pwn no site do GitHub Security Lab.

Por exemplo, você poderá executar um fluxo de trabalho quando uma solicitação de pull for assigned, opened, synchronize ou reopened.

on:
  pull_request_target:
    types: [assigned, opened, synchronize, reopened]
Executar o fluxo de trabalho de pull_request_target com base no branch de cabeçalho ou no branch base de uma solicitação de pull
Você pode usar o filtro branches ou branches-ignore para configurar seu fluxo de trabalho para que ele seja executado somente em solicitações de pull direcionadas a branches específicos. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Por exemplo, este fluxo de trabalho será executado quando alguém abrir uma solicitação de pull direcionada a um branch cujo nome começa com releases/:

on:
  pull_request_target:
    types:
      - opened
    branches:
      - 'releases/**'
Note

Se você usar os filtros branches e paths, o fluxo de trabalho só será executado quando os dois filtros forem atendidos. Por exemplo, o seguinte fluxo de trabalho só será executado quando uma pull request que inclui uma alteração em um arquivo JavaScript (.js) for aberta em uma branch cujo nome começa com releases/:

on:
  pull_request_target:
    types:
      - opened
    branches:
      - 'releases/**'
    paths:
      - '**.js'
Para executar um trabalho com base no nome do branch de cabeçalho da solicitação de pull (em vez do nome do branch base da solicitação de pull), use o contexto github.head_ref em um condicional. Por exemplo, este fluxo de trabalho será executado sempre que uma solicitação de pull for aberta, mas o trabalho run_if só será executado se o cabeçalho da solicitação de pull for um branch cujo nome começa com releases/:

on:
  pull_request_target:
    types:
      - opened
jobs:
  run_if:
    if: startsWith(github.head_ref, 'releases/')
    runs-on: ubuntu-latest
    steps:
      - run: echo "The head of this PR starts with 'releases/'"
Executar o fluxo de trabalho de pull_request_target com base em arquivos alterados em uma solicitação de pull
Você pode usar o filtro paths ou paths-ignore para configurar o fluxo de trabalho para ser executado quando uma solicitação de pull alterar arquivos específicos. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Por exemplo, este fluxo de trabalho será executado quando uma solicitação de pull incluir uma alteração em um arquivo JavaScript (.js):

on:
  pull_request_target:
    paths:
      - '**.js'
Note

Se você usar os filtros branches e paths, o fluxo de trabalho só será executado quando os dois filtros forem atendidos. Por exemplo, o seguinte fluxo de trabalho só será executado quando uma pull request que inclui uma alteração em um arquivo JavaScript (.js) for aberta em uma branch cujo nome começa com releases/:

on:
  pull_request_target:
    types:
      - opened
    branches:
      - 'releases/**'
    paths:
      - '**.js'
Executar o fluxo de trabalho de pull_request_target quando ocorrer uma mesclagem de solicitação de pull
Quando uma pull request faz merge, a pull request é automaticamente fechada. Para executar um fluxo de trabalho quando uma pull request é mesclada, use o tipo de evento pull_request_target closed com um condicional que verifica o valor merged do evento. Por exemplo, o fluxo de trabalho a seguir será executado sempre que uma pull request for fechada. O trabalho if_merged só será executado se a pull request também tiver sido mesclada.

on:
  pull_request_target:
    types:
      - closed

jobs:
  if_merged:
    if: github.event.pull_request.merged == true
    runs-on: ubuntu-latest
    steps:
    - run: |
        echo The PR was merged
push
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
push	Não aplicável	O commit de ponta foi enviado para a referência. Quando você exclui um branch, o SHA na execução do fluxo de trabalho (e os refs associados) é revertido para o branch padrão do repositório.	ref atualizado
Note

A carga do webhook disponível para o GitHub Actions não inclui os atributos added, removed e modified no objeto commit. Você pode recuperar o objeto de commit completo usando a API. Para obter mais informações, consulte Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para commits.

Note

Não serão criados eventos se for efetuado push simultâneo de mais de 5.000 branches. Os eventos não serão criados para tags quando mais de três tags forem transmitidas ao mesmo tempo.

Executa o fluxo de trabalho quando você efetua push em um commit ou tag ou quando cria um repositório a partir de um modelo.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento push ocorrer.

on:
  push
Note

Quando um evento de webhook push dispara uma execução de fluxo de trabalho, o campo “enviado por” da interface do usuário do Actions mostra a conta do pusher e não do autor ou do committer. No entanto, se as alterações forem enviadas para um repositório usando autenticação SSH com uma chave de implantação, o campo "enviado por" será o administrador do repositório que verificou a chave de implantação quando ela foi adicionada a um repositório.

Executando o fluxo de trabalho apenas quando um push para branches específicos ocorre
Você pode usar o filtro branches ou branches-ignore para configurar seu fluxo de trabalho para ser executado somente quando branches específicos forem enviados por push. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Por exemplo, este fluxo de trabalho será executado quando alguém efetuar push para main ou para um branch que começa com releases/.

on:
  push:
    branches:
      - 'main'
      - 'releases/**'
Note

Se você usar os filtros branches e paths, o fluxo de trabalho só será executado quando os dois filtros forem atendidos. Por exemplo, o seguinte fluxo de trabalho só será executado quando um push que inclui uma alteração em um arquivo JavaScript (.js) for efetuado em uma branch cujo nome começa com releases/:

on:
  push:
    branches:
      - 'releases/**'
    paths:
      - '**.js'
Executando o fluxo de trabalho somente quando ocorre um push de tags específicas
Você pode usar o filtro tags ou tags-ignore para configurar seu fluxo de trabalho para ser executado somente quando marcas específicas forem enviadas por push. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Por exemplo, este fluxo de trabalho será executado quando alguém efetuar push de uma marca que começa com v1..

on:
  push:
    tags:
      - v1.**
Executando seu fluxo de trabalho apenas quando um push afeta arquivos específicos
Você pode usar o filtro paths ou paths-ignore para configurar o fluxo de trabalho para ser executado quando ocorrer um push para arquivos específicos. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Por exemplo, este fluxo de trabalho será executado quando alguém efetuar push de uma alteração para um arquivo JavaScript (.js):

on:
  push:
    paths:
      - '**.js'
Note

Se você usar os filtros branches e paths, o fluxo de trabalho só será executado quando os dois filtros forem atendidos. Por exemplo, o seguinte fluxo de trabalho só será executado quando um push que inclui uma alteração em um arquivo JavaScript (.js) for efetuado em uma branch cujo nome começa com releases/:

on:
  push:
    branches:
      - 'releases/**'
    paths:
      - '**.js'
registry_package
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
registry_package	- published
- updated	Commit do pacote publicado	Branch ou tag do pacote publicado
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Note

Ao efetuar push de imagens de contêiner de várias arquiteturas, esse evento ocorre uma vez por manifesto, portanto, você pode observar o fluxo de trabalho sendo disparado várias vezes. Para atenuar isso e executar apenas o trabalho de fluxo de trabalho para o evento que contém as informações reais da marca de imagem, use um condicional:

jobs:
    job_name:
        if: $true
Executa o fluxo de trabalho quando uma atividade relacionada ao GitHub Packages ocorre no seu repositório. Para obter mais informações, confira Documentação do GitHub Packages.

Por exemplo, você pode executar um fluxo de trabalho quando uma nova versão do pacote foi published.

on:
  registry_package:
    types: [published]
release
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
release	- published
- unpublished
- created
- edited
- deleted
- prereleased
- released	Último commit na versão com tag	Referência de marca da versão refs/tags/<tag_name>
Note

Mais de um tipo de atividade aciona este evento. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Os fluxos de trabalho não são disparados para os tipos de atividades created, edited ou deleted em versões de rascunho. Ao criar a sua versão por meio da interface de usuário do navegador de GitHub, a sua versão poderá ser automaticamente salva como rascunho.

Note

O tipo prereleased não será disparado em pré-lançamentos publicados das versões de rascunho, mas o tipo published será disparado. Caso deseje que um fluxo de trabalho seja executado quando as versões estáveis e de pré-lançamento forem publicadas, assine published em vez de released e prereleased.

Executa o fluxo de trabalho quando a atividade de da versão no repositório ocorre. Para obter informações sobre as APIs de lançamento, confira Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para lançamentos e ativos de lançamento na documentação da API REST.

Por exemplo, você poderá executar um fluxo de trabalho quando uma versão for published.

on:
  release:
    types: [published]
repository_dispatch
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
repository_dispatch	Personalizado	Último commit no branch padrão	Branch padrão
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Você pode usar a API do GitHub para disparar um evento de webhook chamado repository_dispatch quando você deseja disparar um fluxo de trabalho para a atividade que ocorre fora do GitHub. Para saber mais, confira Pontos de extremidade da API REST para repositórios.

Ao fazer uma solicitação para criar um evento repository_dispatch, você precisa especificar um event_type para descrever o tipo de atividade. Por padrão, todos os tipos de atividade repository_dispatch disparam a execução de um fluxo de trabalho. Você pode usar a palavra-chave types para limitar o fluxo de trabalho a ser executado quando um valor event_type específico é enviado na carga do webhook repository_dispatch.

on:
  repository_dispatch:
    types: [test_result]
Note

O valor de event_type é limitado a 100 caracteres.

Todos os dados enviados por meio do parâmetro client_payload ficarão disponíveis no contexto github.event no seu fluxo de trabalho. Por exemplo, se você enviar esse texto de solicitação quando criar um evento de despacho de repositório:

{
  "event_type": "test_result",
  "client_payload": {
    "passed": false,
    "message": "Error: timeout"
  }
}
então você poderá acessar a carga em um fluxo de trabalho assim:

on:
  repository_dispatch:
    types: [test_result]

jobs:
  run_if_failure:
    if: ${{ !github.event.client_payload.passed }}
    runs-on: ubuntu-latest
    steps:
      - env:
          MESSAGE: ${{ github.event.client_payload.message }}
        run: echo $MESSAGE
Note

O número máximo de propriedades de nível superior em client_payload é 10.
O payload pode conter no máximo 65.535 caracteres.
schedule
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
Não aplicável	Não aplicável	Último commit no branch padrão	Branch padrão
Note

O evento schedule pode ser atrasado durante períodos de cargas altas de execuções de fluxo de trabalho do GitHub Actions. Os tempos de carregamento altos incluem o início de cada hora. Se a carga for suficientemente alta o suficiente, alguns trabalhos enfileirados talvez sejam descartados. Para diminuir a probabilidade de atraso, agende o fluxo de trabalho para ser executado em uma parte diferente da hora.

Este evento irá disparar uma execução de fluxo de trabalho somente se o arquivo de fluxo de trabalho estiver no branch padrão.

Os fluxos de trabalho agendados só serão executados no branch padrão.

Em um repositório público, os fluxos de trabalho agendados são automaticamente desabilitados quando nenhuma atividade do repositório ocorreu em 60 dias. Para obter informações sobre como reabilitar fluxos de trabalho desabilitados, confira Desabilitar e habilitar um fluxo de trabalho.

Quando o último usuário a fazer commit de um fluxo de trabalho na agenda cron é removido da organização, o fluxo de trabalho agendado é desabilitado. Se um usuário com permissões de write no repositório fizer um commit que altere a agenda cron, o fluxo de trabalho agendado será reativado. Observe que, nessa situação, o fluxo de trabalho não é reativado por nenhuma alteração no arquivo de fluxo de trabalho; você deve alterar o valor de cron e confirmar essa alteração.

Exemplo:

on:
  schedule:
    - cron: "15 4,5 * * *"   # <=== Change this value
O evento schedule permite disparar um fluxo de trabalho em um horário agendado.

Você pode agendar um fluxo de trabalho para ser executado em horários UTC específicos usando a sintaxe cron POSIX. Fluxos de trabalho agendados executados no último commit no branch padrão ou branch de base. O intervalo mais curto que você pode executar fluxos de trabalho agendados é a cada 5 minutos.

Este exemplo aciona o fluxo de trabalho todos os dias às 17:30 e 17:30 UTC:

on:
  schedule:
    # * is a special character in YAML so you have to quote this string
    - cron:  '30 5,17 * * *'
Um fluxo de trabalho individual pode ser disparado por vários eventos schedule. Você pode acessar o evento de agendamento que disparou o fluxo de trabalho por meio do contexto github.event.schedule. Este exemplo dispara o fluxo de trabalho a ser executado às 5h30 UTC todas as segundas e quintas, mas ignora a etapa Not on Monday or Wednesday às segundas e quartas.

on:
  schedule:
    - cron: '30 5 * * 1,3'
    - cron: '30 5 * * 2,4'

jobs:
  test_schedule:
    runs-on: ubuntu-latest
    steps:
      - name: Not on Monday or Wednesday
        if: github.event.schedule != '30 5 * * 1,3'
        run: echo "This step will be skipped on Monday and Wednesday"
      - name: Every time
        run: echo "This step will always run"
A sintaxe cron tem cinco campos separados por um espaço, e cada campo representa uma unidade de tempo.

┌───────────── minute (0 - 59)
│ ┌───────────── hour (0 - 23)
│ │ ┌───────────── day of the month (1 - 31)
│ │ │ ┌───────────── month (1 - 12 or JAN-DEC)
│ │ │ │ ┌───────────── day of the week (0 - 6 or SUN-SAT)
│ │ │ │ │
│ │ │ │ │
│ │ │ │ │
* * * * *
Você pode usar estes operadores em qualquer um dos cinco campos:

Operador	Descrição	Exemplo
*	Qualquer valor	15 * * * * é executado a cada quarto de hora todos os dias.
,	Separador de lista de valor	2,10 4,5 * * * é executado nos minutos 2 e 10 da quarta e da quinta hora todos os dias.
-	Intervalo de valores	30 4-6 * * * é executado a cada meia hora da quarta, da quinta e da sexta hora.
/	Valores de etapa	20/15 * * * * é executado a cada 15 minutos, começando do minuto 20 ao 59 (minutos 20, 35 e 50).
Note

O GitHub Actions não dá suporte à sintaxe não padrão @yearly, @monthly, @weekly, @daily, @hourly e @reboot.

Você pode usar o crontab guru para ajudar a gerar a sintaxe cron e confirmar a hora em que ela será executada. Para ajudar você a começar, há também uma lista de exemplos do crontab guru.

As notificações de fluxos de trabalho agendados são enviadas ao usuário que modificou a sintaxe cron no arquivo do fluxo de trabalho. Para saber mais, confira Notificações para execução de fluxo de trabalho.

status
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
status	Não aplicável	Último commit no branch padrão	Não aplicável
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando o status do commit de Git é alterado. Por exemplo, os commits podem ser marcados como error, failure, pending ou success. Caso deseje fornecer mais detalhes sobre a alteração de status, o ideal é usar o evento check_run. Para obter informações sobre as APIs de status do commit, consulte Objetos na documentação da API do GraphQL ou Pontos de extremidade da API REST para commits.

Por exemplo, você poderá executar um fluxo de trabalho quando o evento status ocorrer.

on:
  status
Caso deseje executar um trabalho no seu fluxo de trabalho com base no novo estado de commit, use o contexto github.event.state. Por exemplo, o fluxo de trabalho a seguir é disparado quando um status de commit é alterado, mas o trabalho if_error_or_failure só é executado se o novo estado de commit é error ou failure.

on:
  status
jobs:
  if_error_or_failure:
    runs-on: ubuntu-latest
    if: >-
      github.event.state == 'error' ||
      github.event.state == 'failure'
    steps:
      - env:
          DESCRIPTION: ${{ github.event.description }}
        run: |
          echo The status is error or failed: $DESCRIPTION
watch
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
watch	- started	Último commit no branch padrão	Branch padrão
Note

Mais de um tipo de atividade aciona este evento. Embora apenas o tipo de atividade started tenha suporte, a especificação do tipo de atividade manterá seu fluxo de trabalho específico se mais tipos de atividade forem adicionados posteriormente. Para obter informações sobre cada tipo de atividade, confira Eventos e cargas de webhook. Por padrão, todos os tipos de atividade disparam fluxos de trabalho que são executados nesse evento. Você pode limitar suas execuções de fluxo de trabalho a tipos de atividades específicos usando a palavra-chave types. Para saber mais, confira Sintaxe de fluxo de trabalho para o GitHub Actions.

Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Executa o fluxo de trabalho quando o repositório do fluxo de trabalho é favoritado. Para obter informações sobre as APIs de solicitação de pull, confira Mutações na documentação da API do GraphQL ou Pontos de extremidade da API REST para estrela.

Por exemplo, você poderá executar um fluxo de trabalho quando alguém adiciona um repositório aos favoritos, que é o tipo de atividade started para um evento de inspeção.

on:
  watch:
    types: [started]
workflow_call
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
Igual ao fluxo de trabalho de chamadas	Não aplicável	Igual ao fluxo de trabalho de chamadas	Igual ao fluxo de trabalho de chamadas
workflow_call é usado para indicar que um fluxo de trabalho pode ser chamado por outro fluxo de trabalho. Quando um fluxo de trabalho é disparado com o evento workflow_call, a carga do evento no fluxo de trabalho chamado é a mesma carga do evento do fluxo de trabalho de chamada. Para saber mais, confira Reutilizar fluxos de trabalho.

O exemplo abaixo só executa o fluxo de trabalho quando é chamado a partir de outro fluxo de trabalho:

on: workflow_call
workflow_dispatch
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
workflow_dispatch	Não aplicável	Último commit no branch GITHUB_REF ou na marcação	Branch ou marcação que recebeu expedição
Note

Esse evento vai disparar apenas um fluxo de trabalho executado se o arquivo de fluxo de trabalho existe no branch padrão.

Para permitir que um fluxo de trabalho seja disparado manualmente, configure o evento workflow_dispatch. Você pode acionar manualmente uma execução de fluxo de trabalho usando a API do GitHub, {a % data variables.product.prodname_cli %} ou a interface do usuário do GitHub. Para saber mais, confira Executar um fluxo de trabalho manualmente.

on: workflow_dispatch
Fornecendo entradas
É possível configurar as propriedades de entrada definidas por personalização, os valores-padrão de entrada e as entradas obrigatórias para o evento diretamente no seu fluxo de trabalho. Ao disparar o evento, você pode fornecer a ref e qualquer inputs. Quando o fluxo de trabalho é executado, você pode acessar os valores de entrada no contexto inputs. Para saber mais, confira Acessar informações contextuais sobre execuções de fluxo de trabalho.

Note

O fluxo de trabalho também receberá as entradas no contexto de github.event.inputs. As informações no contexto inputs e no contexto github.event.inputs são idênticas, exceto que o contexto inputs preserva valores boolianos como boolianos em vez de convertê-los em cadeias de caracteres. O tipo choice é resolvido para uma cadeia de caracteres e é uma única opção selecionável.
O número máximo de propriedades de nível superior para inputs é 10.
O conteúdo máximo para inputs é de 65.535 caracteres.
Esse exemplo define entradas chamadas logLevel, tags e environment. Você passa os valores destas entradas para o fluxo de trabalho quando o executa. Em seguida, esse fluxo de trabalho imprime os valores no log usando as propriedades do contexto inputs.logLevel, inputs.tags e inputs.environment.

on:
  workflow_dispatch:
    inputs:
      logLevel:
        description: 'Log level'
        required: true
        default: 'warning'
        type: choice
        options:
        - info
        - warning
        - debug
      tags:
        description: 'Test scenario tags'
        required: false
        type: boolean
      environment:
        description: 'Environment to run tests against'
        type: environment
        required: true

jobs:
  log-the-inputs:
    runs-on: ubuntu-latest
    steps:
      - run: |
          echo "Log level: $LEVEL"
          echo "Tags: $TAGS"
          echo "Environment: $ENVIRONMENT"
        env:
          LEVEL: ${{ inputs.logLevel }}
          TAGS: ${{ inputs.tags }}
          ENVIRONMENT: ${{ inputs.environment }}
Se você executar este fluxo de trabalho em um navegador, você deverá inserir valores para as entradas necessárias manualmente antes de o fluxo de trabalho ser executado.

Captura de tela de uma lista de execuções de fluxo de trabalho. Um menu suspenso, rotulado "Executar fluxo de trabalho" e expandido para mostrar os campos de entrada, está contornado em laranja escuro.

Você também pode passar entradas quando executar um fluxo de trabalho a partir de um script ou usando GitHub CLI. Por exemplo:

gh workflow run run-tests.yml -f logLevel=warning -f tags=false -f environment=staging
Para saber mais, confira as informações sobre o GitHub CLI em Executar um fluxo de trabalho manualmente.

workflow_run
Carga de evento webhook	Tipos de atividade	GITHUB_SHA	GITHUB_REF
workflow_run	- completed
- requested
- in_progress	Último commit no branch padrão	Branch padrão
