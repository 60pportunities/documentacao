`A automação é boa, desde que você saiba exatamente onde coloca-la`.

A Implantação Contínua (CD) está revolucionando a maneira como os desenvolvedores pensam e agem, e se você está ansioso para elevar seu jogo de codificação, este guia é para você! 
![](img/github-actions-002.jpeg)
## Automação: O Coração da Implantação
Automação não é apenas uma opção; é uma necessidade no mundo do CD. Ao automatizar tarefas, os desenvolvedores liberam tempo, reduzem erros e aumentam a consistência. 
## Colaboração: Todos a postos
Trabalhar em conjunto não é bom apenas para o moral, é crucial para o sucesso do CD. 
## Monitoramento e Feedback: Olhos no Processo
O monitoramento contínuo é essencial para detectar quaisquer problemas precocemente e aprender com eles.
## Teste: Não há espaço para erros
O teste é uma fase crucial que garante a qualidade e a confiabilidade do produto.
## Segurança e conformidade: seguro e sólido
Na era das ameaças cibernéticas, garantir a segurança e a conformidade do seu aplicativo é uma prioridade.
## Adotando uma cultura de aprendizagem e melhoria: cresça com o fluxo
A Implantação Contínua é uma jornada, não apenas um processo. 
## ACT "Pense globalmente, act localmente"
Feedback rápido - Em vez de ter que fazer commit/push toda vez que quiser testar as alterações que está fazendo em seus .github/workflows/arquivos você pode usar `act` ara executar as ações localmente. 
As variáveis ​​de ambiente e o sistema de arquivos são todos configurados para corresponder ao que o GitHub fornece.
Local Task Runner - Com act, você pode usar as GitHub Actions definidas em seu .github/workflows/para substituir seu Makefile!

- [x] `brew install act`
- [ ] Alguns comandosl

| Comando                                    | Descrição                                                                 |
|--------------------------------------------|---------------------------------------------------------------------------|
| `act`                                       | Executa o workflow GitHub Actions localmente usando a configuração padrão. |
| `act --list`                                | Lista os nomes dos eventos disponíveis no repositório.                    |
| `act --secret <SECRET_NAME>=<value>`        | Define uma variável de ambiente secreta a ser usada durante a execução do workflow. |
| `act --event <evento>`                      | Especifica o tipo de evento a ser disparado para o workflow (por exemplo, `push`, `pull_request`, etc.). |
| `act --platform <nome_da_imagem>`           | Define a imagem Docker a ser usada para o runner.                         |
| `act --verbose`                             | Exibe informações detalhadas sobre a execução do workflow.                |
| `act --job <job_name>`                     | Executa um job específico dentro do workflow (em vez de rodar o workflow completo). |
| `act --docker-args <args>`                  | Passa argumentos personalizados para o Docker quando o workflow é executado. |
| `act --secret-file <caminho_do_arquivo>`    | Especifica um arquivo de segredos a ser usado durante a execução do workflow (em vez de definir segredos manualmente). |
| `act --dry-run`                             | Realiza uma execução de teste sem fazer mudanças (dry-run), útil para verificar o que o workflow faria sem executar de fato. |
| `act --reuse`                               | Reutiliza containers e caches de execuções anteriores para acelerar a execução. |
| `act --entrypoint <entrypoint>`             | Substitui o ponto de entrada do container, útil se você precisar personalizar o processo de execução. |
| `act --no-cache`                            | Impede que o cache de execução seja reutilizado, forçando o workflow a ser executado do zero. |
| `act --artifact-server <endereco>`          | Define um servidor para hospedar artefatos durante a execução dos jobs. |

act --container-architecture linux/amd64 --env-file==env_01.env

|  Parametros   | Entenda             |
| -------       | ---------           |
| Events        | Suporte básico a eventos, ele tentará obter o máximo de informações possível do repositório local, embora isso possa não ser suficiente para certos tipos de eventos. Defaul: `push` |
| Workflows     | Todos os fluxos de trabalho serão executados em `.github/workflows`, mas poderá ser modificado por `-W/ --workflows`.  |
| Jobs          | Todos os trabalhos em todos os fluxos de trabalho que são acionados pelo pushevento, mas poderá ser modificado em todos os fluxos de trabalho que são acionados pelo pushevento `act -j 'nome-job'`. |
| Vars          | 
| Secrets       |
| GITHUB_TOKEN  | 

```
~/
├── .actrc          # Arquivo de configuração do `act`
├── .act/
│   ├── secrets.env # Arquivo de segredos
│   └── variables.env # Arquivo de variáveis
└── .github/
    └── workflows/
        └── workflow.yml
```

