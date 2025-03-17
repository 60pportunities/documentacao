## Continuous Learning (Aprendizado Contínuo)
É o processo de aprendizado constante, onde indivíduos e organizações buscam adquirir e aprimorar conhecimentos e habilidades ao longo do tempo.

### Pílula do Conhecimento
São conteúdos curtos e direcionados para aprendizado rápido e objetivo sobre um tema específico.
#### Carreira
<div class="center-table" markdown>
```mermaid
flowchart TD
  id1(Autoaprendizagem) --> id2(Tutoriais)
  id1  --> id3(Certificações)
  id1  --> id4(Projetos)
```
</div>
#### Tecnologia da Informação
<div class="center-table" markdown>
```mermaid
flowchart TD
  id1(Profissional</br>Tecnologia</br>da Informação) --> id2(Continuous Learning)
  subgraph Requisitos
    direction LR
    id10(Processos Ágeis)
    id12(Documentação)
  end
  subgraph Desenvolvedor
   direction LR
   id5(Source</br>Control)
   id13(Linguagem)
   id7(Container)
   id8(Workflow)
  end
  subgraph SRE
    direction LR
    id3(Linux)
    id4(Cloud)
    id6(IaC)
    id9(Configuration</br>Management)
    id11(Observabilidade)
  end
  id2 --> Requisitos & Desenvolvedor & SRE
```
</div>
#### Linux
<div class="center-table" markdown>
```mermaid
flowchart TD
  id3(Linux)    --> id30(Distribuição</br>Ubuntu,Fedora)
  id30          --> id3001(Terminal)
  id3001        --> id300101(FileSystem</br>df,du,chgrp) & id300102(Base CLI</br>ls,cd,pwd) & id300103(Process</br>ps,kill,top) & id300104(Package</br>apt,yum)  & id300105(Scripting</br>bash)
```
</div>
#### Cloud
<div class="center-table" markdown>
```mermaid
flowchart TD
id4(Cloud)   --> id401(GCP,AZ,AWS,OCI)
id401         --> id40101(IaM/IdM) & id40102(Compute EC2) & id40103(Object Storage)
```
</div>
#### Controle de Versão
<div class="center-table" markdown>
```mermaid
flowchart TD
   id5(Source</br>Control) --> id501(Azure-Devops</br>Github)
   id501        --> id501000(Monorepo </br>Polyrepo) & id5010001(Branch</br>Estratégia)
   id501        -->id50101(Basic</br>Clone,Add,Commit</br>Push,Pull,Submodule)
   id501        -->id50102(Access,Proteção Branch</br>Regras)
   id501        -->id50103(Merge,Pull Request)
```
</div>
#### Infraestrutura como Código
<div class="center-table" markdown>
```mermaid
flowchart TD
   id6(IaC)     --> id601(Terraform)
   id601        --> id60101(Basic) & id60102(Criar Servidores) & id60103(Create Multiplos</br> Servidores) & id60104(Criar Recursos) & id60105(Modulos)
```
</div>
#### Container
<div class="center-table" markdown>
```mermaid
flowchart TD
   id7(Container)   --> id701(Docker) & id702(Orquestração)

  subgraph Orquestradores
    direction LR
   id130101(Nomad HashiCorp)
   id130102(Kubernetes K8s)
   id130103(OpenShift)
   id130104(Docker Swarm)
   id130105(Rancher)
  end
  subgraph ContainerBasico
   direction LR
   id70101(Arquitetura Básica)
   id70102(Docker CLI)
   id70103(DockerFile)
   id70104(Docker Compose)
   id70105(Docker CI/CD)
  end
  id701 --> ContainerBasico
  id702 --> Orquestradores
```
</div>
#### Pipelines/Workflows
<div class="center-table" markdown>
```mermaid
flowchart TD
   id8(Workflow)  --> id801(Azure Pipeline) & id802(GitHub Workflow) & id803(Estratégia</br>Implantação)
   subgraph Estrategia
    direction LR
    id80301(Big Bang) & id80302(A/B Testing) & id80303(Canary</br>Deployment) & id80304(Blue/Green</br>Deployment) & id80305(Feature Flags) & id80306(Rolling</br>Deployment) & id80307(Shadow</br>Deployment)
   end
   subgraph workflow
    id80400(EVENTO) --> id80401(JOBS) --> id80402(JOB_NAME) --> id80403(RUNNERS) --> id80404(STEPS) & id80405(ACTIONS)
   end
   subgraph Pipeline
    id80200(trigger) --> id80201(stages) --> id80202(stage) --> id80203(jobs) --> id80204(job)
   end
   id803 --> Estrategia
   id802 --> workflow
   id801 --> Pipeline
```
</div>
#### Gerenciamento de Configuração
<div class="center-table" markdown>
```mermaid
flowchart TD
   id9(Configuration</br>Management) --> id901(Ansible) & id902(Chef)  & id903(Terraform) & id904(SaltStack)
```
</div>
#### Processos Ágeis
<div class="center-table" markdown>
```mermaid
flowchart TD
id10(Processos Ágeis) --> id1001(Manifesto Ágil) & id1002(Metodologias</br>Ágeis) & id1003(Papéis Responsabilidades) & id1004(Ferramentas</br>Ágeis) & id1005(Métricas e</br> Indicadores) & id1006(Cultura Ágil)
subgraph Manifesto
  direction LR
  id100101(Valores)
  id100102(Princípios)
end
subgraph Framework
   direction LR
   id100202(KanBan)
   id100203(Lean)
   id100204(XP)
   id100201(Scrum) --> id10020101(Papéis) & id10020102(Eventos) & id10020103(Artefatos)
end
subgraph Ferramentas
  direction LR
  id100401(Azure DevOps)
  id100402(Trello)
end
subgraph Papel
direction LR
id100301(Stakeholders)
id100302(Product Owner_Manager)
id100303(SCRUM Master)
id100304(Time)
end
subgraph Metricas
direction LR
id100501(DORA)
id100502(Agile Fluency Model)
id100503(Evidence-Based Management)
id100504(SPACE)
id100505(Four Key Metrics)
id100506(Code Quality)
end
subgraph Cultura
  direction LR
  id100601(Colaboração</br>Transparência)
  id100602(Adaptação</br>Mudanças)
  id100603(Autonomia</br>Responsabilidade)
  id100604(Ciclos Curtos</br>Iterativos)
  id100605(Melhoria Contínua)
end
id1001 --> Manifesto
id1002 --> Framework
id1003 --> Papel
id1004 --> Ferramentas
id1005 --> Metricas
id1006 --> Cultura
```

