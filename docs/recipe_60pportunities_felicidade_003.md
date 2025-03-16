## Continuous Learning (Aprendizado Contínuo)
É o processo de aprendizado constante, onde indivíduos e organizações buscam adquirir e aprimorar conhecimentos e habilidades ao longo do tempo.

### Pílula do Conhecimento
São conteúdos curtos e direcionados para aprendizado rápido e objetivo sobre um tema específico.
#### Carreira

```mermaid
flowchart TD
  id1(Autoaprendizagem) --> id2(Tutoriais)
  id1  --> id3(Certificações)
  id1  --> id4(Projetos)
```
#### Tecnologia da Informação

```mermaid
flowchart TD
  id1(Profissional</br>Tecnologia</br>da Informação) --> id2(Continuous Learning)
  id2           --> id3(Linux)
  id2           --> id4(Cloud)
  id2           --> id5(Source</br>Control)
  id2           --> id6(IaC)
  id2           --> id7(Container)
  id2           --> id8(Workflow)
  id2           --> id9(Configuration</br>Management)
  id2           --> id10(Processos Ágeis)
  id2           --> id11(Observabilidade)
  id2           --> id12(Documentação)
```
#### Linux
```mermaid
flowchart TD
  id3(Linux)    --> id30(Distribuição</br>Ubuntu,Fedora)
  id30          --> id3001(Terminal)
  id3001        --> id300101(FileSystem</br>df,du,chgrp) & id300102(Base CLI</br>ls,cd,pwd) & id300103(Process</br>ps,kill,top) & id300104(Package</br>apt,yum)  & id300105(Scripting</br>bash)
```
#### Cloud
```mermaid
flowchart TD
id4(Cloud)   --> id401(GCP,AZ,AWS,OCI)
id401         --> id40101(IaM/IdM) & id40102(Compute EC2) & id40103(Object Storage) 
```
#### Controle de Versão
```mermaid
flowchart TD
   id5(Source</br>Control) --> id501(Azure-Devops</br>Github)
   id501        --> id501000(Monorepo </br>Polyrepo) & id5010001(Branch</br>Estratégia)
   id501        -->id50101(Basic</br>Clone,Add,Commit</br>Push,Pull,Submodule)
   id501        -->id50102(Access,Proteção Branch</br>Regras)
   id501        -->id50103(Merge,Pull Request)   
```
#### Infraestrutura como Código
```mermaid
flowchart TD
   id6(IaC)     --> id601(Terraform)
   id601        --> id60101(Basic) & id60102(Criar Servidores) & id60103(Create Multiplos Servidores) & id60104(Criar Recursos) & id60105(Modulos)
```
#### Container
```mermaid
flowchart TD
   id7(Container)   --> id701(Docker)
   id701        --> id70101(Arquitetura Básica) & id70102(Docker CLI) &  id70103(DockerFile) &  id70104(Docker Compose) &  id70105(Docker CI/CD)
```
#### Pipelines/Workflows
```mermaid
flowchart TD
   id8(Workflow)  --> id801(Azure Pipeline) & id802(GitHub Workflow) & id803(Estratégia</br>Implantação)
   id803 --> id80301(Big Bang) & id80302(A/B Testing) & id80303(Canary</br>Deployment) & id80304(Blue/Green Deployment) & id80305(Feature Flags) & id80306(Rolling Deployment) & id80307(Shadow Deployment) 
```
#### Gerenciamento de Configuração
```mermaid
flowchart TD
   id9(Configuration</br>Management) --> id901(Ansible)
```
#### Processos Ágeis
```mermaid
flowchart TD
id10(Processos Ágeis) --> id1001(Manifesto Ágil) & id1002(Metodologias Ágeis) & id1003(Papéis Responsabilidades) & id1004(Ferramentas Ágeis) & id1005(Métricas e Indicadores) & id1006(Cultura Ágil)
   id1001       --> id100101(Valores e Princípios)
   id1002       --> id100201(Scrum) & id100202(KanBan) & id100203(Lean) & id100204(XP)
   id100201     --> id10020101(Papéis) & id10020102(Eventos) & id10020103(Artefatos)
   id1004       --> id100401(Azure DevOps) & id100402(Trello)
   id1005       --> id100501(DORA) & id100502(Agile Fluency Model) & id100503(Evidence-Based Management) & id100504(SPACE) & id100505(Four Key Metrics) & id100506(Code Quality)
```
#### Observabilidade
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
#### Documentação
```mermaid
flowchart TD
id12(Documentação) --> id1201(Markdown) & id1202(CSS) & id1203(HTML) & id1204(JavaScript)  & id1205(Static Site</br>Generators)
id1205 --> id120501(MkDocs) & id120502(Hugo) & id120503(Jekyll) & id120504(Gatsby)
```