act pull_request
act -l
act --job <name-of-your-job>
act --job 'show'
act --container-architecture linux/amd64 --graph
act --container-architecture linux/amd64 --env-file=~/.act/env_01.env
act  --env-file env_01.env
 act  --env-file env_01.env

## Validação Linter
O yamllint não verifica apenas a validade da sintaxe, mas também estranhezas como repetição de teclas e problemas estéticos como comprimento de linhas, espaços finais, recuo, etc.
`yamllint .github/workflows/*.yml`

Esta action-validator é uma ferramenta autônoma projetada para "lint" os arquivos YAML usados ​​para definir GitHub Actions e Workflows. Ela garante que eles sejam bem formados, verificando-os em relação aos esquemas JSON publicados, e garante que quaisquer globs usados ​​em paths/ paths-ignorecorrespondam a pelo menos um arquivo no repositório.
`action-validator .github/workflows/04_wf_nada.yml`

## GitHub Actions

![](img/github-actions-001.jpeg)

- [x] GitHub Actions refere-se a toda a plataforma e ecossistema para criar e executar fluxos de trabalho automatizados dentro do ambiente GitHub;
- [x] Uma ação é um script invocado de dentro de um fluxo de trabalho;
- [x] GitHub Actions é uma plataforma de integração contínua e entrega contínua (CI/CD) que permite automatizar a sua compilação, testar e pipeline de implantação.
- [x] Oferecem três sabores de ambientes virtuais: Ubuntu, macOS e Windows.
- [x] Os runners vêm com uma variedade de softwares e ferramentas pré-instalados comumente usados no
desenvolvimento de software.

Pipeline de Build
- [x] Processo de compilação;
- [ ] Testes unitários
- [ ] Análise de qualidade
- [ ] Geração do artefato;

Pipeline de Segurança
- [ ] Analisar dependências, 
- [ ] Analisar secrets, 
- [ ] Analisar vulnerabilidades.

Pipeline de Deployment
- [ ] Configuração de ambiente
- [ ] Implantação da aplicação, 
- [ ] Testes de fumaça. 

Pipeline de Infra as Code
- [ ] Processo de infraestrutura em nuvem ou até mesmo no seu Ambiente On-premises. 


### Types of GitHub actions
Há três tipos de ações do GitHub: ações de contêiner (Estas ações só podem ser executadas num ambiente Linux que o GitHub aloja), ações JavaScript (não incluem o ambiente no código, você terá que especificar o ambiente para executar essas ações. As ações JavaScript suportam ambientes Linux, macOS e Windows.) e ações compostas (permitem combinar várias etapas do fluxo de trabalho em uma única ação).


```mermaid
flowchart
EVE(Evento) --> Job(JOB)
subgraph Job
  A1(O que fazer?) --> A2(Inicializar o Trabalho)
  A2               --> A3(Instalar as Dependencias)
  A3               --> A4(Verificação de Pacotes)
  A4               --> A5(Limpar o ambiente após o trabalho)
  A5               --> A6(Finalizar o Trabalho)
end
```

- [x] O principal mecanismo de automação no GitHub.
- [x] As actions são o mecanismo usado para fornecer automação de fluxo de trabalho dentro do ambiente GitHub.


```mermaid
flowchart LR
    A(Eventos) -->|Trigger| B(Workflows)
    B          -->|Contain|C(Jobs)
    C          -->|Use| D(Actions)
```

### Workflow 
Um fluxo de trabalho é um processo automatizado configurável que executará um ou mais trabalhos.
Os fluxos de trabalho são definidos no diretório .github/workflows
Um workflow é processo bem-definido que será executado no repositório ao qual ele pertence
Ele é definido a partir de um arquivo YAML dentro da pasta .github/workflows
É comum definir workflows para testagem de pacotes, geração de documentação, atualização de dados, etc.
O workflow é, essencialmente, um duende mágico que baixa o nosso repositório em um servidor do GitHub e executa os comandos especificados

### Eventos
Um evento é uma atividade específica em um repositório que dispara a execução de um fluxo de trabalho.
uma atividade pode originar-se de GitHub quando alguém cria uma solicitação de pull request, abre um problema ou faz envio por push de um commit para um repositório ou agendamentos.
Eventos: Um evento é uma atividade que aciona um fluxo de trabalho. Por exemplo:
Quando o repositório recebe uma alteração (on: push)
Quando um Pull Request é criado (em outras palavras, alguém está enviando uma contribuição para o repositório) (on: pull_request)

