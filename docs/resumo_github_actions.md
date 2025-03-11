## Introdução
O desenvolvimento teve que se tornar colaborativo
Liberar software deve ser fácil.…
Automatize quase tudo e mantenha tudo o que você precisa para construir, implantar, testar e liberar seu aplicativo no controle de versão.
1968 - mind the gap - metrô de Londres no Reino Unido.

## GitHub Actions
GitHub Actions é uma plataforma de integração contínua e entrega contínua (CI/CD) que permite automatizar a sua compilação, testar e pipeline de implantação.

GitHub Actions vai além de apenas DevOps e permite que você execute fluxos de trabalho quando outros eventos ocorrerem no seu repositório.

GitHub fornece máquinas virtuais do Linux, Windows e macOS para executar seus fluxos de trabalho, ou você pode hospedar seus próprios executores auto-hospedados na sua própria infraestrutura de dados ou na nuvem.

O GitHub Actions é uma plataforma de integração contínua e entrega/implantação contínua (CI/CD) que automatiza seus fluxos de trabalho de desenvolvimento de software. Ele permite que você crie, teste e implante o código-fonte do software diretamente do seu repositório GitHub criando fluxos de trabalho ou pipelines personalizados.

Com várias opções de configuração para gatilhos com base em confirmações e mesclagens, o GitHub Actions é uma boa escolha para fluxos de trabalho baseados em GitOps.

![](img/github-actions-diagram.png)

### GitHub Actions Custo
O GitHub Actions é gratuito se uma ou ambas as duas condições a seguir forem atendidas:

- [x] Os repositórios que você usa com ações são públicos.
- [x] Os sistemas nos quais você executa as ações (os executores) são seus (em vez de usar os fornecidos pelo GitHub).

#### Modelo Pago
Repositórios privados
Clientes corporativos/empresariais do GitHub podem frequentemente usar esse modelo.

Existem dois tipos de itens pelos quais você paga com o GitHub Action:
- [x] Armazenamento: Ações permitem que você armazene artefatos e pacotes nos recursos do GitHub.
- [x] Minutos: As ações exigem tempo de processamento em sistemas virtuais.

### Planos e Preços

| Planejar	                        | Armazenamento | Minutos (por mês) |
| ------                            | ----          | ----              |
| GitHub Free	                      | 500 MB        | 2.000             |
| GitHub Pro	                      | 1 GB          | 3.000             |
| GitHub Free para organizações	    | 500 MB        | 2.000             |
| GitHub Team	                      | 2 GB	        | 3.000             |
| GitHub Enterprise Cloud	          | 50 GB	        | 50.000            |

| Sistema Operacional |  Multiplicador de minutos | Taxa por minuto (USD) |
| ----                | -----                     | -----                 |
| Linux               | 1                         |  0,008                |
| MacOs               | 10                        | 0,008                 |
| Windows             | 2                         | 0,016                 |

Observação: Eles só podem funcionar quando executados pelo mecanismo do GitHub.

![](img/github-actions-001.png)

## Workflow Contexts
Contextos são uma maneira de acessar informações sobre execuções de fluxo de trabalho, variáveis, ambientes de execução, trabalhos e etapas.

Cada contexto é um objeto que contém propriedades, que podem ser strings ou outros objetos.

Você pode acessar contextos usando a sintaxe de expressão. ${{ <context> }}

| Tipo     | Descrição                                                                                                  |
| ----     | ----                                                                                                       |
| github   | Informações sobre a execução do fluxo de trabalho.                                                         |
| env      | Contém variáveis definidas em um fluxo de trabalho, tarefa ou etapa.                                       |
| vars     | Contém variáveis definidas nos níveis de repositório, organização ou ambiente.                             |
| job      | Informações sobre a tarefa em execução no momento.                                                         |
| jobs     | Somente para fluxos de trabalho reutilizáveis, contém saídas de tarefas do fluxo de trabalho reutilizável. |
| steps    | Informações sobre as etapas que foram executadas na tarefa atual.                                          |
| runner   | Informações sobre o executor que está executando a tarefa atual.                                           |
| secrets  | Contém os nomes e valores de segredos que estão disponíveis para uma execução de fluxo de trabalho.        |
| strategy | Informações sobre a estratégia de execução da matriz para a tarefa atual.                                  |
| matrix   | Contém as propriedades da matriz definidas no fluxo de trabalho que se aplicam à tarefa atual.             |
| needs    | Contém as saídas de todas as tarefas que são definidas como uma dependência da tarefa atual.               |
| inputs   | Contém as entradas de um fluxo de trabalho reutilizável ou acionado manualmente.                           |

```
steps:
  - name: Use Secret as Env Var
    run: echo "Secret Value: $MY_SECRET"
    env:
      MY_SECRET: ${{ secrets.MY_SECRET }}
```
![](img/github-actions-workflow.png)

## Gerenciamento de Artefatos
O gerenciamento de artefatos do GitHub Actions é conveniente para armazenamento e compartilhamento rápido e fácil de artefatos. Mas não é um sistema de gerenciamento de pacotes como o GitHub Packages ou o Artifactory.

## Gestão de Ações
Os controles podem assumir a forma de garantir que o conjunto de ações usadas seja aprovado e gerenciável. Também deve haver um processo de atualização regular para garantir que todas as ações públicas usadas sejam mantidas atualizadas e que o uso delas seja revisado conforme necessário.

Ações no GtHub Action são pacotes de código reutilizáveis usados como etapas em um fluxo de trabalho. Eles realizam tarefas como configurar ambientes, executar testes, implantar código, etc., que ajudam a automatizar várias etapas envolvidas no ciclo de vida de desenvolvimento de software.

Você pode usar ações compartilhadas pela comunidade/GitHub ou criar ações personalizadas. O GitHub Actions oferece três tipos de ações personalizadas: ações JavaScript, que são executadas diretamente na máquina executora; ações de contêiner Docker, que são executadas em um ambiente Docker; e ações compostas, que combinam várias etapas do fluxo de trabalho em uma única ação.

### Artefatos do GitHub Actions
Os artefatos do GitHub Actions são arquivos ou diretórios que são carregados e armazenados após a conclusão de um trabalho em um fluxo de trabalho do GitHub Actions. Esses artefatos permitem que você retenha e acesse a saída do trabalho para processamento posterior dentro do pipeline ou por outros serviços. Exemplos de artefatos incluem executáveis versionados, logs e resultados de testes.

### Segredos do GitHub Actions
Atividades de build e deploy geralmente exigem acesso a informações confidenciais, como chaves de API, tokens e senhas. O GitHub Actions fornece um método seguro para configurar e armazenar essas informações confidenciais como segredos. Esses segredos são armazenados em formato criptografado como variáveis de ambiente, que são disponibilizadas aos executores durante cada execução de fluxo de trabalho. Assim, os fluxos de trabalho podem acessar e usar as informações confidenciais necessárias com segurança.
### Qual é a diferença entre uma ação do GitHub e um fluxo de trabalho?
Uma "Ação" e um "Fluxo de trabalho" do GitHub são componentes-chave da plataforma GitHub Actions. Um fluxo de trabalho é um processo automatizado acionado por eventos específicos como push, pull ou agendamento, definidos em arquivos YAML no diretório .github/workflows. Ele consiste em um ou mais trabalhos, cada um contendo etapas. Ações são unidades reutilizáveis de código dentro desses fluxos de trabalho, executando tarefas individuais.

Enquanto os fluxos de trabalho orquestram a automação, as ações fornecem os blocos de construção, permitindo a reutilização de tarefas em diferentes fluxos de trabalho. Ações personalizadas podem ser criadas ou usadas no GitHub Marketplace, facilitando a execução eficiente e consistente de tarefas em processos de desenvolvimento de software.

## Fluxos de trabalho
Um fluxo de trabalho é um processo automatizado configurável que executará um ou mais trabalhos.

Um fluxo de trabalho do GitHub Actions a ser disparado quando um evento ocorrer no seu repositório.

![](img/github-actions-002a.png)

```
name: GitHub Actions Demo
run-name: ${{ github.actor }} is testing out GitHub Actions 🚀
on: [push]
```

Ou seja, em resposta à ocorrência de um evento correspondente, uma definição de fluxo de trabalho armazenada no repositório é acionada, o que, por sua vez, dispara trabalhos em sistemas designados, chamados executores. Os trabalhos são compostos de sequências de etapas que invocam uma ação predefinida ou executam um comando no shell do sistema operacional do executor.

Os fluxos de trabalho são definidos no diretório .github/workflows de um repositório em um arquivo YAML.

Um fluxo de trabalho que usa outro fluxo de trabalho é chamado de fluxo de trabalho "chamador".

O fluxo de trabalho reutilizável é um fluxo de trabalho "chamado".

Fluxos de trabalho reutilizáveis e ações compostas ajudam você a evitar duplicação.

Cada fluxo de trabalho deve ser escrito em YAML e ter uma .yml extensão.

Eles também precisam de um .properties.jsonarquivo correspondente que contenha metadados extras sobre o fluxo de trabalho (isso é exibido na UI do GitHub.com).

Por exemplo: ci/django.ymle ci/properties/django.properties.json.

Essa flexibilidade é aprimorada pelo Actions Marketplace, um registro público onde ações podem ser publicadas e compartilhadas.

Fluxos de trabalho **reutilizáveis** permitem que você reutilize um fluxo de trabalho inteiro, incluindo todas as suas tarefas e etapas.

| Fluxos de trabalho reutilizáveis	| Ações compostas   |
| --------                          | ---------       |
| Um arquivo YAML, muito semelhante a qualquer arquivo de fluxo de trabalho padrão	                       | Uma ação que contém um pacote de etapas do fluxo de trabalho |
|  Cada fluxo de trabalho reutilizável é um único arquivo no diretório .github/workflows de um repositório | Cada ação composta é um repositório, ou um diretório, separado contendo um arquivo action.yml e, opcionalmente, outros arquivos |
| Chamada feita referenciando um arquivo YAML específico                                                   | Chamada feita referenciando um repositório ou diretório no qual a ação está definida |
| Chamada feita diretamente em uma tarefa, não em uma etapa	                                               | Execução feita como uma etapa dentro de uma tarefa |
| Pode conter várias tarefas                                                                               | Não contém tarefas |
| Cada etapa é registrada em tempo real	                                                                   | Registro como uma etapa, mesmo que contenha várias etapas |
| Pode conectar um máximo de quatro níveis de fluxos de trabalho                                           | O aninhamento pode ser feito para ter até 10 ações compostas em um único fluxo de trabalho |
| Pode usar segredos	                                                                                   | Não pode usar segredos

Os fluxos de trabalho são os scripts ou pipelines que controlam o fluxo e a sequência de atividades no GitHub Actions. As ações individuais são as funções que podem ser chamadas para fazer tarefas direcionadas de dentro dos fluxos de trabalho (como verificar o código).