</div>

#### Documentação
<div class="center-table" markdown>
```mermaid
flowchart TD
id12(Documentação) --> id1201(Markdown) & id1202(CSS) & id1203(HTML) & id1204(JavaScript)  & id1205(Sites) & id1206(Wiki)
subgraph SSG
  direction LR
 id120501(MkDocs)
 id120502(Hugo)
 id120503(Jekyll)
 id120504(Gatsby)
end
id1205 --> SSG
```
</div>
#### Linguagem Tecnologia
<div class="center-table" markdown>
```mermaid
flowchart
id13(Linguagem)  --> id1301(Oracle) & id1302(Supravisio) & id1303(PHP)
  subgraph Oracle
    id130101(SQL Developer)
    id130102(SQL DataModeler)
    id130103(Apex)
    id130104(ORDS)
    id130105(Forms)
    id130106(XML Publisher)
    id130107(ODI)
    id130108(SQLcl)
  end
  subgraph Supravisio
   id130201(Python)
   id130202(C/C++)
   id130203(Java)
   id130204(SQL/PLSQL)
   id130205(Ladder/Structured Text)
   id130206(BPMN)
  end
  subgraph PHP
   id130301(Laravel)
   id130302(Symfony)
   id130303(Zend Framework)
   id130304(CMS-Joomla)
   id130305(CMS-WordPress)
  end
  id1301   --> Oracle
  id1302   --> Supravisio
  id1303  --> PHP
```
</div>
#### Linguagem Tecnologia
<div class="center-table" markdown>
```mermaid
flowchart TD
id01(PDTIC) & id02(Teams) & id03(Ticket) --> id04(Produto</br>Projeto)
id04 --> id05(Boards) & id06(Repos) & id07(Test Plan)
id05 --> id0501(Épico) --> id0502(Feature)--> id0503(PBI) --> id0504(Tarefa)
id06 --> id0601(FrontEnd) & id0602(BackEnd) & id0603(IaC) & id0604(Docs)
id07 --> id0701(Test Plan) & id0702(Test Case)
```
</div>
#### Integração Contínua e Entrega Contínua
<div class="center-table" markdown>
```mermaid
flowchart TD
cd01(Codigo) --> cd0101(Compilar</br>Construir) & cd0102(Teste</br>Unitário) & cd0103(Cobertura</br>Código)  & cd0104(Software</br>Composition</br>Analysis) & cd0105(Static Application</br>Security Testing) & cd0106(Quality Gates) & cd0107(Build</br>Docker Image) & cd0108(Scan Docker</br>Image) & cd0109(Smoke Test)
```
</div>
#### Observabilidade
<div class="center-table" markdown>
```mermaid
flowchart TD
id11(Observabilidade) --> id1101(Logs) & id1102(Métricas) & id1103(Traces) & id1104(Ferramentas)
id1104                --> id110401(Coleta de Dados) & id110402(Armazenamento e Processamento) & id110403(Visualização e Dashboard) & id110404(Tracing) & id110405(Alertas e Notificações)
id110401 --> id11040101(Prometheus) & id11040102(Fluentd) & id11040103(Logstash)
id110402 --> id11040201(Elasticsearch) & id11040202(InfluxDB) & id11040203(VictoriaMetrics)
id110403 --> id11040301(Grafana) & id11040302(Kibana) & id11040303(Datadog)
id110404 --> id11040401(Jaeger)  & id11040402(Zipkin) & id11040403(OpenTelemetry)
id110405 --> id11040501(Alertmanager)  & id11040502(PagerDuty) & id11040503(OpsGenie)
```
</div>