https://docs.github.com/pt/actions/reference/events-that-trigger-workflows

Eventos programados. Ex: a cada hora, todos os dias, uma vez por semana, uma vez por mês, etc. O site CronTab é muito útil para isso.
Use a chave `on` para especificar os eventos que disparam o fluxo de trabalho.
- Unico: on: push
- Usando eventos múltiplos:  on: [push, fork]
- Usando tipos de atividade e filtros com vários eventos
- push,pull_request,issues,release,fork,star,status,

| **Evento**                | **Descrição**                                                       | **Exemplo**                                                     |
|---------------------------|---------------------------------------------------------------------|-----------------------------------------------------------------|
| `push`                    | Disparado quando há um push de código para o repositório.           | `on: push`                                                      |
| `pull_request`            | Disparado quando uma pull request é aberta, fechada ou sincronizada. | `on: pull_request`                                              |
| `issues`                  | Disparado quando uma issue é aberta, editada ou fechada.            | `on: issues`                                                    |
| `issue_comment`           | Disparado quando um comentário é feito em uma issue ou PR.          | `on: issue_comment`                                             |
| `release`                 | Disparado quando uma release é criada, publicada ou deletada.       | `on: release`                                                   |
| `fork`                    | Disparado quando um repositório é bifurcado (forked).               | `on: fork`                                                      |
| `star`                    | Disparado quando alguém dá ou retira uma estrela (star).            | `on: star`                                                      |
| `status`                  | Disparado quando o status de um commit muda (ex: CI).               | `on: status`                                                    |
| `workflow_run`            | Disparado quando a execução de outro workflow é concluída.         | `on: workflow_run`                                              |
| `watch`                   | Disparado quando um usuário começa ou para de "seguir" o repositório. | `on: watch`                                                     |
| `repository_dispatch`     | Disparado quando um evento externo envia um payload para o repositório. | `on: repository_dispatch`                                       |
| `schedule`                | Disparado de acordo com um cronograma (expressões cron).            | `on: schedule`                                                  |
| `workflow_dispatch`       | Disparado manualmente, com entradas personalizadas.                 | `on: workflow_dispatch`                                          |
| `label`                   | Disparado quando um rótulo (label) é adicionado ou removido.       | `on: label`                                                     |
| `milestone`               | Disparado quando um milestone é criado, fechado ou reaberto.       | `on: milestone`                                                 |
| `deployment`              | Disparado quando um deployment é criado ou atualizado.             | `on: deployment`                                                |
| `deployment_status`       | Disparado quando o status de um deployment muda (sucesso ou falha). | `on: deployment_status`                                         |
| `push` (tag)              | Disparado quando um tag é enviado para o repositório.              | `on: push: tags: ['v*.*.*']`                                    |
| `github_app`              | Disparado por ações de GitHub Apps no repositório.                 | `on: github_app`                                                |
| `secret_scanning_alert`   | Disparado quando um alerta de vazamento de segredo é gerado.       | `on: secret_scanning_alert`                                     |