Visão Geral
Algum evento de disparo acontece em um repositório GitHub, ser um evento no GitHub que não é uma atualização para uma ref.
Um diretório dedicado no repositório (.github/ workflows) é pesquisado para arquivos de fluxo de trabalho que são codificados para responder ao tipo de evento.
Os fluxos de trabalho correspondentes são identificados e novas execuções dos fluxos de trabalho correspondentes
A sintaxe cron tem cinco campos separados por um espaço, e cada campo representa uma unidade de tempo.
As variáveis de ambiente padrão definidas pelo GitHub estão disponíveis em todas as etapas de um fluxo de trabalho.

### [Categorias dos Fluxos de Trabalho](https://github.com/actions/starter-workflows)

| Categoria           | Descrição |
| ----                | ----      |
| Implantação         | Fluxos de trabalho de exemplo para criar objetos implantáveis (como contêineres) e, em seguida, implantá-los em várias plataformas de nuvem. |
| Segurança           | Conjunto de fluxos de trabalho de varredura de código usando vários métodos de segurança plataformas e suas ferramentas.                     |
| Integração Contínua | número de fluxos de trabalho que abrangem as áreas de construção, teste e/ou publicação para um grande número de diferentes programas linguagens e ferramentas. |
| Automação           | Alguns exemplos simples de automação básica.  |
| Páginas             | Fluxos de trabalho para empacotar/implantar sites usando ferramentas comuns como Gatsby, Astro, Jekyll, etc. |


## Eventos
Um evento é uma atividade específica em um repositório que dispara a execução de um fluxo de trabalho.

| Eventos                                  | Tipos de atividade	       | Disparo |
| --------------                           | -----                     | ----    |
| branch_protection_rule                   | created, edited e deleted | Executa o fluxo de trabalho quando as regras de proteção de branch no repositório do fluxo de trabalho são alteradas. | `on: branch_protection_rule: types: [created, deleted]` |
| check_run                                | created, rerequested, completed, requested_action | Executa o fluxo de trabalho quando ocorre a atividade relacionada a uma execução de verificação. | `on: check_run:    types: [rerequested, completed]` |
| check_suite                              | completed                 | Um conjunto de verificações é uma coleção das execuções de verificação criadas para um commit específico. |  `on: check_suite: types: [completed]` |
| create                                   | - | Quando alguém cria uma referência Git (branch ou tag) no repositório do fluxo de trabalho. | `on: create` |
| delete                                   | - | Quando alguém exclui uma referência Git (branch ou tag) no repositório do fluxo de trabalho. | `on: delete` |
| deployment                               | - | quando alguém cria uma implantação no repositório do fluxo de trabalho. | `on: deployment` |
| deployment_status                        | - | mplantações criadas com um commit SHA podem não ter uma referência Git.  |  `on: deployment_status` |
| discussion                               | created,edited,deleted,transferred,pinned,unpinned,labeled,unlabeled,locked,unlocked,category_changed,answered,unanswered | quando uma discussão no repositório do fluxo de trabalho é criada ou modificada. | `on: discussion: types: [created, edited, answered]` |
| discussion_comment                       | created,edited,deleted | quando um comentário em uma discussão no repositório do fluxo de trabalho é criado ou modificado. | `on:discussion_comment: types: [created, deleted]` |
| fork                                     | - | Fluxo de trabalho quando alguém bifurca um repositório. | `on: fork`  |
| gollum                                   | -  | Quando alguém cria ou atualiza uma página wiki.         |  `on: fork` |
| issue_comment                            |    | Quando um problema ou comentário de pull request é criado, editado ou excluído.  | `on: issue_comment: types: [created, deleted]` |
| issues                                   | opened,edited,deleted,transferred,pinned,unpinned,closed,reopened,assigned,unassigned,labeled,unlabeled,locked,unlocked,milestoned,demilestoned | quando um problema no repositório do fluxo de trabalho é criado ou modificado. | `on: issues: types: [opened, edited, milestoned]` |
| label                                    | created,edited,deleted  | Quando uma etiqueta no repositório do fluxo de trabalho é criada ou modificada.  | `on: label: types: [created, deleted]` |
| merge_group                              | checks_requested | Quando uma solicitação de pull é adicionada a uma fila de mesclagem, o que adiciona a solicitação de pull a um grupo de mesclagem. | `on: pull_request: branches: [ "main" ] merge_group: types: [checks_requested]` |
| milestone                                | created,closed,opened,edited,deleted | quando um marco no repositório do fluxo de trabalho é criado ou modificado.  |  `on: milestone:    types: [opened, deleted]` |
| page_build                               | - | Quando alguém faz push em um branch que é a fonte de publicação para GitHub Pages, se o GitHub Pages estiver habilitado no repositório. | `on: page_build` |
| public                                   | - | Quando o repositório do fluxo de trabalho é alterado de privado para público.  | ``
| pull_request                             | assigned,unassigned,labeled,unlabeled,opened,edited,closed,reopened,synchronize,converted_to_draft,locked,unlocked,enqueued,dequeued,milestoned,demilestoned,ready_for_review,review_requested,review_request_removed,auto_merge_enabled,auto_merge_disabled | quando ocorre uma atividade em uma pull request no repositório do fluxo de trabalho. | `on:
  pull_request:
    types: [opened, reopened]`
| pull_request_comment (use issue_comment) | -  | quando um comentário em uma solicitação de pull (não na comparação de uma solicitação de pull) é criado, editado ou excluído, use o evento issue_comment |  |
| pull_request_review                      | submitted, edited, dismissed | Quando uma revisão de pull request é enviada, editada ou ignorada. | `on: pull_request_review:  types: [edited, dismissed]` |
| pull_request_review_comment              | created, edited, deleted | Quando um comentário de revisão de pull request é modificado.  | `on: pull_request_review_comment:    types: [created, deleted]` |
| pull_request_target                      | assigned,unassigned,labeled,unlabeled,opened,edited,closed,reopened,synchronize,converted_to_draft,ready_for_review,locked,unlocked,review_requested,review_request_removed,auto_merge_enabled,auto_merge_disabled | Quando ocorre uma atividade em uma pull request no repositório do fluxo de trabalho.  | `on: pull_request_target: types: [assigned, opened, synchronize, reopened]` |
| push                                     | - | quando você efetua push em um commit ou tag ou quando cria um repositório a partir de um modelo. | `on:
  push` |
| registry_package                         | published, updated | Quando uma atividade relacionada ao GitHub Packages ocorre no seu repositório.  | `on:
  registry_package:
    types: [published]` |
| release                                  | published,unpublished,created,edited,deleted,prereleased,released | quando a atividade de da versão no repositório ocorre.  | `on:
  release:
    types: [published]` |
| repository_dispatch                      | | quando você deseja disparar um fluxo de trabalho para a atividade que ocorre fora do GitHub. | `on: repository_dispatch:  types: [test_result]` |
| schedule                                 | | O evento schedule pode ser atrasado durante períodos de cargas altas de execuções de fluxo de trabalho do GitHub Actions.  | `on:
  schedule:
    - cron: "15 4,5 * * *"` |
| status                                   | | quando o status do commit de Git é alterado. Por exemplo, os commits podem ser marcados como error, failure, pending ou success.  | `on:
  status`
| watch                                    | started | quando o repositório do fluxo de trabalho é favoritado.  | `on: watch: types: [started]` |
| workflow_call                            |         | É usado para indicar que um fluxo de trabalho pode ser chamado por outro fluxo de trabalho.   | `on: workflow_call` |
| workflow_dispatch                        |  | Para permitir que um fluxo de trabalho seja disparado manualmente, configure o evento workflow_dispatch | `on: workflow_dispatch` |
| workflow_run                             | completed, requested, in_progress | quando uma execução do fluxo de trabalho é solicitada ou concluída.  | `on:
  workflow_run:
    workflows: [Staging, Lab]
    types:
      - completed` |

através da tecnologia de IA. Incentive suas equipes a participarem de conferências, hackathons e fazerem parte de conselhos consultivos universitários. Ao apresentar e participar dessas iniciativas, você ganh

```
┌───────────── minute (0 - 59)
│ ┌───────────── hour (0 - 23)
│ │ ┌───────────── day of the month (1 - 31)
│ │ │ ┌───────────── month (1 - 12 or JAN-DEC)
│ │ │ │ ┌───────────── day of the week (0 - 6 or SUN-SAT)
│ │ │ │ │
│ │ │ │ │
│ │ │ │ │
* * * * *
```

Você pode usar estes operadores em qualquer um dos cinco campos:

| Operador	| Descrição	                    | Exemplo                                                                                          |
| ----      | ----                          | -------                                                                                          |
| *	        | Qualquer valor	            | 15 * * * * é executado a cada quarto de hora todos os dias.                                      |
| ,	        | Separador de lista de valor	| 2,10 4,5 * * * é executado nos minutos 2 e 10 da quarta e da quinta hora todos os dias.          |
| -	        | Intervalo de valores	        | 30 4-6 * * * é executado a cada meia hora da quarta, da quinta e da sexta hora.                  |
| /	        | Valores de etapa	            | 20/15 * * * * é executado a cada 15 minutos, começando do minuto 20 ao 59 (minutos 20, 35 e 50). |