### Estratégia de Branch
<div class="center-table" markdown>
```mermaid
gitGraph
   commit id: "git flow init"
   branch develop
   checkout develop
   commit id: "flow feature start feat"
   branch feature/feat-pbi
   checkout feature/feat-pbi
   commit id: "flow feature finish feat"
   checkout develop
   merge feature/feat-pbi id: "flow release start x.x.x"
   branch release/x.x.x
   checkout release/x.x.x
   commit id: "Code Review"
   checkout main
   merge release/x.x.x id: "flow release finish 'x.x.x'"
   commit id: "flow hotfix start bug-ticket"
   branch hotfix/bug-ticket
   checkout hotfix/bug-ticket
   commit id: "Acerta BUG"
   checkout main
   merge hotfix/bug-ticket id: "flow hotfix finish bug-ticket"
   checkout develop
   merge main
```
</div>

```
name: CI/CD - GitFlow Go App

on:
  push:
    branches:
      - main
      - develop
      - 'feature/*'
      - 'release/*'
      - 'hotfix/*'
  pull_request:
    branches:
      - main
      - develop
      - 'release/*'
      - 'hotfix/*'

jobs:
  sca-security:
    name: SCA Security Scan
    runs-on: ubuntu-latest

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Instalar Trivy (Ferramenta SCA)
        run: |
          sudo apt update
          sudo apt install -y wget
          wget https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.50.1_Linux-64bit.tar.gz
          tar zxvf trivy_0.50.1_Linux-64bit.tar.gz
          sudo mv trivy /usr/local/bin/

      - name: Rodar análise SCA
        run: |
          trivy fs --exit-code 1 --severity HIGH,CRITICAL .

  unit-tests:
    name: Testes Unitários
    runs-on: ubuntu-latest
    needs: sca-security  # Só roda após a análise SCA passar

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Configurar Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.21'

      - name: Instalar dependências
        run: go mod tidy

      - name: Rodar testes unitários
        run: go test ./... -v -cover

  docker-build:
    name: Build Docker Image
    runs-on: ubuntu-latest
    needs: unit-tests  # Só roda após os testes unitários passarem

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Build da imagem Docker
        run: docker build -t my-go-app:latest .

      - name: Testar execução do container
        run: docker run --rm my-go-app:latest

  deploy:
    name: Deploy (Somente em releas
```
<div class="center-table" markdown>
```mermaid
gitGraph
   commit id: "checkout -b feature/feat-01"
   branch feature/feat-01
   checkout feature/feat-01
   commit id: "Tarefa 01 - Feature Flah - git push origin feature/feat-01"
   checkout main
   merge feature/feat-01 id: "Pull Requiest - Check"
   branch feature/feat-02
   checkout feature/feat-02
   commit id: "Tarefa 01 - Feature Flah - git push origin feature/feat-02"
   checkout main
   merge feature/feat-02 id: "Merge feature 2 into main"
   commit id: "Release"
```
</div>