### Runners
O GitHub Actions oferece [ambientes virtuais](https://docs.github.com/en/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners) gerenciados para executar fluxos de trabalho. 
Para act executar seus fluxos de trabalho localmente, ele deve executar um contêiner para o runner definido no seu arquivo de fluxo de trabalho. (act --container-architecture linux/amd64 ou act -P ubuntu-latest=-self-hosted)

Você pode identificar o código-fonte usado para criar as imagens de VM para executores hospedados no GitHub usados ​​para Actions, bem como para agentes hospedados pela Microsoft usados ​​para Azure Pipelines. 

- [x] [Imagens Runners](https://github.com/actions/runner-images)

#### Runners Específicos - Auto-hospedados
Você pode adicionar um executor auto-hospedado a um repositório, a uma organização ou a uma empresa. Os executores auto-hospedados a nível da organização ou empresa. Esta abordagem torna o executor disponível para vários repositórios na sua organização ou empresa, e também permite gerenciar seus executores em um só lugar.

Settings --> Actions --> Runners

Arquiteturas
As seguintes arquiteturas de processador são compatíveis com o aplicativo do executor auto-hospedado.

x64 – Linux, macOS e Windows.
ARM64 – Linux, macOS, Windows (atualmente em versão prévia pública).
ARM32 – Linux.

```
# Create a folder
$ mkdir actions-runner && cd actions-runner
Copied!# Download the latest runner package
$ curl -o actions-runner-osx-arm64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-osx-arm64-2.321.0.tar.gz
Copied!# Optional: Validate the hash
$ echo "fbee07e42a134645d4f04f8146b0a3d0b3c948f0d6b2b9fa61f4318c1192ff79  actions-runner-osx-arm64-2.321.0.tar.gz" | shasum -a 256 -c
# Extract the installer
$ tar xzf ./actions-runner-osx-arm64-2.321.0.tar.gz
Copied!
Configure
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/60pportunities --token BMFODSGMACOJCOS5W7HYTKLHKAQPM
Copied!# Last step, run it!
$ ./run.sh
Using your self-hosted runner
# Use this YAML in your workflow file for each job
runs-on: self-hosted
```


### Job
Um job é um conjunto de etapas em um fluxo de trabalho executadas no mesmo executor.
Um evento aciona automaticamente o fluxo de trabalho, que contém um trabalho. Em seguida, o trabalho usa etapas para controlar a ordem em que as ações são executadas. 
O trabalho usa etapas para controlar a ordem em que as ações são executadas

| Chave          |  Entenda                                              |
| ----           | ----                                                  |
| jobs:          | Palavra-chave para declarar um trabalho               |
| job_name       | Identificador do Job (Texto Simples)                  |
| name: XXXXX    | Nome do Job                                           |
| runs-on: XXXXX | Runner type (e.g., ubuntu-latest, windows-latest, self-hosted runner name) |
| steps:         | Lista de etapas a serem executadas dentro do trabalho |

#### Steps
Definir tarefas individuais a serem executadas dentro de um trabalho.

| Chave               |  Entenda                                              |
| ----                | ----                                                  |
| steps:              | Keyword to declare steps within a job
| name: (Optional)    | Custom name for the step
| run:                | Execute a shell command within the step
| uses:               | (Optional) Use a pre-built action from the GitHub Actions marketplace
| action_name:        | Name of the action to use
| version: (Optional) | Specific version of the action to use
| with: (Optional)    | Input values for the action
| command_to_execute: Shell command to be executed

### Secure Workflow Data
Proteger informações confidenciais como senhas, tokens de acesso e chaves de API é crucial
As violações de dados podem ter consequências graves para organizações e indivíduos
O GitHub Actions fornece vários recursos para manuseio seguro de dados

Definição: Armazenamento seguro para dados sensíveis como chaves de API
Uso: Acessível por fluxos de trabalho no mesmo repositório
Configuração: GitHub.com > Configurações > Segredos > Novo segredo do repositório

### Variáveis ​​de ambiente padrão

### Actions
Uma ação é um aplicativo personalizado para a plataforma GitHub Actions que executa uma tarefa complexa, mas frequentemente repetida.

Types of GitHub Actions : 

- [x] Pushes: Trigger on any push 
- [x] Pull Requests: Trigger on PR events 
- [x] Issues: Trigger on issue activities 
- [x] Releases: Trigger on new releases 
- [x] Scheduled Events: Cron expressions for scheduling 
- [x] Manual Triggers: Trigger manually via GitHub UI/CLI

### Runners (Executores)
Um executor é um servidor que executa seus fluxos de trabalho quando eles são disparados. Cada executor pode executar um único trabalho por vez. GitHub fornece executores Ubuntu Linux, Microsoft Windows e macOS para executar seus fluxos de trabalho. 

Secrets (ou segredos, em português) são variáveis de ambiente que não podem ser compartilhadas com ninguém que não seja autorizado. São dados sigilosos, geralmente específicos de um contexto, por exemplo, de uma organização, um repositório, uma equipe… 

Exemplos de secrets:

- [x] O usuário e uma senha para acessar uma ferramenta;
- [x] A chave para consumir uma API;
- [x] Um token ou uma credencial de acesso; 
- [x] O número de um documento (CPF, Passaporte etc).

O Github Action é orientado por eventos, onde cada evento pode acionar (trigger) automaticamente um ou mais workflows. um workflow após cada push, pull request ou comentário, para uma branch específica ou para todas, e é customizável.

## JOB 
Um job é um conjunto de etapas em um fluxo de trabalho que são executadas no mesmo runner (um runner é um servidor que executa seus fluxos de trabalho quando acionado). Os fluxos de trabalho têm jobs, e os jobs têm etapas. Os passos são executados em ordem e são dependentes uns dos outros. Você adicionará etapas ao seu fluxo de trabalho mais adiante no curso. Para ler mais sobre jobs, consulte " Jobs".
    
Os trabalhos, por sua vez, são compostos de etapas. Uma etapa executa um comando shell ou invoca uma
ação predefinida do GitHub. Todas as etapas em um trabalho são executadas em um runner. O runner é um
servidor (virtual ou físico) ou um contêiner que foi configurado para entender como interagir com o GitHub

 gh workflow --repo https://github.com/horaciovasconcellos/estudo list

Etapa 1: definir o gatilho do fluxo de trabalho
O pipeline é acionado toda vez que há um evento,. mas podemos ter algumas exceções:

```
on:
  push:
    branches:
      - main
    paths-ignore:
      - 'README.md'
  ```
Etapa 2: Construindo e testando o aplicativo
  Este trabalho configura o ambiente, instala e executa os testes para o backend.

jobs:
  build-and-test-fastapi:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ./api

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt


Etapa 3: Construindo e testando o frontend Next.js
 build-and-test-front-end-nextjs:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ./front-end-nextjs

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install Dependencies
        run: npm ci


Etapa 4: Construindo e enviando imagens do Docker

build-and-push-images:
    needs: [build-and-test-fastapi, build-and-test-front-end-nextjs]
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login to DockerHub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and Push FastAPI image
        uses: docker/build-push-action@v5
        with:
          context: ./api
          file: ./api/Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/qr-api:${{ github.sha }}

      - name: Build and Push Next.js image
        uses: docker/build-push-action@v5
        with:
          context: ./front-end-nextjs
          file: ./front-end-nextjs/Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/qr-frontend:${{ github.sha }}

Etapa 4: Configurando segredos de ambiente para Dockerhub

Etapa 5: Confirmar e executar o fluxo de trabalho

build-and-push-images:
    needs: [build-and-test-fastapi, build-and-test-front-end-nextjs]
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login to DockerHub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and Push FastAPI image
        uses: docker/build-push-action@v5
        with:
          context: ./api
          file: ./api/Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/qr-api:${{ github.sha }}

      - name: Build and Push Next.js image
        uses: docker/build-push-action@v5
        with:
          context: ./front-end-nextjs
          file: ./front-end-nextjs/Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/qr-frontend:${{ github.sha }}


Neste guia, implementamos um pipeline de CI/CD para automatizar o processo de teste, construção e implantação do nosso backend FastAPI e frontend Next.js. Ao integrar o Docker, GitHub Actions e DockerHub, otimizamos nosso fluxo de trabalho para construções consistentes e confiáveis.


Elabore um Dockerfile com os seguintes componentes: 
markdown-include
mike
mkdocs
mkdocs-autorefs
mkdocs-git-authors-plugin
mkdocs-git-committers-plugin-2
mkdocs-git-revision-date-localized-plugin
mkdocs-glightbox
mkdocs-include-markdown-plugin
mkdocs-material
mkdocs-mermaid2-plugin
mkdocs-minify-plugin
mkdocs-render-swagger-plugin
mkdocs-swagger-ui-tag
mkdocs-table-reader-plugin
pymdown-extensions

Após efetuar a instalação, copiar os

FROM python:3

RUN pip install mkdocs
RUN mkdocs new letscloud

EXPOSE 8000

WORKDIR /letscloud

ENTRYPOINT ["mkdocs"]

CMD ["serve", "--dev-addr=0.0.0.0:8000"]

FROM python:3-alpine

ARG USER=1001

RUN adduser -h /usr/src/mkdocs -D -u $USER mkdocs \
&& apk add bash \
&& apk add git 

ENV PATH="${PATH}:/usr/src/mkdocs/.local/bin"

USER mkdocs
RUN mkdir -p /usr/src/mkdocs/build
WORKDIR /usr/src/mkdocs/build

RUN pip install --upgrade pip

RUN pip install pymdown-extensions \
&& pip install mkdocs \
&& pip install mkdocs-material \
&& pip install mkdocs-rtd-dropdown \
&& pip install mkdocs-git-revision-date-plugin \
&& pip install mkdocs-git-revision-date-localized-plugin


ENTRYPOINT ["/usr/src/mkdocs/.local/bin/mkdocs"]

docker build -t exmaple-mkdocs:v1 --build-arg=USER=$(id -u) .

docker run -it -v /root/test-delete/:/usr/src/mkdocs/build example-mkdocs:v2 gh-deploy
cat docs/CNAME 
60pportunities.com.br

docker run -it --rm \
-v /home/mkdocs/.git-credentials:/usr/src/mkdocs/.git-credentials \
-v /home/mkdocs/Documents/mkdocs/jvincze84.github.io/:/usr/src/mkdocs/build \
mkdocs:1 gh-deploy