Observação: Use  o site [Crontab](https://crontab.guru).

Um workflow do GitHub Actions é um conjunto de códigos que define. uma sequência e um conjunto de etapas para executar, semelhante a um script ou programa.

Um evento pode ser definido de várias maneiras diferentes:

- [x] Uma pessoa ou um processo realiza alguma operação em um repositório do GitHub.
- [x] Um gatilho externo correspondente acontece, ou seja, um evento de fora do GitHub.
- [x] Um cronograma é configurado para executar um fluxo de trabalho em horários ou intervalos específicos.
- [x] Um fluxo de trabalho é iniciado manualmente, sem que nenhuma operação precise ser realizada primeiro.


A palavra-chave on e as linhas que a seguem definem quais tipos de gatilhos o fluxo de trabalho corresponderá e começará a executar.
Alguns tipos básicos de gatilhos e exemplos simples da sintaxe para cada um seguem:
- [x] O fluxo de trabalho pode responder a um único evento, como quando ocorre um push: `on: push`
- [ ] O fluxo de trabalho pode responder a uma lista (vários eventos): `on: [push, pull_request]`
- [ ] O fluxo de trabalho pode responder a tipos de eventos com qualificadores:

```
on:
  push:
    branches:
      - main
      - 'rel/v*'
    tags:
      - v1.*
      - beta
```

- [x] O fluxo de trabalho pode ser executado em um cronograma:

```
on:
  scheduled:
    - cron: '30 5,15 * * *'
```
- [x] O fluxo de trabalho pode responder a eventos manuais específicos: `on: [workflow-dispatch, repository-dispatch]`
- [ ] O fluxo de trabalho pode ser chamado de outros fluxos de trabalho (chamado de evento de reutilização): `on: workflow_call`

Onservação:
- [x] Para esses eventos, se você tiver o arquivo de fluxo de trabalho somente em um branch não padrão e acionar a atividade que normalmente faria o fluxo de trabalho ser executado, nada acontecerá.
- [ ]
## Webhooks de repositório
É um mecanismo que permite a comunicação entre diferentes sistemas de forma automatizada e em tempo real. Ele funciona como um callback HTTP, onde um sistema envia automaticamente dados para outro sistema assim que um evento específico ocorre.
você só pode criar até 20 webhooks que se inscrevam em cada tipo de evento individual.

## Job
Um JOB é um conjunto de etapas em um fluxo de trabalho executadas no mesmo executor.

Os JOBs agregam etapas e definem em qual executor executá-los.

Ele é composto de uma série de comandos individuais para executar e/ou ações predefinidas para chamar.

O sucesso ou fracasso é exibido no nível do trabalho, não nas etapas individuais.

O hífen no início desta linha indica que este é o início de um segundo passo.


Cada etapa é um script de shell que será executado ou uma ação que será executada.
Você pode configurar as dependências de um trabalho com outros trabalhos; por padrão, os trabalhos não têm dependências e são executados em paralelo.
Cada trabalho é executado em um ambiente do executor(runner) especificado por runs-on.
O job que vai conter todas as operações deste exercício que estamos fazendo aqui é composta de quatro etapas:
1.	Primeira etapa para permitir que seu workflow tenha acesso aos arquivos e diretórios do repositório através da ação checkout.
2.	Segunda etapa para instalar a versão do Python específica que desejamos usar. Neste caso, usaremos a ação setup-python, que permite informar como input a versão de python específica: aqui 3.8.
3.	Terceira etapa para instalar as dependências ou bibliotecas. Neste caso, vamos usar um comando shell utilizando pip para fazer a instalação da biblioteca requests.
4.	Uma quarta etapa para executar o script usando Python.

Os jobs são o que você geralmente vê em outros aplicativos como estágios, ou seja, partes de um processo maior que executam uma função distinta e separada.

Embora CI ou CI/CD seja o propósito principal que vem à mente, fluxos de trabalho e ações podem ser usados para automatizar quase qualquer processo.

Um trabalho no GitHub Actions consiste em uma série de etapas executadas no mesmo executor. Os trabalhos podem ser executados em paralelo ou sequencialmente, dependendo das dependências definidas no fluxo de trabalho. Os trabalhos que não dependem da saída de outros trabalhos podem ser executados em paralelo, o que ajuda a reduzir o tempo geral de compilação.


### Dependent Jobs
Uma execução de fluxo de trabalho é composta de um ou mais trabalhos, que são executados em paralelo por padrão. Para executar trabalhos sequencialmente, você pode definir dependências em outros trabalhos usando:

jobs..needs
jobs..if

```
jobs:
  job1:
  job2:
    needs: job1
  job3:
    if: ${{ always() }}
    needs: [job1, job2]
```
### Segredos criptografados
Segredos criptografados são variáveis que permitem que você passe informações confidenciais para seu fluxo de trabalho do GitHub Actions

Os segredos são acessados por  meio do contexto de segredos, por exemplo, ${{ secrets.MY_SECRET }}

Segredos em nível de organização
você pode usar políticas de acesso para controlar quais repositórios podem usar segredos da organização para compartilhar segredos entre vários repositórios

A atualização de segredos da organização propaga alterações para todos os repositórios compartilhados.

Segredos em nível de repositório
Segredos que são compartilhados em todos os ambientes para um repositório.

Segredos em nível de ambiente
Você pode habilitar revisores necessários para controlar o acesso aos segredos

Variáveis de ambiente de nível inferior substituem variáveis de ambiente de nível superior

Os nomes de segredos podem conter apenas caracteres alfanuméricos e sublinhados. Nenhum espaço permitido, por exemplo. Hello_world123
Os nomes não devem começar com o prefixo GITHUB_
Os nomes não devem começar com números
Os nomes não diferenciam maiúsculas de minúsculas
Os nomes devem ser exclusivos no nível em que são criados
Segredos criptografados — Acessando segredos
Passando segredos como entradas
Você pode passar segredos como entradas usando o contexto de segredos.

Passando segredos como variáveis de ambiente
Você também pode passar segredos para ações ou scripts definindo-os como variáveis de ambiente.

```
name: Example Using Secret as Env Var

on: [push]

jobs:
  use-secret-as-env:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run a script using Secret
        run: |
          echo "Using API key: $API_KEY"
        env:
          API_KEY: ${{ secrets. API_KEY }}
```
### Segredos Criptografados — Segredos de Configurações
Segredos de Configurações no Nível do Repositório
#### set a secret and prompt for secret value
gh secret set SECRET_NAME
#### sets a secret and sets values from a text file
gh secret set SECRET_NAME < secret.txt
#### set a secret and prompt for secret value
gh secret set --env ENV_NAME SECRET_NAME
#### get list of secrets for an env
gh secret list --env ENV_NAME
#### login with admin:org scope to manage org secrets
gh auth login --scopes "admin:org"
#### set a secret only for private repos and prompt for secret value
gh secret set --org ORG_NAME SECRET_NAME
#### set a secret for public, private, and internal repos
gh secret set --org ORG_NAME SECRET_NAME --visibility all
#### set a secret for specific repos
gh secret set --org ORG_NAME SECRET_NAME --repos REPO-NAME-1, REPO-NAME-2
#### list secrets for the org
gh secret list --org ORG_NAME

## Variáveis de configuração
Variáveis de configuração são variáveis que permitem que você insira informações não confidenciais no seu fluxo de trabalho do GitHub Actions

Os segredos são acessados por  meio do contexto vars, por exemplo, ${{ vars.APP_ID_EXAMPLE }}

### Segredos em nível de organização
você pode usar políticas de acesso para controlar quais repositórios podem usar segredos da organização para compartilhar segredos entre vários repositórios

A atualização de segredos da organização propaga alterações para todos os repositórios compartilhados.

###Segredos em nível de repositório
Segredos que são compartilhados em todos os ambientes para um repositório.

### Segredos em nível de ambiente
Você pode habilitar revisores necessários para controlar o acesso aos segredos

Os nomes dos segredos podem conter apenas caracteres alfanuméricos e sublinhados, sem espaços permitidos, por exemplo, Hello_world123
Os nomes não devem começar com o prefixo GITHUB_
Os nomes não devem começar com números
Os nomes não diferenciam maiúsculas de minúsculas
Os nomes devem ser exclusivos no nível em que são criados

#### Add variable value for the current repository in an interactive prompt
gh variable set MYVARIABLE
#### Read variable value from an environment variable
gh variable set MYVARIABLE --body "$ENV_VALUE"
#### Read variable value from a file
gh variable set MYVARIABLE < myfile.txt
#### Set variable for a deployment environment in the current repository
gh variable set MYVARIABLE --env myenvironment
#### Set organization-level variable visible to both public and private repositories
gh variable set MYVARIABLE --org myOrg --visibility all
#### Set organization-level variable visible to specific repositories
gh variable set MYVARIABLE --org myOrg --repos repo1,repo2,repo3
#### Set multiple variables imported from the ".env" file
gh variable set -f .env
## Default Env Vars
As variáveis de ambiente padrão que o GitHub define estão disponíveis em cada etapa de um fluxo de trabalho.

- [x[ CI
- [x[ GITHUB_ACTION
- [x[ GITHUB_ACTION_PATH
- [x[ GITHUB_ACTION_REPOSITORY
- [x[ GITHUB_ACTIONS
- [x[ GITHUB_ACTOR
- [x[ GITHUB_ACTOR_ID
- [x[ GITHUB_API_URL
- [x[ GITHUB_BASE_REF
- [x[ GITHUB_ENV
- [x[ GITHUB_EVENT_NAME
- [x[ GITHUB_EVENT_PATH
- [x[ GITHUB_GRAPHQL_URL
- [x[ GITHUB_HEAD_REF
- [x[ GITHUB_JOB
- [x[ GITHUB_OUTPUT
- [x[ GITHUB_PATH
- [x[ GITHUB_REF
- [x[ GITHUB_REF_NAME
- [x[ GITHUB_REF_PROTECTED
- [x[ GITHUB_REF_TYPE
- [x[ GITHUB_REPOSITORY
- [x[ GITHUB_REPOSITORY_ID
- [x[ GITHUB_REPOSITORY_OWNER
- [x[ GITHUB_REPOSITORY_OWNER_ID
- [x[ GITHUB_RETENTION_DAYS
- [x[ GITHUB_RUN_ATTEMPT
- [x[ GITHUB_RUN_ID
- [x[ GITHUB_RUN_NUMBER
- [x[ GITHUB_SERVER_URL
- [x[ GITHUB_SHA
- [x[ GITHUB_STEP_SUMMARY
- [x[ GITHUB_TRIGGERING_ACTOR
- [x[ GITHUB_WORKFLOW
- [x[ GITHUB_WORKFLOW_REF
- [x[ GITHUB_WORKFLOW_SHA
- [x[ GITHUB_WORKSPACE
- [x[ RUNNER_ARCH
- [x[ RUNNER_DEBUG
- [x[ RUNNER_NAME
- [x[ RUNNER_OS
- [x[ RUNNER_TEMP
- [x[ RUNNER_TOOL_CACHE

Você pode definir Variáveis de Ambiente em linha no seu fluxo de trabalho do GitHub Actions.
```
name: Conditional env variable

on: workflow_dispatch

env:
  DAY_OF_WEEK: Monday

jobs:
  greeting_job:
    runs-on: ubuntu-latest
    env:
      Greeting: Hello
    steps:
    - name: "Say Hello Mona it's Monday"
      if: ${{ env.DAY_OF_WEEK == 'Monday' }}
      run: echo "$Greeting $First_Name. Today is $DAY_OF_WEEK!"
      env:
        First_Name: Mona
```

## Definir variáveis de ambiente com comandos de fluxo de trabalho
No GitHub Actions, você pode definir variáveis de ambiente dinamicamente durante a execução de seus fluxos de trabalho usando o comando de fluxo de trabalho especial $GITHUB_ENV.

Isso é útil para passar valores entre etapas, ajustar dinamicamente o comportamento com base em dados de tempo de execução ou configurar ferramentas e scripts executados pelo seu fluxo de trabalho.

```
name: Set Environment Variables Example
on: [push]
jobs:
  setup-and-use-env:
    runs-on: ubuntu-latest
    steps:
      - name: Set dynamic environment variable
        run: |
          # Using workflow command to set an environment variable
          echo "DYNAMIC_VAR=Hello from GitHub Actions" > $GITHUB_ENV

      - name: Use the environment variable
        run: |
          # Using the environment variable in a subsequent step
          echo "The value of DYNAMIC_VAR is: $DYNAMIC_VAR"

```
GITHUB_TOKEN Secret
No início de cada trabalho de fluxo de trabalho, o GitHub cria automaticamente um segredo GITHUBTOKEN exclusivo para usar no seu fluxo de trabalho. Você pode usar o GITHUBTOKEN para autenticar no trabalho de fluxo de trabalho.

Quando você habilita o GitHub Actions, o GitHub instala um GitHub App no seu repositório.

O segredo GITHUB_TOKEN é um token de acesso de instalação do GitHub App.

```
name: Create issue on commit

on: [push]

jobs:
  create_issue:
    runs-on: ubuntu-latest
    permissions:
      issues: write
    steps:
      - name: Create issue using REST API
        run: |
          curl --request POST \
          --url https://api.github.com/repos/${{ github.repository }}/issues \
          --header 'authorization: Bearer ${{ secrets.GITHUB_TOKEN }}' \
          --header 'content-type: application/json' \
          --data '{
            "title": "Automated issue for commit: ${{ github.sha }}",
            "body": "Automatically crated by the GitHub Action workflow **${{ github.workflow }}**. \n\n The commit hash was: _${{ github.sha }} }}_."
          }' \
          -- fail
```
## Adicionar script ao fluxo de trabalho
Você pode executar scripts bash dentro de um fluxo de trabalho do GitHub Actions

```
jobs:
  example-job:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ./scripts
    steps:
      - name: Check out the repository to the runner
        uses: actions/checkout@v4
      - name: Run a script
        run: ./my-script.sh
      - name: Run another script
        run: ./my-other-script.sh
```
## Publish GitHub Package using Workflow

```
name: Create and publish a Docker image
on:
  push:
    branches: ['release']

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  build-and-push-image:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    steps:
steps:
  - name: Checkout repository
    uses: actions/checkout@v4
  - name: Log in the Container registry
    uses: docker/login-action@65b78...
    with:
      registry: ${{ env.REGISTRY }}
      username: ${{ github.actor }}
      password: ${{ secrets.GITHUB_TOKEN }}
  - name: Extract metadata (tags, labels) for Docker
    id: meta
    uses: docker/metadata-action@9ec57...
    with:
      images: $ {{ env.REGISTRY }} /${{ env.IMAGE_NAME }}
  - name: Build and push Docker image
    uses: docker/build-push-action@f2a1d...
    with:
      context: .
      push: true
      tags: ${{ steps.meta.outputs.tags }}
      labels: ${{ steps.meta.outputs.labels }}
```

## Publish Docker Hub Registry using Workflo

```
name: Publish Docker image

on:
  release:
    types: [published]

jobs:
  push_to_registry:
    name: Push Docker image to Docker Hub
    runs-on: ubuntu-latest
    steps:
  - name: Check out the repo
    uses: actions/checkout@v4

  - name: Log in to Docker Hub
    uses docker/login-action@f4e78...
    with:
      username: ${{ secrets.DOCKER_USERNAME }}
      password: ${{ secrets.DOCKER_PASSWORD }}

  - name: Extract metadata (tags, labels) for Docker
    id: meta
    uses: docker/metadata-action@9ec57...
    with:
      images: my-docker-hub-namespace/my-docker-hub-repository

  - name: Build and push Docker image
    uses: docker/build-push-action@3b5e8...
    with:
      context: .
      file: ./Dockerfile
      push: true
      tags: ${{ steps.meta.outputs.tags }}
      labels: ${{ steps.meta.outputs.labels }}
```
### Publish GitHub Container Registry using Workflow

```
name: Publish Docker Image
on: [push]
jobs:
  build-and-push
    runs-on: ubuntu-latest
    steps:
    - name: Check out the repo
      uses: actions/checkout@v2

    - name: Log in to GitHub Container Registry
      uses: docker/login-action@v1
      with:
        registry: ghcr.io
        username: ${{ github.actor }}
        password: ${{ secrets.CR_PAT }} # or use GITHUB_TOKEN

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v1

    - name: Build and push Docker image
      users: docker/build-push-action@v2
      with:
        context: .
        file: ./Dockerfile
        push: true
        tags: ghcr.io/${{ github.repository_owner }}/my-image latest

    - name: Verify the image was pushed
      run: docker pull ghcr.io/${{ github.repository_owner }}/my-image latest
```

### Publish Component as GitHub Release

```
name: Release Workflow
on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
steps:
  - name: Checkout code
    uses: actions/checkout@v2

  - name: Build project
    run: |
      echo "Build your project here"
      # Example: gcc -o output_binary source_code.c

  - name: Create Release
    id: create_release
    uses: actions/create-release@v1
    env:
      GITHUB_TOKEN: $ {{ secrets.GITHUB_TOKEN }}
    with:
      tag_name: ${{ github.ref }}
      release_name: Release ${{ github.ref }}
      draft: false
      prerelease: false

  - name: Upload Release Asset
    uses: actions/upload-release-asset@v1
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    with:
      upload_url: ${{ steps.create.release.outputs.upload_url }}
      asset_path: ./path/to/your/output_binary
      asset_name: output_binary_name
      asset_content_type: application/octet-stream
```
### Deploy Release to Cloud Provider

```
name: Deploy web app to Azure Static Web Apps

env:
  APP_LOCATION: "/"
  API_LOCATION: "api"
  OUTPUT_LOCATION: "build"

on:
  push:
    branches:
      - main
  pull_request:
    types: [opened, synchronize, reopened, closed]
    branches:
      - main
permissions:
  issues: write
  contents: read
  pull-requests: write

jobs:
jobs:
  build_and_deploy:
    if: github_event_name == 'push' || (github.event_name == 'pull_request' && github.event_action != 'closed')
    runs-on: ubuntu-latest
    name: Build and Deploy
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: true
      - name: Build and Deploy
        uses: Azure/static-web-apps-deploy@1a947...
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: ${{ env.APP_LOCATION }}
          api_location: ${{ env.API_LOCATION }}
          output_location: ${{ env.OUTPUT_LOCATION }}

  close_pull_request:
    if: github.event_name == 'pull_request' && github.event_action == 'closed'
    runs-on: ubuntu-latest
    name: Close Pull Request
    steps:
      - name: Close Pull Request
        uses: Azure/static-web-apps-deploy@1a947...
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          action: 'close'
```

## Actions
Uma ação é um aplicativo personalizado para a plataforma GitHub Actions que executa uma tarefa complexa, mas frequentemente repetida.

### Set Env Vars
defina uma variável de ambiente que estará disponível para as etapas subsequentes do trabalho.
steps:
  - name: Set environment variable
    run: echo "ACTION_ENV=production" >> $GITHUB_ENV
### Adding to System Path
add a directory to the system PATH for subsequent steps in your job

steps:
  - name: Add directory to PATH
    run: echo "/path/to/dir" >> $GITHUB_PATH

### Setting Output Parameters
set outputs that can be used by other jobs in a multi-job workflow,

steps:
  - name: Set output
    id: example_step
    run: echo "result=output_value" >> $GITHUB_OUTPUT

  - name: Use output
    run: echo "The output was ${{ steps.example_step.outputs.result }}"

### Creating Debugging Messages
Create debug messages that appear in the logs of your actions, which are only visible if you enable step debug logging.

steps:
  - name: Create debug message
    run: echo "::debug::This is a debug message"

### [Ações Marketplace](https://github.com/marketplace?type=actions)
Ao contrário dos fluxos de trabalho que chamam ações, você pode encontrar um conjunto útil de ações existentes para chamar no GitHub Marketplace na seção Ações.
Pense nisso como se fossem plug-ins ou outros módulos complementares que adicionam funcionalidade em outros aplicativos.

## Runners
Um executor é um servidor que executa seus fluxos de trabalho quando eles são disparados. Cada executor pode executar um único trabalho por vez. GitHub fornece executores Ubuntu Linux, Microsoft Windows e macOS para executar seus fluxos de trabalho. Cada execução de fluxo de trabalho é executada em uma máquina virtual nova e recém-provisionada.

A integração contínua (CI, Continuous Integration) é uma prática de software que exige commits frequentes de códigos para um repositório compartilhado.

O Runner determina o cálculo subjacente e o SO em que o fluxo de trabalho será executado. O runner pode ser:

### GitHub-hosted — Ambientes de tempo de execução predefinidos dos provedores do GitHub
- [x] Standard size
- [x] Linux: ubuntu-latest, ubuntu-22.04, ubuntu-20.04
- [x] Windows: windows-latest, windows-2022, windows-2019
- [x] MacOS: macos-latest, macos-14, macos-13, macos-12, macos-11
- [x] Larger Size
- [x] Only available for organizations and enterprises using the GitHub
- [x] Team or GitHub Enterprise Cloud plans
- [x] More RAM, CPU, and disk space
- [x] Static IP addresses
- [x] The ability to group runners
- [x] Autoscaling to support concurrent workflows
### Self-hosted — computação externa conectada ao GitHub usando o aplicativo executor auto-hospedado GitHub Actions
Crie configurações de hardware personalizadas que atendam às suas necessidades

Self-hosted runners podem ser:

- [x] Physical;
- [x] Virtual;
- [x] In a container;
- [x] On-premises;
- [x] In a cloud;
- [x] Você pode adicionar executores auto-hospedados em vários níveis na hierarquia de gerenciamento:
    - [x] Executores de nível de repositório são dedicados a um único repositório.
    - [x] Executores de nível de organização podem processar trabalhos para vários repositórios em uma organização.
    - [x] Executores de nível empresarial podem ser atribuídos a várias organizações em uma conta empresarial.
    - [x] Para configurar o auto-hospedado, você precisa adicionar um executor e instalar o GitHub Actions Runner para conectar a computação externa ao executor auto-hospedado.

```
Self-Hosted Runner Follow Along: Hands-On Setup -  GitHub Actions Course
These lab notes guide you through setting up a self-hosted runner for GitHub Actions. This tutorial is beneficial for understanding the setup process, even if we don't complete every step due to limitations with environments like GitHub Codespaces. If you're working locally or on a cloud provider, the steps should work similarly.

Step 1: Verify Repository Access and Prepare Compute
1.1 Go to your repository where you'll set up the self-hosted runner.
1.2 Confirm that you have compute access (a system with appropriate OS like Linux, Windows, or macOS).
1.3 If using GitHub Codespaces or a local machine, open the environment where you'll work.
Step 2: Access GitHub Actions Runner Settings
2.1 Navigate to your GitHub repository's settings:
In the repository view, go to Settings.
On the left sidebar, locate and click on Actions > Runners.
2.2 Set up a New Runner:
Select Add New Runner.
Choose an OS (in this example, we'll use Linux).
Follow the instructions provided by GitHub to download and configure the runner.
Step 3: Install Dependencies
3.1 Open Terminal/Console: Launch a terminal in your compute environment.
3.2 Make a Directory for the Runner:
Run:
mkdir actions-runner && cd actions-runner
3.3 Download the GitHub Actions Runner application:
Use the curl command provided by GitHub to download the necessary files.
3.4 Extract the Files:
Unzip or extract the downloaded file (GitHub may provide tar -xzf commands).
3.5 Configure the Runner with Token:
Get your token from the GitHub setup page and follow the configuration steps.
Run:
./config.sh --url YOUR_REPOSITORY_URL --token YOUR_TOKEN
3.6 Enter Additional Setup Details as Prompted:
If prompted, specify:
Runner Group: (press Enter for default).
Runner Name: Choose a descriptive name (e.g., "Enterprise".
Labels: Optional, but you may add custom labels.
Work Folder: Default to ./_work by pressing Enter.
Step 4: Start the Self-Hosted Runner
4.1 Run the Runner:
Start it with:
./run.sh
4.2 Verify the Runner is Online:
Check your repository's Actions tab to see if the runner is listed.
Step 5: Create and Test a GitHub Action Workflow
5.1 Navigate to the .github/workflows/ folder in your repository.
5.2 Create a new YAML file (e.g., self-hosted-runner.yml) with the following code:

```
name: Self-Hosted Runner Test
on:
  push:
    branches:
      - main

jobs:
  test-self-hosted:
    runs-on: self-hosted
    steps:
      - name: Check Runner
        run: echo "Running on self-hosted runner"
```
5.3. Commit and Push this file to trigger the workflow.
5.4. Monitor the Workflow: Go to the Actions tab and check if the workflow triggers. You might see a "waiting for runner" status if the runner cannot connect.
Troubleshooting Network and Connectivity Issues
Ensure Ports are Open: For a self-hosted runner to communicate with GitHub, ensure it can access Port 443 for HTTPS.
Review Network Requirements: Ensure any firewall settings allow the runner to communicate back to GitHub's servers.
If connectivity issues persist, consider testing on a local machine or cloud provider with appropriate permissions.
Summary
This walkthrough introduced you to the basics of setting up a self-hosted GitHub Actions runner. This method, while possible in Codespaces, may encounter network or dependency issues, and is generally easier to test on a local or cloud-hosted environment.


```
# specify a specific GitHub-self hosted
runs-on: ubuntu-latest
runs-on: windows-latest
runs-on: macos-latest

# specify multiple possible runners
runs-on: [macos-14, macos-13, macos-12]

# specify Self-Hosted runner


## Contextos
Os contextos são uma forma de acessar informações sobre execuções de fluxo de trabalho, variáveis, ambientes dos executores, trabalhos e etapas. ${{ <context> }}


### github actions to build & deploy book, following https://github.com/executablebooks/cookiecutter-jupyter-book/blob/main/.github/workflows/deploy.yml

```
name: deploy

on:
  # Trigger the deploy on push to main branch
  push:
    branches:
      - main
  schedule:
    # jupyter-book is updated regularly, let's run this deployment every month in case something fails
    # <minute [0,59]> <hour [0,23]> <day of the month [1,31]> <month of the year [1,12]> <day of the week [0,6]>
    # https://pubs.opengroup.org/onlinepubs/9699919799/utilities/crontab.html#tag_20_25_07
    # https://crontab.guru/every-month
    # Run cron job every month
    - cron: '0 0 1 * *'

jobs:
  # This job deploys the example book
  deploy-example-book:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest]
        python-version: [3.8]
    steps:
    - uses: actions/checkout@v2

    # Install python
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v1
      with:
        python-version: ${{ matrix.python-version }}

    # install virtual environment with caching, so only updates when requirements.txt changes,
    # based on https://github.com/marketplace/actions/restore-or-create-a-python-virtualenv#custom_virtualenv_dir
    # Note: virtual environment by default will be created under ~/.venv
    - uses: syphar/restore-virtualenv@v1
      id: cache-virtualenv
      with:
        requirement_files: docs/requirements_py.txt
    - uses: syphar/restore-pip-download-cache@v1
      if: steps.cache-virtualenv.outputs.cache-hit != 'true'

    # install python dependencies
    - name: Install python dependencies
      run: pip install -r docs/requirements_py.txt
      if: steps.cache-virtualenv.outputs.cache-hit != 'true'

    # update kernel of all jupyter notebooks to .venv to match GH action environment
    - name: Update Jupyter Notebook kernels
      run: python docs/update_jupyter_kernels.py .venv |
           python -m ipykernel install --user --name=.venv

    # install R
    - name: Install R
      uses: r-lib/actions/setup-r@v2
      with:
        use-public-rspm: true
    # install R dependencies
    - name: Install R dependencies
      run: sh docs/install_R_dependencies.sh

    # Build the example book
    - name: Build book
      run: jupyter-book build --all docs/

    # Deploy html to gh-pages
    - name: GitHub Pages action
      uses: peaceiris/actions-gh-pages@v3.6.1
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: docs/_build/html
        publish_branch: gh-pages
```

## Fluxo de trabalho de ramificação de recursos
O fluxo de trabalho de ramificação de recursos consiste em uma mainramificação de código que representa ativos publicados.
 Novos recursos ou correções de bugs exigem que os autores criem uma nova ramificação de main, implementem suas alterações e, em seguida, enviem uma solicitação de pull de volta para main.

Quanto maior a mudança, mais difícil é mesclá-la de volta ao codebase main. A CI incentiva cada pessoa a mesclar seu trabalho *frequentemente* de volta ao branch principal. Dessa forma, os conflitos são fáceis de detectar e o trabalho de cada pessoa tem menos chance de divergir do que seus colegas estão fazendo.

![](img/github-actions-fluxo-001.png)


.github/fluxos de trabalho/01_teste.yml

```
name: Test
on:
  push:
    branches: [ main ]
jobs:
  test:
      runs-on: ${{ matrix.os }}
      strategy:
        matrix:
          os: [ubuntu-latest, macos-latest, windows-latest]
      steps:
        - uses: actions/checkout@v2
        - name: Set up Python
          uses: actions/setup-python@master
          with:
            python-version: 3.9
        - name: Install dependencies
          run: |
            python -m pip install --upgrade pip
            pip install -r requirements.txt
        - name: Run tests
          run: |
            pip install pytest
            pytest
```

.github/fluxos de trabalho/02_deploy.yml

```
name: Deploy
on:
  push:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: '3.9'
      - name: Install latex dependencies
        run: sudo apt-get update -y && sudo apt-get install -y texlive latexmk texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended ghostscript

      - name: Update pip and install python dependencies
        working-directory: 'docs/'
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt

      - name: Build html and pdf ebook
        working-directory: 'docs/'
        run: |
          make html latexpdf --keep-going LATEXMKOPTS="-interaction=nonstopmode" || true
          make latexpdf --keep-going LATEXMKOPTS="-interaction=nonstopmode" || true
          make latexpdf --keep-going LATEXMKOPTS="-interaction=nonstopmode" || true
        continue-on-error: true
      - name: Get current datetime in ISO format
        id: date
        run: echo "::set-output name=date::$(date -u +'%Y-%m-%d')"
      - name: Create GitHub release
        id: gh_release
        uses: softprops/action-gh-release@v1
        with:
          files: docs/build/latex/addressinguncertaintyinmultisectordynamicsresearch.pdf
          tag_name: ${{ steps.date.outputs.date }}v${{ github.run_number }}

      - name: Commit the compiled files
        run: |
          cd docs/build/html
          git init
          git add -A
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git commit -m 'deploy' -a || true

      - name: Push changes to gh-pages
        uses: ad-m/github-push-action@master
        with:
          branch: gh-pages
          directory: docs/build/html
          force: true
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

## [Integração com Slack](https://slack.github.com/)
Para levar nosso fluxo de trabalho para o próximo nível (e evitar a necessidade de ler ainda mais e-mails 😅 ), adicionamos o aplicativo GitHub ao nosso canal Slack de eBooks. Isso adiciona um bot que pode assinar repositórios do GitHub e relatar atividades; por exemplo: novos problemas, novas solicitações de pull e novos lançamentos. Podemos então discutir e iterar inline no Slack, sem precisar pular para outros aplicativos ou sites.



```
name: Lake model

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [3.8]

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v2
      with:
        python-version: ${{ matrix.python-version }}
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install flake8 pytest
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
    - name: Lint with flake8
      run: |
        # stop the build if there are Python syntax errors or undefined names
        flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
        # exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
        flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
    - name: Test with pytest
      run: |
        python -m pytest test.py
```

## Componentes
### Steps

Steps são a unidade básica de execução com a qual você lida ao trabalhar com GitHub Actions, consistem em invocações de uma ação predefinida ou um comando shell a ser executado no runner.  Indica o início de uma série de etapas a serem executadas sequencialmente.

As etapas do GitHub Actions são as tarefas ou comandos individuais que compõem um trabalho. Cada trabalho consiste em uma ou mais etapas que são executadas sequencialmente.

As etapas podem executar scripts ou ações — os pacotes de código reutilizáveis.

O script permite que você execute uma série de comandos shell ou bash no ambiente do executor. Tarefas como instalar dependências, executar comandos de build e testar são realizadas usando scripts.

#### Run
Comandos shell são executados por meio de uma cláusula run.
#### Uses
Quaisquer ações predefinidas são extraídas por meio de uma cláusula uses.
#### With
Cláusula with é usada para especificar argumentos/parâmetros a serem passados para a ação.
#### Estrutura da Ação
Os fluxos de trabalho usam ações para realizar o trabalho em etapas, e as ações usam fluxos de trabalho para CI/CD, automação, validação, etc.

#### Artefatos do GitHub Actions
Os artefatos do GitHub Actions são arquivos ou diretórios que são carregados e armazenados após a conclusão de um trabalho em um fluxo de trabalho do GitHub Actions. Esses artefatos permitem que você retenha e acesse a saída do trabalho para processamento posterior dentro do pipeline ou por outros serviços. Exemplos de artefatos incluem executáveis ​​versionados, logs e resultados de testes.

#### Segredos do GitHub Actions
Atividades de build e deploy geralmente exigem acesso a informações confidenciais, como chaves de API, tokens e senhas. O GitHub Actions fornece um método seguro para configurar e armazenar essas informações confidenciais como segredos. Esses segredos são armazenados em formato criptografado como variáveis ​​de ambiente, que são disponibilizadas aos executores durante cada execução de fluxo de trabalho. Assim, os fluxos de trabalho podem acessar e usar as informações confidenciais necessárias com segurança.

#### Interagindo com ações
Ações
Ações no GtHub Action são pacotes de código reutilizáveis ​​usados ​​como etapas em um fluxo de trabalho. Eles realizam tarefas como configurar ambientes, executar testes, implantar código, etc., que ajudam a automatizar várias etapas envolvidas no ciclo de vida de desenvolvimento de software.

Você pode usar ações compartilhadas pela comunidade/GitHub ou criar ações personalizadas. O GitHub Actions oferece três tipos de ações personalizadas: ações JavaScript, que são executadas diretamente na máquina executora; ações de contêiner Docker, que são executadas em um ambiente Docker; e ações compostas, que combinam várias etapas do fluxo de trabalho em uma única ação.
Para ser usado como uma ação, um repositório GitHub deve conter um arquivo de action.yml.
O formato deste arquivo é dividido em quatro áreas principais: informações básicas (nome, autor, descrição), entradas, saídas e execuções.Há também uma seção de branding menos usada que permite adicionar um ícone à ação, se desejado.
Se um parâmetro for necessário, seu fluxo de trabalho precisa usar uma instrução with , ao chamar a ação, para fornecer um valor a ser passado para esse parâmetro.
O mesmo é verdadeiro para fornecer um valor diferente do padrão.
A lição que se tira disso é que o arquivo action.yml é a chave para entender como interagir com qualquer ação que você queira ou precise usar em seus fluxos de trabalho.
A cláusula uses que identifica um caminho particular para uma ação (e a versão da ação) pode usar um pouco mais de explicação. Isso é fornecido na próxima seção.

A parte do caminho (actions/checkout neste caso) é o caminho relativo para o repositório
no GitHub após github.com. O número da versão (parte após o símbolo @) pode ser expresso
de várias maneiras.

Isso significa que você pode usar um branch, uma tag ou até mesmo o valor SHA completo de um commit individual para designar uma versão de uma ação a ser usada em seu fluxo de trabalho.

Há uma diferença entre ir diretamente para uma ação versus chegar a ela por meio de um
link do Marketplace. Se você simplesmente for para github.com/
actions/ checkout, por exemplo, você verá o repositório de código para a ação como foi
mostrado na Figura 3-4. Se, por outro lado, você for para a ação através do link do
Marketplace, como em https:// github.com/ marketplace/
actions/ checkout, você verá o arquivo README.md do projeto exibido em uma página
mais amigável.

https://github.com/marketplace?type=actions

Capítulo 4. Trabalhando com fluxos de trabalho

Há quatro maneiras de começar um novo fluxo de trabalho em um repositório quando não há nenhum existente:

- [X] Clique no link Configurar um fluxo de trabalho você mesmo logo acima da ação Pesquisar fluxos de trabalho;
- [X] Clique no botão Configurar para o fluxo de trabalho sugerido sob o título Sugerido para este repositório;
- [X] Role e escolha um dos outros fluxos de trabalho sugeridos e clique no botão Configurar para o apropriado;
- [X] Crie um arquivo de fluxo de trabalho fora do GitHub e adicione-o a um subdiretório .github/workflows no repositório.



| Desabilitando um fluxo de trabalho | Excluindo um fluxo de trabalho |
| ---- | ----- |
| Interrompa temporariamente o acionamento de um fluxo de trabalho. | Remova permanentemente o fluxo de trabalho do repositório. |
| Facilmente reversível. Você pode reativar o fluxo de trabalho a qualquer momento. | Não diretamente reversível; você precisaria recriar o arquivo ou restaurá-lo do histórico de versões. |
| Quando atualizações ou manutenção forem necessárias, ou se o fluxo de trabalho estiver sendo acionado com muita frequência ou desnecessariamente. | Quando o fluxo de trabalho não for mais necessário, ou você estiver limpando o repositório. |
| Você pode desabilitar o fluxo de trabalho usando o GitHub CLI | Você precisa usar a interface do usuário do GitHub para excluir um Wokflow |

## Types of Actions

| Tipo               | Linux  | MacOS | Windows |
| ----               | ----   | ----- | -----   |
| Docker container   |  Yes   | No    | No      |
| JavaScript         |  Yes   | Yes   | Yes     |
| Composite Actions  |  Yes   | Yes   | Yes     |


- [x] O contêiner Docker executa seu código de ação em um contêiner Docker
- [x] O JavaScript é executado diretamente no sistema operacional host do runner
- [x] Uma ação composta permite que você combine várias etapas do fluxo de trabalho em uma ação.



```
# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the workflow will run

on:
# Triggers the workflow on push or pull request events for main
push:
 branches: [ main ]
 pull_request:
 branches: [ main ]

 # Allows you to run this workflow manually from the Actions tab
 workflow_dispatch:

 # A workflow run is made up of one or more jobs
 jobs:
 # This workflow contains a single job called "build"
 build:
 # The type of runner that the job will run on
 runs-on: ubuntu-latest

 # Steps are a sequence of tasks executed as part of a job
 steps:
 # Checks-out your repository under $GITHUB_WORKSPACE
 - uses: actions/checkout@v3

 # Runs a single command using the runners shell
 - name: Run a one-line script
 run: echo Hello, world!

 # Runs a set of commands using the runners shell
 - name: Run a multi-line script
 run: |
 echo Add other actions to build,
 echo test, and deploy your project.
```

------

nome: 'Checkout'
descrição: 'Checkout de um repositório Git em uma versão específica'
entradas:
repositório:
descrição: 'Nome do repositório com proprietário. Por exemplo, actions/checkout'
padrão: ${{ github.repository }}
ref:
descrição: >
A ramificação, tag ou SHA para checkout. Ao fazer checkout do repositório que
disparou um fluxo de trabalho, isso assume como padrão a referência ou SHA para esse
evento. Caso contrário, usa a ramificação padrão.
token:
descrição: >
Token de acesso pessoal (PAT) usado para buscar o repositório. O PAT é configurado
com a configuração git local, o que permite que seus scripts executem comandos git
autenticados. A etapa pós-trabalho remove o PAT.

Recomendamos usar uma conta de serviço com o mínimo de permissões necessárias.
Além disso, ao gerar um novo PAT, selecione o mínimo de escopos necessários.

[Saiba mais sobre como criar e usar segredos criptografados](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)
default: ${{ github.token }}
ssh-key:
description: >
Chave SSH usada para buscar o repositório. A chave SSH é configurada com a
configuração local do git, que permite que seus scripts executem comandos git autenticados.
A etapa pós-trabalho remove a chave SSH.

Recomendamos usar uma conta de serviço com o mínimo de permissões necessárias.

[Saiba mais sobre como criar e usar
segredos criptografados](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)
ssh-known-hosts:
description: >
Hosts conhecidos, além do banco de dados de chaves de host global e de usuário. As chaves SSH públicas
para um host podem ser obtidas usando o utilitário `ssh-keyscan`. Por exemplo,
`ssh-keyscan github.com`. A chave pública para github.com é sempre adicionada implicitamente.
ssh-strict:
description: >
Se deve executar a verificação estrita da chave do host. Quando verdadeiro, adiciona as opções `StrictHostKeyChecking=yes`
e `CheckHostIP=no` à linha de comando SSH. Use a entrada `ssh-known-hosts` para
configurar hosts adicionais.
default: true
ssh-user:
description: >
O usuário a ser usado ao conectar-se ao host SSH remoto. Por padrão, 'git' é usado.
default: git
persist-credentials:
description: 'Se deve configurar o token ou a chave SSH com a configuração local do git'
default: true
path:
description: 'Caminho relativo em $GITHUB_WORKSPACE para colocar o repositório'
clean:
description: 'Se deve executar `git clean -ffdx && git reset --hard HEAD` antes de buscar'
default: true
filter:
description: >
Clonar parcialmente em relação a um filtro fornecido.
Substitui sparse-checkout se definido.
default: null
sparse-checkout:
description: >
Faz um sparse checkout em padrões fornecidos.
Cada padrão deve ser separado com novas linhas.
default: null
sparse-checkout-cone-mode:
description: >
Especifica se deve usar o cone-mode ao fazer um sparse checkout.
default: true
fetch-depth:
description: 'Número de confirmações para buscar. 0 indica todo o histórico para todos os branches e tags.'
padrão: 1
fetch-tags:
descrição: 'Se deve buscar tags, mesmo se fetch-depth > 0.'
padrão: falso
show-progress:
descrição: 'Se deve mostrar a saída do status do progresso ao buscar.'
padrão: verdadeiro
lfs:
descrição: 'Se deve baixar arquivos Git-LFS'
padrão: falso
submodules:
descrição: >
Se deve fazer checkout de submódulos: `true` para fazer checkout de submódulos ou `recursive` para
fazer checkout recursivamente de submódulos.

Quando a entrada `ssh-key` não é fornecida, URLs SSH começando com `git@github.com:` são
convertidos para HTTPS.
default: false
set-safe-directory:
description: Adicione o caminho do repositório como safe.directory para a configuração global do Git executando `git config --global --add safe.directory <path>`
default: true
github-server-url:
description: A URL base para a instância do GitHub da qual você está tentando clonar usará os padrões do ambiente para buscar da mesma instância da qual o fluxo de trabalho está sendo executado, a menos que especificado. URLs de exemplo são https://github.com ou https://my-ghes-server.example.com
required: false
outputs:
ref:
description: 'O branch, tag ou SHA que foi retirado'
commit:
description: 'O SHA de commit que foi retirado'
runs:
using: node20
main: dist/index.js
post: dist/index.js



steps:
- uses: actions/checkout@v3
- uses: liquibase-github-actions/execute-sql@v4.31.1
  with:
    # The JDBC database connection URL
    # string
    # Required
    url: ""

    # The default catalog name to use for the database connection
    # string
    # Optional
    defaultCatalogName: ""

    # The default schema name to use for the database connection
    # string
    # Optional
    defaultSchemaName: ""

    # Delimiter to use when executing SQL script
    # string
    # Optional
    delimiter: ""

    # The JDBC driver class
    # string
    # Optional
    driver: ""

    # The JDBC driver properties file
    # string
    # Optional
    driverPropertiesFile: ""

    # Password to use to connect to the database
    # string
    # Optional
    password: ""

    # SQL string to execute
    # string
    # Optional
    sql: ""

    # SQL script to execute
    # string
    # Optional
    sqlFile: ""

    # Username to use to connect to the database
    # string
    # Optional
    username: ""
```

## Qual é a diferença entre uma ação do GitHub e um fluxo de trabalho?
Uma "Ação" e um "Fluxo de trabalho" do GitHub são componentes-chave da plataforma GitHub Actions. Um fluxo de trabalho é um processo automatizado acionado por eventos específicos como push, pull ou agendamento, definidos em arquivos YAML no diretório .github/workflows. Ele consiste em um ou mais trabalhos, cada um contendo etapas. Ações são unidades reutilizáveis ​​de código dentro desses fluxos de trabalho, executando tarefas individuais.

Enquanto os fluxos de trabalho orquestram a automação, as ações fornecem os blocos de construção, permitindo a reutilização de tarefas em diferentes fluxos de trabalho. Ações personalizadas podem ser criadas ou usadas no GitHub Marketplace, facilitando a execução eficiente e consistente de tarefas em processos de desenvolvimento de software.





gh workflow run greet.yml \
-f name=mona \
-f greeting=hello \
-f data=@myfile.txt




https://app.exampro.co/student/material/gha/6770?autoplay=true


https://docs.github.com/pt/actions/learn-github-actions/using-starter-workflows
https://docs.github.com/pt/actions/automating-builds-and-tests
https://docs.github.com/pt/actions/publishing-packages
https://docs.github.com/pt/actions/deployment
https://docs.github.com/pt/actions/managing-issues-and-pull-requests
https://docs.github.com/pt/actions/examples

workflow_dispatcher: você pode definir até 10 parametros
git clone repositório
gh workflowgh workflow run novaci.yml --ref main

osv-scanner --recursive .


## Como criar um fluxo de trabalho do GitHub Actions

Siga estas etapas para criar o fluxo de trabalho do GitHub Actions:

- [x] Escreva o código do aplicativo.
- [x] Crie um arquivo YAML para definir as ações.
- [x] Configurar uma tarefa de compilação.
- [x] Teste seu fluxo de trabalho do GitHub Action.
- [x] Configurar segredos para ações do GitHub.
- [x] Configurar a etapa de upload para S3.
- [x] Defina o trabalho de implantação e acesse o artefato.
- [x] Implantar no EC2.

### Integração contínua com GitHub Actions
Integração Contínua (CI) é a prática de automatizar os trabalhos de construção e teste e fornecer feedback antecipado antes de integrar as novas alterações de código no repositório central. Isso garante a estabilidade do software que está sendo implantado/entregue. Com o GitHub Actions, você configura a sequência de trabalhos em um fluxo de trabalho para criar um processo de construção de ponta a ponta.

Observe que as atividades envolvidas na fase de construção precedem a implantação.

#### Etapa 1: Escreva o código do aplicativo
O exemplo abaixo implementa um pipeline de CI para um aplicativo básico escrito em Go. Este é um servidor matemático simples que expõe uma operação de adição matemática. A API recebe alguns inteiros como parâmetros de consulta e responde com a soma. O código abaixo também entrega alguns cenários de conversão de String para Int.

```
package main

import (
	"fmt"
	"net/http"
	"strconv"
)

func Add(a, b int) int {
	return a + b
}

func additionHandler(w http.ResponseWriter, r *http.Request) {
	values := r.URL.Query()

	aStr := values.Get("a")
	bStr := values.Get("b")

	a, err := strconv.Atoi(aStr)
	if err != nil {
		http.Error(w, "Parameter 'a' must be an integer", http.StatusBadRequest)
		return
	}

	b, err := strconv.Atoi(bStr)
	if err != nil {
		http.Error(w, "Parameter 'b' must be an integer", http.StatusBadRequest)
		return
	}

	result := Add(a, b)

	fmt.Fprintf(w, "%d", result)
}

func main() {
	http.HandleFunc("/addition", additionHandler)

	fmt.Println("Server listening on port 8080....")
	http.ListenAndServe(":8080", nil)
}
```
Do terminal, navegue até a raiz deste projeto e execute 'go run .' para executar o aplicativo. Se ele exibir a mensagem Server listening on port 8080…., significa que ele foi executado com sucesso. Teste a API matemática simples exposta por este aplicativo acessando o localhost, conforme mostrado abaixo.

Este é um código de aplicativo simples gerenciado em um repositório do GitHub. Nas próximas etapas, começaremos a escrever o fluxo de trabalho do GitHub Actions para construir, testar, entregar e implantar o código automaticamente.

#### Etapa 2: Crie um arquivo YAML para definir as ações
No diretório raiz do projeto, crie um subdiretório, .github/workflows. Dentro desse diretório, crie um arquivo com a extensão .yml. Neste exemplo, nós o nomeamos go.yml. Esse arquivo .yml é automaticamente interpretado pelo GitHub Actions como um arquivo de fluxo de trabalho. Aqui, começamos configurando os gatilhos.

O código YAML abaixo é colocado no início do arquivo go.yml.

```
name: Go

on:
  push:
    branches: [ "main" ]
```
O parâmetro name apenas nomeia esse fluxo de trabalho como Go. on: push: branches:parte do arquivo de fluxo de trabalho menciona a lista de ramificações para as quais o fluxo de trabalho deve ser acionado automaticamente. Nesse caso, queremos que o fluxo de trabalho seja acionado automaticamente para a ramificação 'main'.

#### Etapa 3: Configurar um trabalho de compilação
Grandes aplicativos escritos na linguagem de programação Go exigem uma etapa de build porque é uma linguagem compilada e estaticamente tipada. Isso gera um binário, que é então implantado nos servidores. O primeiro trabalho, que definimos no fluxo de trabalho, é construir esse binário.

Conforme mencionado anteriormente, cada job é executado em uma instância nova de um runner. Pense nisso como uma máquina virtual nova onde as dependências necessárias não estão disponíveis.

O código abaixo define todas as etapas necessárias para criar um aplicativo Go:

```
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3

    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.21.5'

    - name: Build
      run: go build -v ./...
```

Primeiro, definimos um trabalho chamado build. O nome do trabalho não faz parte da sintaxe e pode ser qualquer coisa que faça sentido para você. Em seguida, precisamos especificar o typeexecutor que queremos usar para executar este trabalho. O GitHub Actions oferece suporte a vários sistemas operacionais, como Ubuntu, Microsoft Windows ou MacOS. Para nosso propósito, usaremos o ambiente Ubuntu.

O primeiro passo neste trabalho é verificar o código-fonte do aplicativo no runner. Isso clona os arquivos no repositório GitHub na VM do runner. No próximo passo, configuramos o compilador Go com a versão desejada. Finalmente, no terceiro passo, executamos o comando go build. O binário assim gerado é disponibilizado no runner localmente.

Assim, nesta etapa, nós apenas construímos o binário para o aplicativo Go. Se você agora enviar quaisquer alterações para o repositório de código-fonte no branch principal, este fluxo de trabalho será automaticamente acionado e seguirá estas etapas a cada vez.

No entanto, observe que, como esses runners são disponibilizados apenas para executar os jobs, eles são revogados quando todos os jobs são concluídos. Isso também significa que o binário assim gerado também é perdido após uma execução de workflow.

#### Etapa 4: teste seu fluxo de trabalho do GitHub Action
Para a próxima etapa, queremos testar o aplicativo antes de entregar o binário. O propósito deste teste é identificar rapidamente quaisquer problemas e fornecer feedback aos desenvolvedores antes que o fluxo de trabalho prossiga para a próxima fase.

Como prática recomendada, a fonte deve sempre ter casos de teste de unidade definidos, garantindo cobertura máxima. Isso é verdade para aplicativos escritos em qualquer linguagem de programação. Para este exemplo, vamos primeiro escrever o teste de unidade que garante que a lógica escrita para executar operações matemáticas simples esteja correta. Go fornece um pacote de 'teste' que ajuda a escrever casos de teste para o código-fonte do aplicativo. O código abaixo faz parte do arquivo main_test.go — o nome do arquivo é orientado pela estrutura de teste.

```
package main

import (
	"io/ioutil"
	"net/http/httptest"
	"strconv"
	"testing"
)

func TestAdditionHandler(t *testing.T) {
	// Test case 1
	req1 := httptest.NewRequest("GET", "/addition?a=3&b=5", nil)
	w1 := httptest.NewRecorder()
	additionHandler(w1, req1)
	resp1 := w1.Result()
	defer resp1.Body.Close()
	body1, _ := ioutil.ReadAll(resp1.Body)
	result1, _ := strconv.Atoi(string(body1))
	expected1 := 8
	if result1 != expected1 {
		t.Errorf("Test case 1 failed, expected %d but got %d", expected1, result1)
	}
}
```

O caso de teste acima faz uma chamada de API para a API /addition com entradas específicas e espera a saída correspondente. Se a lógica da operação matemática simples for falha, o caso de teste falha, e o fluxo de trabalho do GitHub Action também falha e não prossegue.

Para executar este teste no fluxo de trabalho do GitHub Actions, volte ao arquivo go.yml e adicione a seguinte etapa no trabalho de compilação definido acima.

```
- name: Test
      run: go test -v ./...
```

Envie o código para o branch principal e observe a execução do pipeline. Como visto na captura de tela abaixo, os casos de teste são executados durante a etapa 'Test' e seus resultados também são impressos nos logs.


Quaisquer alterações no código-fonte que se seguem devem agora ser testadas usando esta mesma etapa. É dever do desenvolvedor fazer alterações no código-fonte ou adicionar mais código para fazer alterações correspondentes nos testes unitários também.

Se os testes forem aprovados, teremos implementado com sucesso a Integração Contínua (CI) para nosso servidor matemático simples.

Entrega contínua com GitHub Actions
Resultados positivos de teste significam que agora podemos prosseguir com segurança para entregar/implantar o aplicativo em seu destino alvo. Entrega é diferente de implantação. Na entrega contínua, construímos e entregamos os artefatos, e um processo separado é então responsável pela implantação real dos artefatos nos servidores alvo. Na implantação contínua, os artefatos são realmente implantados nos servidores.

No exemplo discutido até agora, o binário gerado é o artefato a ser entregue. Como o binário é perdido quando os executores são eliminados após a conclusão do fluxo de trabalho, faz sentido fazer upload de um binário para o armazenamento persistente antes que o executor seja liberado.

#### Etapa 5: Configurar segredos para ações do GitHub
Neste exemplo, estamos usando buckets S3 para armazenar os artefatos, então precisamos configurar as permissões para a VM runner que permitem que ela execute operações 'PUT' no bucket de destino. Acessar a AWS usando a CLI requer credenciais como Access Key e Secret Access Key.

Opcionalmente, também precisaríamos que o nome do bucket após configurar o bucket S3 fosse armazenado como uma variável secreta e para fins de reutilização.

Navegue até seu repositório GitHub > Configurações > Segredos e variáveis -> Ações e configure esses segredos conforme mostrado abaixo.

Observação: por enquanto, ignore o SECRET_KEY; retornaremos a ele nas próximas seções.

Anote também os nomes de todos os segredos, pois precisaremos deles para configurar etapas futuras em nosso fluxo de trabalho de ações do Github.

#### Etapa 6: Configurar upload para a etapa S3
De volta ao arquivo go.yml, configure uma nova etapa para carregar o artefato (binário) para o bucket S3 de destino. A configuração é como abaixo.

```
- name: Upload Binary to S3
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.ACCESS_KEY }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.SECRET_KEY }}
        AWS_DEFAULT_REGION: "eu-central-1"
      run: |
        aws s3 cp ./simplemath s3://${{ secrets.TARGET_BUCKET }}/
```

Eu nomeei esta etapa Upload Binary to S3. Escolha um nome que faça sentido para você. Primeiro, definimos as variáveis de ambiente para o runner onde estamos definindo as credenciais da AWS. Os valores para elas estão sendo recuperados dos segredos que configuramos na etapa anterior. Observe como os segredos são acessados usando secrets.a palavra-chave, envolvida em colchetes duplos, precedida por um sinal $.

Na parte de execução desta etapa, usamos o AWS CLI para executar o s3 cpcomando . Neste exemplo, o binário gerado é nomeado simplemathporque esse é o nome que escolhi para este módulo Go durante o desenvolvimento. Pode ser diferente no seu caso. Para ter certeza, verifique a primeira linha do go.modarquivo.

Observe que, assim como o compilador Go, não fomos obrigados a instalar o AWS CLI explicitamente. Os executores do GitHub Actions vêm equipados com ele e outros utilitários. Em caso de dúvida, verifique a documentação de cada executor.

Quando o pipeline é executado, ele constrói o binário, que a etapa de upload (esta etapa) carrega para o bucket S3 de destino definido na variável secreta. A captura de tela abaixo mostra o binário carregado, bem como o nome do bucket usado para este exemplo.


Nesta etapa, entregamos com sucesso o software ao seu destino.

Implantação contínua com GitHub Actions
O GitHub Actions ajuda a implantar o aplicativo em servidores ou clusters do Kubernetes. Normalmente, essa é a fase final do ciclo de vida do desenvolvimento de software e também significa o fim de uma iteração. Exploraremos o aspecto de implantação contínua do GitHub Actions implantando o servidor matemático simples em uma instância EC2.

Leia mais: Como implantar o Kubernetes com o GitHub Actions?

Como pré-requisito, configure uma instância EC2 com acesso apropriado habilitado para a implantação. A instância EC2 assim criada deve usar um par de chaves para efetuar login. A chave privada desse par de chaves é armazenada como a PRIVATE_KEYvariável secreta, conforme visto na captura de tela na Etapa 4. Isso é necessário para que as próximas etapas funcionem.

Também criaremos um novo trabalho no mesmo fluxo de trabalho para manter as etapas de CI e CD separadas.

Etapa 7: Defina o trabalho de implantação e acesse o artefato
Anexe o arquivo go.yml com o código abaixo. Aqui, criamos um novo trabalho chamado deploy. O primeiro argumento, needs, especifica a dependência do primeiro trabalho, build. Se não especificarmos isso, os trabalhos de construção e implantação serão executados em paralelo. Isso acabará implantando o arquivo errado com código mais antigo na instância EC2 ou falhará se não houver nenhum arquivo presente no bucket S3.


```
deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
    - name: Download S3
      uses: joutvhu/download-s3@v1.0.0
      with:
        aws_access_key_id: ${{ secrets.ACCESS_KEY }}
        aws_secret_access_key: ${{ secrets.SECRET_KEY }}
        aws_region: "eu-central-1"
        aws_bucket: ${{ secrets.TARGET_BUCKET }}
        target: .
```

Conforme mencionado anteriormente, cada tarefa é executada em uma VM runner nova. Portanto, precisamos selecionar o SO apropriado novamente especificando o runs-onargumento. Por motivos semelhantes, essa VM runner nova também não tem acesso ao binário Go. Portanto, temos que acessá-la do mesmo bucket S3 onde a armazenamos na buildfase.

A primeira etapa do deploytrabalho usa os segredos configurados na Etapa 4 para acessar e baixar o binário na VM do runner, colocando o binário no diretório home. Saber o local do download é importante porque o usaremos para carregar e implantar o binário na instância EC2 de destino na próxima etapa.

Note que, nesta etapa, fizemos uso da GitHub Action existente publicada pela joutvhucomunidade. Isso economiza o esforço de escrever a lógica de download do zero.

#### Etapa 8: Implantar no EC2
Nesta etapa, também aproveitaremos o pacote publicado por cross-the-worldpara executar a implantação. Sob o capô, nesta etapa o runner:

Usa a chave privada para efetuar login na VM EC2
Copia o binário matemático simples baixado do bucket S3 para o diretório inicial do usuário EC2
Adiciona permissão de execução a este binário
Executa o binário

Se tudo tiver ocorrido bem até agora e as regras de entrada e saída estiverem configuradas corretamente, a API /addition deverá estar acessível no navegador, conforme mostrado abaixo:

3 ações do github api
Implantamos com sucesso o aplicativo simplemath no servidor de instância EC2.

Lembre-se de que o fluxo de trabalho completo será acionado toda vez que você fizer push ou merge de alterações no branch principal deste repositório. Uma vez que essas ações são definidas, a equipe de desenvolvimento de software pode executar várias iterações e lançar vários recursos de forma rápida e segura.

Exemplos de ações do GitHub

imos como o GitHub Actions fornece uma maneira de criar fluxos de trabalho de automação rapidamente. Como regra geral, sempre verifique as ações disponíveis no GitHub Marketplace para evitar repetições e economizar tempo. Vamos dar uma olhada em alguns exemplos do GitHub Actions Marketplace que abrangem vários casos de uso.

Exemplo 1: Configuração do ambiente
Aplicações escritas em várias linguagens exigem que os compiladores, runtimes, variáveis de ambiente, etc. correspondentes sejam configurados antes que possam ser operados com sucesso. Você pode encontrar muitas Ações do Github que ajudam a configurar tais ambientes no runner antes que as etapas reais sejam executadas.

O exemplo abaixo usa a ação do GitHub "Setup Node.js environment" para instalar o ambiente Node.js ajustando qualquer um dos atributos relevantes abaixo. Idealmente, esta etapa deve ser seguida pelas etapas de instalação e teste do pacote npm.

https://github.com/marketplace/actions/setup-node-js-environment

```
- uses: actions/setup-node@v4
  with:
     node-version: ''
     node-version-file: ''
     check-latest: false
     architecture: ''
     token: ''
     cache: ''
     cache-dependency-path: ''
     registry-url: ''
     scope: ''
     always-auth: ''
```

#### Exemplo 2: Imagens do Docker
Os aplicativos a serem implantados em ambientes conteinerizados exigem etapas explícitas de build e publicação para gerenciar imagens de contêiner do Docker. Isso é necessário para cada solicitação push/pull, pois as alterações devem ser refletidas na nova imagem. O Cloud Posse oferece a ação build e push do Docker para fazer isso.

No exemplo abaixo, especificamos as credenciais para o repositório do Docker e outros detalhes, como a plataforma de build. Essas informações são suficientes para que essa ação crie e envie automaticamente a imagem do Docker.

```
name: Push into main branch
  on:
    push:
      branches: [ master ]

  jobs:
    context:
      runs-on: ubuntu-latest
      steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Build
        id: build
        uses: cloudposse/github-action-docker-build-push@main
        with:
          registry: registry.hub.docker.com
          organization: "${{ github.event.repository.owner.login }}"
          repository: "${{ github.event.repository.name }}"
          login: "${{ secrets.DOCKERHUB_USERNAME }}"
          password: "${{ secrets.DOCKERHUB_PASSWORD }}"
          platforms: linux/amd64,linux/arm64

    outputs:
      image: ${{ steps.build.outputs.image }}
      tag: ${{ steps.build.outputs.tag }}
```

#### Exemplo 3: Verificação de segurança
O GitHub Actions também habilita o ScOps com seu fluxo de trabalho flexível. Vários Github Actions estão disponíveis para executar a varredura de segurança de arquivos, código-fonte e imagens de contêiner. No exemplo abaixo, configuramos a varredura de código-fonte para aplicativos Go como uma etapa no fluxo de trabalho do GitHub Actions. Uma vez configurado, após a etapa de checkout , esta ação inspeciona o código-fonte e fornece resultados a serem aproveitados no processo de desenvolvimento.

```
name: Run Gosec
on:
  push:
    branches:
      - master
  pull_request:
    branches:
      - master
jobs:
  tests:
    runs-on: ubuntu-latest
    env:
      GO111MODULE: on
    steps:
      - name: Checkout Source
        uses: actions/checkout@v3
      - name: Run Gosec Security Scanner
        uses: securego/gosec@master
        with:
          args: ./...
```

Pontos-chave
GitHub Actions é uma ferramenta flexível para automatizar fluxos de trabalho de desenvolvimento de software. Seu vasto ecossistema de ações e a capacidade de criar ações personalizadas simplificam várias tarefas, desde a construção e teste do seu código até a implantação de seus aplicativos e o gerenciamento de sua infraestrutura. Dependendo dos trabalhos configurados no seu fluxo de trabalho GitHub Actions, eles garantem a qualidade do código e entregam o software de forma mais eficiente.

Neste tutorial do GitHub Actions para iniciantes, nós apenas arranhamos a superfície ao cobrir o básico, incluindo como criar fluxos de trabalho com o GitHub Actions, usar ações internas e de terceiros e aproveitar recursos avançados como segredos de ambiente e artefatos. Também exploramos exemplos práticos que demonstraram como configurar pipelines de integração, entrega e implantação contínuas para diferentes tipos de projetos.



https://spacelift.io/blog/ci-cd-pipeline


Ao longo deste guia, exploramos desde os fundamentos do Git até recursos avançados e soluções práticas para problemas comuns. Agora, você está preparado para usar essa poderosa ferramenta em seus projetos, colaborando de forma eficiente e mantendo controle total sobre o código. Dicas Finais: Pratique regularmente. O Git é mais fácil de entender com o uso diário.  Não tenha medo de errar. Experimentar é a melhor maneira de aprender.  Participe de comunidades de desenvolvedores para trocar experiências e tirar dúvidas.  Mini Projeto Prático: Criando e Publicando um Site Estático com Git Este projeto guia você por um fluxo completo de trabalho com Git, desde a criação de um repositório local até a publicação de um site estático no GitHub Pages.

Passo 1: Configuração Inicial Crie a Estrutura do Projeto  Crie uma pasta chamada meu-site e, dentro dela, crie os arquivos básicos:  index.html: A página principal.  style.css: O arquivo de estilos (opcional).  Inicie o Repositório Git  Abra o terminal, navegue até a pasta do projeto e execute:  bash git init  Passo 2: Primeiras Alterações Adicione Conteúdo ao Site  No index.html, insira o seguinte código:  html <!DOCTYPE html>  <html lang="en">  <head>  <meta charset="UTF-8">  <meta name="viewport" content="width=device-width, initial-scale=1.0">  <title>Meu Site</title>  </head>  <body>  <h1>Bem-vindo ao Meu Site</h1>
<p>Este é um site simples criado como parte de um projeto prático.</p>
</body>
</html>

Adicione e Faça Commit das Alterações  Adicione os arquivos ao Git:  bash git add.

Faça o primeiro commit:  bash git commit -m "feat: Adiciona estrutura inicial do site"

Passo 3: Publicando no GitHub Crie um Repositório no GitHub  Acesse o GitHub e crie um repositório chamado meu-site.
Conecte o Repositório Local ao Remoto  No terminal, conecte o repositório local ao remoto:  bash git remote add origin https://github.com/seu-usuario/meu-site.git

Envie os Arquivos para o GitHub  Faça o push para a branch principal:  bash git push -u origin main
Passo 4: Configurando o GitHub Pages Habilite o GitHub Pages  No repositório do GitHub, acesse as configurações.  Na seção Pages, selecione a branch main como fonte e clique em "Save".
Acesse o Site Publicado  O site estará disponível em: https://seu-usuario.github.io/meu-site/.

Passo 5: Realizando Atualizações Edite o Arquivo index.html  Adicione um novo parágrafo ou uma lista.
Faça commit e push das alterações:  bash git add index.html  git commit -m "feat: Atualiza conteúdo da página inicial" git push  Verifique as Alterações no GitHub Pages  Acesse o site novamente para verificar as atualizações.  Este mini projeto prático demonstra como usar Git para rastrear versões, colaborar e publicar um site.



https://github.com/sottlmarek/DevSecOps?tab=readme-ov-file