## Exemplo de Workflow
```
.
├── .github/workflows/ci.yml  # Workflow do GitHub Actions
├── Dockerfile                # Dockerfile para build da aplicação
├── go.mod                    # Dependências do projeto Go
├── main.go                   # Código principal
├── app/                      # Código fonte
└── tests/                    # Testes unitários

```

```
# Usa a imagem base do Golang
FROM golang:1.21

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Baixa as dependências
RUN go mod tidy

# Compila a aplicação
RUN go build -o main .

# Define o comando de execução
CMD ["/app/main"]
```


```
name: CI - Go App

on:
  push:
    branches:
      - main
      - 'feature/*'
  pull_request:
    branches:
      - main

jobs:
  sca-security:
    name: SCA Security Scan
    runs-on: ubuntu-latest

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Instalar Trivy (Ferramenta SCA)
        run: |
          sudo apt update
          sudo apt install -y wget
          wget https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.50.1_Linux-64bit.tar.gz
          tar zxvf trivy_0.50.1_Linux-64bit.tar.gz
          sudo mv trivy /usr/local/bin/

      - name: Rodar análise SCA
        run: |
          trivy fs --exit-code 1 --severity HIGH,CRITICAL .

  unit-tests:
    name: Testes Unitários
    runs-on: ubuntu-latest
    needs: sca-security  # Só roda após a análise SCA passar

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Configurar Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.21'

      - name: Instalar dependências
        run: go mod tidy

      - name: Rodar testes unitários
        run: go test ./... -v -cover

  docker-build:
    name: Build Docker Image
    runs-on: ubuntu-latest
    needs: unit-tests  # Só roda após os testes unitários passarem

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Build da imagem Docker
        run: docker build -t my-go-app:latest .

      - name: Testar execução do container
        run: docker run --rm my-go-app:latest
```

##
```
mvn liquibase:validate
mvn liquibase:update -Dliquibase.labels=v1.2.0 -Dliquibase.contexts=hml

# This is a basic workflow to help you get started with Actions

name: Liquibase_Maven_GitHub-Hosted

on: [push]

# For more control over when the action will run, comment out (or delete) the above and trigger the workflow on master-branch push or pull request
# by uncommenting the appropriate section below.
# on:
# workflow_dispatch:
#   push:
#     branches: [ main ]
#   pull_request:
#     branches: [ main ]

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains jobs called "LBJobMaven"
  LBJobMaven:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:

      - name: RunLiquibaseMavenCommands
        uses: actions/checkout@v2
      - run: |
          cd extra/SalesManager_h2_version
          mvn -version
          mvn clean package
          #Uncomment the line below to save changes.  Also, see environment variables under "env" and assign variables accordingly
          #git config --global user.email $user.email; git config --global user.name $user.name; git config pull.rebase false; git add .; git commit -m $"message"; git push -u origin $branch
          mvn liquibase:status -Dliquibase.verbose
          mvn liquibase:updateTestingRollback


        env:
            user.email: "<email>"
            user.name: "<user name>"
            message: "<commit message>"
            branch: "<branch name>"
```
