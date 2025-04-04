## Introdução
Este guia abrangente visa equipá-lo com o conhecimento e as habilidades necessárias para aproveitar o poder do GitHub Actions de forma eficaz.

O GitHub Actions é um serviço CI/CD (Integração Contínua/Implantação Contínua) versátil, poderoso e totalmente integrado que permite automatizar várias tarefas e processos dentro do seu ciclo de vida de desenvolvimento de software.

Neste capítulo introdutório, fornecerei uma visão geral do GitHub Actions, seus principais recursos e os benefícios de adotá-lo em seu fluxo de trabalho de desenvolvimento.

Também abordaremos alguns casos de uso e cenários comuns em que o GitHub Actions pode agilizar seu processo de desenvolvimento de software, melhorando a eficiência e reduzindo o erro humano.

Ao final, você terá uma sólida compreensão dos conceitos fundamentais por trás do GitHub Actions e uma perspectiva clara sobre como ele pode beneficiar seus projetos de desenvolvimento.

Esta base preparará o cenário para a exploração aprofundada do GitHub Actions nos capítulos subsequentes, onde nos aprofundaremos em tópicos mais avançados e implementações práticas.

| **Aspecto**                | **Continuous Integration (CI)**                                  | **Continuous Delivery (CD)**                                       | **Continuous Deployment (CD)**                                        |
|----------------------------|------------------------------------------------------------------|--------------------------------------------------------------------|-----------------------------------------------------------------------|
| **Objetivo**                | Integrar e testar código frequentemente para detectar erros cedo | Garantir que o código esteja sempre pronto para ser liberado       | Automatizar a liberação do código diretamente para produção          |
| **Frequência de Deploy**    | Nenhum deploy automático; apenas integração e testes contínuos  | Deploy manual para produção, mas o código está sempre pronto      | Deploy automático em produção após testes e validações automáticas   |
| **Ação Manual**             | Não envolve deploy ou release manual                            | A liberação para produção é manual ou por aprovação                | Nenhuma ação manual; o deploy ocorre automaticamente para produção   |
| **Ponto de Feedback**       | Feedback imediato após integração e testes unitários             | Feedback contínuo com a garantia de que o código está pronto para produção | Feedback rápido com liberação contínua após aprovação de testes      |
| **Exemplo de Ferramentas**  | Jenkins, Travis CI, CircleCI, GitLab CI                          | Jenkins, Spinnaker, GitLab CI, Bamboo                               | Jenkins, CircleCI, GitLab CI, AWS CodePipeline                        |
| **Benefício Principal**     | Identificação precoce de problemas de integração e qualidade do código | Liberação mais rápida e controlada para produção, com menos risco de falhas | Entrega contínua, com mudanças sendo rapidamente disponibilizadas para os usuários |
| **Foco**                    | Automatizar testes e integração de código                       | Garantir que o código esteja pronto para produção a qualquer momento | Automatizar todo o processo, incluindo o deploy em produção          |
| **Exemplo de Workflow**     | Desenvolvedor envia código → Testes e integração contínuos      | Código aprovado → Pré-produção → Aprovação manual → Deploy em produção | Código aprovado → Deploy automático em produção                       |

```mermaid
sequenceDiagram
    participant Delivery as Delivery Team
    participant VersionControl as Version Control
    participant BuildTest as Build & Unit Test
    participant AutoAcceptTest as Automated Acceptance Test
    participant UserAcceptTest as User Acceptance Test
    participant Release as Release

    %% Continuous Integration (CI)
    Delivery->>VersionControl: Check-in de código
    VersionControl->>BuildTest: Trigger de Build & Unit Test
    BuildTest->>VersionControl: Feedback de Build & Unit Test (sucesso ou falha)
    alt Sucesso no Build
        BuildTest->>AutoAcceptTest: Trigger para Automated Acceptance Test
        AutoAcceptTest->>BuildTest: Feedback de Automated Acceptance Test (sucesso ou falha)
        alt Sucesso nos Testes Automatizados
            %% Continuous Delivery (CD)
            AutoAcceptTest->>UserAcceptTest: Trigger para User Acceptance Test
            UserAcceptTest->>AutoAcceptTest: Feedback de User Acceptance Test (sucesso ou falha)
            alt Sucesso nos Testes de Aceitação do Usuário
                %% Continuous Deployment (CD)
                UserAcceptTest->>Release: Trigger para Release
                Release->>UserAcceptTest: Feedback de Release (sucesso ou falha)
            else Falha nos Testes de Aceitação do Usuário
                UserAcceptTest->>Delivery: Feedback de falha
            end
        else Falha nos Testes Automatizados
            AutoAcceptTest->>Delivery: Feedback de falha
        end
    else Falha no Build
        BuildTest->>Delivery: Feedback de falha
    end
```

## O que são GitHub Actions?
O GitHub Actions é uma plataforma de automação poderosa integrada ao ecossistema GitHub que permite aos desenvolvedores criar, compartilhar e reutilizar fluxos de trabalho personalizados para automatizar tarefas em seus processos de desenvolvimento de software.

Esta plataforma rica em recursos oferece uma maneira versátil e flexível de definir e executar tarefas, incluindo integração contínua (CI), implantação contínua (CD), teste de código, linting, gerenciamento de problemas e muito mais.

O GitHub Actions simplifica o processo de automatização de fluxos de trabalho ao fornecer um ambiente onde essas tarefas podem ser configuradas e executadas diretamente em seus repositórios GitHub.

Em sua essência, o GitHub Actions usa uma série de **fluxos de trabalho orientados a eventos** para executar tarefas em resposta a gatilhos específicos.

Esses fluxos de trabalho são definidos usando **arquivos YAML**, que são armazenados em um diretório especial dentro do seu repositório **(.github/workflows/)**.

Cada arquivo de fluxo de trabalho consiste em um conjunto de instruções que definem as condições sob as quais o fluxo de trabalho deve ser executado (o gatilho), as tarefas ou "ações" a serem executadas e o ambiente de execução para essas ações.

O GitHub Actions pode ser acionado por vários eventos do GitHub, como enviar código para um repositório, abrir uma solicitação de pull, criar um problema ou até mesmo em uma base programada.

Um dos principais pontos fortes do GitHub Actions é seu design modular.

As ACTIONS **podem ser criadas e compartilhadas** como componentes individuais e reutilizáveis que podem ser facilmente integrados aos seus fluxos de trabalho.

Você pode usar ações pré-construídas fornecidas pelo GitHub, criar suas próprias ações personalizadas ou aproveitar as ações contribuídas pela comunidade disponíveis no GitHub Actions Marketplace.

Essa abordagem modular permite que os desenvolvedores criem fluxos de trabalho sofisticados combinando várias ações de maneira lógica e simplificada, resultando em maior produtividade e eficiência.

O GitHub Actions oferece uma variedade de "executores" predefinidos que servem como ambientes de execução para seus fluxos de trabalho.

Os executores são essencialmente máquinas virtuais que podem ser executadas no Linux, macOS ou Windows, permitindo que você execute seus fluxos de trabalho na plataforma de sua escolha.

O GitHub fornece executores hospedados e gratuitos para repositórios públicos, enquanto repositórios privados recebem uma certa quantidade de uso gratuito a cada mês, com a opção de comprar minutos adicionais, se necessário.

Você também pode escolher hospedar seus próprios executores autogerenciados se precisar de mais controle sobre o ambiente de execução ou precisar cumprir com requisitos de segurança específicos.

Uma das principais vantagens do **GitHub Actions é sua integração perfeita com o ecossistema do GitHub**.

Como ele é construído diretamente na plataforma, não há necessidade de configurar serviços externos ou lidar com chaves de API e outras credenciais. Essa integração estreita com o GitHub permite que os desenvolvedores criem fluxos de trabalho eficientes que automatizam tarefas, como construir e implantar código, executar testes e gerenciar problemas, diretamente na interface familiar do GitHub.

Além disso, o GitHub Actions Marketplace oferece uma ampla gama de ações contribuídas pela comunidade que podem ser facilmente integradas aos seus fluxos de trabalho, fornecendo acesso a uma biblioteca crescente de componentes reutilizáveis.

O GitHub Actions também fornece amplo suporte para personalizar a execução de fluxos de trabalho. Isso inclui a capacidade de controlar o fluxo de tarefas usando instruções condicionais, criar caminhos de execução paralelos e gerenciar dependências entre trabalhos.

Além disso, você pode usar variáveis de ambiente e segredos para armazenar com segurança dados confidenciais e passá-los entre ações, garantindo que seus fluxos de trabalho permaneçam seguros e suas informações confidenciais permaneçam protegidas.

Em resumo, o GitHub Actions é uma plataforma de automação poderosa e flexível que permite que os desenvolvedores criem, compartilhem e reutilizem fluxos de trabalho personalizados para automatizar uma ampla gama de tarefas dentro do processo de desenvolvimento de software.

Sua natureza orientada a eventos, design modular, integração perfeita com o ecossistema GitHub e opções de personalização extensivas o tornam uma ferramenta essencial para equipes modernas de desenvolvimento de software.

Nas seções a seguir, vamos nos aprofundar nos vários recursos e capacidades do GitHub Actions, fornecendo a você o conhecimento e as habilidades necessárias para aproveitar todo o seu potencial e otimizar seus fluxos de trabalho de desenvolvimento de software.

```mermaid
sequenceDiagram
    participant Board as Azure DevOps - Board
    participant Dev as Developer - Git
    participant DetectSecrets as Pre-Commit - Detect-Secrets
    participant SBOM as SBOM-Scan - OSV-Scanner
    participant SAST as SAST
    participant UnitTest as Unit Test
    participant DockerfileScan as Dockerfile Scan
    participant Build as Build
    participant ImageScan as Container Image Scan
    participant ContainerTest as Container Validation Test
    participant ContainerSigning as Container Signing
    participant K8ManifestScan as K8-Manifest-Scan
    participant K8CISScan as K8-CIS Scan
    participant Deploy as Deploy
    participant SmokeTest as Smoke Test
    participant DAST as DAST

    Board->>Dev: Criar tarefas no board
    Dev->>DetectSecrets: Commit do código
    DetectSecrets->>Dev: Detecta segredos no código?
    alt Falha
        DetectSecrets->>Board: Criar ticket de bug
        Board->>Dev: Corrigir segredos e reexecutar
    else Sucesso
        Dev->>SBOM: Executar SBOM Scan (OSV-Scanner)
        SBOM->>Dev: Vulnerabilidades nas dependências?
        alt Falha
            SBOM->>Board: Criar ticket de bug
            Board->>Dev: Corrigir dependências e reexecutar
        else Sucesso
            Dev->>SAST: Executar SAST
            SAST->>Dev: Vulnerabilidades no código?
            alt Falha
                SAST->>Board: Criar ticket de bug
                Board->>Dev: Corrigir código e reexecutar
            else Sucesso
                Dev->>UnitTest: Executar testes unitários
                UnitTest->>Dev: Testes unitários falharam?
                alt Falha
                    UnitTest->>Board: Criar ticket de bug
                    Board->>Dev: Corrigir falhas e reexecutar
                else Sucesso
                    Dev->>DockerfileScan: Escanear Dockerfile
                    DockerfileScan->>Dev: Dockerfile seguro?
                    alt Falha
                        DockerfileScan->>Board: Criar ticket de bug
                        Board->>Dev: Corrigir Dockerfile e reexecutar
                    else Sucesso
                        Dev->>Build: Build da aplicação
                        Build->>Dev: Build bem-sucedido?
                        alt Falha
                            Build->>Board: Criar ticket de bug
                            Board->>Dev: Corrigir build e reexecutar
                        else Sucesso
                            Dev->>ImageScan: Escanear imagem do contêiner
                            ImageScan->>Dev: Imagem de contêiner segura?
                            alt Falha
                                ImageScan->>Board: Criar ticket de bug
                                Board->>Dev: Corrigir imagem e reexecutar
                            else Sucesso
                                Dev->>ContainerTest: Validar contêiner
                                ContainerTest->>Dev: Contêiner validado?
                                alt Falha
                                    ContainerTest->>Board: Criar ticket de bug
                                    Board->>Dev: Corrigir validação e reexecutar
                                else Sucesso
                                    Dev->>ContainerSigning: Assinar contêiner
                                    ContainerSigning->>Dev: Contêiner assinado?
                                    alt Falha
                                        ContainerSigning->>Board: Criar ticket de bug
                                        Board->>Dev: Corrigir assinatura e reexecutar
                                    else Sucesso
                                        Dev->>K8ManifestScan: Escanear manifesto do Kubernetes
                                        K8ManifestScan->>Dev: Manifests seguros?
                                        alt Falha
                                            K8ManifestScan->>Board: Criar ticket de bug
                                            Board->>Dev: Corrigir manifesto e reexecutar
                                        else Sucesso
                                            Dev->>K8CISScan: Escanear Kubernetes com CIS Scan
                                            K8CISScan->>Dev: Conformidade com CIS?
                                            alt Falha
                                                K8CISScan->>Board: Criar ticket de bug
                                                Board->>Dev: Corrigir CIS e reexecutar
                                            else Sucesso
                                                Dev->>Deploy: Implantar aplicação
                                                Deploy->>Dev: Deploy bem-sucedido?
                                                alt Falha
                                                    Deploy->>Board: Criar ticket de bug
                                                    Board->>Dev: Corrigir deploy e reexecutar
                                                else Sucesso
                                                    Dev->>SmokeTest: Executar smoke test
                                                    SmokeTest->>Dev: Smoke test passou?
                                                    alt Falha
                                                        SmokeTest->>Board: Criar ticket de bug
                                                        Board->>Dev: Corrigir falha e reexecutar
                                                    else Sucesso
                                                        Dev->>DAST: Executar DAST
                                                        DAST->>Dev: DAST passou?
                                                        alt Falha
                                                            DAST->>Board: Criar ticket de bug
                                                            Board->>Dev: Corrigir falha de DAST e reexecutar
                                                        else Sucesso
                                                            Dev->>Board: Task concluída com sucesso
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
```
## Introdução
Automatize quase tudo e mantenha tudo o que você precisa para construir, implantar, testar e liberar seu aplicativo no controle de versão.
## GitHub Actions
GitHub Actions é uma plataforma de integração contínua e entrega contínua (CI/CD) que permite automatizar a sua compilação, testar e pipeline de implantação.

GitHub Actions vai além de apenas DevOps e permite que você execute fluxos de trabalho quando outros eventos ocorrerem no seu repositório.

GitHub fornece máquinas virtuais do Linux, Windows e macOS para executar seus fluxos de trabalho, ou você pode hospedar seus próprios executores auto-hospedados na sua própria infraestrutura de dados ou na nuvem.

![](img/github-actions-diagram.png){width="600" height="450" style="display: block; margin: 0 auto"}

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

#### Planos e Preços

<div class="center-table" markdown>
| Planejar	                         | Armazenamento | Minutos (por mês) |
| ------                            | ----:         | ----:             |
| GitHub Free	                      | 500 MB        | 2.000             |
| GitHub Pro	                       | 1 GB          | 3.000             |
| GitHub Free para organizações	    | 500 MB        | 2.000             |
| GitHub Team	                      | 2 GB	         | 3.000             |
| GitHub Enterprise Cloud	          | 50 GB	        | 50.000            |
</div>

<div class="center-table" markdown>
| Sistema Operacional |  Multiplicador de minutos | Taxa por minuto (USD) |
| ----                | -----:                    | -----:                |
| Linux               | 1                         |  0,008                |
| MacOs               | 10                        | 0,008                 |
| Windows             | 2                         | 0,016                 |
</div>

Observação: Eles só podem funcionar quando executados pelo mecanismo do GitHub.

![](img/github-actions-001.png){width="600" height="450" style="display: block; margin: 0 auto"}

## Por que usar o GitHub Actions?
À medida que as práticas de desenvolvimento de software continuam a evoluir, a automação se tornou cada vez mais crítica para melhorar a eficiência, reduzir erros e agilizar processos.

O GitHub Actions oferece uma solução poderosa e flexível para automatizar vários aspectos dos fluxos de trabalho de desenvolvimento de software, tornando-o uma ferramenta essencial para equipes de desenvolvimento modernas.

Discutiremos os principais motivos pelos quais desenvolvedores e organizações devem considerar o uso do GitHub Actions.

### Integração perfeita com o GitHub
O GitHub Actions é fortemente integrado à plataforma GitHub, facilitando para os desenvolvedores criar e gerenciar fluxos de trabalho de automação dentro de seus repositórios existentes.

Essa integração perfeita elimina a necessidade de configurar e manter ferramentas externas, garantindo uma experiência suave e coesa.

Ao aproveitar o ecossistema do GitHub, os desenvolvedores podem aproveitar recursos nativos, como regras de proteção de ramificações, solicitações de pull e rastreamento de problemas, para criar fluxos de trabalho mais eficazes e eficientes.

## Arquitetura orientada a eventos:
O GitHub Actions emprega uma **arquitetura orientada a eventos**, permitindo que os fluxos de trabalho sejam acionados por uma ampla gama de eventos dentro da plataforma GitHub. Isso inclui eventos comuns, como push de código, abertura de pull requests e criação de problemas, bem como eventos agendados e acionadores manuais.

Essa flexibilidade permite que os desenvolvedores criem fluxos de trabalho altamente responsivos que executam tarefas automaticamente em resposta a ações específicas, agilizando o processo de desenvolvimento e reduzindo o potencial de erro humano.

### Tarefa comuns de eventos
- [x] Adicionar novos colaboradores;
- [x] Fechar problemas obsoletos e PRS;
- [x] Solicitação de pull;
- [x] Tarefas organizacionais: Problema criado por usuários;
- [x] Rotular o problema {menor, maior, reproduzível, prioritário etc.};
- [x] Corrigir o problema e levantar um PR;
- [x] Verificar PR e mesclar o código ao principal;
- [x] Nova versão com uma nova versão;
- [x] Construir pipeline para testar e construir código;

### Os eventos podem ser
- [x] Trigger Events
- [x] Schedule Events
- [x] Manually Triggers

**Observação**: É recomendado a colocação workflow_dispatch: durante o processo de desenvolvimento do workflow.

## Ações modulares e reutilizáveis:
Um dos principais pontos fortes do GitHub Actions é sua modularidade.

As ações podem ser criadas e compartilhadas como componentes individuais e reutilizáveis que podem ser facilmente integrados aos fluxos de trabalho. Os desenvolvedores podem escolher entre uma vasta biblioteca de ações pré-construídas fornecidas pelo GitHub, criar suas próprias ações personalizadas ou aproveitar ações contribuídas pela comunidade do GitHub Actions Marketplace.

Essa abordagem modular permite que os desenvolvedores criem fluxos de trabalho sofisticados combinando várias ações de maneira lógica e simplificada, aumentando, em última análise, a produtividade e a eficiência.

### Cross-platform support:
O GitHub Actions fornece suporte multiplataforma, permitindo que os fluxos de trabalho sejam executados em diferentes sistemas operacionais, incluindo **Linux, macOS e Windows**.

Isso permite que os desenvolvedores testem e implantem seus aplicativos em várias plataformas, garantindo compatibilidade e desempenho.

Com suporte para uma variedade de linguagens e estruturas, o GitHub Actions oferece uma solução versátil para diversos ambientes de desenvolvimento.

### Amplas opções de personalização:
O GitHub Actions oferece uma ampla gama de opções de personalização para definir e executar fluxos de trabalho.

Isso inclui a capacidade de controlar o fluxo de tarefas usando instruções condicionais, criar caminhos de execução paralelos e gerenciar dependências entre trabalhos.

Além disso, os desenvolvedores podem usar variáveis de ambiente e segredos para armazenar dados confidenciais com segurança e passá-los entre ações.

Essas opções de personalização permitem que os desenvolvedores criem fluxos de trabalho personalizados que atendam às suas necessidades e requisitos específicos.

### Integração Contínua (CI) e Implantação Contínua (CD):
Implementar práticas de CI e CD é essencial para equipes de desenvolvimento modernas, pois ajuda a garantir a qualidade do código, reduzir erros e acelerar o ciclo de lançamento.

O GitHub Actions simplifica o processo de configuração de pipelines de CI/CD ao fornecer um ambiente onde tarefas como construção, teste e implantação podem ser configuradas e executadas diretamente em seus repositórios do GitHub.

Com suporte integrado para ferramentas e serviços populares de CI/CD, os desenvolvedores podem facilmente criar pipelines eficientes e robustos que automatizam aspectos-chave de seu processo de desenvolvimento.

## Escalabilidade e desempenho:
O GitHub Actions foi projetado para escalar com suas necessidades de desenvolvimento, oferecendo uma solução flexível e de alto desempenho para automação. **Ao utilizar os recursos de paralelismo e construção de matriz, os desenvolvedores podem otimizar seus fluxos de trabalho para velocidade e eficiência**.

O GitHub também fornece executores hospedados que são automaticamente escalados e mantidos, garantindo que seus fluxos de trabalho sejam executados de forma suave e confiável, mesmo que seus projetos cresçam em tamanho e complexidade.

## Segurança e conformidade:
A segurança é uma consideração crítica para qualquer processo de desenvolvimento, e o GitHub Actions fornece uma variedade de recursos para ajudar a garantir a segurança e a conformidade dos seus fluxos de trabalho.

Isso inclui a **capacidade de armazenar dados confidenciais com segurança usando segredos, gerenciar o controle de acesso usando permissões de repositório e monitorar e auditar atividades usando as ferramentas de registro e relatórios integradas do GitHub**.

Para **organizações com requisitos de segurança rigorosos, os executores auto-hospedados podem ser empregados para manter o controle total sobre o ambiente de execução** e garantir a conformidade com as políticas e regulamentações internas.

### Comunidade e ecossistema:
O GitHub Actions se beneficia de uma comunidade grande e ativa de desenvolvedores que contribuem para o GitHub Actions Marketplace, fornecendo uma riqueza de ações pré-construídas para várias tarefas e integrações com serviços de terceiros.

Este ecossistema orientado pela comunidade permite que os desenvolvedores encontrem e utilizem rapidamente ações que podem simplificar seus fluxos de trabalho, economizando tempo e esforço.

Além disso, a natureza colaborativa da plataforma incentiva o compartilhamento de conhecimento e as melhores práticas, fomentando uma cultura de melhoria e inovação contínuas.

### Custo-efetividade:
O GitHub Actions oferece uma solução econômica para automação, especialmente para projetos de código aberto e equipes pequenas.

Repositórios públicos podem usar o GitHub Actions gratuitamente, enquanto repositórios privados recebem uma certa quantidade de uso gratuito a cada mês, com a opção de comprar minutos adicionais, se necessário.

Este modelo de preços de pagamento conforme o uso garante que os desenvolvedores paguem apenas pelos recursos que usam, tornando-o uma escolha atraente para projetos de todos os tamanhos. Concluindo, o GitHub Actions fornece uma solução poderosa, flexível e integrada para automatizar vários aspectos dos fluxos de trabalho de desenvolvimento de software.

Ao alavancar sua arquitetura orientada a eventos, design modular, suporte multiplataforma e opções de personalização extensivas, os desenvolvedores podem criar fluxos de trabalho de automação personalizados que melhoram a eficiência, reduzem erros e simplificam processos.

O suporte da plataforma para CI/CD, recursos de segurança e preços econômicos a tornam uma ferramenta essencial para equipes de desenvolvimento modernas, enquanto sua comunidade ativa e ecossistema próspero garantem que os desenvolvedores tenham acesso a uma riqueza de recursos e melhores práticas.

Ao adotar o GitHub Actions, as equipes de desenvolvimento podem se concentrar em entregar software de alta qualidade de forma mais rápida e confiável, impulsionando, em última análise, a inovação e o sucesso.

### Ações do GitHub vs. Outras ferramentas de CI/CD
No mundo do desenvolvimento de software, há inúmeras ferramentas de Integração Contínua e Implantação Contínua (CI/CD) disponíveis, cada uma com seus próprios recursos e capacidades exclusivos.

Nesta seção, compararemos o GitHub Actions com algumas das ferramentas populares de CI/CD no mercado, destacando suas principais diferenças, pontos fortes e fracos para ajudar você a tomar uma decisão informada ao escolher a ferramenta certa para suas necessidades.

#### Jenkins:
Jenkins é uma ferramenta de CI/CD de código aberto e auto-hospedada que tem sido uma favorita de longa data entre os desenvolvedores devido ao seu amplo ecossistema de plugins e flexibilidade.

Jenkins permite que os desenvolvedores criem pipelines personalizados usando uma linguagem de script chamada Groovy ou por meio de pipelines declarativos usando uma linguagem específica de domínio. Principais diferenças:

- [X] GitHub Actions é um serviço totalmente gerenciado e baseado em nuvem, enquanto Jenkins é uma solução auto-hospedada que requer configuração e manutenção manuais.
- [X] GitHub Actions oferece integração perfeita com a plataforma GitHub, enquanto Jenkins requer configuração e instalação adicionais para trabalhar com seus repositórios.
- [X] Jenkins tem uma curva de aprendizado mais íngreme devido ao uso de Groovy ou uma linguagem específica de domínio para configuração de pipeline, enquanto GitHub Actions depende de arquivos YAML, que geralmente são mais fáceis de ler e escrever.
- [X] Jenkins tem um vasto ecossistema de plugins, mas GitHub Actions se beneficia de um mercado crescente de ações reutilizáveis e contribuições da comunidade.

### GitLab CI/CD:
GitLab CI/CD é uma solução CI/CD integrada fornecida pelo GitLab, uma alternativa popular ao GitHub.

- [X] O GitLab CI/CD é fortemente integrado à plataforma GitLab e permite que os desenvolvedores criem pipelines usando arquivos YAML, semelhante ao GitHub Actions.
- [X] O GitHub Actions faz parte do ecossistema GitHub, enquanto o GitLab CI/CD é exclusivo do GitLab.
- [X] Ambas as plataformas oferecem integração perfeita com seus respectivos serviços de hospedagem de repositórios, tornando a escolha entre os dois amplamente dependente da sua plataforma preferida.
- [X] O GitHub Actions e o GitLab CI/CD têm abordagens de configuração semelhantes usando arquivos YAML, tornando-os relativamente fáceis de aprender e usar.
- [X] O GitLab oferece um conjunto mais abrangente de recursos integrados, incluindo registros de contêineres integrados e armazenamento de artefatos, enquanto o GitHub Actions depende de serviços externos para essas funcionalidades.

### CircleCI:
CircleCI é um serviço de CI/CD baseado em nuvem que fornece uma plataforma altamente configurável e flexível para automatizar fluxos de trabalho de desenvolvimento.

CircleCI suporta uma ampla gama de linguagens de programação e frameworks, e sua configuração de pipeline também é baseada em arquivos YAML.

- [x] O GitHub Actions é integrado diretamente à plataforma GitHub, enquanto o CircleCI é um serviço separado que requer instalação e configuração adicionais.
- [x] O CircleCI fornece uma plataforma altamente otimizada e orientada para o desempenho, com recursos como paralelismo e mecanismos avançados de cache, enquanto o GitHub Actions oferece recursos semelhantes, mas pode exigir mais otimização manual.
- [x] O CircleCI tem um sistema de permissões mais avançado e granular para gerenciar o controle de acesso, enquanto o GitHub Actions depende do sistema de permissões do repositório GitHub.
- [X] Ambas as plataformas oferecem suporte a uma ampla variedade de linguagens, estruturas e plataformas, tornando-as adequadas para diversos ambientes de desenvolvimento.

### Travis CI:
O Travis CI é um serviço de CI/CD baseado em nuvem que tem sido popular entre projetos de código aberto devido à sua simplicidade e facilidade de uso. O Travis CI suporta uma ampla gama de linguagens e plataformas e usa arquivos YAML para configuração de pipeline.

- [X] O GitHub Actions é integrado à plataforma GitHub, enquanto o Travis CI é um serviço externo que requer configuração e integração adicionais.
- [X] O Travis CI tem uma abordagem mais simples e otimizada para configuração de pipeline, facilitando a configuração de fluxos de trabalho básicos, enquanto o GitHub Actions oferece opções de personalização mais avançadas e modularidade.
- [X] O GitHub Actions se beneficia de um mercado crescente de ações reutilizáveis, enquanto o Travis CI depende de um conjunto mais limitado de recursos e integrações integrados.
- [X] O Travis CI recentemente mudou seu foco de projetos de código aberto, limitando sua oferta gratuita e tornando-o menos atraente para desenvolvedores de código aberto, enquanto o GitHub Actions continua a oferecer uso gratuito para repositórios públicos.

### Azure Pipelines:
O Azure Pipelines é um serviço de CI/CD baseado em nuvem oferecido pela Microsoft como parte do pacote Azure DevOps.

Ele oferece suporte a uma ampla variedade de linguagens, frameworks e plataformas, e sua configuração de pipeline é baseada em arquivos YAML, semelhante ao GitHub Actions.

- [x] O GitHub Actions é integrado nativamente à plataforma GitHub, enquanto o Azure Pipelines faz parte do conjunto Azure DevOps, exigindo configuração e instalação adicionais.
- [x] O Azure Pipelines fornece integração perfeita com outros serviços do Azure DevOps, como Azure Repos, Azure Boards e Azure Artifacts, tornando-o uma solução mais abrangente para organizações que usam o ecossistema Azure DevOps.
- [x] Ambas as plataformas oferecem uma ampla gama de opções de personalização e suporte para diversos ambientes de desenvolvimento, mas o GitHub Actions se beneficia de um mercado crescente de ações reutilizáveis e contribuições da comunidade.
- [x] O Azure Pipelines fornece limites de uso gratuito mais generosos para repositórios privados em comparação ao GitHub Actions, tornando-o uma opção atraente para equipes menores e projetos com orçamentos limitados.

Concluindo, o GitHub Actions é uma ferramenta de CI/CD poderosa e flexível que oferece integração perfeita com a plataforma GitHub, uma arquitetura orientada a eventos e um design modular que permite que os desenvolvedores criem fluxos de trabalho de automação personalizados.

Embora outras ferramentas de CI/CD, como Jenkins, GitLab CI/CD, CircleCI, Travis CI e Azure Pipelines tenham seus próprios recursos e pontos fortes exclusivos, a escolha depende, em última análise, de fatores como sua plataforma de hospedagem de repositório preferida, requisitos de integração, necessidades de personalização e restrições de orçamento.

Ao entender as principais diferenças entre o GitHub Actions e outras ferramentas de CI/CD, você pode tomar uma decisão informada sobre a melhor solução para seus fluxos de trabalho de desenvolvimento.

Independentemente da sua escolha, adotar uma ferramenta de CI/CD é essencial para equipes modernas de desenvolvimento de software, pois ajuda a garantir a qualidade do código, reduzir erros e acelerar o ciclo de lançamento, impulsionando, em última análise, a inovação e o sucesso.

### Introdução ao GitHub Actions
Neste capítulo, nós o guiaremos pelos primeiros passos do uso do GitHub Actions em seus projetos. Começaremos apresentando os blocos de construção básicos de um fluxo de trabalho do GitHub Actions, que incluem sintaxe YAML, arquivos de fluxo de trabalho e vários gatilhos de eventos.

Ao entender esses conceitos fundamentais, você estará bem preparado para criar e personalizar seus próprios fluxos de trabalho.

Em seguida, nós o guiaremos pela configuração do seu primeiro fluxo de trabalho, desde a criação de um arquivo de fluxo de trabalho até a definição dos trabalhos e etapas necessários.

Essa abordagem prática ajudará você a ganhar experiência prática com a interface e a estrutura do fluxo de trabalho do GitHub Actions.

Além disso, discutiremos contextos e expressões essenciais do GitHub Actions, que permitirão que você crie fluxos de trabalho dinâmicos e condicionais adaptados às suas necessidades específicas.

Essas ferramentas são cruciais para otimizar seus fluxos de trabalho e garantir que eles respondam efetivamente a vários eventos e circunstâncias.

Ao final deste capítulo, você terá uma compreensão sólida dos conceitos básicos do GitHub Actions e estará pronto para implementar fluxos de trabalho simples em seus projetos de desenvolvimento.

Com essa base, você estará bem equipado para explorar recursos e técnicas mais avançados nos capítulos subsequentes.

### Configurando seu primeiro fluxo de trabalho do GitHub Actions
Agora que cobrimos os fundamentos do GitHub Actions e discutimos seus benefícios e como ele se compara a outras ferramentas de CI/CD, é hora de mergulhar na criação do seu primeiro fluxo de trabalho.

Nesta seção, guiaremos você pelo processo de configuração de um fluxo de trabalho básico do GitHub Actions para automatizar a construção e o teste de um projeto de amostra.

### Crie um novo repositório no GitHub:
Antes de começar, crie um novo repositório no GitHub (se você ainda não tiver um) para hospedar seu projeto. Este repositório servirá como base para seu fluxo de trabalho do GitHub Actions.

Certifique-se de ter inicializado o repositório com um arquivo README e adicionado seus arquivos de projeto.

#### Adicionar um arquivo de fluxo de trabalho:
Os fluxos de trabalho do GitHub Actions são definidos usando arquivos YAML armazenados no diretório `.github/workflows` dentro do seu repositório.

Para criar seu primeiro fluxo de trabalho, siga estas etapas:

- [X] No seu repositório, navegue até a aba "Ações".
- [X] Clique no botão "Novo fluxo de trabalho".
- [X] O GitHub fornece vários modelos de fluxo de trabalho para você escolher. Você pode usar um desses modelos como ponto de partida ou criar um novo fluxo de trabalho do zero clicando em "Configurar um fluxo de trabalho você mesmo".
- [X] Isso criará um novo arquivo YAML no diretório .github/workflows. Dê ao seu arquivo de fluxo de trabalho um nome descritivo, como build-and-test.yml.

Fluxos de trabalho **reutilizáveis** permitem que você reutilize um fluxo de trabalho inteiro, incluindo todas as suas tarefas e etapas.

<div class="center-table" markdown>
| Fluxos de trabalho reutilizáveis	| Ações compostas   |
| --------                          | ---------       |
| Um arquivo YAML, muito semelhante a qualquer arquivo de fluxo de trabalho padrão	                       | Uma ação que contém um pacote de etapas do fluxo de trabalho |
| Cada fluxo de trabalho reutilizável é um único arquivo no diretório .github/workflows de um repositório | Cada ação composta é um repositório, ou um diretório, separado contendo um arquivo action.yml e, opcionalmente, outros arquivos |
| Chamada feita referenciando um arquivo YAML específico                                                   | Chamada feita referenciando um repositório ou diretório no qual a ação está definida |
| Chamada feita diretamente em uma tarefa, não em uma etapa	| Execução feita como uma etapa dentro de uma tarefa |
| Pode conter várias tarefas                                                                               | Não contém tarefas |
| Cada etapa é registrada em tempo real	                                                                   | Registro como uma etapa, mesmo que contenha várias etapas |
| Pode conectar um máximo de quatro níveis de fluxos de trabalho                                           | O aninhamento pode ser feito para ter até 10 ações compostas em um único fluxo de trabalho |
| Pode usar segredos	                                                                                   | Não pode usar segredos
</div>

Os fluxos de trabalho são os scripts ou pipelines que controlam o fluxo e a sequência de atividades no GitHub Actions.

As ações individuais são as funções que podem ser chamadas para fazer tarefas direcionadas de dentro dos fluxos de trabalho (como verificar o código).

#### Visão Geral
Algum evento de disparo acontece em um repositório GitHub, ser um evento no GitHub que não é uma atualização para uma ref.

Um diretório dedicado no repositório **(.github/ workflows)** é pesquisado para arquivos de fluxo de trabalho que são codificados para responder ao tipo de evento.

Os fluxos de trabalho correspondentes são identificados e novas execuções dos fluxos de trabalho correspondentes

A sintaxe `cron` tem cinco campos separados por um espaço, e cada campo representa uma unidade de tempo.

As variáveis de ambiente padrão definidas pelo GitHub estão disponíveis em todas as etapas de um fluxo de trabalho.

![](img/github-actions-002a.png){width="600" height="450" style="display: block; margin: 0 auto"}

#### Defina os gatilhos do fluxo de trabalho
No seu novo arquivo YAML, comece definindo os eventos que devem disparar seu fluxo de trabalho. Para este exemplo, configuraremos o fluxo de trabalho para ser executado em cada solicitação push e pull para o branch principal.

Adicione as seguintes linhas ao seu arquivo de fluxo de trabalho:

```
 on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
```
#### Configure o ambiente do fluxo de trabalho
Em seguida, especifique o sistema operacional e o ambiente da linguagem de programação para seu fluxo de trabalho.

Neste exemplo, usaremos um ambiente baseado em Ubuntu com Node.js. Adicione as seguintes linhas ao seu arquivo de fluxo de trabalho:

```
jobs:
  build-and-test:
     runs-on: self-hosted
  steps:
```
#### Verifique seu repositório
Para acessar os arquivos do seu repositório dentro do fluxo de trabalho, você precisará verificar o repositório usando a ação actions/checkout.

Adicione as seguintes linhas ao seu arquivo de fluxo de trabalho:

```
- name: Checkout repository
  uses: actions/checkout@v4
```

#### Configure seu ambiente de linguagem de programação
Neste exemplo, estamos usando Node.js, então precisaremos configurar o ambiente Node.js usando a ação actions/setup-node.

Adicione as seguintes linhas ao seu arquivo de fluxo de trabalho:

```
- name: Set up Node.js
  uses: actions/setup-node@v4
  with:
   node-version: 14
```

### Instalar dependências e executar build
Com o ambiente configurado, agora você pode instalar as dependências do seu projeto e executar o processo de build.

Supondo que seu projeto use npm, adicione as seguintes linhas ao seu arquivo de fluxo de trabalho:

```
- name: Install dependencies
  run: npm ci
- name: Build project
  run: npm run build
```
### Executar Testes
Finalmente, adicione uma etapa para executar os testes do seu projeto usando o executor de testes de sua escolha.

Neste exemplo, usaremos o npm test. Adicione as seguintes linhas ao seu arquivo de fluxo de trabalho:

```
- name: Run tests
   run: npm test
```
### Salve e confirme o arquivo de fluxo de trabalho
Depois de terminar de configurar seu fluxo de trabalho, salve o arquivo YAML e confirme-o em seu repositório.

Isso habilitará automaticamente o fluxo de trabalho e ele será acionado com base nos eventos que você definiu.

Com esse fluxo de trabalho básico do GitHub Actions em vigor, seu projeto será criado e testado automaticamente em cada solicitação de push e pull para o branch principal.

Este é apenas o começo do que você pode fazer com o GitHub Actions, pois há muito mais opções de personalização e integrações disponíveis para ajudar a simplificar e automatizar seus processos de desenvolvimento.

Conforme você continua a explorar o GitHub Actions, você pode aproveitar o crescente mercado de ações reutilizáveis para expandir seus recursos de fluxo de trabalho, como implantar seu aplicativo em várias plataformas de hospedagem, enviar notificações e integrar com serviços de terceiros.

O design modular e a arquitetura orientada a eventos do GitHub Actions permitem que você crie fluxos de trabalho de automação personalizados que atendem às suas necessidades específicas, garantindo que seus processos de desenvolvimento sejam tão eficientes e simplificados quanto possível.

Nas seções a seguir, nos aprofundaremos nos recursos avançados e nas opções de personalização do GitHub Actions, ajudando você a desbloquear todo o seu potencial e transformar seus fluxos de trabalho de desenvolvimento de software.

### Entendendo a sintaxe YAML
Para trabalhar efetivamente com o GitHub Actions, é essencial entender a sintaxe YAML usada para definir fluxos de trabalho.

YAML, que significa "YAML Ain't Markup Language", é um formato de serialização de dados legível por humanos comumente usado para arquivos de configuração e troca de dados entre linguagens com diferentes estruturas de dados.

Abordarei os conceitos básicos da sintaxe YAML e forneceremos exemplos para ajudar você a entender melhor como escrever e manter seus arquivos de fluxo de trabalho do GitHub Actions.

Entender a sintaxe YAML é crucial para trabalhar efetivamente com o GitHub Actions, pois permite que você crie e mantenha fluxos de trabalho complexos e eficientes.

Ao dominar os diferentes aspectos do YAML, você pode escrever arquivos de fluxo de trabalho mais sustentáveis, legíveis e escaláveis, garantindo que seus processos de desenvolvimento sejam simplificados e otimizados.

Vamos nos aprofundar nos recursos avançados e opções de personalização do GitHub Actions, ajudando você a desbloquear todo o seu potencial e transformar seus fluxos de trabalho de desenvolvimento de software.

#### Estrutura básica
Os arquivos YAML usam recuo para representar a estrutura dos dados, semelhante a como linguagens de programação como Python usam espaços em branco.

Os blocos de construção básicos do YAML são escalares (strings, números e booleanos), sequências (matrizes ou listas) e mapeamentos (pares chave-valor ou dicionários).

YAML permite novas linhas significativas e recuo, semelhante ao Python, mas, ao contrário do Python, proíbe o uso de caracteres de tabulação literais para recuo.

Aqui está um exemplo simples da sintaxe YAML:

```
version: 1
  languages:
    - Python
    - JavaScript
    - Go

frameworks:
  Python:
    - Django
    - Flask
  JavaScript:
    - React
    - Vue
```

#### Escalares
Escalares são o tipo de dado mais simples em YAML e incluem strings, números e booleanos. Strings podem ser escritas com ou sem aspas, mas geralmente é melhor usar aspas ao lidar com caracteres especiais ou espaços em branco. Números podem ser escritos como inteiros ou valores de ponto flutuante. Booleanos são representados usando true e false.

Exemplo:

```
string: "Hello, World!"
integer: 42
float: 3.14
boolean: true
```
#### Sequências
Sequências são coleções ordenadas de itens, semelhantes a arrays ou listas em linguagens de programação. Em YAML, você pode representar uma sequência iniciando cada item em uma nova linha com um hífen seguido por um espaço.

Exemplo:

```
Languages:
   - Python
   - JavaScript
   - Go
```
#### Mappings
Mapeamentos representam pares chave-valor, semelhantes a dicionários ou mapas hash em linguagens de programação. Em YAML, você pode criar um mapeamento escrevendo a chave, seguida por dois pontos e um espaço, e então o valor.

Exemplo:

```
Frameworks:
   Python:
     Django
     JavaScript: React
     Go: Gin
```
### Estruturas de dados complexas
Você pode criar estruturas de dados mais complexas em YAML combinando sequências e mapeamentos. Por exemplo, você pode ter uma sequência de mapeamentos ou um mapeamento com sequências como valores.

Exemplo:

```
projects:
   - name: Project A
     language: Python
     frameworks:
       - Django
       - Flask
   - name: Project B
     language: JavaScript
     frameworks:
        - React
        - Vue
```

### [Anchors and aliases](https://github.com/actions/runner/issues/1182#issuecomment-2722005293)
YAML fornece uma maneira de reutilizar partes da sua configuração usando âncoras e aliases.

Uma âncora é definida adicionando `&` seguido por um nome exclusivo após um valor, enquanto um alias é referenciado usando seguido pelo nome da âncora.
Exemplo:

```
defaults: &default_setting
timeout: 10
retries: 3
Job_a:
<<: *default_settings
name: Job A
Job_b:
<<: *default_settings
name: Job B
```
#### Multi-line strings
YAML suporta strings multi-linha usando o caractere pipe '|' ou maior que '>'.

O caractere **pipe preserva novas linhas na string**, enquanto o caractere **maior que converte novas linhas em espaços**. Exemplo:

```
multiline_pipe: |
   This is a multi-line
   string with preserved
   Newlines.
multiline_gt: >
   This is a multi-line
   string with newlines
   converted to spaces.


# Este é um exemplo de um Workflow

name: 17-manual_teste_variavel_linha

on:
  workflow_dispatch:


# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "greet"
  greet:
    # The type of runner that the job will run on
    runs-on: [ self-hosted, linux ]

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
    # Runs a single command using the runners shell
    - name: Send greeting
      run: echo "Hello ${{ inputs.name }}"

    - name: Usando | para string multi-linha
      run: |
            echo "Esta é uma linha
            e aqui começa outra linha" > output10.txt

    - name: Redirecionando string para um arquivo com >
      run: |
          echo "Esta é a primeira linha
          Esta é a segunda linha
          Esta é a terceira linha" > output20.txt

    - name: Mostrar conteúdo do arquivo com >
      run: |
            cat output10.txt
            echo "--------------------------- Separando ----------------------"
            cat output20.txt
```

#### Comentários
Você pode adicionar **comentários** em arquivos YAML iniciando uma linha com o caractere `#`. Comentários podem ajudar a documentar sua configuração e facilitar para outros entenderem seu fluxo de trabalho. Exemplo:

```
# Este é um comentário em YAML
versão: 1 # Você também pode adicionar comentários inline
```

```
steps:
  - name: Show warning
    run: echo "::warning::Esta é uma mensagem de alerta importante"

  - name: Outras mensagens
    run: |
          echo "::notice::Mensagem informativa"     # Azul (padrãopara informações)
          echo "::warning::Mensagem de alerta"      # Amarelo(avisos)
          echo "::error::Mensagem de erro"          # Vermelho(erros críticos)
          echo "::debug::Mensagem de debug"         # Somentevisível com ativação de debug
          echo "::group::Título da seção"           # Inicia gruporecolhível
          echo " Teste da Seção"
          echo "::endgroup::"                       # Fecha grupo
          echo "::add-mask::valor_secreto"          # Mascaravalores sensíveis nos logs
          echo "::warning file=app.js,line=10,col=15::Erro desintaxe"  # Com localização
          echo "::notice title=TítuloCustomizado::Mensagem"            # Com título
```

**Observaçao**: Por uma questão de Markdown, optou-se em não deixar o comentário em uma única linha.

#### Variáveis de ambiente
Nos fluxos de trabalho do GitHub Actions, você pode usar variáveis de ambiente para armazenar e passar dados entre etapas. Para definir uma variável de ambiente, use a chave `env:` seguida pelo nome e valor da variável. Exemplo:

```
jobs:
  build:
    runs-on: self-hosted
    env:
      MY_VARIABLE: my_value
    steps:
      - name: Print environment variable
         run: echo $MY_VARIABLE
```
## Anatomia de um fluxo de trabalho de ações do GitHub
Para aproveitar totalmente os recursos do GitHub Actions, é essencial entender os diferentes componentes que compõem um fluxo de trabalho.

Dissecaremos a anatomia de um fluxo de trabalho do GitHub Actions, explicando cada elemento em detalhes e fornecendo exemplos para ajudar você a compreender sua função e uso.

### Workflow triggers
Os gatilhos de fluxo de trabalho definem os eventos que iniciam a execução de um fluxo de trabalho do GitHub Actions.

Você pode especificar vários eventos, como pushes, pull requests ou até mesmo eventos personalizados, para iniciar o fluxo de trabalho.

Os gatilhos são definidos usando a palavra-chave `on:`, seguida pelos nomes dos eventos e qualquer configuração adicional. Exemplo:

```
on:
  push:
    branches:
      - main
    pull_request:
      branches:
        - main
    schedule:
      - cron: '0 12 ***'
```

![](img/github-actions-workflow.png){width="600" height="450" style="display: block; margin: 0 auto"}

### [Categorias dos Fluxos de Trabalho](https://github.com/actions/starter-workflows)

<div class="center-table" markdown>
| Categoria           | Descrição |
| ----                | ----      |
| Automação           | Alguns exemplos simples de automação básica.  |
| Páginas             | Fluxos de trabalho para empacotar/implantar sites usando ferramentas comuns como Gatsby, Astro, Jekyll, etc. |
| Segurança           | Conjunto de fluxos de trabalho de varredura de código usando vários métodos de segurança plataformas e suas ferramentas.                     |
| Implantação         | Fluxos de trabalho de exemplo para criar objetos implantáveis (como contêineres) e, em seguida, implantá-los em várias plataformas de nuvem. |
| Integração Contínua | número de fluxos de trabalho que abrangem as áreas de construção, teste e/ou publicação para um grande número de diferentes programas linguagens e ferramentas. |
</div>

### Jobs
Um fluxo de trabalho consiste em um ou mais jobs, que são unidades individuais de trabalho que são executadas em paralelo por padrão. Os trabalhos são definidos usando a palavra-chave `jobs:`, seguida por um identificador exclusivo para cada trabalho e sua configuração. Exemplo:

```
jobs:
  build:
    runs-on: self-hosted
    steps:
      - name: Build project
        run: npm run build
  test:
    runs-on: self-hosted
    steps:
    - name: Run tests
      run: npm test
```

### Job dependencies
Por padrão, os trabalhos são executados em paralelo, mas você pode especificar dependências entre os trabalhos usando a palavra-chave `needs:`. Isso pode ser útil para criar fluxos de trabalho sequenciais em que certos trabalhos devem ser concluídos antes que outros possam começar. Exemplo:

```
jobs:
build:
  runs-on: self-hosted
  steps:
    - name: Build project
       run: npm run build
test:
  runs-on: self-hosted
  needs: build
  steps:
    - name: Run tests
      run: npm test
```

### Job environment
Cada trabalho é executado em um ambiente específico definido pela palavra-chave `runs-on:`, que especifica o sistema operacional e a versão do trabalho. O GitHub Actions fornece vários ambientes pré-construídos, como **ubuntu-latest**, **windows-latest** e **macos-latest**. Exemplo:

```
jobs:
  build:
    runs-on: self-hosted
```
### Steps
Os trabalhos são compostos de uma ou mais etapas, que são tarefas individuais executadas sequencialmente dentro de um trabalho. As etapas podem usar ações pré-construídas do mercado GitHub Actions, ações personalizadas ou simplesmente executar comandos shell. As etapas são definidas usando a palavra-chave `steps:`, seguida por uma lista de configurações de etapas. Exemplo:

```
jobs:
  build:
    runs-on: self-hosted
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 14
      - name: Install dependencies
          run: npm ci
      - name: Build project
         run: npm run build
```
### Actions
Ações são unidades reutilizáveis de código que podem ser incluídas como etapas no seu fluxo de trabalho. Você pode usar ações **pré-criadas** do marketplace GitHub Actions, **criar suas próprias ações** personalizadas ou **referenciar ações** de outros repositórios.

As ações são referenciadas usando a palavra-chave `uses:`, seguida pelo repositório de ações e versão. Exemplo:

```
steps:
- name: Checkout repository
  uses: actions/checkout@v4
```

As ações podem ser:

- [x] **Reutilizável**: as ações podem ser usadas em diferentes fluxos de trabalho e repositórios, permitindo que você evite reescrever o mesmo código.
- [x] **Pré-escrito**: muitas ações estão disponíveis no GitHub Marketplace, abrangendo uma ampla gama de tarefas, como verificar código, configurar ambientes, executar testes e implantar aplicativos.
- [x] **Configurável**: você pode configurar ações com entradas, saídas e variáveis de ambiente para adaptá-las às suas necessidades específicas.
- [x] **Orientado pela comunidade**: você pode criar suas próprias ações e compartilhá-las com outras pessoas ou usar ações desenvolvidas pela comunidade.

### Inputs and outputs
Você pode passar dados entre etapas usando entradas e saídas.

As entradas são definidas usando a palavra-chave `with:`, seguida por um mapeamento de nomes e valores de entrada.

As saídas são definidas usando a palavra-chave `id:` para atribuir um identificador exclusivo a uma etapa e, em seguida, acessadas usando o contexto steps em etapas subsequentes. Exemplo:

```
name: Exercicio 01
on:
  workflow_dispatch:
jobs:
  build_random:
    name: build_random
    runs-on: self-hosted
    env:
      API_BASE_URL: "https://api.example.com"
    steps:
    - name: Imprime variavel
      run: echo "Nome da variacel $API_BASE_URL"

    - name: Generate a random number
      id: random_number
      # Obsoleto: run: echo "::set-output name=number::$(shuf -i 1-100 -n 1)"
      run: echo "numero=$(shuf -i 1-100 -n 1)" >> "$GITHUB_OUTPUT"
    - name: Print the random number
      run: |
            echo "The random number is ${{ steps.random_number.outputs.numero }}"
            echo "Parte: ${API_BASE_URL}"
```
Outro exemplo:
```
# This is a basic workflow that is manually triggered

name: 18-input-output-variaveis

on:
  workflow_dispatch:  # Permite a execução manual do workflow e a entrada de parâmetros
    inputs:
      environment:
        description: 'Ambiente específico (opcional)'
        required: false
        default: 'all'
        type: choice
        options:
        - all
        - DEVELOPER
        - HOMOLOGACAO
        - PRODUCAO
jobs:
  input_output_job:
    runs-on: [ self-hosted, linux ]
    steps:

      # Etapa 1: Recebe o input
      - name: Solicitar Input do Usuário
        id: input_step
        run: |
          # Solicita o input através de uma variável definida pelo usuário na execução do workflow
          echo "Input fornecido: ${{ github.event.inputs.environment }}"
          # echo "::set-output name=processed_input::${{ github.event.inputs.user_input }}"
          echo "name=${{ github.event.inputs.environment }}" >> $GITHUB_OUTPUT


      # Etapa 2: Usar o Output da Etapa 1
      - name: Usar o Output da Etapa 1
        run: |
          # Usa o valor de output da etapa anterior
          echo "O output processado da etapa 1 é: ${{ steps.input_step.outputs.name }}"
```

### Environment variables and secrets
Variáveis de ambiente e segredos permitem que você armazene e passe dados sensíveis ou reutilizáveis entre etapas.

Variáveis de ambiente são definidas usando a palavra-chave `env:`, enquanto segredos são gerenciados nas configurações do repositório e acessados usando o contexto `secrets.`. Exemplo:

```
  build_random:
    name: build_random
    runs-on: self-hosted
    env:
      API_BASE_URL: "https://api.example.com"
    run: |
          echo "Deploying to $API_BASE_URL"
          curl -H "Authorization: Bearer ${{ secrets.DEPLOY_TOKEN }}" -X POST $API_ BASE_URL/deploy
```

```
name: 19-environment-secrets
on:
  workflow_dispatch:  # Permite disparar o workflow manualmente
jobs:
  print_secret:
    runs-on: ubuntu-latest
    environment: DESENVOLVIMENTO
    steps:
      - name: Acessar e imprimir o valor de EMAIL_PASS
        run: |
              echo "O valor do EMAIL_PASS é: ${{ secrets.EMAIL_PASS }}"
```

### Contexts
Contextos no GitHub Actions fornecem acesso a vários tipos de metadados relacionados à execução atual do fluxo de trabalho, como o evento que acionou o fluxo de trabalho, o repositório, o trabalho, o executor e quaisquer entradas personalizadas.

Eles permitem que você crie fluxos de trabalho dinâmicos e flexíveis que podem se adaptar a diferentes situações com base nos metadados disponíveis.

Por exemplo, você pode usar o contexto do `GITHUB` para acessar informações sobre o evento que acionou o fluxo de trabalho, como o tipo de evento, o ator que iniciou o evento e o SHA de confirmação associado.

Da mesma forma, o contexto de segredos permite que você acesse com segurança segredos criptografados armazenados nas configurações do seu repositório.

Para acessar dados de contexto, você pode usar a sintaxe `${{ context }}` no seu arquivo de fluxo de trabalho. Aqui está um exemplo de uso do contexto do github para acessar o nome do evento:

```
name: 20-imprimir-contexto-github
on:
  workflow_dispatch:  # Permite disparar o workflow manualmente
jobs:
  print_github_context:
    runs-on: [ self-hosted, Linux]
    steps:
      - name: Imprimir informações do contexto GitHub
        run: |
          # Imprimindo o contexto github completo
          echo "Repositório: ${{ github.repository }}"
          echo "Evento: ${{ github.event_name }}"
          echo "Branch: ${{ github.ref }}"
          echo "SHA do Commit: ${{ github.sha }}"
          echo "Ator do Commit: ${{ github.actor }}"
          echo "Padrão de caminho: ${{ github.event.pull_request.head.ref }}"
          echo "Número da PR: ${{ github.event.pull_request.number }}"
          echo "Tipo de workflow: ${{ github.workflow }}"
```

### Workflow Contexts
Contextos são uma maneira de acessar informações sobre execuções de fluxo de trabalho, variáveis, ambientes de execução, trabalhos e etapas.

Cada contexto é um objeto que contém propriedades, que podem ser strings ou outros objetos.

Você pode acessar contextos usando a sintaxe de expressão.`${{ <context> }}`

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
### Expressões
Expressões no GitHub Actions são uma maneira poderosa de avaliar e manipular dados dentro dos seus arquivos de fluxo de trabalho.

Elas permitem que você execute cálculos, acesse dados de contexto e controle o fluxo do seu fluxo de trabalho com base em condições.

As expressões são encapsuladas em chaves duplas, como `${{ expression }}`.

As expressões do GitHub Actions oferecem suporte a uma variedade de funções, operadores e literais que você pode usar para criar lógica complexa em seus fluxos de trabalho.

Por exemplo, você pode usar a função contains para verificar se uma string contém uma substring específica ou pode usar o operador `==` para comparar dois valores para igualdade.

Aqui está um exemplo de uso de expressões para executar condicionalmente uma etapa com base no evento que acionou o fluxo de trabalho:

```
name: 21-expressoes-impressao-steps
on:
  workflow_dispatch:
jobs:
  build:
   runs-on: [ self-hosted, Linux ]
   steps:
     - name: Log event name
       run: |
             echo "Você esta no repositorio horaciovasconcellos/estudo-actions"
             echo "Exemplo: ${{ github.repository }}"
       if: ${{ github.repository  == 'horaciovasconcellos/estudo-actions' }}
```

Neste exemplo, a palavra-chave `if` é combinada com uma expressão para controlar se a etapa será executada.

A etapa será executada somente se o evento que disparou o fluxo de trabalho for um evento de solicitação de pull.

Ao incorporar contextos e expressões em seus fluxos de trabalho do GitHub Actions, você pode criar processos de automação mais dinâmicos, flexíveis e adaptáveis que atendem às necessidades exclusivas de seus projetos de desenvolvimento.

### Workflow status badges
Para exibir o status dos seus fluxos de trabalho do GitHub Actions no README do seu repositório ou em outra documentação, você pode usar emblemas de status do fluxo de trabalho. A URL do emblema pode ser gerada usando o seguinte padrão: `https://github.com/<OWNER>/<REPOSITORY>/actions/workflows/<WORKFLOW_FILE>/badge.svg`. Exemplo:

![CI Status](https://github.com/horaciovasconcellos/estudo-actions/workflows/21-expressoes-impressao-steps/badge.svg)

- [x] O badge mostrará:
    - [x] ✅ (verde) quando o último workflow foi bem-sucedido
    - [x] ❌ (vermelho) quando falhou
    - [x] 🟠 (amarelo/laranja) quando está em andamento ou foi cancelado

Ao entender a anatomia de um fluxo de trabalho do GitHub Actions, você pode criar fluxos de trabalho mais eficientes, sustentáveis e escaláveis, adaptados às suas necessidades específicas.

Continuaremos explorando recursos avançados e opções de personalização do GitHub Actions, ajudando você a desbloquear todo o seu potencial e revolucionar seus processos de desenvolvimento de software.

## Construindo seu primeiro fluxo de trabalho
Vamos agora orientá-lo no processo de criação do seu primeiro fluxo de trabalho do GitHub Actions do zero.

Meu objetivo é ajudar você a obter uma compreensão prática de como criar e configurar fluxos de trabalho para automatizar várias tarefas em seus projetos de desenvolvimento.

Um workflow do GitHub Actions é um conjunto de códigos que define:

- [x] Uma sequência e um conjunto de etapas para executar, semelhante a um script ou programa.

Começaremos discutindo diferentes tipos de gatilhos de fluxo de trabalho, incluindo:
- [x] Gatilhos baseados em eventos;
    - [x] Disparam quando ocorrem eventos específicos no repositório:
        - [x] push: Quando código é enviado para um branch ou tag
        - [x] pull_request: Quando há atividade em pull requests (abertura, atualização, etc.)
        - [x] issues: Quando issues são abertas, editadas, fechadas, etc.
        - [x] fork: Quando o repositório é bifurcado
        - [x] release: Quando uma nova release é publicada
        - [x] watch: Quando alguém começa a "observar" o repositório
        - [x] star: Quando o repositório recebe uma estrela
        - [x] discussion: Eventos relacionados a discussões
- [x] Gatilhos Baseados em Agenda (Scheduled)
    - [x] Disparam em horários específicos usando sintaxe cron
        - [x] schedule:
            - [x] cron: '0 0 * * *'  # Executa diariamente à meia-noite
- [x] Gatilhos Manuais
    - [x] Permitem executar workflows manualmente:
        - [x] workflow_dispatch: Disparado através da interface do GitHub ou API
        - [x] repository_dispatch: Disparado por eventos externos via API
- [x] Gatilhos de Webhook
    - [x] Disparam quando webhooks específicos são recebidos
- [x] Gatilhos Específicos
    - [x] workflow_run: Dispara quando outro workflow é concluído
    - [x] check_suite: Relacionado a verificações de código
    - [x] label: Quando labels são criadas, editadas ou removidas
    - [x] milestone: Eventos relacionados a milestone

Exemplo:
```
name: 31-multi_trigger_exemplo

on:
  # Gatilho manual
  workflow_dispatch:
    inputs:
      environment:
        description: 'Ambiente para deploy'
        required: true
        default: 'staging'
      debug:
        description: 'Executar em modo debug?'
        type: boolean
        default: false

  # Gatilho quando outro workflow é concluído
  workflow_run:
    workflows: ["CI Pipeline"]  # Nome do workflow que deve ser concluído
    branches: [main]
    types:
      - completed

  # Gatilho para eventos de check suite
  check_suite:
    types:
      - completed

  # Gatilho para eventos de label
  label:
    types:
      - created
      - edited
      - deleted

  # Gatilho para eventos de milestone
  milestone:
    types:
      - created
      - closed

jobs:
  process-event:
    runs-on: ubuntu-latest
    steps:
      - name: Check event type
        run: |
          echo "Evento que disparou o workflow: ${{ github.event_name }}"

          case "${{ github.event_name }}" in
            "workflow_dispatch")
              echo "Execução manual"
              echo "Ambiente: ${{ github.event.inputs.environment }}"
              echo "Debug: ${{ github.event.inputs.debug }}"
              ;;
            "workflow_run")
              echo "Workflow CI Pipeline concluído"
              echo "Status: ${{ github.event.workflow_run.conclusion }}"
              ;;
            "check_suite")
              echo "Check suite concluído"
              echo "Status: ${{ github.event.check_suite.conclusion }}"
              ;;
            "label")
              echo "Evento de label"
              echo "Ação: ${{ github.event.action }}"
              echo "Label: ${{ github.event.label.name }}"
              ;;
            "milestone")
              echo "Evento de milestone"
              echo "Ação: ${{ github.event.action }}"
              echo "Milestone: ${{ github.event.milestone.title }}"
              ;;
          esac
```

Entender esses gatilhos é essencial para projetar fluxos de trabalho que respondam efetivamente a eventos específicos ou sejam executados em um cronograma predeterminado.

Ao aprender sobre esses componentes, você poderá criar fluxos de trabalho personalizados adaptados às suas necessidades específicas.

Também exploraremos como aproveitar compilações de matriz e paralelismo para testar seu código com eficiência em vários ambientes, versões de tempo de execução ou configurações.

Este recurso poderoso permite que você otimize seus fluxos de trabalho executando várias instâncias de um trabalho simultaneamente, reduzindo o tempo geral de execução e melhorando a confiabilidade.

### Gatilhos de fluxo de trabalho: eventos e agendamento
Vamos nos aprofundar nos diferentes tipos de gatilhos de fluxo de trabalho disponíveis no GitHub Actions.

Os gatilhos de fluxo de trabalho são cruciais para definir quando e em quais circunstâncias seus fluxos de trabalho devem ser executados.

Entender e utilizar as várias opções de gatilho ajudará você a criar fluxos de trabalho mais eficientes e adaptáveis, adaptados às suas necessidades específicas.

#### Gatilhos baseados em eventos
Os gatilhos baseados em eventos são o tipo mais comum de gatilhos no GitHub Actions.

Esses gatilhos iniciam fluxos de trabalho em resposta a vários eventos que ocorrem no seu repositório, como **push**, **pull requests** e **issues**.

Um evento é uma atividade específica em um repositório que dispara a execução de um fluxo de trabalho.

| Eventos                                  | Tipos de atividade	       | Disparo |
| --------------                           | -----                     | ----    |
| branch_protection_rule                   | created, edited e deleted | Executa o fluxo de trabalho quando as regras de proteção de branch no repositório do fluxo de trabalho são alteradas. | `on: branch_protection_rule: types: [created, deleted]` |
| check_run                                | created, rerequested, completed, requested_action | Executa o fluxo de trabalho quando ocorre a atividade relacionada a uma execução de verificação. | `on: check_run:    types: [rerequested, completed]` |
| check_suite                              | completed                 | Um conjunto de verificações é uma coleção das execuções de verificação criadas para um commit específico. |  `on: check_suite: types: [completed]` |
| create                                   | - | Quando alguém cria uma referência Git (branch ou tag) no repositório do fluxo de trabalho. | `on: create` |
| delete                                   | - | Quando alguém exclui uma referência Git (branch ou tag) no repositório do fluxo de trabalho. | `on: delete` |
| deployment                               | - | quando alguém cria uma implantação no repositório do fluxo de trabalho. | `on: deployment` |
| deployment_status                        | - | Implantações criadas com um commit SHA podem não ter uma referência Git.  |  `on: deployment_status` |
| discussion                               | created,edited,deleted,transferred,pinned,unpinned,labeled,unlabeled,locked,unlocked,category_changed,answered,unanswered | Quando uma discussão no repositório do fluxo de trabalho é criada ou modificada. | `on: discussion: types: [created, edited, answered]` |
| discussion_comment                       | created,edited,deleted | Quando um comentário em uma discussão no repositório do fluxo de trabalho é criado ou modificado. | `on:discussion_comment: types: [created, deleted]` |
| fork                                     | - | Fluxo de trabalho quando alguém bifurca um repositório. | `on: fork`  |
| gollum                                   | -  | Quando alguém cria ou atualiza uma página wiki.         |  `on: gollum` |
| issue_comment                            |    | Quando um problema ou comentário de pull request é criado, editado ou excluído.  | `on: issue_comment: types: [created, deleted]` |
| issues                                   | opened,edited,deleted,transferred,pinned,unpinned,closed,reopened,assigned,unassigned,labeled,unlabeled,locked,unlocked,milestoned,demilestoned | Quando um problema no repositório do fluxo de trabalho é criado ou modificado. | `on: issues: types: [opened, edited, milestoned]` |
| label                                    | created,edited,deleted  | Quando uma etiqueta no repositório do fluxo de trabalho é criada ou modificada.  | `on: label: types: [created, deleted]` |
| merge_group                              | checks_requested | Quando uma solicitação de pull é adicionada a uma fila de mesclagem, o que adiciona a solicitação de pull a um grupo de mesclagem. | `on: pull_request: branches: [ "main" ] merge_group: types: [checks_requested]` |
| milestone                                | created,closed,opened,edited,deleted | Quando um marco no repositório do fluxo de trabalho é criado ou modificado.  |  `on: milestone:    types: [opened, deleted]` |
| page_build                               | - | Quando alguém faz push em um branch que é a fonte de publicação para GitHub Pages, se o GitHub Pages estiver habilitado no repositório. | `on: page_build` |
| public                                   | - | Quando o repositório do fluxo de trabalho é alterado de privado para público.  | ``
| pull_request                             | assigned,unassigned,labeled,unlabeled,opened,edited,closed,reopened,synchronize,converted_to_draft,locked,unlocked,enqueued,dequeued,milestoned,demilestoned,ready_for_review,review_requested,review_request_removed,auto_merge_enabled,auto_merge_disabled | quando ocorre uma atividade em uma pull request no repositório do fluxo de trabalho. | `on:
  pull_request:
    types: [opened, reopened]`
| pull_request_comment (use issue_comment) | -  | Quando um comentário em uma solicitação de pull (não na comparação de uma solicitação de pull) é criado, editado ou excluído, use o evento issue_comment |  |
| pull_request_review                      | submitted, edited, dismissed | Quando uma revisão de pull request é enviada, editada ou ignorada. | `on: pull_request_review:  types: [edited, dismissed]` |
| pull_request_review_comment              | created, edited, deleted | Quando um comentário de revisão de pull request é modificado.  | `on: pull_request_review_comment:    types: [created, deleted]` |
| pull_request_target                      | assigned,unassigned,labeled,unlabeled,opened,edited,closed,reopened,synchronize,converted_to_draft,ready_for_review,locked,unlocked,review_requested,review_request_removed,auto_merge_enabled,auto_merge_disabled | Quando ocorre uma atividade em uma pull request no repositório do fluxo de trabalho.  | `on: pull_request_target: types: [assigned, opened, synchronize, reopened]` |
| push                                     | - | Quando você efetua push em um commit ou tag ou quando cria um repositório a partir de um modelo. | `on:
  push` |
| registry_package                         | published, updated | Quando uma atividade relacionada ao GitHub Packages ocorre no seu repositório.  | `on:
  registry_package:
    types: [published]` |
| release                                  | published,unpublished,created,edited,deleted,prereleased,released | Quando a atividade de da versão no repositório ocorre.  | `on:
  release:
    types: [published]` |
| repository_dispatch                      | | Quando você deseja disparar um fluxo de trabalho para a atividade que ocorre fora do GitHub. | `on: repository_dispatch:  types: [test_result]` |
| schedule                                 | | O evento schedule pode ser atrasado durante períodos de cargas altas de execuções de fluxo de trabalho do GitHub Actions.  | `on:
  schedule:
    - cron: "15 4,5 * * *"` |
| status                                   | | Quando o status do commit de Git é alterado. Por exemplo, os commits podem ser marcados como error, failure, pending ou success.  | `on:
  status`
| watch                                    | started | Quando o repositório do fluxo de trabalho é favoritado.  | `on: watch: types: [started]` |
| workflow_call                            |         | É usado para indicar que um fluxo de trabalho pode ser chamado por outro fluxo de trabalho.   | `on: workflow_call` |
| workflow_dispatch                        |  | Para permitir que um fluxo de trabalho seja disparado manualmente, configure o evento workflow_dispatch | `on: workflow_dispatch` |
| workflow_run                             | completed, requested, in_progress | Quando uma execução do fluxo de trabalho é solicitada ou concluída.  | `on:
  workflow_run:
    workflows: [Staging, Lab]
    types:
      - completed` |

Um evento pode ser definido de várias maneiras diferentes:

- [x] Uma pessoa ou um processo realiza alguma operação em um repositório do GitHub.
- [x] Um gatilho externo correspondente acontece, ou seja, um evento de fora do GitHub.
- [x] Um fluxo de trabalho é iniciado manualmente, sem que nenhuma operação precise ser realizada primeiro.
- [x] Um cronograma é configurado para executar um fluxo de trabalho em horários ou intervalos específicos.

A palavra-chave `on:` e as linhas que a seguem definem quais tipos de gatilhos o fluxo de trabalho corresponderá e começará a executar. Alguns tipos básicos de gatilhos e exemplos simples da sintaxe para cada um seguem:

- [x] O fluxo de trabalho pode responder a um único evento, como quando ocorre um push: `on: push`
- [x] O fluxo de trabalho pode responder a uma lista (vários eventos): `on: [ push, pull_request ]`
- [x] O fluxo de trabalho pode responder a tipos de eventos com qualificadores:

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

- [x] O fluxo de trabalho pode responder a eventos manuais específicos: `on: [workflow_dispatch, repository_dispatch]`
- [x] O fluxo de trabalho pode ser chamado de outros fluxos de trabalho (chamado de evento de reutilização): `on: workflow_call`

Observação:

- [x] Para esses eventos, se você tiver o arquivo de fluxo de trabalho **somente em um branch não padrão e acionar a atividade que normalmente faria o fluxo de trabalho ser executado, nada acontecerá**.
- [x] Além disso, você pode usar filtros para restringir o escopo do gatilho, como especificar branches ou tags específicas. Exemplo:

```
on:
push:
  branches:
    - main
pull_request:
  branches:
    - main
  types:
    - opened
    - synchronize
```
#### Gatilhos programados/agendados
Os gatilhos agendados permitem que você execute fluxos de trabalho em **intervalos especificados**, usando sintaxe semelhante à do cron.

Isso é útil para executar **tarefas periódicas, como compilações noturnas, relatórios semanais ou manutenção mensal**. Para configurar um gatilho agendado, use a palavra-chave `schedule:` e forneça uma ou mais expressões cron. Exemplo:

```
on:
  schedule:
     - cron: '0 0 * * * # Run the workflow daily at midnight
```
Tenha em mente que o agendamento é baseado no **fuso horário UTC**, e o menor intervalo possível entre execuções de fluxo de trabalho agendadas é de **5 minutos**.

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

| Operador	| Descrição	                    | Exemplo                             |
| ----      | ----                          | -------                             |
| *	        | Qualquer valor	            | 15 * * * * é executado a cada quarto de hora todos os dias.                                      |
| ,	        | Separador de lista de valor	| 2,10 4,5 * * * é executado nos minutos 2 e 10 da quarta e da quinta hora todos os dias.          |
| -	        | Intervalo de valores	        | 30 4-6 * * * é executado a cada meia hora da quarta, da quinta e da sexta hora.                  |
| /	        | Valores de etapa	            | 20/15 * * * * é executado a cada 15 minutos, começando do minuto 20 ao 59 (minutos 20, 35 e 50). |

Observação: Use  o site [Crontab](https://crontab.guru).

#### Manual triggers
Os gatilhos manuais permitem que você execute fluxos de trabalho sob demanda, usando a interface da web do GitHub Actions ou a API do GitHub.

Isso pode ser útil para executar tarefas que não precisam necessariamente ser executadas automaticamente, como **implantações, migrações de dados ou scripts únicos**.

Para configurar um gatilho manual, use a palavra-chave **workflow_dispatch** e, opcionalmente, forneça parâmetros de entrada. Exemplo:

```
  workflow_dispatch:
    inputs:
      environment:
        description: 'Ambiente para deploy'
        type: string
        required: true
        default: 'staging'
      debug:
        description: 'Executar em modo debug?'
        type: boolean
        default: false
```

Depois de configurar um gatilho manual, você pode iniciar o fluxo de trabalho clicando no botão "Executar fluxo de trabalho" na guia Ações do seu repositório ou usando a API do GitHub.

Agora você pode especificar tipos de entrada para fluxos de trabalho acionados manualmente, permitindo que você forneça uma melhor experiência aos usuários do seu fluxo de trabalho.

Além do `string` tipo padrão, agora oferecemos suporte a `choice`, `boolean`, e `environment`.

### Gatilhos Externos
Os gatilhos externos permitem que você inicie fluxos de trabalho em resposta a eventos que ocorrem fora do seu repositório, como webhooks de serviços de terceiros ou eventos personalizados de outros repositórios.

 Para configurar um gatilho externo, use a palavra-chave `repository_dispatch:` ou `workflow_dispatch:` e forneça uma matriz de tipos com os nomes dos eventos personalizados que você deseja ouvir. Exemplo:

```
on:
  repository_dispatch:
  types:
    - my_custom_event
```
Para acionar um fluxo de trabalho com um evento externo, você pode enviar uma solicitação POST para a API do GitHub com o tipo de evento e a carga útil apropriados.

### Webhooks de repositório
É um mecanismo que permite a comunicação entre diferentes sistemas de forma automatizada e em tempo real.

Ele funciona como um callback HTTP, onde um sistema envia automaticamente dados para outro sistema assim que um evento específico ocorre. Você só pode criar até **20 webhooks** que se inscrevam em cada tipo de evento individual.


```
name: 22-webhook_triggered_action

on:
  repository_dispatch:
    types: [webhook-event] # Você pode definir tipos personalizados

jobs:
  process-webhook:
    runs-on: [ self-hosted , Linux ]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Display payload
        run: |
          echo "Event payload: ${{ toJSON(github.event.client_payload) }}"
          # Processe os dados do webhook aqui

      - name: Execute custom logic
        run: |
          echo "Webhook received with data: ${{ github.event.client_payload.data }}"

```

```
curl -X POST \
  -H "Authorization: token TOKEN-PAT-" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/horaciovasconcellos/estudo-actions/dispatches \
  -d '{"event_type":"webhook-event","client_payload":{"data":"valor","outro_dado":"outro_valor"}}'
```


### Gatilhos de atividade
Os gatilhos de atividade iniciam fluxos de trabalho em resposta a várias atividades do usuário ou do sistema, como marcar um repositório como favorito, criar uma versão ou atribuir um rótulo. Alguns exemplos de gatilhos de atividade incluem:

- [x] **watch**: Aciona o fluxo de trabalho quando alguém marca o repositório como favorito.
- [x] **release**: Aciona o fluxo de trabalho quando uma versão é criada, publicada ou atualizada.
- [x] **label**: Aciona o fluxo de trabalho quando um rótulo é criado, editado ou excluído.

Você pode usar gatilhos de atividade em combinação com outros gatilhos para criar fluxos de trabalho mais flexíveis e responsivos. Exemplo:

```
name: 23-on_repository_watch

on:
  watch:
    types: [started]  # Dispara quando alguém começa a observar o repositório

jobs:
  thank-watcher:
    runs-on: [ self-hosted, Linux ]
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Get watcher info
        id: watcher-info
        run: |
          echo "Watcher: ${{ github.actor }}"
          echo "Event: ${{ github.event_name }}"
          echo "Repository: ${{ github.repository }}"
          echo "Timestamp: ${{ github.event.repository.updated_at }}"

          # Armazenar informações para uso posterior
          echo "WATCHER_LOGIN=${{ github.actor }}" >> $GITHUB_ENV
          echo "REPO_NAME=${{ github.repository }}" >> $GITHUB_ENV

      - name: Send thank you message (simulado)
        run: |
          echo "🤖 Obrigado por observar o repositório, @${{ env.WATCHER_LOGIN }}!"
          echo "📌 Agora você receberá notificações sobre atividades em ${{ env.REPO_NAME }}"
          echo "⭐ Se você gostou do projeto, considere dar uma estrela também!"

      - name: Create GitHub Issue (opcional)
        if: github.event.repository.stargazers_count > 100  # Só cria issue para repositórios populares
        uses: actions/github-script@v6
        with:
          script: |
            await github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: `Novo observador: @${{ github.actor }}`,
              body: `O usuário @${{ github.actor }} começou a observar este repositório! Total de observadores agora: ${{ github.event.repository.subscribers_count }}`
            })
```
#### Combinando gatilhos
Você pode combinar vários gatilhos em um único fluxo de trabalho para manipular vários eventos e cenários. Ao combinar gatilhos, esteja ciente de que cada gatilho pode ter seu próprio conjunto de filtros e opções de configuração. Exemplo:

```
on:
  push:
    branches:
      - main
   pull_request:
     branches:
       - main
   schedule:
       - cron: '0 0 * * *'
   workflow_dispatch:
     inputs:
        environment:
            description: 'The target environment for deployment'
               required: true
                default: 'staging'
```

Neste exemplo, o fluxo de trabalho é acionado por push e `pull_request events` no branch principal, é executado diariamente à meia-noite (UTC) e pode ser acionado manualmente com uma entrada de ambiente especificada.
```
name: Pipeline Diária UTC-3

on:
  schedule:
    # Executa todos os dias às 08:00 no horário de Brasília (UTC-3)
    # No cron do GitHub (que usa UTC), isso equivale a 11:00 UTC
    - cron: '0 11 * * *'

  # Opcional: permite acionar manualmente
  workflow_dispatch:

jobs:
  run-pipeline:
    runs-on: ubuntu-latest
    steps:
      - name: Verificar horário
        run: |
          echo "Horário de execução (UTC): $(date)"
          echo "Horário equivalente em UTC-3: $(TZ='America/Sao_Paulo' date)"

      - name: Executar pipeline
        run: |
          echo "Pipeline sendo executada no horário UTC-3..."
          # Seus comandos aqui
```


Ao entender e utilizar os diferentes tipos de acionadores de fluxo de trabalho no GitHub Actions, você pode criar fluxos de trabalho que respondem a vários eventos e cenários, tornando seu processo de desenvolvimento mais eficiente e adaptável. Nas próximas seções, discutiremos como criar trabalhos e etapas, usar ações e gerenciar variáveis de ambiente e segredos para construir fluxos de trabalho poderosos e personalizáveis.

- [x] O agendamento (schedule) sempre usa UTC;
- [x] A execução real pode variar em até 15 minutos do horário agendado;
- [x] Para horários de verão, o UTC-3 pode se tornar UTC-2 (o GitHub ajusta automaticamente);
- [x] Você pode verificar os próximos agendamentos na aba "Actions" do repositório;

### Defining Jobs and Steps

Jobs e steps são blocos de construção fundamentais dos fluxos de trabalho do GitHub Actions. Aprender como definir e configurar jobs e steps, criar dependências de job e gerenciar paralelismo e simultaneidade em seus fluxos de trabalho.

Um job é uma unidade individual de trabalho que é executada em um ambiente especificado e consiste em uma ou mais etapas.

Os jobs em um fluxo de trabalho são executados em paralelo por padrão, mas você pode criar dependências entre os jobs para impor uma ordem de execução específica. Os jobs são definidos usando a palavra-chave jobs, seguida por um identificador exclusivo para cada job e sua configuração. Exemplo:

- [x] Um JOB no GitHub Actions consiste em uma série de etapas executadas no mesmo executor.
- [x] Os JOB podem ser executados em paralelo ou sequencialmente, dependendo das dependências definidas no fluxo de trabalho.
- [x] Os JOB que não dependem da saída de outros trabalhos podem ser executados em paralelo, o que ajuda a reduzir o tempo geral de compilação.
- [x] Um JOB é um conjunto de etapas em um fluxo de trabalho executadas no mesmo executor.
- [x] Os JOBs agregam etapas e definem em qual executor executá-los.
- [x] Ele é composto de uma série de comandos individuais para executar e/ou ações predefinidas para chamar.
- [x] O **sucesso ou fracasso** é exibido no nível do trabalho, não nas etapas individuais.
- [x] O hífen no início desta linha indica que este é o início de um segundo passo.
- [x] Cada etapa é um script de shell que será executado ou uma ação que será executada.
- [x] Você pode configurar as dependências de um trabalho com outros trabalhos; **por padrão, os trabalhos não têm dependências e são executados em paralelo**. Cada trabalho é executado em um ambiente do executor(runner) especificado por `runs-on:`.

Os jobs são o que você geralmente vê em outros aplicativos **como estágios**, ou seja, partes de um processo maior que executam uma função distinta e separada.

```
name: 24-SDLC_pipeline_microsoft_model

on:
  workflow_dispatch:

jobs:
  # Fase 1: Requisitos e Análise
  requirements_analysis:
    name: "1. Requisitos e Análise"
    runs-on: [ self-hosted, Linux ]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Impressao Sep
        run: |
              echo "Passo: Checkout code - Baixando o código-fonte"

      - name: Analyze requirements
        run: |
          echo "Passo: Analyze requirements - Analisando requisitos do sistema"
          echo "Simulando análise de requisitos..."
          sleep 2

      - name: Generate documentation
        run: |
          echo "Passo: Generate documentation - Gerando documentação inicial"
          echo "Documentação técnica criada" > docs.txt

    outputs:
      requirements_approved: ${{ steps.analyze_requirements.outputs.approved }}

  # Fase 2: Design do Sistema
  system_design:
    name: "2. Design do Sistema"
    needs: requirements_analysis
    runs-on: [ self-hosted, Linux ]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Impressao
        run: |
               echo "Passo: Checkout code - Baixando o código-fonte"

      - name: Architectural design
        run: |
          echo "Step: Architectural design - Criando arquitetura do sistema"
          echo "Diagrama de arquitetura gerado" > architecture.txt

      - name: Database design
        run: |
          echo "Step: Database design - Projetando modelo de banco de dados"
          echo "Modelo ERD criado" > database-design.txt

  # Fase 3: Implementação (Coding)
  implementation:
    name: "3. Implementação"
    needs: system_design
    runs-on: [ self-hosted, Linux ]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Impressao
        run: |
               echo "Step: Checkout code - Baixando o código-fonte"

      - name: Install dependencies
        run: |
          echo "Step: Install dependencies - Instalando dependências"
          echo "npm install (simulado)" && sleep 1

      - name: Build application
        run: |
          echo "Step: Build application - Compilando aplicação"
          echo "Build concluído" > build.log

      - name: Run unit tests
        run: |
          echo "Step: Run unit tests - Executando testes unitários"
          echo "Todos os 42 testes passaram!" > test-results.txt

  # Fase 4: Testes
  testing:
    name: "4. Testes"
    needs: implementation
    runs-on: [ self-hosted, Linux ]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Impressao
        run: |
               echo "Step: Checkout code - Baixando o código-fonte"

      - name: Integration tests
        run: |
          echo "Step: Integration tests - Testes de integração"
          echo "Testes de integração concluídos" > integration-tests.log

      - name: System tests
        run: |
          echo "Step: System tests - Testes de sistema"
          echo "Sistema validado" > system-tests.log

      - name: Performance tests
        run: |
          echo "Step: Performance tests - Testes de performance"
          echo "Performance: 98.7% de uptime" > performance-tests.log

  # Fase 5: Deploy
  deployment:
    name: "5. Deployment"
    needs: testing
    runs-on: [ self-hosted, Linux ]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Impressao
        run: |
               echo "Step: Checkout code - Baixando o código-fonte"

      - name: Prepare deployment
        run: |
          echo "Step: Prepare deployment - Preparando pacote de deploy"
          echo "Pacote .zip criado" > deployment-package.zip

      - name: Deploy to staging
        run: |
          echo "Step: Deploy to staging - Implantando em ambiente de staging"
          echo "Deploy para staging concluído" > staging-deploy.log

      - name: Approve production
        if: github.ref == 'refs/heads/main'
        run: |
          echo "Step: Approve production - Aprovação para produção"
          echo "Aguardando aprovação manual..." && sleep 5
          echo "Aprovado!"

      - name: Deploy to production
        if: github.ref == 'refs/heads/main'
        run: |
          echo "Step: Deploy to production - Implantando em produção"
          echo "Deploy para produção concluído" > production-deploy.log

  # Fase 6: Manutenção
  maintenance:
    name: "6. Manutenção"
    needs: deployment
    runs-on: [ self-hosted, Linux ]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Impressao
        run: |
               echo "Passo: Checkout code - Baixando o código-fonte"

      - name: Monitor application
        run: |
          echo "Step: Monitor application - Monitorando aplicação"
          echo "Coletando métricas..." && sleep 3
          echo "Tudo operacional!"

      - name: Generate report
        run: |
          echo "Step: Generate report - Gerando relatório final"
          echo "Relatório do ciclo SDLC:" > sdlc-report.md
          echo "- Requisitos analisados" >> sdlc-report.md
          echo "- Sistema projetado" >> sdlc-report.md
          echo "- Código implementado" >> sdlc-report.md
          echo "- Testes concluídos" >> sdlc-report.md
          echo "- Deploy realizado" >> sdlc-report.md

```
#### Configuring jobs:
Cada job tem um conjunto de propriedades que você pode configurar, como o ambiente em que o trabalho é executado, suas dependências e suas configurações de tempo limite e repetição.

- [x] **runs-on**: Especifica o sistema operacional e a versão do trabalho. Exemplos incluem self-hosted, windows-latest e macos-latest.
- [x] **needs**: Especifica as dependências entre os trabalhos, garantindo que um trabalho seja executado somente após os trabalhos especificados terem sido concluídos com sucesso.
- [x] **timeout-minutes**: Define um tempo limite para o trabalho, após o qual ele será cancelado se não tiver sido concluído.
- [x] **continue-on-error**: Configura se o trabalho deve continuar se uma etapa falhar.
- [x] **strategy**: Define a configuração da matriz para executar várias instâncias de um trabalho com diferentes variáveis de ambiente, sistemas operacionais ou configurações.

#### Dependent Jobs
Uma execução de fluxo de trabalho é composta de um ou mais trabalhos, que **são executados em paralelo por padrão**. Para executar trabalhos sequencialmente, você pode definir dependências em outros trabalhos usando:

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

### Defining steps:
STEPS são tarefas individuais que são executadas sequencialmente dentro de um trabalho.

Cada STEP pode executar um comando shell, usar uma ação pré-criada do marketplace GitHub Actions ou referenciar uma ação personalizada.

Os STEPS são definidas usando a palavra-chave `steps:`, seguida por uma lista de configurações de etapas. Exemplo:

```
jobs:
  build:
    runs-on: self-hosted
    steps:
       - name: Checkout repository
         uses: actions/checkout@v4
       - name: Set up Node.js
         uses: actions/setup-node@v4
           with:
              node-version: 14
       - name: Install dependencies
         run: npm ci
       - name: Build project
         run: npm run build
```

#### Configuring steps:
Cada etapa tem um conjunto de propriedades que você pode configurar, como seu nome, a ação que ela usa e os parâmetros de entrada para a ação.

| Campo                   | Tipo          | Descrição                                                                 | Obrigatório? |
|-------------------------|---------------|---------------------------------------------------------------------------|--------------|
| **`id`**               | string        | Identificador único para referenciar o step em outros lugares.            | Não          |
| **`name`**             | string        | Nome exibido no log do GitHub Actions.                                    | Não          |
| **`uses`**             | string        | Define uma ação pré-construída (ex: `actions/checkout@v4`).               | Não¹         |
| **`run`**              | string        | Comandos shell ou script a ser executado (ex: `npm install`).             | Não¹         |
| **`shell`**            | string        | Define o shell padrão (ex: `bash`, `pwsh`, `python`).                     | Não          |
| **`env`**              | objeto (key-value) | Variáveis de ambiente específicas para o step.                          | Não          |
| **`with`**             | objeto (key-value) | Parâmetros de entrada para ações (`uses`).                              | Não          |
| **`continue-on-error`**| boolean       | Permite que o job continue mesmo se o step falhar (`true`/`false`).       | Não          |
| **`timeout-minutes`**  | number        | Tempo máximo de execução do step (em minutos).                            | Não          |
| **`if`**               | string (condicional) | Executa o step apenas se a condição for atendida (ex: `if: github.ref == 'refs/heads/main'`). | Não          |

#### Job dependencies and parallelism:
Por padrão, os trabalhos são executados em paralelo. No entanto, você pode criar dependências entre os trabalhos usando a palavra-chave needs para impor uma ordem de execução específica.

Um trabalho com uma propriedade `needs:` só será iniciado após todos os trabalhos especificados terem sido concluídos com **sucesso**.

Isso permite que você crie fluxos de trabalho complexos com vários estágios, como construir, testar e implantar seu aplicativo. Exemplo:

```
name: 34_workflow_steps
on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Ambiente para deploy'
        required: true
        default: 'staging'
      debug-mode:
        description: 'Habilitar modo debug'
        type: boolean
        default: false

env:
  APP_VERSION: '1.0.0'
  NODE_ENV: 'production'

jobs:
  build-and-test:
    name: Construir e Testar
    runs-on: ubuntu-latest
    env:
      CI: true

    outputs:
      build-status: ${{ steps.build.outputs.status }}
      test-coverage: ${{ steps.test.outputs.coverage }}

    steps:
      # Step 1: Checkout do código
      - name: Checkout repository
        id: checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 2
          submodules: recursive

      # Step 2: Configurar Node.js
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          cache: 'npm'

      # Step 3: Instalar dependências
      - name: Install dependencies
        id: install
        run: npm ci
        shell: bash
        env:
          NODE_ENV: development
        timeout-minutes: 5

      # Step 4: Build do projeto
      - name: Build application
        id: build
        run: |
          echo "status=success" >> $GITHUB_OUTPUT
        continue-on-error: false

      # Step 5: Executar testes
      - name: Run tests
        id: test
        run: |
          npm test
          echo "coverage=$(cat coverage.txt)" >> $GITHUB_OUTPUT
        if: always() && steps.build.outputs.status == 'success'

      # Step 6: Upload de artefatos
      - name: Upload build artifacts
        uses: actions/upload-artifact@v4
        with:
          name: build-output
          path: dist/
        if: success()
        continue-on-error: true
  deploy:
    name: Deploy para Produção
    needs: build-and-test
    runs-on: ubuntu-latest
    environment: production
    concurrency:
      group: production-deploy
      cancel-in-progress: true

    steps:
      # Step 1: Download de artefatos
      - name: Download artifacts
        run: |
              echo ":::warning::: Teste "

      # Step 3: Notificação
      - name: Send notification
        run: |
              echo ":::warning::: Tudo muito bom "
        if: always()
```

Isso impõe uma ordem de execução sequencial, garantindo que a implantação só aconteça depois que os trabalhos de construção e teste forem concluídos com sucesso.

#### Matrix strategy
A estratégia matrix permite que você execute várias instâncias de um trabalho com diferentes variáveis de ambiente, sistemas operacionais ou configurações.
Isso pode ser útil para testar seu aplicativo em várias plataformas ou versões. Para configurar uma estratégia matrix, use a palavra-chave strategy e forneça uma configuração matrix. Exemplo:

```
name: 35_multiplataforma_matrix
on:
  workflow_dispatch:

jobs:
  test-matrix:
    name: Testes em Multiplataformas
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        # Configuração da matriz de testes
        os: [ubuntu-latest, windows-latest, macos-latest]
        node-version: [14, 16, 18]
        framework: ['react', 'angular', 'vue']
        include:
          - os: ubuntu-latest
            node-version: 18
            framework: 'react'
            test-type: 'integration'
          - os: windows-latest
            node-version: 16
            framework: 'angular'
            test-type: 'e2e'
        exclude:
          - os: macos-latest
            node-version: 14

    env:
      CI: true
      TEST_TYPE: ${{ matrix.test-type || 'unit' }}

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Node.js ${{ matrix.node-version }}
        run:  |
               echo "Passei pelo Setup Node.js ${{ matrix.node-version }}"

      - name: Install dependencies
        run:  |
               echo "Passei pelo Install dependencies ${{ matrix.node-version }}"

      - name: Run ${{ matrix.framework }} tests
        run: |
          echo "Running $TEST_TYPE tests on ${{ matrix.os }} with Node ${{ matrix.node-version }}"
        shell: bash

      - name: Upload test results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: test-results-${{ matrix.os }}-node${{ matrix.node-version }}-${{ matrix.framework }}
          path: test-results.xml

  deploy:
    name: Deploy após testes
    needs: test-matrix
    runs-on: ubuntu-latest
    if: success()

    steps:
      - name: Consolidate test results
        run: |
          echo "Todos os testes da matriz foram concluídos com sucesso!"
          echo "Versões testadas:"
          echo "${{ toJSON(needs.test-matrix.outputs) }}"
```

Neste exemplo, o trabalho de teste será executado em três sistemas operacionais diferentes (self-hosted, windows-latest e macos-latest) e três versões diferentes do Node.js (14, 16, 18) e com os framework: ['react', 'angular', 'vue'], resultando em um total de 27 (vinte e sete) instâncias de trabalho, porem há a clausula exclude, que exclui três instancias, totalizando 24  (vinte e quatro) instancias em execução.

### [Ações Marketplace](https://github.com/marketplace?type=actions)
Ao contrário dos fluxos de trabalho que chamam `actions`, você pode encontrar um conjunto útil de ações existentes para chamar no GitHub Marketplace na seção Actions.

Pense nisso como se fossem plug-ins ou outros módulos complementares que adicionam funcionalidade em outros aplicativos.

### Usando ações pré-construídas
Actions pré-construídas são componentes reutilizáveis criados pela comunidade do GitHub e pela equipe do GitHub Actions que ajudam a automatizar tarefas comuns, tornando seus fluxos de trabalho mais eficientes e fáceis de manter.

Discutiremos como encontrar, usar e configurar ações pré-construídas e explorar algumas ações populares que você pode incorporar em seus fluxos de trabalho.

### Encontrando ações pré-construídas
O GitHub Actions Marketplace é a principal fonte para descobrir e compartilhar ações pré-construídas.

Você pode acessar o marketplace visitando a seguinte URL: `https://github.com/marketplace?type=actions`

Alternativamente, você pode navegar até a aba "Ações" no seu repositório, clicar em "Novo fluxo de trabalho" e então clicar em "Marketplace" para visualizar uma lista com curadoria de ações adaptadas à linguagem e estrutura do seu repositório.

Ao **selecionar uma ação, considere sua popularidade, status de manutenção e a confiabilidade do seu autor**.

Ler a documentação, as avaliações e o código-fonte da ação pode ajudar você a tomar uma melhor decisão.

### Usando ações pré-construídas
Para usar uma ação pré-construídas  no seu fluxo de trabalho, adicione uma nova etapa ao seu trabalho e use a palavra-chave `uses:`, seguida pelo repositório da ação no formato `<owner>/<repo>@<ref>`. Exemplo:

| Método de Acesso                | Sintaxe de Exemplo                          | Quando Usar                              | Observações                             |
|----------------------------------|--------------------------------------------|------------------------------------------|-----------------------------------------|
| **Marketplace Oficial**         | `uses: actions/checkout@v4`               | Quando buscar ações validadas            | [Link](https://github.com/marketplace?type=actions) |
| **Versão Específica**           | `uses: actions/setup-node@v3.5.0`         | Para máxima reprodutibilidade            | Usar versão semântica completa          |
| **Branch Principal**            | `uses: actions/checkout@main`             | Apenas desenvolvimento                   | Não recomendado para produção           |
| **Commit SHA**                   | `uses: actions/checkout@d8812c3`          | Quando precisa de fixação absoluta       | Garante imutabilidade                   |
| **Ação Local**                  | `uses: ./.github/actions/minha-action`    | Para ações personalizadas no repositório | Caminho relativo ao diretório .github   |
| **Repositório Privado**         | `uses: minha-org/action-privada@v1`       | Para ações internas                      | Requer configuração de token            |
| **Container Docker**            | `uses: docker://alpine:3.15`              | Quando a ação é um container             | Pode exigir permissões adicionais       |
| **Ação Composta**               | `uses: actions/setup-node@v3`<br>`uses: actions/setup-python@v4` | Para agrupar lógicas relacionadas | Executa múltiplos passos como uma unidade |
| **Ação JavaScript**             | `uses: actions/github-script@v6`          | Para interações com API do GitHub        | Permite scripts inline                  |

Neste exemplo, a ação actions/checkout@v4 verifica o código do seu repositório, e a ação actions/setup-node@v4 configura o Node.js com a versão especificada.

### Configuring pre-built actions:
Muitas ações fornecem parâmetros de entrada que você pode usar para personalizar seu comportamento.

Para definir parâmetros de entrada, use a palavra-chave `with:` seguida por um mapa de valores-chave de nomes e valores de parâmetros. Exemplo:


```
jobs:
  deploy:
     runs-on: self-hosted
     steps:
       - name: Deploy to Firebase
         uses: horaciovasconcellos/firebase-action@v1.5.0
         with:
           args: deploy --only hosting
         env: FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
```

Neste exemplo, a ação horaciovasconcellos/firebase-action@v1.5.0 implanta seu aplicativo no Firebase Hosting, com os argumentos especificados.

A ação também requer uma variável de ambiente FIREBASE_TOKEN, que é fornecida como um segredo.

### Ações pré-construídas populares
Há inúmeras ações pré-construídas disponíveis no GitHub Actions Marketplace, abrangendo várias tarefas, como verificações de qualidade de código, implantações e notificações.

Aqui estão algumas ações populares que você pode achar úteis em seus fluxos de trabalho:

- [X] **actions/checkout**: Verifica o código do seu repositório para que seu fluxo de trabalho possa acessá-lo e manipulá-lo.
- [X] **actions/setup-node**: Configura uma versão específica do Node.js no ambiente do seu trabalho.
- [X] **actions/cache**: Armazena dependências em cache e artefatos de compilação para acelerar seu fluxo de trabalho.
- [X] **actions/upload-artifact e actions/download-artifact**: Carrega e baixa artefatos de compilação, como binários compilados ou resultados de teste, para compartilhar entre trabalhos ou armazenar como saídas do fluxo de trabalho.
- [X] **actions/create-release**: Cria uma nova versão do GitHub e carrega ativos para ela.
- [X] **actions/slack**: Envia notificações para um canal do Slack.

Lembre-se de consultar a documentação e o código-fonte da ação para entender sua funcionalidade, requisitos e limitações.

### Considerações de segurança:
Ao usar ações pré-construídas, esteja ciente dos riscos potenciais de segurança associados à execução de código de terceiros em seus fluxos de trabalho. Para mitigar esses riscos, siga estas práticas recomendadas:

- [X] **Revise o código-fonte e a documentação** da ação para entender sua funcionalidade e garantir que ela não contenha código malicioso ou inseguro.
- [X] **Use tags de versão específicas ou hashes de confirmação** em vez de nomes de ramificação ao referenciar ações. Isso ajuda a evitar alterações inesperadas no comportamento da ação devido a atualizações ou modificações.
- [X] **Mantenha suas ações atualizadas para se beneficiar de correções de bugs**, patches de segurança e novos recursos. Verifique regularmente se há novos lançamentos e atualize seus fluxos de trabalho adequadamente.
- [X] **Limite o acesso a informações confidenciais**, como segredos e variáveis de ambiente, em seus fluxos de trabalho. Certifique-se de fornecer apenas as permissões e dados necessários para as ações que você usa.

Ao usar ações pré-construídas em seus fluxos de trabalho do GitHub Actions, você pode aproveitar o poder da comunidade do GitHub para automatizar várias tarefas, economizar tempo e agilizar seu processo de desenvolvimento.

À medida que você se familiariza mais com o GitHub Actions, você também pode considerar criar suas próprias ações personalizadas para adaptar ainda mais seus fluxos de trabalho às suas necessidades específicas.

### Running Shell Commands
Além de usar ações pré-construídas, você pode executar comandos e scripts de shell diretamente em seus fluxos de trabalho do GitHub Actions.

Isso fornece a flexibilidade para executar tarefas personalizadas, manipular arquivos ou interagir com ferramentas e serviços externos. Discutiremos como executar comandos de shell, controlar o ambiente de shell e gerenciar códigos de saída e tratamento de erros em seus fluxos de trabalho.

#### Executando comandos shell
Para executar um comando shell no seu fluxo de trabalho, adicione uma nova etapa ao seu trabalho e use a palavra-chave `run`, seguida pelo comando ou script que você deseja executar. Exemplo:

## Comandos multilinha e encadeados
Você pode executar vários comandos em uma única etapa usando strings YAML multi-linha ou encadeando comandos com operadores de shell. Exemplo:

```
 jobs:
   test:
     runs-on: self-hosted
     steps:
        - name: Install dependencies and run tests
           run: |
                 npm ci
                 npm test
        - name: Build and deploy
           run: npm run build && npm run deploy
```
Neste exemplo, a primeira etapa instala as dependências e executa os testes usando uma string YAML de várias linhas, enquanto a segunda etapa compila e implanta o projeto usando um comando encadeado com o operador de shell &&.

### Especificando o shell
O GitHub Actions oferece suporte a vários **shells**, incluindo **Bash, PowerShell e Windows Command Prompt**.

Por padrão, o **shell usado depende do sistema operacional do executor**.

 Você pode especificar o shell a ser usado com a palavra-chave `shell:`. Exemplo:

```
name: 36_bash_python_shell
on:
  workflow_dispatch:

jobs:
  multi-shell-demo:
    runs-on: ubuntu-latest
    defaults:
      run:
        shell: bash  # Default shell for all steps

    steps:
      # 1. Checkout the repository
      - name: Checkout code
        uses: actions/checkout@v4

      # 2. Pure Bash step
      - name: Execute Bash commands
        run: |
          echo "Running in Bash shell"
          echo "Current directory: $(pwd)"
          echo "System info: $(uname -a)"
          ls -la
          echo "PATH: ${PATH}"

  # 2. Pure Bash step
      - name: Execute Bash commands
        run: |
          echo "Running in Bash shell"
          echo "Current directory: $(pwd)"
          echo "System info: $(uname -a)"
          ls -la
          echo "PATH: ${PATH}"

      # 3. Run Python script
      - name: Run Python script
        run: |
          python --version
          echo "print('Hello, World!')" | python
```

Neste exemplo, o comando echo "Hello, World!" é executado usando o interpretador Python como um shell personalizado.


### Variáveis de ambiente
Você pode definir variáveis de ambiente para uma etapa específica ou um trabalho inteiro usando a palavra-chave `env`.

Variáveis de ambiente podem ser acessadas em comandos e scripts de shell usando a sintaxe apropriada para o shell que está sendo usado. Exemplo:

```
name: 37_variaveis_de_ambiente_contexto
on:
  workflow_dispatch:
env:
  VAR_GLOBAL: "Esta variável está disponível em todos os jobs"

jobs:
  print-env-vars:
    runs-on: ubuntu-latest
    env:
      VAR_JOB: "Variável disponível apenas neste job"

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      # Variáveis padrão do GitHub Actions
      - name: Print default GitHub env vars
        run: |
          echo "::group::Variáveis padrão do GitHub"
          echo "GITHUB_REPOSITORY: $GITHUB_REPOSITORY"
          echo "GITHUB_SHA: $GITHUB_SHA"
          echo "GITHUB_REF: $GITHUB_REF"
          echo "GITHUB_WORKFLOW: $GITHUB_WORKFLOW"
          echo "::endgroup::"

      # Variáveis customizadas
      - name: Print custom env vars
        run: |
          echo "::group::Variáveis customizadas"
          echo "VAR_GLOBAL: $VAR_GLOBAL"
          echo "VAR_JOB: $VAR_JOB"
          echo "VAR_STEP: $VAR_STEP"
          echo "::endgroup::"
        env:
          VAR_STEP: "Variável disponível apenas neste step"

      # Variáveis do sistema
      - name: Print system env vars
        run: |
          echo "::group::Variáveis do sistema"
          echo "PATH: $PATH"
          echo "USER: $USER"
          echo "HOME: $HOME"
          echo "::endgroup::"

      # Variáveis de contexto
      - name: Print context vars
        run: |
          echo "::group::Variáveis de contexto"
          echo "Evento: ${{ github.event_name }}"
          echo "Branch: ${{ github.ref }}"
          echo "Timestamp: ${{ steps.timestamp.outputs.time }}"
          echo "::endgroup::"
        id: context-step

      # Criando variáveis dinamicamente
      - name: Set dynamic variable
        id: timestamp
        run: echo "time=$(date)" >> $GITHUB_OUTPUT

      # Variáveis de secrets
      - name: Print secret example
        if: env.MY_SECRET
        run: echo "Secret value is set (but won't print it!)"
        env:
          MY_SECRET: ${{ secrets.MY_SECRET }}

  outro-job:
    runs-on: ubuntu-latest
    needs: print-env-vars
    steps:
      - name: Show var inheritance
        run: |
          echo "VAR_GLOBAL: $VAR_GLOBAL"  # Ainda disponível
          echo "VAR_JOB: $VAR_JOB"        # Vazio - só existia no job anterior

```

#### Default Env Vars
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

```
name: 38_debug_variaveis_ambiente
on:
  workflow_dispatch:

jobs:
  print-github-vars:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      # Grupo 1: Identificação do Workflow
      - name: Variáveis de Identificação
        run: |
          echo "::group::🆔 Identificação do Workflow"
          echo "GITHUB_WORKFLOW: $GITHUB_WORKFLOW"
          echo "GITHUB_RUN_ID: $GITHUB_RUN_ID"
          echo "GITHUB_RUN_NUMBER: $GITHUB_RUN_NUMBER"
          echo "GITHUB_RUN_ATTEMPT: $GITHUB_RUN_ATTEMPT"
          echo "GITHUB_ACTION: $GITHUB_ACTION"
          echo "GITHUB_ACTIONS: $GITHUB_ACTIONS"
          echo "::endgroup::"

      # Grupo 2: Contexto do Repositório
      - name: Variáveis do Repositório
        run: |
          echo "::group::📦 Contexto do Repositório"
          echo "GITHUB_REPOSITORY: $GITHUB_REPOSITORY"
          echo "GITHUB_REPOSITORY_ID: $GITHUB_REPOSITORY_ID"
          echo "GITHUB_REPOSITORY_OWNER: $GITHUB_REPOSITORY_OWNER"
          echo "GITHUB_REPOSITORY_OWNER_ID: $GITHUB_REPOSITORY_OWNER_ID"
          echo "GITHUB_WORKSPACE: $GITHUB_WORKSPACE"
          echo "GITHUB_ACTION_PATH: $GITHUB_ACTION_PATH"
          echo "GITHUB_ACTION_REPOSITORY: $GITHUB_ACTION_REPOSITORY"
          echo "::endgroup::"

      # Grupo 3: Contexto de Git
      - name: Variáveis de Referência Git
        run: |
          echo "::group::🌿 Referência Git"
          echo "GITHUB_REF: $GITHUB_REF"
          echo "GITHUB_REF_NAME: $GITHUB_REF_NAME"
          echo "GITHUB_REF_TYPE: $GITHUB_REF_TYPE"
          echo "GITHUB_REF_PROTECTED: $GITHUB_REF_PROTECTED"
          echo "GITHUB_BASE_REF: $GITHUB_BASE_REF"
          echo "GITHUB_HEAD_REF: $GITHUB_HEAD_REF"
          echo "GITHUB_SHA: $GITHUB_SHA"
          echo "GITHUB_WORKFLOW_REF: $GITHUB_WORKFLOW_REF"
          echo "GITHUB_WORKFLOW_SHA: $GITHUB_WORKFLOW_SHA"
          echo "::endgroup::"

      # Grupo 4: Contexto de Execução
      - name: Variáveis de Ambiente de Execução
        run: |
          echo "::group::⚙️ Ambiente de Execução"
          echo "GITHUB_JOB: $GITHUB_JOB"
          echo "GITHUB_EVENT_NAME: $GITHUB_EVENT_NAME"
          echo "GITHUB_EVENT_PATH: $GITHUB_EVENT_PATH"
          echo "GITHUB_ENV: $GITHUB_ENV"
          echo "GITHUB_PATH: $GITHUB_PATH"
          echo "GITHUB_OUTPUT: $GITHUB_OUTPUT"
          echo "GITHUB_STEP_SUMMARY: $GITHUB_STEP_SUMMARY"
          echo "::endgroup::"

      # Grupo 5: Informações do Runner
      - name: Variáveis do Runner
        run: |
          echo "::group::🏃 Runner"
          echo "RUNNER_OS: $RUNNER_OS"
          echo "RUNNER_ARCH: $RUNNER_ARCH"
          echo "RUNNER_NAME: $RUNNER_NAME"
          echo "RUNNER_TEMP: $RUNNER_TEMP"
          echo "RUNNER_TOOL_CACHE: $RUNNER_TOOL_CACHE"
          echo "RUNNER_DEBUG: $RUNNER_DEBUG"
          echo "::endgroup::"

      # Grupo 6: URLs e API
      - name: Variáveis de API
        run: |
          echo "::group::🔗 URLs e API"
          echo "GITHUB_SERVER_URL: $GITHUB_SERVER_URL"
          echo "GITHUB_API_URL: $GITHUB_API_URL"
          echo "GITHUB_GRAPHQL_URL: $GITHUB_GRAPHQL_URL"
          echo "::endgroup::"

      # Grupo 7: Contexto de Usuário
      - name: Variáveis de Usuário
        run: |
          echo "::group::👤 Usuário"
          echo "GITHUB_ACTOR: $GITHUB_ACTOR"
          echo "GITHUB_ACTOR_ID: $GITHUB_ACTOR_ID"
          echo "GITHUB_TRIGGERING_ACTOR: $GITHUB_TRIGGERING_ACTOR"
          echo "::endgroup::"

      # Grupo 8: Configurações
      - name: Variáveis de Configuração
        run: |
          echo "::group::⚙️ Configurações"
          echo "GITHUB_RETENTION_DAYS: $GITHUB_RETENTION_DAYS"
          echo "::endgroup::"

      # Versão condensada para debug rápido
      - name: Todas as variáveis (raw)
        run: |
          echo "::group::📜 TODAS AS VARIÁVEIS (raw)"
          printenv | grep -E '^(GITHUB|RUNNER)_' | sort
          echo "::endgroup::"
```
Você pode definir Variáveis de Ambiente em linha no seu fluxo de trabalho do GitHub Actions.

```
name: Conditional env variable

on: workflow_dispatch

env:
  DAY_OF_WEEK: Monday

jobs:
  greeting_job:
    runs-on: self-hosted
    env:
      Greeting: Hello
    steps:
    - name: "Say Hello Mona it's Monday"
      if: ${{ env.DAY_OF_WEEK == 'Monday' }}
      run: echo "$Greeting $First_Name. Today is $DAY_OF_WEEK!"
      env:
        First_Name: Mona
```

### Criando mensagens de depuração
Crie mensagens de depuração que aparecem nos logs de suas ações, que só ficam visíveis se você habilitar o registro de depuração por etapas.

```
steps:
  - name: Create debug message
    run: |
          echo "::debug::Esta é uma mensagem de depuração."
```

#### Definir variáveis de ambiente com comandos de fluxo de trabalho
No GitHub Actions, você pode definir variáveis de ambiente dinamicamente durante a execução de seus fluxos de trabalho usando o comando de fluxo de trabalho especial $GITHUB_ENV.

Isso é útil para passar valores entre etapas, ajustar dinamicamente o comportamento com base em dados de tempo de execução ou configurar ferramentas e scripts executados pelo seu fluxo de trabalho.

```
name: 39_variaveis_de_ambiente

# Controls when the action will run. Workflow runs when manually triggered using the UI
# or API.
on:
  workflow_dispatch:
jobs:
  setup-and-use-env:
    runs-on: self-hosted
    steps:
      - name: Set dynamic environment variable
        run: |
          echo "DYNAMIC_VAR=Hello from GitHub Actions" > $GITHUB_ENV
      - name: Use the environment variable
        run: |
          echo "The value of DYNAMIC_VAR is: $DYNAMIC_VAR"
```
### GITHUB_TOKEN Secret
No início de cada trabalho de fluxo de trabalho, o **GitHub cria automaticamente um segredo GITHUB_TOKEN** exclusivo para usar no seu fluxo de trabalho.

Você pode usar o GITHUB_TOKEN para autenticar no trabalho de fluxo de trabalho.

Quando você habilita o GitHub Actions, o GitHub instala um GitHub App no seu repositório.

O segredo GITHUB_TOKEN é um token de acesso de instalação do GitHub App.

```
name: 40_criar_issue_automatica
on:
  workflow_dispatch:
    inputs:
      issue-title:
        description: 'Título da Issue'
        required: true
        default: 'Nova Issue criada via GitHub Actions'
      issue-body:
        description: 'Conteúdo da Issue'
        required: false
        default: 'Esta issue foi criada automaticamente por um workflow do GitHub Actions.'

jobs:
  create-issue:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Criar issue
        uses: actions/github-script@v7
        with:
          script: |
            const issue = await github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: 'Nova Issue Criada Automáticamente',
              body: 'Esta issue foi criada automaticamente por um workflow do GitHub Actions.'
            });
            console.log('Issue criada com sucesso: ' + issue.data.html_url);
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}


name: Create issue on commit

on: [push]

jobs:
  create_issue:
    runs-on: self-hosted
    permissions:
      issues: write
    steps:
      - name: Create issue using REST API
        run: |
          curl --silent --request POST \
          --url https://api.github.com/repos/${{ github.repository }}/issues \
          --header 'authorization: Bearer ${{ secrets.GITHUB_TOKEN }}' \
          --header 'content-type: application/json' \
          --data '{
            "title": "Automated issue for commit: ${{ github.sha }}",
            "body": "Automatically crated by the GitHub Action workflow **${{ github.workflow }}**. \n\n The commit hash was: _${{ github.sha }} }}_."
          }' \
          -- fail
```

### Códigos de saída e tratamento de erros
Por padrão, uma etapa falha se o comando shell ou script retornar um código de saída diferente de zero.

Para controlar o comportamento de tratamento de erros, você pode usar as palavras-chave continue-on-error e if.

- [x] **continue-on-error**: Defina como true se o trabalho deve continuar mesmo se a etapa falhar. O valor padrão é false.
- [x] **if**: Adiciona uma expressão condicional que determina se uma etapa deve ser executada. A etapa será executada somente se a expressão for avaliada como true.

Example:
```
jobs:
  build:
  runs-on: self-hosted
    steps:
      - name: Run linter
         run: npm run lint
         continue-on-error: true
         - name: Run tests
            run: npm test
         - name: Deploy
            run: npm run deploy
            if: success()
```
Neste exemplo, a etapa Run linter é configurada para continuar em caso de erro, permitindo que o fluxo de trabalho prossiga mesmo se o linter falhar.

A etapa Deploy usa uma expressão condicional com a palavra-chave if, garantindo que ela seja executada somente se as etapas anteriores forem bem-sucedidas.

### Diretório de trabalho
Por padrão, comandos e scripts de shell são executados no diretório raiz do repositório. Você pode alterar o diretório de trabalho para uma etapa específica ou um trabalho inteiro usando a palavra-chave **working-directory**. Exemplo:

```
name: 41-working-directory
on:
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      # 1. Criando estrutura de diretórios para o exemplo
      - name: Criar estrutura de pastas
        run: |
          mkdir -p api/ src/ tests/
          echo "console.log('API module');" > api/index.js
          echo "console.log('Source code');" > src/main.js
          echo "console.log('Tests');" > tests/test.js

      # 2. Executando comandos no diretório raiz
      - name: Listar arquivos (raiz)
        run: ls -l

      # 3. Usando working-directory para a pasta 'api'
      - name: Trabalhando no diretório api
        working-directory: ./api
        run: |
          echo "Diretório atual: $(pwd)"
          ls -l
          node index.js

      # 4. Usando working-directory para a pasta 'src'
      - name: Trabalhando no diretório src
        working-directory: ./src
        run: |
          echo "Diretório atual: $(pwd)"
          ls -l
          node main.js

      # 5. Step que falha propositalmente (diretório não existe)
      - name: Tentativa em diretório inexistente
        working-directory: ./non-existent-dir
        run: echo "Este passo falhará"
        continue-on-error: true

      # 6. Trabalhando com múltiplos working-directory no mesmo step
      - name: Build multi-projeto
        run: |
          echo "Build do projeto API:"
          cd api && npm install

          echo "Build do projeto principal:"
          cd ../src && npm install
```
Neste exemplo, as etapas Build frontend e Build backend são executadas nos diretórios frontend e backend, respectivamente.

### Executando scripts de arquivos
Em vez de escrever comandos shell diretamente no arquivo de fluxo de trabalho, você pode executar scripts de arquivos externos. Isso é particularmente útil para gerenciar scripts complexos ou reutilizáveis. Exemplo:
```
name: 41-run-scripts
on:
  workflow_dispatch:
jobs:
  execute-scripts:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      # 1. Executar script Bash
      - name: Executar script Shell
        run: |
             bash scripts/bash-script.sh
        env:
          CUSTOM_VAR: "Valor do GitHub Actions"

      # 2. Script com parâmetros
      - name: Executar com argumentos
        run: |
               bash scripts/bash-script.sh "param1" "param2"

      # 3. Dar permissão antes de executar (se necessário)
      - name: Dar permissão de execução
        run: |
              chmod +x scripts/*.sh

```
Neste exemplo, a etapa Execute deployment script executa o script bash-script.shdo diretório scripts.

## Gerenciando a execução do fluxo de trabalho
Ao aprender a controlar e ajustar seus fluxos de trabalho, você pode garantir que eles sejam executados de forma eficiente, eficaz e segura, ao mesmo tempo em que minimiza o consumo de recursos.

Primeiro, discutiremos variáveis de ambiente e segredos, que são essenciais para gerenciar dados de configuração e armazenar com segurança informações confidenciais, como chaves de API ou credenciais.

Acessar e usar variáveis de ambiente e segredos dentro dos seus fluxos de trabalho para torná-los mais flexíveis e seguros.

Exploraremos condições de nível de trabalho e etapa, que permitem que você controle a execução de trabalhos ou etapas específicas com base em determinados critérios.

Abordaremos vários tipos de expressões condicionais, como execução condicional básica, combinação de expressões com operadores lógicos e filtragem por tipo de evento ou ramificação.

Ao incorporar essas condições aos seus fluxos de trabalho, você pode criar processos de automação mais dinâmicos e adaptáveis.

Ao final você terá um entendimento completo de como gerenciar e otimizar a execução do fluxo de trabalho do GitHub Actions, permitindo que você crie processos de automação robustos, eficientes e seguros para seus projetos de desenvolvimento.

### Variáveis ​​de ambiente e segredos
Gerenciar dados sensíveis e valores de configuração é crucial para manter a segurança e a flexibilidade dos seus fluxos de trabalho.

Variáveis de ambiente e segredos fornecem uma maneira de armazenar e acessar esses dados sem codificá-los em seus arquivos de fluxo de trabalho. Nesta seção, discutiremos como definir, usar e gerenciar variáveis de ambiente e segredos em seus fluxos de trabalho do GitHub Actions.

#### Variáveis de Ambiente
Variáveis de ambiente são pares de chave-valor que estão disponíveis para as etapas do seu fluxo de trabalho conforme elas são executadas.

Elas podem armazenar valores de configuração, caminhos ou outros dados que você deseja acessar em várias etapas ou trabalhos.

Você pode definir variáveis de ambiente em três níveis diferentes:

- [x] **Nível do repositório**: Definido nas configurações do seu repositório e aplicado a todos os fluxos de trabalho no repositório;
- [x]**Nível do fluxo de trabalho**: Definido no arquivo de fluxo de trabalho com a palavra-chave env e aplicado a todos os trabalhos no fluxo de trabalho.
- [x] **Nível do trabalho ou etapa**: Definido no arquivo de fluxo de trabalho com a palavra-chave env e aplicado somente ao trabalho ou etapa específica. Exemplo:

```
name: 43-variaveis
on:
  workflow_dispatch:
env:
  GLOBAL_VARIABLE: "Global value"
jobs:
  build:
    runs-on: self-hosted
    env:
      JOB_VARIABLE: "Job value"
    steps:
      - name: Print environment variables
        run: |
              echo "Global variable: $GLOBAL_VARIABLE"
              echo "Job variable: $JOB_VARIABLE"
              echo "Step variable: $STEP_VARIABLE"
        env:
          STEP_VARIABLE: "Step value"
```

Neste exemplo, as variáveis de ambiente são definidas nos níveis de repositório, fluxo de trabalho, tarefa e etapa. A etapa Print environment variables acessa e imprime seus valores usando a sintaxe apropriada para o shell que está sendo usado.

### Secrets:
Segredos são variáveis de ambiente criptografadas que armazenam dados confidenciais, como tokens de acesso, senhas ou chaves de API.

Os **segredos não são expostos em logs ou disponibilizados para usuários com acesso de leitura ao repositório**, fornecendo uma maneira segura de armazenar e usar dados confidenciais em seus fluxos de trabalho.

Para criar um segredo, navegue até a guia "Configurações" do seu repositório e clique em "Segredos" na barra lateral esquerda.

Clique em "Novo segredo do repositório" para adicionar um novo segredo, fornecendo um nome e um valor.

Para usar um segredo em seu fluxo de trabalho, faça referência a ele usando o contexto de segredos em uma expressão.
Os segredos podem ser atribuídos a variáveis de ambiente ou usados diretamente em expressões. Exemplo:

```
jobs:
  deploy:
     runs-on: self-hosted
       steps:
          - name: Deploy with secret token
             run: npm run deploy --token $TOKEN
             env: TOKEN: ${{ secrets.DEPLOY_TOKEN }}
```

### Mascarando e redigindo segredos
O GitHub Actions mascara e redige automaticamente segredos em logs para evitar exposição acidental.

Se um valor secreto for detectado nos logs, ele será substituído pela sequência de caracteres `***`.

Para garantir que os segredos sejam mascarados corretamente, evite usar segredos com valores muito curtos ou comuns e valide a entrada do usuário se ela for usada para construir segredos.

#### Segredos da organização e do ambiente
Além dos segredos do repositório, o GitHub Actions oferece suporte a segredos da organização e segredos do ambiente.

Os segredos da organização podem ser compartilhados entre vários repositórios dentro de uma organização, enquanto os segredos do ambiente são delimitados para ambientes específicos e exigem aprovação para serem acessados por um fluxo de trabalho.

### Limitando o acesso secreto
Por padrão, os segredos não são passados para fluxos de trabalho que são acionados por uma solicitação de pull de um repositório bifurcado.

Isso ajuda a evitar acesso não autorizado aos seus segredos.

Para fornecer acesso limitado aos segredos para repositórios bifurcados, você pode usar o evento pull_request_target em combinação com verificações e condições adicionais no seu fluxo de trabalho. Exemplo:

```
  on:
    pull_request_target:
       types: [opened, synchronize]
        jobs:
          check_pr:
              runs-on: self-hosted
                steps:
                  - name: Check for approval
                    id: check
                    run: |
                         # Add logic to check if the PR is approved,
                         #e.g., by a specific user or using labels
                         if [ "${{ github.event.pull_request.user.login}}" =="trusted-user"]; then
                           echo "::set-output name=approved::true"
                         Else
                           echo "::set-output name=approved::false"
                        Fi
                        deploy:
                          runs-on: self-hosted
                            needs: check_pr
                            if: ${{ steps.check.outputs.approved == 'true'}}
                            steps:
                              - name: Deploy with secret token
                                 run: npm run deploy --token $TOKEN
                                 env:
                                   TOKEN: ${{ secrets.DEPLOY_TOKEN }}
```

Neste exemplo, o trabalho check_pr verifica se a solicitação de pull é aprovada com base na lógica personalizada (por exemplo, por um usuário específico ou usando rótulos).

O trabalho de implantação usa a palavra-chave needs para depender do trabalho check_pr e a palavra-chave if para executar condicionalmente a etapa de implantação se a solicitação de pull for aprovada.

Ao gerenciar efetivamente variáveis de ambiente e segredos em seus fluxos de trabalho do GitHub Actions, você pode armazenar com segurança dados confidenciais e valores de configuração, fornecendo uma maneira flexível e sustentável de gerenciar a execução do seu fluxo de trabalho.

### Condições de trabalho e de nível de etapa
A execução condicional é um recurso poderoso que permite que você controle quando os trabalhos e as etapas são executados com base em critérios específicos.

A execução condicional básica no GitHub Actions permite que você controle quando os trabalhos ou as etapas em seus fluxos de trabalho são executados com base em critérios específicos.

Ao usar a palavra-chave `if seguida por uma expressão condicional`, você pode determinar se um trabalho ou etapa deve ser executado.

O trabalho ou etapa será executado somente se a expressão for avaliada como true.Para definir uma condição para um trabalho, adicione a palavra-chave if no nível do trabalho no seu arquivo de fluxo de trabalho:

```
name: 44-controle_avançado_jobs_steps
on:
  workflow_dispatch:
env:
  ENV_GLOBAL: "Disponível em todos os jobs"

jobs:
  setup:
    runs-on: ubuntu-latest
    outputs:
      db_url: ${{ steps.set-db.outputs.db_url }}
      build_status: ${{ steps.build.outputs.status }}

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      # Step condicional
      - name: Configurar Banco de Dados
        id: set-db
        if: github.ref == 'refs/heads/main'
        run: |
          echo "Configurando banco de dados..."
          echo "" >> $GITHUB_OUTPUT

      # Step com timeout
      - name: Build
        id: build
        timeout-minutes: 5
        run: |
          echo "Executando build..."
          echo "status=success" >> $GITHUB_OUTPUT

      # Step que sempre executa (mesmo se anteriores falharem)
      - name: Notificar início
        if: always()
        run: echo "Iniciando pipeline..."

  test:
    needs: setup
    runs-on: ubuntu-latest
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest]
        node-version: [14, 16, 18]

    steps:
      - name: Setup Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v3
        with:
          node-version: ${{ matrix.node-version }}

      # Step com continue-on-error
      - name: Testes unitários
        continue-on-error: true
        run: npm test

      # Step dependente do anterior
      - name: Upload coverage
        if: success() || failure()  # Executa mesmo se testes falharem
        uses: actions/upload-artifact@v3
        with:
          name: coverage-${{ matrix.os }}-node${{ matrix.node-version }}
          path: coverage/

  deploy:
    needs: [setup, test]
    runs-on: ubuntu-latest
    environment: production
    concurrency: production-deploy
    strategy:
      matrix:
        region: ["us-east-1", "us-west-2", "eu-central-1"]


    steps:
      - name: Validar ambiente
        run: |
          echo "DB_URL: ${{ needs.setup.outputs.db_url }}"
          [ "${{ needs.setup.outputs.build_status }}" == "success" ] || exit 1

      # Step com matriz dinâmica
      - name: Deploy para regiões
        run: ./deploy.sh ${{ matrix.region }}

      # Step com retry
      - name: Verificação pós-deploy
        timeout-minutes: 3
        run: ./healthcheck.sh

  notify:
    needs: deploy
    if: always()  # Executa mesmo se jobs anteriores falharem
    runs-on: ubuntu-latest

    steps:
      - name: Notificar sucesso
        if: success()
        run: ./notify.sh "Deploy concluído com sucesso!"

      - name: Notificar falha
        if: failure()
        run: |
               echo "::error:: Falha deu ruim"
      # Step final com resumo
      - name: Resumo da execução
        run: |
          echo "Status dos jobs:"
          echo "- Setup: ${{ needs.setup.result }}"
          echo "- Test: ${{ needs.test.result }}"
          echo "- Deploy: ${{ needs.deploy.result }}"

```
Usando a execução condicional básica, você pode adaptar seus fluxos de trabalho para responder a diferentes eventos ou ramificações, otimizando o uso de recursos e reduzindo o tempo de execução geral. Isso torna seus fluxos de trabalho mais eficientes e adaptáveis, simplificando, em última análise, sua manutenção.

### Contextos e funções em condições
Ao definir expressões condicionais em seus fluxos de trabalho do GitHub Actions, você pode usar vários contextos e funções para criar condições mais dinâmicas e complexas.

Contextos fornecem acesso a dados sobre a execução do fluxo de trabalho atual, repositório e evento, enquanto funções oferecem uma maneira de manipular e avaliar esses dados. Aqui está uma visão geral de alguns contextos e funções comumente usados:

#### Contextos:
- [x] **github**: Fornece acesso a dados relacionados à execução do fluxo de trabalho atual, repositório e evento. Algumas propriedades comumente usadas incluem github.event_name, github.ref e github.actor.
- [x] **secrets**: Permite que você faça referência a segredos criptografados armazenados em seu repositório.needs: permite que você acesse a saída de trabalhos concluídos anteriormente dentro do mesmo fluxo de trabalho.
- [x] **steps**: Concede acesso à saída de etapas anteriores dentro do mesmo trabalho.
- [ ] **env**: Faz referência a variáveis de ambiente definidas no nível do fluxo de trabalho, trabalho ou etapa.

#### Funções:
- [x] **success()**: Retorna true se todas as etapas ou trabalhos anteriores no fluxo de trabalho foram concluídos com sucesso e false caso contrário.
- [x] **failure()**: Retorna true se qualquer uma das etapas ou trabalhos anteriores no fluxo de trabalho falhou e false caso contrário.
- [x] **cancelled()**: Retorna true se qualquer uma das etapas ou trabalhos anteriores no fluxo de trabalho foram cancelados e false caso contrário.
- [x] **startsWith(), endsWith() e contains()**: Funções de manipulação de string que podem ser usadas para verificar se uma stringExample:jobs:deploy:starts with, ends with ou contains uma substring específica, respectivamente.
- [x] **fromJson()**: Analisa uma string JSON e retorna um objeto JSON que pode ser usado em expressões.

```
jobs:
  runs-on: self-hosted
  if: ${{ github.event_name steps:=='push' && startsWith(github.ref, 'refs/heads/main')}}
     - name: Checkout repository
       uses: actions/checkout@v4
     - name: Deployrun: npm run deploy
        env:API_KEY: ${{ secrets.API_KEY}}
```

Ao usar contextos e funções em suas condições, você pode criar fluxos de trabalho mais versáteis que respondem dinamicamente a diferentes eventos, ramificações, status e outros critérios relevantes.

Isso permite que você otimize o uso de recursos, reduza o tempo de execução e melhore a capacidade de manutenção dos seus fluxos de trabalho do GitHub Actions.

### Combinando Expressões com Operadores Lógicos
No GitHub Actions, você pode combinar expressões em suas instruções condicionais usando operadores lógicos para criar condições mais complexas. Essa flexibilidade permite que você adapte seus fluxos de trabalho para executar ou pular tarefas e etapas com base em vários critérios, otimizando ainda mais o uso de recursos e o tempo de execução.

Os seguintes operadores lógicos estão disponíveis para uso em expressões condicionais:

- [x] `&& (e)`: Avalia como verdadeiro se as expressões esquerda e direita forem verdadeiras e falso caso contrário.
- [x]  `|| (ou)`: Avalia como verdadeiro se a expressão esquerda ou direita for verdadeira e falso caso contrário.
- [x]  `! (não)`: Nega o valor verdade da expressão que o segue. Retorna verdadeiro se a expressão for falsa e falso se a expressão for verdadeira.

```
jobs:
   teste:
      runs-on: self-hosted
      if: ${{ github.event_name=='push' && (startsWith(github.ref, 'refs/heads/main') || contains(github.event.head_commit.message, '[build]')) }}
      steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Install dependencies
        run: npm ci
      - name: Run tests
        run: npm test
      - name: Build project
        run: npm run build
```
Neste exemplo, o trabalho teste será executado somente se o evento que disparou o fluxo de trabalho for um evento push e o branch atual for o branch principal ou a mensagem de commit contiver a string [build].

Ao combinar expressões com operadores lógicos, você pode criar condições mais diferenciadas para executar trabalhos e etapas em seus fluxos de trabalho do GitHub Actions.

Esse nível adicional de controle permite que você crie fluxos de trabalho mais eficientes e adaptáveis, simplificando sua manutenção e melhorando o gerenciamento de recursos.

### Dependências condicionais de trabalho
Dependências condicionais de trabalho no GitHub Actions permitem que você crie dependências entre trabalhos e controle sua ordem de execução com base no sucesso ou falha de trabalhos anteriores.

Essa funcionalidade pode ajudar a otimizar o uso de recursos, reduzir o tempo de execução e melhorar a manutenibilidade dos seus fluxos de trabalho.

Para criar uma dependência de trabalho, use a palavra-chave needs no nível do trabalho, seguida pelo nome do(s) trabalho(s) do(s) qual(is) ele(s) depende. O trabalho dependente só será executado se todos os trabalhos dos quais ele depende tiverem sido concluídos com sucesso. Exemplo:
```
jobs:
   build:
     runs-on: self-hosted
     steps:
       - name: Checkout repository
         uses: actions/checkout@v4
       - name: Install dependencies
         run: npm ci
       - name: Build project
         run: npm run
    buildtest:
      runs-on: self-hosted
      needs: build
      steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Install dependencies
        run: npm ci
      - name: Run tests
        run: npm
      testdeploy:
        runs-on: self-hosted
        needs:
         teststeps:
        - name: Checkout repository
          uses: actions/checkout@v4
          - name: Deploy
             run: npm run deploy
```
Neste exemplo, o trabalho de teste depende da conclusão bem-sucedida do trabalho de construção, e o trabalho de implantação depende da conclusão bem-sucedida do trabalho de teste.

Os trabalhos serão executados em sequência e, se algum trabalho falhar, os trabalhos subsequentes não serão executados.

Você também pode usar expressões condicionais com a palavra-chave needs para criar dependências mais complexas:

```
jobs:
  build:
     runs-on: self-hosted
      steps:
         - name: Checkout repository
           uses: actions/checkout@v4
          - name: Install dependencies
             run: npm ci
          - name: Build project
            run: npm run
      buildtest:
        runs-on: self-hosted
          needs: build
          if: ${{ github.event_name != 'pull_request' || !contains(github.event.pull_request.labels.*.name, 'skip-tests') }}
          steps:
            - name: Checkout repository
              uses: actions/checkout@v4
            - name: Install dependencies
               run: npm ci
            - name: Run tests
               run: npm test
      deploy:
        runs-on: self-hosted
          needs: test
          if: ${{ success() }}
            steps:
              - name: Checkout repository
                uses: actions/checkout@v4
              - name: Deploy
                 run: npm run deploy
```

Neste exemplo modificado, o trabalho de teste será executado somente se o trabalho de construção for bem-sucedido e o evento não for uma solicitação de pull ou a solicitação de pull não tiver um rótulo chamado "skip-tests".

O trabalho de implantação será executado somente se o trabalho de teste for bem-sucedido.

Ao aproveitar as dependências de trabalho condicionais em seus fluxos de trabalho do GitHub Actions, você pode criar fluxos de trabalho mais eficientes e flexíveis que respondem dinamicamente ao sucesso ou falha de trabalhos anteriores, simplificando, em última análise, a manutenção do fluxo de trabalho e melhorando o gerenciamento de recursos.

### Pular tarefas e etapas
No GitHub Actions, você pode pular trabalhos ou etapas dentro dos seus fluxos de trabalho com base em condições específicas usando a palavra-chave if seguida por uma expressão condicional.

Se a expressão for avaliada como falsa, o trabalho ou etapa será ignorado.

Pular trabalhos ou etapas desnecessárias pode ajudar a otimizar o uso de recursos, reduzir o tempo de execução e melhorar a capacidade de manutenção dos seus fluxos de trabalho.

Para pular um trabalho, adicione a palavra-chave if no nível do trabalho no seu arquivo de fluxo de trabalho:
```
jobs:
  deploy:
  runs-on: self-hosted
  if: ${{ github.event_name == 'push' && startsWith(github.ref, 'refs/heads/main')}}
  steps:
   - name: Checkout repository
     uses: actions/checkout@v4
   - name: Deploy to production
     run: npm run deploy
```

Neste exemplo, o trabalho de implantação será executado somente se o evento que disparou o fluxo de trabalho for um evento push e a ramificação atual for a ramificação principal.

Caso contrário, o trabalho será ignorado.

Da mesma forma, você pode pular etapas individuais dentro de um trabalho adicionando a palavra-chave if no nível da etapa:
```
jobs:
 test:
   runs-on: self-hosted
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Install dependencies
        run: npm ci
      - name: Run tests
        run: npm test
      - name: Upload test coverage
        if: ${{ success()}}
         uses: actions/upload-artifact@v2
           with:
             name: test-coverage
             path: coverage/
```

Neste exemplo, a etapa Upload test coverage será executada somente se todas as etapas anteriores dentro do trabalho de teste tiverem sido concluídas com sucesso. Se qualquer etapa anterior falhar, a etapa será ignorada.

Ao usar expressões condicionais para ignorar trabalhos e etapas em seus fluxos de trabalho do GitHub Actions, você pode criar fluxos de trabalho mais eficientes e adaptáveis que respondem dinamicamente a diferentes eventos, ramificações e status.

Este nível adicional de controle permite que você otimize o uso de recursos e reduza o tempo de execução, simplificando, em última análise, a manutenção do fluxo de trabalho e melhorando o gerenciamento de recursos.

### Filtragem por tipo de evento ou filial
Filtrar trabalhos e etapas com base no tipo de evento ou ramificação no GitHub Actions permite que você crie fluxos de trabalho mais direcionados que respondem especificamente ao contexto em que são executados.

Ao usar expressões condicionais com a palavra-chave if, você pode controlar quando um trabalho ou etapa é executado com base no evento que acionou o fluxo de trabalho ou a ramificação atual.

### Filtrando por tipo de evento
Para filtrar um trabalho ou etapa com base no tipo de evento, use o contexto github.event_name na sua expressão condicional.
Este contexto fornece acesso ao nome do evento que disparou o fluxo de trabalho.
Exemplo:
```
jobs:
  deploy:
     runs-on: self-hosted
      if: ${{ github.event_name == 'push'}}
       steps:
         - name: Checkout repository
           uses: actions/checkout@v4
         - name: Deploy to production
           run: npm run deploy
```

Neste exemplo, o job de implantação será executado somente se o evento que disparou o fluxo de trabalho for um evento push.

#### Filtrando por  Branch
Para filtrar um trabalho ou etapa com base no branch atual, use o contexto github.ref na sua expressão condicional.

Este contexto fornece acesso ao branch ou tag ref que disparou o fluxo de trabalho. Exemplo:

```
jobs:
  deploy:
    runs-on: self-hosted
    if: ${{ startsWith(github.ref, 'refs/heads/main') }}
     steps:
         - name: Checkout repository
           uses: actions/checkout@v4
         - name: Deploy to production
            run: npm run deploy
```
Neste exemplo, o trabalho de implantação será executado somente se o branch atual for o branch principal.


### Combinando tipo de evento e filtragem de ramificação
Você também pode combinar filtragem de tipo de evento e ramificação em uma única expressão condicional usando operadores lógicos como `&& (e) ou || (ou)`. Exemplo:
```
jobs:
  Deploy:
    runs-on: self-hosted
    if: ${{ github.event_name == 'push' && startsWith(github.ref, 'refs/heads/main')}}
     steps:
    - name: Checkout repository
      uses: actions/checkout@v4
    - name: Deploy to production
       run: npm run deploy
```

Neste exemplo, o trabalho de implantação será executado somente se o evento que disparou o fluxo de trabalho for um evento push e a ramificação atual for a ramificação principal.

### Tratamento de erros e continue-on-error
O tratamento de erros é um aspecto crucial da construção de fluxos de trabalho robustos do GitHub Actions.
Por padrão, se uma etapa falhar, todo o trabalho será marcado como falhado e quaisquer etapas subsequentes não serão executadas.
No entanto, pode haver casos em que você deseja que um trabalho continue em execução mesmo se uma etapa encontrar um erro.
A palavra-chave continue-on-error permite que você controle esse comportamento e garanta que seus fluxos de trabalho possam lidar com erros com elegância e continuar em execução quando necessário.
Usando continue-on-errorPara usar continue-on-error em seu fluxo de trabalho, adicione a palavra-chave no nível da etapa e defina seu valor como true.
Isso instruirá o GitHub Actions a continuar executando as etapas restantes no trabalho, mesmo se a etapa atual encontrar um erro.Exemplo:
```
jobs:
  build:
    runs-on: self-hosted
      steps:
        - name: Checkout repository
          uses: actions/checkout@v4
        - name: Install dependencies
          run: npm ci
        - name: Run linter
          run: npm run lint
          continue-on-error: true
        - name: Run tests
           run: npm test
```
Neste exemplo, a etapa Run linter é configurada com continue-on-error: true.
Se o linter encontrar um erro (por exemplo, ele encontrar violações de estilo de código), a etapa será marcada como falha, mas o trabalho continuará executando as etapas restantes, como executar os testes.

### Personalizando o comportamento de tratamento de erros
Você também pode usar expressões condicionais com a palavra-chave continue-on-error para personalizar o comportamento de tratamento de erros com base em condições específicas.
Exemplo:
```
jobs:
  build:
   runs-on: self-hosted
   steps:
     - name: Checkout repository
       uses: actions/checkout@v4
     - name: Install dependencies
       run: npmci
      - name: Run linter
         run: npm run lint
         continue-on-error: ${{ github.event_name=='pull_request'}}
        - name: Run tests
           run: npm test
```
Neste exemplo modificado, o valor continue-on-error é definido como uma expressão condicional que avalia como true se o evento que acionou o fluxo de trabalho for uma solicitação de pull.

Isso significa que se o fluxo de trabalho for acionado por um evento de solicitação de pull e o linter encontrar um erro, o trabalho continuará executando as etapas restantes.

No entanto, se o fluxo de trabalho for acionado por outro tipo de evento, como um evento push, o trabalho será marcado como falha e as etapas restantes não serão executadas.

### Criando ações personalizadas do GitHub
Nós podemos expandir os recursos dos seus fluxos de trabalho além das ações pré-construídas disponíveis no GitHub Marketplace.

As ações personalizadas permitem que você adapte seus processos de automação às necessidades específicas dos seus projetos de desenvolvimento e implemente funcionalidades exclusivas que podem não estar disponíveis em ações existentes.

#### Tipos de ações do GitHub
Existem três tipos de ações do GitHub:

- [x] Ações de contêiner;
- [x] Ações JavaScript;
- [x] Ações compostas;

Com ações de contêiner , o ambiente é parte do código da ação.

Essas ações só podem ser executadas em um ambiente Linux que o GitHub hospeda. As ações de contêiner suportam muitas linguagens diferentes.

As ações JavaScript não incluem o ambiente no código. Você terá que especificar o ambiente para executar essas ações.

Você pode executar essas ações em uma VM (máquina virtual) na nuvem ou no local. As ações JavaScript oferecem suporte a ambientes Linux, macOS e Windows.

Ações compostas permitem que você combine várias etapas de fluxo de trabalho em uma ação.
Por exemplo, você pode usar esse recurso para agrupar vários comandos de execução em uma ação e, então, ter um fluxo de trabalho que executa os comandos agrupados como uma única etapa usando essa ação.

Em seguida, forneceremos instruções passo a passo sobre como criar suas próprias ações personalizadas, abrangendo a estrutura, os componentes e o processo de desenvolvimento para ações baseadas em Docker e JavaScript.

Esta abordagem prática garantirá que você ganhe experiência prática e um profundo entendimento de como criar ações personalizadas de forma eficaz.

Esses insights ajudarão você a criar ações personalizadas reutilizáveis e de alta qualidade que podem ser compartilhadas com a comunidade ou usadas de forma privada em sua organização.

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

- [x] O contêiner Docker executa seu código de ação em um contêiner Docker;
- [x] O JavaScript é executado diretamente no sistema operacional host do runner;
- [x] Uma ação composta permite que você combine várias etapas do fluxo de trabalho em uma ação;

### Ações baseadas em Docker vs. Ações baseadas em JavaScript
Compararemos e contrastaremos os dois tipos principais de ações personalizadas do GitHub: ações baseadas em Docker e ações baseadas em JavaScript.

Entender as diferenças entre esses tipos de ação, bem como suas respectivas vantagens e limitações, ajudará você a tomar decisões informadas ao criar ações personalizadas para seus fluxos de trabalho.

### Introdução às ações baseadas em Docker
Ações baseadas em Docker são Ações do GitHub que são executadas dentro de um contêiner Docker. Isso significa que o ambiente de tempo de execução da ação é isolado e pode ser personalizado para incluir quaisquer dependências necessárias para a ação.

### Vantagens das ações baseadas em Docker
- [x] Ambiente altamente personalizável e autocontido.
- [x] Ambiente de execução consistente, garantindo que a ação se comporte da mesma forma em diferentes executores.

Pode ser escrito em qualquer linguagem de programação, desde que o tempo de execução da linguagem esteja disponível no contêiner Docker.

### Limitações das ações baseadas em Docker
**Só pode ser executado em executores Linux**, pois o Docker não é suportado em executores macOS ou Windows.

Tempo de **inicialização mais lento**, devido à sobrecarga de construção e execução do contêiner Docker.

### Introdução às ações baseadas em JavaScript
Ações baseadas em JavaScript são Ações do GitHub que **são executadas diretamente na máquina host do executor** usando Node.js.
Essas ações **exigem menos recursos em comparação com Ações baseadas em Docker**, pois não são executadas dentro de um contêiner.

#### Vantagens das ações baseadas em JavaScript
Tempo de inicialização mais rápido, pois não há necessidade de construir ou executar um contêiner Docker.

Pode ser executado em qualquer plataforma, incluindo Linux, macOS e Windows.

Mais fácil de criar e manter, pois eles exigem apenas um script de ponto de entrada único escrito em JavaScript ou TypeScript.

#### Limitações das ações baseadas em JavaScript
Limitado a JavaScript ou TypeScript, pois a ação é executada diretamente no tempo de execução do Node.js.

As dependências da ação e o ambiente de tempo de execução devem ser compatíveis com o ambiente host do executor.

### Escolhendo o tipo de ação certo para seu fluxo de trabalho
Ao decidir entre ações baseadas em Docker e baseadas em JavaScript, considere os seguintes fatores:
- [X] **Compatibilidade de plataforma**: Se seu fluxo de trabalho precisa ser executado em executores macOS ou Windows, as ações baseadas em JavaScript são a melhor escolha.
- [X] **Tempo de inicialização**: Se minimizar o tempo de inicialização for crucial, as ações baseadas em JavaScript geralmente oferecem execução mais rápida.
- [X] **Personalização e dependências**: se sua ação requer um ambiente altamente personalizado ou tem dependências complexas, as ações baseadas em Docker podem ser mais adequadas.
- [X] **Linguagem de programação**: Se você preferir usar uma linguagem de programação diferente de JavaScript ou TypeScript, as ações baseadas em Docker oferecem maior flexibilidade.

Concluindo, as ações baseadas em Docker e JavaScript têm seus méritos e limitações.

### Construindo uma ação baseada em Docker

#### Configurar a estrutura do projeto
Primeiro, crie um novo diretório para sua ação e navegue até ele:

```
mkdir minha-imagem-docker
cd minha-imagem-docker
```
Em seguida, crie os seguintes arquivos e pastas dentro do diretório do projeto:

- [x] **Dockerfile**: O Dockerfile define a imagem do contêiner para sua ação, incluindo a imagem base, o tempo de execução e as dependências.
- [x] **entrypoint.sh**: Este script de shell serve como ponto de entrada para sua ação, contendo o código que será executado quando a ação for executada.
- [x] **README.md**: Um arquivo README que documenta sua ação, incluindo instruções de uso, parâmetros de entrada e valores de saída.

### Configure the Dockerfile
Edite o Dockerfile e especifique a imagem base, dependências e outras configurações.
Por exemplo, se sua ação requer Python, você pode usar o seguinte Dockerfile:

```
FROM python:3.8-slim
# Install any additional dependencies
RUN pip install requests
# Set the working directory
WORKDIR /app
# Copy the entrypoint script into the container
COPY entrypoint.sh /app
# Make the script executable
RUN chmod +x /app/entrypoint.sh
# Set the entrypoint for the container
ENTRYPOINT ["/app/entrypoint.sh"]
```
#### Implementar o script do ponto de entrada
Edite o arquivo `entrypoint.sh` e escreva o código que sua ação executará. Por exemplo, o script a seguir busca dados de uma API e imprime a resposta:
```
#!/bin/sh -1
set-e
API_URL="https://api.example.com/data"
echo "Fetching data from $API_URL..."
response=$(curl -s "$API_URL")
echo "Response from API:"
echo "$response"
```
Certifique-se de definir as permissões corretas no arquivo entrypoint.sh:

```
chmod +x entrypoint.sh
```
### Teste sua ação localmente
Antes de publicar sua ação, teste-a localmente criando e executando o contêiner Docker:
```
docker build -t minha-imagem-docker .
docker run   --rm minha-imagem-docker
```
Se tudo funcionar como esperado, você pode prosseguir para a próxima etapa.

### Publique sua ação
Para tornar sua ação disponível para uso em fluxos de trabalho, envie o projeto para um repositório do GitHub.

Certifique-se de incluir um arquivo README.md com instruções sobre como usar sua ação, incluindo quaisquer parâmetros de entrada necessários e valores de saída esperados.

Depois que sua ação for publicada, você pode referenciá-la em seus fluxos de trabalho usando a palavra-chave uses com a URL do repositório:

```
jobs:
  my-job:
    runs-on: self-hosted
      steps:
        - name: Run My Docker Action
          uses: horaciovasconcellos/minha-imagem-docker@main
```
Pronto! Agora você criou com sucesso uma GitHub Action personalizada baseada em Docker.
Seguindo essas etapas, você pode desenvolver e publicar suas próprias ações para automatizar várias tarefas e processos em seus fluxos de trabalho.
### Construindo uma ação baseada em JavaScript
Seguindo essas etapas, você aprenderá como desenvolver, testar e publicar sua própria Action baseada em Java-Script para uso em seus fluxos de trabalho.

### Configurar a estrutura do projeto
Primeiro, crie um novo diretório para sua ação e navegue até ele:
```
mkdir meu-javascript-action
cd meu-javascript-action
```
Em seguida, crie os seguintes arquivos e pastas dentro do diretório do projeto:

- [x] **index.js**: O ponto de entrada para sua ação, contendo o código Java-Script que será executado quando a ação for executada.
- [x] **action.yml**: Um arquivo YAML que define os metadados da sua ação, incluindo seu nome, descrição, entradas e saídas.
- [x] **README.md**: Um arquivo README que documenta sua ação, incluindo instruções de uso, parâmetros de entrada e valores de saída.
- [x] **package.json**: O manifesto do pacote do projeto, que lista dependências e outras configurações.

### Configurar o arquivo action.yml
Edite o arquivo `action.yml` e especifique os metadados da sua ação, incluindo nome, descrição, entradas e saídas.
```
For example:name: 'My JavaScript Action'
description: 'Perform a custom task using a JavaScript-based GitHub Action'
inputs:
  input1:
     description: 'An example input parameter'
     required: true
     outputs:
       output1:
           description: 'An example output value'
           runs:
             using: 'node12'
            main:
               'index.js'
```
### Implementar o arquivo index.js
Edite o arquivo index.js e escreva o código JavaScript que sua ação executará.
Certifique-se de importar os pacotes @actions/core e @actions/ github para interagir com o GitHub Actions.
Por exemplo, o script a seguir busca dados de uma API e define um valor de saída:
```
const core = require('@actions/core');
const axios = require('axios');
(async() => {try {const apiUrl = 'https://api.example.com/data';
console.log(`Fetching data from ${apiUrl}...`);
const response = await axios.get(apiUrl);
console.log('Response from API:', response.data);
core.setOutput('output1', response.data);}
catch (error) {console.error(error.message);
core.setFailed(error.message);}})0;
```

### Instalar dependências e configurar o arquivo package.json
Instale as dependências necessárias usando npm:

- [x] `npm init -y npm install @actions/core @actions/github axios`

### Teste sua ação localmente
Antes de publicar sua ação, teste-a localmente executando o arquivo index.js com Node.js:

- [x] `node index.js`

Se tudo funcionar como esperado, você pode prosseguir para a próxima etapa.

Publique sua açãoPara tornar sua ação disponível para uso em fluxos de trabalho, envie o projeto para um repositório GitHub.

Certifique-se de incluir um arquivo README.md com instruções sobre como usar sua ação, incluindo quaisquer parâmetros de entrada necessários e valores de saída esperados.

Depois que sua ação for publicada, você pode referenciá-la em seus fluxos de trabalho usando a palavra-chave uses com a URL do repositório:

```
jobs:
  My-job:
    runs-on: self-hosted
      steps:
        - name: Run My JavaScript Action
          uses: your-username/meu-javascript-action@main
           With:
          input1: 'example-value'
```
Seguindo essas etapas, você pode desenvolver e publicar suas próprias ações para automatizar várias tarefas e processos em seus fluxos de trabalho.

### Controle de versão e publicação de sua ação personalizada
#### Controle de versão semântico
O controle de versão semântico (SemVer) é um esquema de controle de versão amplamente adotado que usa um formato simples para transmitir informações sobre alterações em sua ação.

Ele usa um formato de número de versão MAJOR.MINOR.PATCH, onde:

- [x] MAJOR: incrementado quando você introduz alterações de quebra ou remove funcionalidades.
- [x] MINOR: incrementado quando você adiciona novos recursos que são compatíveis com versões anteriores.
- [x] PATCH: incrementado quando você corrige bugs ou faz pequenas melhorias que são compatíveis com versões anteriores.

Adotar o SemVer ajuda os usuários a entender o impacto das atualizações e torna mais fácil para eles escolherem a versão apropriada de sua ação.

### Usando tags Git
As tags Git são uma maneira conveniente de marcar pontos específicos no histórico do seu repositório como um lançamento.

Ao criar um novo lançamento da sua ação, crie uma tag Git com o número da versão correspondente:
```
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```
### Criando ramificações de lançamento
Além das tags do Git, você pode querer criar branches de lançamento para cada versão principal da sua ação.
Isso permite que você mantenha várias versões simultaneamente, fornecendo correções de bugs e melhorias para versões mais antigas enquanto continua a desenvolver novos recursos.
Por exemplo, você pode criar um branch chamado v1 para a versão principal 1:
```
git checkout -b v1
git push -u origin v1
```

### Atualizando o README
No arquivo `README.md` da sua ação, inclua instruções claras sobre como referenciar diferentes versões da sua ação em um fluxo de trabalho.

Para usar a versão mais recente do `My Action`, adicione a seguinte etapa ao seu fluxo de trabalho:
```
steps:
  - name: Run My Action
    uses: your-username/my-action@main
```
Para usar uma versão específica do My Action, substitua main pelo número da versão desejada:
```
steps:
  - name: Run My Action
    uses: your-username/my-action@v1.0.0
```
### Publishing Your Action
Para tornar sua ação disponível para uso em fluxos de trabalho, envie o projeto para um repositório do GitHub.

Certifique-se de que seu arquivo README.md contenha instruções abrangentes sobre como usar sua ação, incluindo quaisquer parâmetros de entrada necessários e valores de saída esperados.

Depois que sua ação for publicada, os usuários podem referenciá-la em seus fluxos de trabalho usando a palavra-chave uses com a URL do repositório e a versão desejada:

```
jobs:
  my-job:
    runs-on: self-hosted
       steps:
         - name: Run My Custom Action
           uses: your-username/my-action@v1
```

### Usando o GitHub Actions Marketplace
O marketplace oferece uma ampla variedade de ações que podem ajudar você a automatizar tarefas, integrar com serviços de terceiros e simplificar seus fluxos de trabalho sem precisar criar ações personalizadas do zero.

Ao usar as ações disponíveis no marketplace, você pode economizar tempo, reduzir a complexidade e se concentrar nos principais recursos dos seus projetos.

#### Descobrindo e avaliando ações
Nesta seção, discutiremos como encontrar, avaliar e selecionar as ações certas do GitHub Actions Marketplace para seu caso de uso específico.
Ao seguir essas diretrizes, você pode ter confiança nas ações que escolher e garantir que elas atendam aos seus requisitos.

### Navegando e pesquisando no Marketplace
O GitHub Actions Marketplace pode ser acessado em `https://github.com/marketplace?type=actions`.
Aqui, você pode navegar por várias categorias ou usar a barra de pesquisa para encontrar ações que atendam às suas necessidades específicas.

Você pode filtrar seus resultados de pesquisa por categoria, editora ou classificação por popularidade, classificação ou atualidade.
### Avaliando a qualidade da ação
Ao avaliar uma ação, considere os seguintes fatores para garantir que ela atenda às suas expectativas:

- [X] **Popularidade**: Verifique o número de estrelas, bifurcações e downloads para ter uma ideia da popularidade da ação na comunidade. Ações populares têm mais probabilidade de serem mantidas e atualizadas regularmente.
- [X] **Documentação**: Ações bem documentadas geralmente fornecem instruções claras, exemplos de uso e detalhes sobre parâmetros de entrada, saídas e problemas potenciais. A documentação adequada facilita a compreensão e a integração de uma ação ao seu fluxo de trabalho.
- [X] **Editor**: Considere a reputação do editor, seja ele um desenvolvedor individual ou uma organização. Ações publicadas por fontes confiáveis têm mais probabilidade de serem confiáveis ​​e seguras.
- [X] **Problemas abertos e solicitações de pull**: Revise o repositório da ação para problemas abertos e solicitações de pull. Isso pode lhe dar uma ideia da capacidade de resposta do mantenedor e de qualquer desenvolvimento ou problemas em andamento que possam afetar o desempenho da ação.
- [X] **Licença**: Verifique se a ação é lançada sob uma licença de código aberto que seja compatível com as políticas do seu projeto e da organização.

### Ações de teste
Crie um repositório de teste, configure um fluxo de trabalho de amostra e inclua a ação que deseja testar.

Monitore a execução do fluxo de trabalho e analise os resultados para garantir que a ação se comporte conforme o esperado.

### Lendo avaliações de usuários
As avaliações de usuários podem fornecer insights valiosos sobre o desempenho, a confiabilidade e a usabilidade de uma ação.

Ao ler as experiências de outros usuários, você pode obter uma melhor compreensão dos pontos fortes e fracos da ação, o que pode ajudá-lo a tomar uma decisão informada.

Ao seguir estas etapas, você pode descobrir, avaliar e selecionar as ações mais adequadas do GitHub Actions Marketplace para aprimorar seus fluxos de trabalho e agilizar seu processo de desenvolvimento.

### Ações populares para tarefas comuns
Essas ações podem ajudar você a economizar tempo e esforço automatizando processos repetitivos e integrando-se com ferramentas e serviços amplamente utilizados.

### Integração e Implantação Contínua
- [X] **GitHub Actions para Node.js**: Esta ação configura um ambiente Node.js no runner, permitindo que você crie, teste e implante aplicativos Node.js.
- [X] **GitHub Actions para Python**: Semelhante à ação Node.js, esta ação configura um ambiente Python no runner, permitindo que você crie, teste e implante aplicativos Python.
- [X] **Implantar em GitHub Pages**: Esta ação automatiza a implantação de sites estáticos ou documentação em GitHub Pages.
### Qualidade e Análise de Código
- [X] **ESLint**: Esta ação executa o ESLint na sua base de código, ajudando você a manter um estilo de código consistente e identificar problemas potenciais.
- [X] **Codecov**: Esta ação carrega seus relatórios de cobertura de código para o Codecov, uma ferramenta popular de análise de cobertura de código que fornece insights sobre a cobertura de teste do seu projeto.

### Project Management and Collaboration
- [X] **Ação do GitHub para Triagem**: Esta ação adiciona rótulos a novos problemas com base no conteúdo do problema, ajudando você a categorizar e priorizar problemas de forma mais eficaz.
- [X] **Obsoleto**: Esta ação marca automaticamente problemas inativos e solicitações de pull como obsoletos e, eventualmente, os fecha se permanecerem inativos, mantendo o rastreador de problemas do seu projeto limpo e gerenciável.

### Integrações de terceiros
- [x] **Notificação do Slack**: Esta ação envia notificações para um canal do Slack quando eventos específicos ocorrem no seu fluxo de trabalho, como falhas de build ou conclusões de implantação.
- [x] **AWS CLI:** esta ação permite que você use a AWS Command Line Interface (CLI) dentro dos seus fluxos de trabalho do GitHub Actions, permitindo que você interaja com os serviços da AWS.
### Miscellaneous
- [X] **Cache**: Esta ação armazena em cache dependências e saídas de build, reduzindo o tempo necessário para executar builds subsequentes.
- [X] **Labeler**: Esta ação adiciona automaticamente rótulos a pull requests com base nas alterações feitas, melhorando a organização e a colaboração do projeto.

### Integrando serviços de terceiros
Essas integrações podem ajudar você a simplificar seu processo de desenvolvimento, automatizar tarefas repetitivas e aproveitar os recursos de várias ferramentas e plataformas.
### Escolha a integração certa
Ao decidir sobre integrações de terceiros, considere o seguinte:
- [x] Identifique os serviços que já fazem parte do seu processo de desenvolvimento e implantação.
- [x] Determine os serviços adicionais que podem ajudar a melhorar seu fluxo de trabalho, como ferramentas de colaboração, ferramentas de análise de qualidade de código ou serviços de monitoramento.
- [x] Avalie a disponibilidade e a qualidade das GitHub Actions para os serviços que você identificou.
### Autenticação e Autorização
A maioria dos serviços de terceiros exige autenticação e autorização para interagir com suas APIs.
Isso normalmente é feito usando chaves de API, tokens ou outras credenciais.
Você deve armazenar essas credenciais com segurança usando segredos do GitHub Actions, que são criptografados e expostos apenas às ações específicas que precisam deles.
Aqui está um exemplo de configuração de um segredo para um token da API do Slack:
- [X] Vá para seu repositório do GitHub, clique em "Configurações" e depois clique em "Segredos".
- [X] Clique em "Novo segredo do repositório" e insira um nome (por exemplo, "SLACK_API_TOKEN") e o valor do token da API correspondente.
- [X] No seu arquivo de fluxo de trabalho, faça referência ao segredo usando o contexto de segredos:
```
jobs:
notify_slack:
runs-on: self-hosted
steps:
   - name: Send notification to Slack
     uses: some/example-slack-action@v1
        with:
          token: ${{ secrets.SLACK_API_TOKEN }}
```
### Configurar a ação
Após adicionar a ação ao seu fluxo de trabalho e configurar a autenticação necessária, configure a ação com os parâmetros de entrada necessários.
Esses parâmetros geralmente são documentados no arquivo README da ação.
Certifique-se de ler a documentação cuidadosamente para entender as opções disponíveis e garantir a integração adequada.
### Teste a integração
Antes de incorporar totalmente a integração de terceiros ao seu fluxo de trabalho principal, teste-a em um ambiente isolado. Crie um repositório de teste e fluxo de trabalho, inclua a ação e monitore sua execução. Analise os resultados para confirmar se a integração funciona conforme o esperado e satisfaz seus requisitos.
### Monitorar e manter a integração
Monitore suas execuções de fluxo de trabalho regularmente para garantir que a integração de terceiros continue a funcionar conforme o esperado. Se você encontrar problemas ou precisar atualizar a integração, siga a documentação e as diretrizes da ação para resolver o problema ou implementar novos recursos.

Ao integrar serviços de terceiros em seus fluxos de trabalho do GitHub Actions, você pode aproveitar o poder de várias ferramentas, plataformas e serviços para automatizar tarefas, melhorar a colaboração e otimizar seu processo de desenvolvimento.

Ao descobrir, avaliar e integrar as ações certas para suas necessidades específicas, você pode criar fluxos de trabalho mais eficientes e eficazes, economizando tempo e esforço.

À medida que você avança em sua jornada com o GitHub Actions, um aspecto essencial a ser considerado é implementar a Integração Contínua (CI) para seus projetos.

### Implementando Integração Contínua com Ações do GitHub
Integração Contínua (CI) é um aspecto crucial das práticas modernas de desenvolvimento de software que visa aumentar a colaboração, manter a qualidade do código e agilizar o processo de desenvolvimento.

Ao incorporar CI em seus projetos, você pode garantir que novas alterações de código sejam frequentemente integradas em um repositório compartilhado, testadas automaticamente e validadas em relação à base de código existente. Essa abordagem ajuda na detecção precoce de problemas potenciais, reduz o risco de conflitos de mesclagem e, finalmente, leva a um desenvolvimento de software mais rápido e confiável.

O GitHub Actions é uma excelente plataforma para implementar CI em seus projetos, pois fornece uma solução flexível, escalável e fácil de usar para automatizar várias tarefas, como construir, testar e implantar seu código.

Com seu amplo mercado, integração nativa com repositórios do GitHub e suporte para várias plataformas e idiomas, o GitHub Actions permite que você crie fluxos de trabalho de CI poderosos e eficientes, adaptados aos requisitos específicos do seu projeto.
Neste capítulo, exploraremos os fundamentos da Integração Contínua, discutiremos os benefícios de implementar CI com GitHub Actions e o guiaremos pelo processo de configuração de um pipeline de CI para seu projeto.
Ao final deste capítulo, você terá um entendimento sólido de como usar GitHub Actions para criar fluxos de trabalho de CI eficazes que melhoram seu processo de desenvolvimento e garantem a qualidade do código.
### Automated Testing
O teste automatizado é um componente central da Integração Contínua, pois permite que os desenvolvedores validem novas alterações de código em relação à base de código existente de forma rápida e eficiente.
Nesta seção, discutiremos a importância do teste automatizado no contexto de CI, os tipos de testes que você pode incorporar em seus fluxos de trabalho e como configurar o GitHub Actions para executar seus testes automaticamente.
### Why Automated Testing is Crucial for CI
Os testes automatizados desempenham um papel crítico no processo de CI por vários motivos:
- [x] Feedback mais rápido: executar testes automaticamente como parte do seu pipeline de CI fornece feedback imediato sobre o impacto de novas alterações de código, permitindo que os desenvolvedores resolvam problemas antes que se tornem problemas mais significativos.
- [x] Esforço manual reduzido: automatizar testes elimina a necessidade de testes manuais, liberando tempo dos desenvolvedores para se concentrarem na implementação de novos recursos e na correção de bugs.
- [x] Ambiente de teste consistente: testes automatizados são executados em um ambiente consistente, reduzindo a probabilidade de discrepâncias entre execuções de teste e garantindo um processo de validação confiável.
- [x] Colaboração aprimorada: com testes automatizados em vigor, os membros da equipe podem ter mais confiança na estabilidade da base de código, facilitando a colaboração em novos recursos e correções de bugs.

### Types of Tests in CI
Existem vários tipos de testes que você pode incorporar em seus fluxos de trabalho de CI, dependendo dos requisitos do seu projeto e do nível de validação necessário:
- [x] Testes de unidade: os testes de unidade focam em pequenos pedaços isolados de código, como funções ou classes individuais. Esses testes garantem que cada componente funcione conforme o esperado isoladamente.
- [x] Testes de integração: os testes de integração examinam as interações entre diferentes componentes do seu aplicativo para garantir que eles funcionem juntos corretamente.
- [x] Testes funcionais: os testes funcionais validam a funcionalidade geral do seu aplicativo da perspectiva do usuário, geralmente por meio de interações de IU automatizadas ou chamadas de API.
- [x] Testes de desempenho: os testes de desempenho avaliam a capacidade de resposta, a escalabilidade e a estabilidade do seu aplicativo sob várias condições de carga.
### Configuring GitHub Actions for Automated Testing
Para configurar testes automatizados no seu fluxo de trabalho do GitHub Actions, siga estas etapas:
- [x] Escolha um executor de teste: Selecione um executor de teste que seja compatível com a linguagem de programação e a estrutura de teste do seu projeto. Alguns executores de teste populares incluem Jest para JavaScript, pytest para Python e JUnit para Java.
- [x] Configure o executor de teste: Certifique-se de que o executor de teste esteja configurado corretamente no seu projeto, com as dependências necessárias instaladas e os scripts de teste definidos no seu arquivo package.json (para projetos JavaScript) ou outros arquivos de configuração.
- [x] Crie um fluxo de trabalho do GitHub Actions: No seu repositório, crie um novo arquivo de fluxo de trabalho do GitHub Actions (por exemplo, .github/workflows/ci.yml) e defina as etapas necessárias para configurar o ambiente de teste. Isso normalmente envolve verificar seu código, configurar o ambiente de tempo de execução (por exemplo, Node.js ou Python) e instalar dependências.
- [x] Execute os testes: adicione uma etapa ao seu fluxo de trabalho para executar seus scripts de teste usando o executor de teste escolhido. Certifique-se de que o executor de teste esteja configurado para gerar os resultados em um formato que possa ser facilmente analisado e relatado.
```
name: CI
on: [ push, pull_request]
jobs:
yest:
runs-on: self-hosted steps:
- name: Check out code
uses: actions/checkout@v4
- name: Set up Node.js
uses: actions/setup-node@v4 with:
node-version: 14
- name: Install dependencies
run: npm ci
- name: Run tests
run: npm test
```
- [x] Relatar resultados de teste: Opcionalmente, você pode configurar seu fluxo de trabalho para relatar resultados de teste para serviços ou ferramentas externas, como Codecov para análise de cobertura de código ou Slack para notificações.

Ao incorporar testes automatizados em seu fluxo de trabalho de CI do GitHub Actions, você pode garantir que seu código seja completamente validado antes de ser mesclado ao branch principal. Isso não apenas ajuda a manter uma base de código de alta qualidade, mas também promove um ambiente de desenvolvimento colaborativo onde os membros da equipe podem ter mais confiança na estabilidade do código.
Em resumo, o teste automatizado é um aspecto essencial da implementação da Integração Contínua com o GitHub Actions. Ele fornece vários benefícios, como feedback mais rápido, esforço manual reduzido, ambientes de teste consistentes e colaboração aprimorada. Ao selecionar cuidadosamente os tipos de testes mais relevantes para seu projeto e configurar o GitHub Actions para executá-los automaticamente, você pode criar um pipeline de CI robusto que garante a qualidade e a confiabilidade de sua base de código.
### Code Quality and Linting
Manter um alto nível de qualidade de código é crucial para qualquer projeto de software, pois garante que o código seja legível, sustentável e
menos propenso a erros. Linting é uma prática comum empregada por desenvolvedores para verificar automaticamente padrões de codificação, melhores práticas e problemas potenciais em seu código. Nesta seção, discutiremos a importância da qualidade do código e linting no contexto da Integração Contínua e demonstraremos como configurar o GitHub Actions para executar linting como parte do seu pipeline de CI.
### The Importance of Code Quality and Linting in CI
A qualidade do código e o linting são aspectos essenciais do CI por vários motivos:
- [x] Legibilidade e manutenibilidade: garantir que o código siga um estilo consistente e cumpra as melhores práticas estabelecidas torna mais fácil para os membros da equipe ler, entender e manter o código.
- [x] Erros reduzidos: ferramentas de linting podem detectar problemas potenciais, como erros de sintaxe, variáveis não utilizadas ou chamadas de função incorretas antes que causem problemas no aplicativo.
- [x] Revisões de código mais rápidas: ao impor padrões de codificação e melhores práticas por meio do linting, os desenvolvedores podem se concentrar em aspectos mais críticos das revisões de código, como lógica e funcionalidade, em vez de gastar tempo em questões estilísticas ou de formatação.
- [x] Colaboração simplificada: o linting como parte do CI ajuda a garantir que todo o código contribuído para o projeto cumpra os mesmos padrões, levando a uma base de código mais coesa e consistente.

### Choosing a Linter for Your Project
Existem vários linters disponíveis para várias linguagens de programação e frameworks, cada um com seu próprio conjunto de regras e configurações. Alguns linters populares incluem ESLint para JavaScript, Flake8 para Python e RuboCop para Ruby. Ao selecionar um linter para seu projeto, considere os seguintes fatores:
- [x] Compatibilidade: certifique-se de que o linter suporta sua linguagem de programação e a versão específica que você está usando.
- [x] Configurabilidade: escolha um linter que permita personalizar as regras e configurações para corresponder aos requisitos do seu projeto e padrões de codificação.
- [x] Integração: selecione um linter que possa ser facilmente integrado ao seu ambiente de desenvolvimento, pipeline de CI e outras ferramentas que você possa estar usando.
### Configuring GitHub Actions for Linting
Para configurar o linting no seu pipeline do GitHub Actions CI, siga estas etapas:
- [x] Instale e configure o linter: adicione o linter escolhido ao seu projeto e configure-o de acordo com seus padrões de codificação e melhores práticas. Certifique-se de que o arquivo de configuração do linter (por exemplo, .eslintrc para ESLint ou flakes para Flake8) esteja presente no seu repositório.
- [x] Crie um fluxo de trabalho do GitHub Actions: no seu repositório, crie um novo arquivo de fluxo de trabalho do GitHub Actions (por exemplo, .github/workflows/lint.yml) e defina as etapas necessárias para configurar o ambiente de linting. Isso normalmente envolve verificar seu código, configurar o ambiente de tempo de execução (por exemplo, Node.js ou Python) e instalar dependências.
- [x] Execute o linter: adicione uma etapa ao seu fluxo de trabalho para executar o linter no seu código. Certifique-se de que o linter esteja configurado para gerar os resultados em um formato que possa ser facilmente analisado e relatado.

```
name: Lint
on: [push, pull_request]
jobs:
lint:
runs-on: self-hosted steps:
- name: Check out code
uses: actions/checkout@v4
- name: Set up Node.js uses: actions/setup-node@v4 with:
node-version: 14
- name: Install dependencies run: npm ci
- name: Run ESLint run: npm run lint
```
- [x] Anotar e relatar problemas de linting: Opcionalmente, você pode configurar seu fluxo de trabalho para anotar o código com problemas de linting, tornando-os visíveis na aba "Arquivos alterados" de uma solicitação de pull. Para fazer isso, você pode usar GitHub Actions de terceiros como reviewdog/action-eslint para ESLint ou suo/flake8-github-action para Flake8. Além disso, você pode configurar notificações para problemas de linting, enviando-as para plataformas de comunicação como Slack ou e-mail.
Ao incorporar o linting em seu pipeline de CI do GitHub Actions, você pode manter um estilo de código consistente e detectar problemas potenciais antes que eles se tornem problemas mais significativos. Isso não apenas ajuda a garantir uma base de código de alta qualidade, mas também promove um ambiente de colaboração mais simplificado entre os membros da equipe.

Em resumo, a qualidade do código e o linting são aspectos vitais da implementação da Integração Contínua com GitHub Actions. Eles fornecem vários benefícios, como melhor legibilidade e manutenibilidade, redução de erros, revisões de código mais rápidas e colaboração simplificada. Ao selecionar cuidadosamente um linter que atenda aos requisitos do seu projeto e configurar o GitHub Actions para executá-lo automaticamente, você pode criar um pipeline de CI robusto que aplica padrões de codificação e práticas recomendadas, ao mesmo tempo em que detecta possíveis problemas no início do processo de desenvolvimento.
### Code Coverage and Reporting
A cobertura de código é uma métrica importante que mede a porcentagem do seu código que é executada durante o teste. Ela ajuda os desenvolvedores a identificar áreas do código que podem não ser testadas adequadamente e exigem testes adicionais para garantir a correção e a confiabilidade. Nesta seção, discutiremos a importância da cobertura de código no contexto da Integração Contínua e demonstraremos como configurar o GitHub Actions para gerar relatórios de cobertura de código como parte do seu pipeline de CI.
### Introduction to Code Coverage
A cobertura de código é uma métrica que quantifica o grau em que o código-fonte de um programa é testado por um conjunto de testes específico. Geralmente é expressa como uma porcentagem e representa a proporção de linhas de código, ramificações, funções ou outras unidades lógicas que foram executadas durante o processo de teste. A cobertura de código fornece insights valiosos sobre a eficácia do seu conjunto de testes, destacando áreas do código que podem não ser testadas adequadamente e potencialmente abrigando bugs ou problemas não descobertos.

Ao medir a cobertura de código, os desenvolvedores podem identificar lacunas em sua cobertura de teste e priorizar a criação de novos testes para garantir que a funcionalidade crítica seja completamente testada. É importante observar, no entanto, que uma alta porcentagem de cobertura de código não garante a ausência de bugs ou a qualidade geral do software.
É apenas um indicador da extensão em que o código foi exercido pelo conjunto de testes.
Outros fatores, como a minúcia dos próprios testes, também desempenham um papel crucial na confiabilidade e na manutenibilidade da base de código.
No contexto da Integração Contínua, a cobertura de código serve como uma métrica útil para monitorar a eficácia contínua do seu conjunto de testes e orientar melhorias na sua estratégia de testes.

### Importance of Code Coverage in CI
A cobertura de código desempenha um papel crucial na Integração Contínua (CI) por vários motivos:
- [x] Detecção precoce de código não testado: Ao medir regularmente a cobertura de código como parte do seu pipeline de CI, você pode identificar rapidamente áreas do código que não foram suficientemente testadas. Isso permite que os desenvolvedores abordem problemas potenciais antes que se tornem problemas mais significativos e ajuda a manter uma base de código robusta e confiável.
- [x] Monitoramento da eficácia do conjunto de testes: As métricas de cobertura de código fornecem insights sobre a eficácia geral do seu conjunto de testes, garantindo que ele continue a fornecer cobertura adequada conforme a base de código evolui. Isso permite que os desenvolvedores tomem decisões informadas sobre onde concentrar seus esforços de teste, garantindo que as partes mais críticas do código sejam completamente testadas.
- [x] Qualidade de código aprimorada: Um conjunto de testes abrangente, combinado com análise regular de cobertura de código, incentiva os desenvolvedores a escrever código mais limpo e modular, mais fácil de testar e manter. Isso resulta em uma base de código de maior qualidade com menos bugs e problemas.
- [x] Maior confiança nas alterações de código: Ao manter um alto nível de cobertura de código, os desenvolvedores podem ter maior confiança de que suas alterações não introduzirão novos bugs ou regressões. Isso pode levar a ciclos de desenvolvimento mais rápidos e melhor colaboração entre os membros da equipe, pois há menos risco associado a fazer alterações no código.
- [ ] Responsabilidade e visibilidade: Integrar métricas de cobertura de código em seu pipeline de CI fornece uma medida transparente e objetiva da eficácia do conjunto de testes. Isso pode ajudar a estabelecer expectativas claras e responsabilidade para a equipe, garantindo que os testes permaneçam uma prioridade durante todo o processo de desenvolvimento.

Em resumo, a cobertura de código é um aspecto essencial da implementação da Integração Contínua, pois ajuda a garantir uma base de código confiável e de alta qualidade.
Ao medir e monitorar regularmente a cobertura de código como parte de seu pipeline de CI, você pode identificar lacunas em sua cobertura de teste, priorizar os esforços de teste e manter um conjunto de testes abrangente que minimiza o risco de bugs e regressões.

### Choosing a Code Coverage Tool
Selecionar a ferramenta de cobertura de código certa para seu projeto é uma decisão importante, pois impactará a eficácia com que você pode medir e monitorar o desempenho do seu conjunto de testes. Há vários fatores a serem considerados ao escolher uma ferramenta de cobertura de código:
- [x] Suporte a idiomas: certifique-se de que a ferramenta suporte as linguagens de programação usadas em seu projeto. Diferentes ferramentas atendem a diferentes idiomas e algumas fornecem suporte para vários idiomas. Por exemplo, JaCoCo é uma escolha popular para projetos Java, enquanto Istanbul é comumente usado para projetos Java-Script.
- [x] Integração com estruturas de teste: verifique se a ferramenta é compatível com suas estruturas de teste escolhidas e pode ser facilmente integrada à sua configuração de teste existente. O ideal é que a ferramenta forneça integração perfeita com configuração mínima necessária.

- [x] Integração com pipelines de CI/CD: a ferramenta de cobertura de código deve ser compatível com sua plataforma de CI/CD, permitindo que você incorpore facilmente a análise de cobertura de código em seu pipeline. Muitas ferramentas oferecem plug-ins pré-construídos ou integrações para plataformas populares de CI/CD, como GitHub Actions, Jenkins ou GitLab CI.
- [x] Métricas de cobertura: Diferentes ferramentas podem oferecer métricas de cobertura variadas, como cobertura de linha, cobertura de ramificação, cobertura de declaração ou cobertura de função. Escolha uma ferramenta que forneça as métricas mais relevantes para as necessidades do seu projeto e da equipe.
- [x] Recursos de relatórios: Considere os recursos de relatórios oferecidos pela ferramenta, como a capacidade de gerar relatórios detalhados e legíveis por humanos ou exportar dados de cobertura em vários formatos (por exemplo, XML, JSON ou HTML). Uma boa ferramenta de cobertura de código deve fornecer insights claros e acionáveis sobre o desempenho do seu conjunto de testes.
- [x] Facilidade de uso e configuração: Avalie a facilidade de uso e configuração da ferramenta, particularmente em termos de configuração de limites de cobertura, geração de relatórios e visualização de dados de cobertura. Uma ferramenta amigável com documentação abrangente tornará mais fácil para sua equipe adotar e manter um processo de cobertura de código robusto.
- [x] Comunidade e suporte: Por fim, considere a comunidade e os recursos de suporte da ferramenta. Uma ferramenta com uma comunidade ativa e desenvolvimento contínuo tem mais probabilidade de receber atualizações regulares, correções de bugs e novos recursos.

Ao avaliar cuidadosamente os requisitos do seu projeto e considerar esses fatores, você pode escolher uma ferramenta de cobertura de código que o ajudará a monitorar e melhorar efetivamente o desempenho do seu conjunto de testes no contexto da Integração Contínua.

### Integrating Code Coverage Tools with GitHub Actions
Integrar uma ferramenta de cobertura de código com o GitHub Actions permite automatizar a análise de cobertura de código como parte do seu pipeline de CI/CD. Nesta seção, discutiremos as etapas gerais para integrar ferramentas de cobertura de código com o GitHub Actions. Observe que as etapas específicas podem variar dependendo da linguagem, estrutura de teste e ferramenta de cobertura de código que você está usando.
- [x] Instale a ferramenta de cobertura de código: primeiro, certifique-se de que a ferramenta de cobertura de código esteja instalada e configurada no seu projeto. Isso pode envolver adicioná-la como uma dependência no seu gerenciador de pacotes (por exemplo, npm, pip ou Maven) ou baixá-la e instalá-la manualmente.
- [x] Configure a estrutura de teste: em seguida, configure sua estrutura de teste para gerar dados de cobertura de código durante a execução do teste. Isso pode envolver modificar o comando test ou adicionar opções de configuração ao seu executor de teste. Por exemplo, se você estiver usando o Jest para testes de JavaScript, poderá adicionar o sinalizador --coverage ao seu comando Jest.
- [x] Crie um fluxo de trabalho do GitHub Actions: se você ainda não tiver um, crie um fluxo de trabalho do GitHub Actions no seu repositório adicionando um diretório .github/workflows e criando um arquivo YAML dentro dele (por exemplo, ci.yml). Neste arquivo de fluxo de trabalho, defina as etapas necessárias para instalar dependências, construir seu projeto e executar testes.
- [x] Adicione análise de cobertura de código ao fluxo de trabalho: no seu fluxo de trabalho do GitHub Actions, adicione uma etapa para executar a análise de cobertura de código após seus testes terem sido executados. Dependendo da ferramenta de cobertura de código, isso pode envolver a execução de um comando separado ou a adição de um sinalizador ao seu comando de teste existente. Por exemplo, se você estiver usando o Istanbul para cobertura de código JavaScript, você pode adicionar a seguinte etapa:

```
- name: Run code coverage analysis
run: npm run coverage
```

- [x] Configurar limites de cobertura (opcional): se desejar, configure sua ferramenta de cobertura de código para impor limites mínimos de cobertura, fazendo com que o pipeline de CI falhe se a cobertura ficar abaixo dos níveis especificados. Isso pode ajudar a garantir que seu conjunto de testes mantenha um alto nível de cobertura ao longo do tempo. Consulte a documentação da sua ferramenta de cobertura de código para obter instruções sobre como configurar limites de cobertura.
- [x] Gerar e publicar relatórios de cobertura: configure sua ferramenta de cobertura de código para gerar relatórios de cobertura em um formato compatível com o GitHub Actions. Algumas ferramentas de cobertura de código têm suporte integrado para publicar relatórios no GitHub ou integrar com outros serviços de relatórios como Codecov ou Coveralls. Como alternativa, você pode usar GitHub Actions dedicados, como actions/upload-artifact, para armazenar os relatórios gerados como artefatos de fluxo de trabalho.
- [x] Visualizar dados de cobertura (opcional): Opcionalmente, você pode usar serviços de terceiros como Codecov ou Coveralls para visualizar seus dados de cobertura de código, rastrear tendências de cobertura ao longo do tempo e exibir emblemas de cobertura no arquivo README do seu repositório.

Seguindo essas etapas, você pode integrar a análise de cobertura de código ao seu fluxo de trabalho do GitHub Actions, ajudando a garantir que seu conjunto de testes permaneça eficaz e abrangente à medida que sua base de código evolui.

### Configuring Code Coverage Thresholds
Limites de cobertura de código são uma maneira eficaz de garantir que seu conjunto de testes mantenha um alto nível de cobertura ao longo do tempo. Ao definir requisitos mínimos de cobertura, você pode impor um certo padrão de qualidade de código e evitar que código não testado seja mesclado em seu branch principal. Nesta seção, discutiremos o processo geral para configurar limites de cobertura de código. Observe que as etapas específicas podem variar dependendo da linguagem, estrutura de teste e ferramenta de cobertura de código que você está usando.

- [x] Revise a documentação da sua ferramenta de cobertura de código: consulte a documentação da sua ferramenta de cobertura de código específica para entender como configurar limites de cobertura. A maioria das ferramentas oferece uma maneira de especificar níveis mínimos de cobertura, e algumas até permitem que você defina limites diferentes para diferentes métricas de cobertura (por exemplo, cobertura de linha, branch ou função).
- [x] Decida sobre valores de limite apropriados: determine os níveis mínimos de cobertura que você deseja impor ao seu projeto. Esses valores devem ser realistas e atingíveis, ao mesmo tempo em que promovem alta qualidade de código. Tenha em mente que definir limites muito altos pode ser contraproducente, pois pode desencorajar os desenvolvedores de escrever testes e criar uma barreira para contribuição.
- [x] Atualize sua configuração de cobertura de código: adicione os valores de limite ao arquivo de configuração ou às configurações da sua ferramenta de cobertura de código. Isso pode envolver a atualização de um arquivo JSON, YAML ou XML, ou a modificação de um argumento de linha de comando ou variável de ambiente. Por exemplo, se você estiver usando Istanbul para cobertura de código JavaScript, você pode adicionar a seguinte configuração ao seu arquivo package.json:
- [ ]
```
"nyc": {
}
"check-coverage": true,
"branches": 80,
"functions": 80,
"lines": 80
"statements": 80
}
```
Esta configuração impõe uma cobertura mínima de 80% para ramificações, funções, linhas e instruções.
- [x] Integre a imposição de limites ao seu pipeline de CI/CD: garanta que seu pipeline de CI/CD verifique a conformidade do limite de cobertura durante a etapa de análise de cobertura de código. Se os limites não forem atingidos, o pipeline deve falhar, impedindo que as alterações de código sejam mescladas. Isso pode ser feito modificando o comando de cobertura ou adicionando uma etapa separada no seu fluxo de trabalho do GitHub Actions ou outra plataforma de CI/CD.
- [x] Monitore e ajuste os limites ao longo do tempo: conforme seu projeto evolui, você pode precisar ajustar seus limites de cobertura para refletir as alterações em sua base de código ou estratégia de teste. Revise regularmente suas métricas de cobertura e atualize seus limites conforme necessário para manter um alto padrão de qualidade de código. Ao configurar limites de cobertura de código e aplicá-los como parte do seu pipeline de CI/CD, você pode promover uma cultura de testes completos e ajudar a garantir que sua base de código permaneça robusta e confiável ao longo do tempo.
### Generating and Publishing Code Coverage Reports
Gerar e publicar relatórios de cobertura de código é um aspecto importante para manter a qualidade do código e garantir que seu conjunto de testes permaneça abrangente. Os relatórios de cobertura fornecem insights valiosos sobre o quão bem seu código é testado e podem ajudar a identificar áreas que precisam de melhorias. Nesta seção, discutiremos o processo geral para gerar e publicar relatórios de cobertura de código. Observe que as etapas específicas podem variar dependendo da linguagem, estrutura de teste e ferramenta de cobertura de código que você está usando.

- [x] Configure sua ferramenta de cobertura de código para gerar relatórios: a maioria das ferramentas de cobertura de código oferece suporte à geração de relatórios em vários formatos, como HTML, JSON, XML ou texto. Verifique a documentação da sua ferramenta de cobertura de código para entender como configurar o formato de saída e especificar o diretório de saída para os relatórios gerados.
- [x] Execute seu conjunto de testes com a cobertura de código habilitada: execute seu conjunto de testes com a ferramenta de cobertura de código configurada para gerar o formato de relatório desejado. Isso pode envolver a execução de um comando específico ou a adição de um sinalizador ao seu comando de teste existente. Por exemplo, se você estiver usando o Jest para testes de JavaScript, poderá adicionar o sinalizador --coverage ao seu comando Jest.
- [x] Revise os relatórios gerados localmente: depois de executar o conjunto de testes com a cobertura de código habilitada, revise os relatórios gerados localmente para garantir que estejam precisos e completos. Se necessário, ajuste a configuração da sua ferramenta de cobertura de código para capturar dados adicionais ou modificar o formato do relatório.

- [ ] Publique relatórios de cobertura no GitHub ou em um serviço de terceiros: depois de gerar os relatórios de cobertura de código desejados, você pode publicá-los no GitHub ou integrá-los a serviços de terceiros como Codecov ou Coveralls. Algumas ferramentas de cobertura de código têm suporte integrado para publicar relatórios no GitHub ou integrar-se a esses serviços. Como alternativa, você pode usar GitHub Actions dedicados ou outras integrações de plataforma CI/CD para carregar os relatórios gerados. Por exemplo, para publicar um relatório de cobertura HTML no GitHub Pages, você pode usar a ação peaceiris/actions-gh-pages no seu fluxo de trabalho GitHub Actions.

- [x] Visualize dados de cobertura e acompanhe tendências: serviços de terceiros como Codecov ou Coveralls oferecem recursos adicionais para visualizar seus dados de cobertura de código, acompanhar tendências de cobertura ao longo do tempo e exibir emblemas de cobertura no arquivo README do seu repositório. Ao integrar esses serviços com seu fluxo de trabalho do GitHub Actions ou outra plataforma de CI/CD, você pode obter insights mais profundos sobre a qualidade do código do seu projeto e tomar decisões baseadas em dados sobre sua estratégia de teste.

Ao seguir essas etapas, você pode gerar e publicar relatórios de cobertura de código como parte do seu pipeline de CI/CD, ajudando a garantir que seu conjunto de testes permaneça abrangente e eficaz ao longo do tempo. Além disso, a integração com serviços de terceiros pode fornecer insights valiosos sobre a qualidade do código do seu projeto e orientar os esforços da sua equipe para manter altos níveis de cobertura.

### Visualizing Code Coverage Data
A visualização eficaz dos dados de cobertura de código é crucial para entender a qualidade e a abrangência do seu conjunto de testes. Ao apresentar dados de cobertura em um formato de fácil digestão, você pode identificar rapidamente áreas da sua base de código que precisam de mais testes e acompanhar seu progresso em direção ao cumprimento de suas metas de cobertura. Nesta seção, discutiremos diferentes maneiras de visualizar dados de cobertura de código, incluindo formatos de relatórios locais e serviços de terceiros.

- [x] Formatos de relatórios locais: a maioria das ferramentas de cobertura de código oferece vários formatos para gerar relatórios de cobertura localmente. Esses formatos podem incluir relatórios HTML, JSON, XML ou baseados em texto. Os relatórios HTML são particularmente úteis para visualizar dados de cobertura de código, pois geralmente fornecem uma interface interativa para explorar sua base de código com métricas de cobertura exibidas junto com o código-fonte. Para visualizar um relatório de cobertura HTML, basta abrir o arquivo index.html gerado no seu navegador da web.
- [x] Emblemas de cobertura: Um emblema de cobertura é um pequeno gráfico que exibe a porcentagem de cobertura de código atual do seu projeto. Emblemas de cobertura podem ser adicionados ao arquivo README do seu repositório ou outra documentação do projeto para fornecer um resumo visual rápido do status da cobertura do seu código. Serviços de terceiros como Codecov ou Coveralls podem gerar emblemas de cobertura automaticamente para o seu projeto, e você pode incorporar esses emblemas na sua documentação usando Markdown ou HTML.

- [x] Serviços de terceiros: Serviços como Codecov ou Coveralls oferecem recursos de visualização poderosos para analisar seus dados de cobertura de código. Esses serviços podem ser integrados ao seu repositório GitHub e pipeline de CI/CD, permitindo que você rastreie tendências de cobertura ao longo do tempo, compare alterações de cobertura entre confirmações e receba notificações quando os níveis de cobertura mudarem. Ao se inscrever em um desses serviços e integrá-lo ao seu fluxo de trabalho do GitHub Actions ou outra plataforma de CI/CD, você pode obter insights valiosos sobre a qualidade do código do seu projeto e monitorar a eficácia da sua estratégia de teste.

- [x] Integrações do GitHub: Algumas ferramentas de cobertura de código oferecem suporte integrado para publicar relatórios de cobertura no GitHub ou exibir dados de cobertura na interface do GitHub. Por exemplo, o pacote Python de cobertura pode ser configurado para gerar relatórios em um formato compatível com o recurso de anotação de código do GitHub, permitindo que você visualize dados de cobertura diretamente na visualização de arquivo do seu repositório. Além disso, você pode usar o GitHub Actions ou outras integrações de plataforma CI/CD para publicar relatórios de cobertura no GitHub Pages ou exibir informações de cobertura em comentários de solicitação de pull.

Ao aproveitar esses diferentes métodos de visualização, você pode obter uma melhor compreensão da cobertura de código do seu projeto e tomar decisões informadas sobre onde concentrar seus esforços de teste. A visualização de dados de cobertura de código pode ajudá-lo a manter uma base de código de alta qualidade e garantir que seu conjunto de testes permaneça abrangente e eficaz ao longo do tempo.

### Best Practices for Code Coverage
A cobertura de código é uma métrica valiosa para avaliar a qualidade e a abrangência do seu conjunto de testes. No entanto, simplesmente almejar altas porcentagens de cobertura sem considerar outros fatores pode levar a uma falsa sensação de confiança na sua estratégia de teste. Nesta seção, discutiremos as melhores práticas para utilizar efetivamente a cobertura de código para melhorar a qualidade geral do seu projeto.

- [x] Almeje uma cobertura significativa: embora uma alta porcentagem de cobertura de código seja desejável, é importante garantir que seus testes estejam genuinamente testando a funcionalidade do seu código, em vez de apenas executar linhas para inflar as métricas de cobertura. Concentre-se em escrever testes que cubram uma variedade de cenários, casos extremos e condições de erro potenciais para garantir que seu código seja robusto e confiável.

- [x] Defina metas de cobertura realistas: definir uma porcentagem de cobertura de código alvo pode ajudar a orientar seus esforços de teste e motivar sua equipe a manter um código de alta qualidade. No entanto, é importante definir metas realistas que levem em consideração a complexidade do seu projeto e os recursos disponíveis para teste. Visar 100% de cobertura pode não ser sempre viável ou econômico, e uma meta mais modesta ainda pode fornecer benefícios significativos para a qualidade do seu projeto.

- [x] Use a cobertura como uma ferramenta de diagnóstico: a cobertura de código é mais eficaz quando usada como uma ferramenta de diagnóstico para identificar áreas da sua base de código que precisam de mais testes. Ao analisar seus dados de cobertura e identificar áreas com baixa ou nenhuma cobertura, você pode priorizar seus esforços de teste e garantir que seu conjunto de testes permaneça abrangente ao longo do tempo.

- [x] Combine a cobertura com outras métricas de qualidade: a cobertura de código não deve ser a única métrica usada para avaliar a qualidade da sua base de código. Combinar dados de cobertura com outras métricas de qualidade, como resultados de análise estática, complexidade ciclomática e densidade de defeitos, pode fornecer uma visão mais abrangente da saúde geral do seu projeto.

- [x] Monitore as tendências de cobertura ao longo do tempo: rastrear as tendências de cobertura de código ao longo do tempo pode ajudá-lo a identificar áreas do seu projeto que podem precisar de mais atenção e garantir que seu conjunto de testes permaneça eficaz à medida que sua base de código evolui. Integrar relatórios de cobertura de código em seu pipeline de CI/CD e usar serviços de terceiros como Codecov ou Coveralls pode facilitar o monitoramento de tendências de cobertura e receber notificações quando os níveis de cobertura mudarem.

- [x] Incentive uma cultura de testes: Promova uma cultura de testes dentro de sua equipe, enfatizando a importância da cobertura completa de testes e o valor que ela traz para seu projeto. Incentive os membros da equipe a escrever testes para novos recursos e correções de bugs, e considere incorporar métricas de cobertura de código em seu processo de revisão de código para ajudar a manter altos níveis de cobertura.

Seguindo essas práticas recomendadas, você pode utilizar efetivamente a cobertura de código para melhorar a qualidade da sua base de código e garantir que seu conjunto de testes permaneça abrangente e eficaz.

Lembre-se de que a cobertura de código é apenas um aspecto de uma estratégia de teste robusta e deve ser usada em conjunto com outras métricas de qualidade para manter uma base de código de alta qualidade.

Neste capítulo, exploramos os aspectos essenciais da implementação de um pipeline de Integração Contínua (CI) usando o GitHub Actions. Começamos discutindo a importância dos testes automatizados, qualidade do código e linting, destacando a necessidade de conjuntos de testes robustos e adesão aos padrões de codificação. Em seguida, nos aprofundamos na cobertura e relatórios de código, enfatizando o valor da cobertura significativa e das práticas recomendadas para alavancar dados de cobertura para melhorar a qualidade geral da sua base de código.

Ao implementar o CI com o GitHub Actions, você pode aproveitar uma plataforma poderosa e flexível que se integra perfeitamente aos seus repositórios do GitHub. A capacidade de personalizar seus fluxos de trabalho, integrar ferramentas de terceiros e aproveitar o GitHub Actions Marketplace permite que você crie um pipeline de CI adaptado às necessidades específicas do seu projeto. Como resultado, você pode garantir que sua base de código permaneça de alta qualidade, confiável e sustentável durante todo o seu ciclo de vida.

No futuro, é essencial se manter atualizado com novos recursos, práticas recomendadas e tendências emergentes no mundo do GitHub Actions e CI/CD em geral. A melhoria contínua é um aspecto fundamental do CI e, ao manter suas habilidades e conhecimentos atualizados, você pode continuar a otimizar seus fluxos de trabalho e aprimorar a qualidade do seu projeto ao longo do tempo.

Com uma base sólida em CI usando o GitHub Actions, agora você pode criar, manter e expandir com confiança seu pipeline de CI para atender às necessidades em constante evolução do seu projeto. Ao adotar o CI e seus princípios, você estará no caminho certo para construir um software mais robusto, confiável e de alta qualidade.

### Implementing Continuous Deployment with GitHub Actions
No Capítulo 8, exploraremos o poderoso conceito de Implantação Contínua (CD) e como você pode implementá-lo usando o GitHub Actions. A Implantação Contínua é a extensão natural da Integração Contínua, permitindo a implantação automática do seu código em vários ambientes sempre que alterações forem enviadas para o branch principal ou uma versão específica for criada. Essa abordagem garante que seu aplicativo esteja sempre atualizado com os recursos mais recentes, correções de bugs e melhorias, permitindo que sua equipe entregue valor de forma mais rápida e consistente.
Ao longo deste capítulo, discutiremos os principais componentes e estratégias para configurar um pipeline de Implantação Contínua usando o GitHub Actions. Abordaremos tópicos como gerenciamento de ambiente, estratégias de implantação, tratamento de segredos e dados confidenciais e implantação em várias plataformas e serviços, incluindo provedores de nuvem e servidores locais.
Além disso, exploraremos as melhores práticas para monitorar e manter seu pipeline de CD, garantindo que suas implantações sejam confiáveis, seguras e eficientes.

Ao final deste capítulo, você terá adquirido uma compreensão abrangente dos princípios e práticas de Implantação Contínua, juntamente com as habilidades necessárias para implementar um pipeline de CD eficaz usando o GitHub Actions.
Esse conhecimento permitirá que você otimize seu processo de entrega de software, minimize a intervenção manual e melhore a qualidade geral de seus aplicativos implantados.

### Deploying to Cloud Platforms
Nesta seção, discutiremos a implantação de seus aplicativos em plataformas de nuvem populares usando o GitHub Actions. As plataformas de nuvem oferecem uma variedade de serviços e recursos que podem ajudar você a dimensionar, gerenciar e monitorar seus aplicativos com facilidade. Alguns dos provedores de nuvem mais populares incluem Amazon Web Services (AWS), Microsoft Azure e Google Cloud Platform (GCP). Cada um desses provedores oferece seu próprio conjunto exclusivo de ferramentas, serviços e ecossistemas que podem ser aproveitados para implantar e gerenciar seus aplicativos.
#### Amazon Web Services (AWS)
A AWS é uma plataforma de nuvem abrangente que fornece uma ampla gama de serviços de infraestrutura e plataforma, incluindo computação, armazenamento, bancos de dados, rede e muito mais. A implantação do seu aplicativo na AWS usando o GitHub Actions envolve as seguintes etapas:

- [x] Configurando credenciais da AWS: para autenticar e implantar seu aplicativo na AWS, você precisa criar um usuário do IAM com as permissões necessárias e configurar o GitHub Actions com a chave de acesso e a chave secreta geradas.
- [x] Configurando serviços da AWS: determine os serviços da AWS que você usará para seu aplicativo, como EC2, Elastic Beanstalk ou Lambda, e configure-os adequadamente.
- [x] Criando um fluxo de trabalho do GitHub Actions: projete um fluxo de trabalho que crie, teste e implante seu aplicativo no ambiente AWS apropriado. Use as AWS Actions oficiais disponíveis no GitHub Actions Marketplace para interagir com os serviços da AWS. Por exemplo, você pode usar aws-actions/configure-aws-credentials para configurar credenciais da AWS e aws-actions/amazon-ecs-deploy-task-definition para implantar uma tarefa do Amazon ECS.

#### Microsoft Azure
O Azure é a plataforma de nuvem da Microsoft, que oferece uma variedade de serviços para computação, armazenamento, bancos de dados e redes. Para implantar seu aplicativo no Azure usando o GitHub Actions, siga estas etapas:

- [x] Configurando credenciais do Azure: crie uma entidade de serviço no Azure com as permissões necessárias para implantar seu aplicativo. Adicione as credenciais (ID do locatário, ID do cliente e segredo do cliente) ao seu repositório GitHub como segredos.
- [x] Configurando serviços do Azure: identifique os serviços do Azure que você usará para seu aplicativo, como o Azure App Service, o Azure Functions ou o Azure Kubernetes Service (AKS), e configure-os para suas necessidades de implantação. Assim como na AWS, crie ambientes separados para cada estágio do seu pipeline de implantação.
- [x] Criando um fluxo de trabalho do GitHub Actions: desenvolva um fluxo de trabalho que crie, teste e implante seu aplicativo no ambiente Azure apropriado. Utilize o Azure Actions oficial do GitHub Actions Marketplace para interagir com os serviços do Azure. Por exemplo, use azure/login para autenticar com o Azure e azure/webapps-deploy para implantar seu aplicativo no Serviço de Aplicativo do Azure.

#### Google Cloud Platform (GCP)
O GCP é a oferta de nuvem do Google, fornecendo uma ampla gama de serviços para computação, armazenamento, bancos de dados e redes. Para implantar seu aplicativo no GCP usando o GitHub Actions, execute as seguintes etapas:
- [x] Configurando credenciais do GCP: crie uma conta de serviço no GCP com as permissões necessárias para implantar seu aplicativo. Gere uma chave JSON para a conta de serviço e adicione-a ao seu repositório GitHub como um segredo.
- [x] Configurando serviços do GCP: determine os serviços do GCP que você usará para seu aplicativo, como Google App Engine, Google Cloud Run ou Google Kubernetes Engine (GKE), e configure-os adequadamente. Assim como com AWS e Azure, é importante criar ambientes separados para cada estágio do seu pipeline de implantação.
- [x] Criando um fluxo de trabalho do GitHub Actions: construa um fluxo de trabalho que crie, teste e implante seu aplicativo no ambiente GCP apropriado. Aproveite o Google Cloud Actions oficial do GitHub Actions Marketplace para interagir com os serviços do GCP. Por exemplo, use google-github-actions/setup-gcloud para autenticar com o GCP e configurar o Google Cloud SDK. Dependendo do serviço que você usa, outras ações como google-github-actions/deploy-appengine ou google-github-ac-tions/deploy-cloudrun podem ser empregadas para implantar seu aplicativo.

Concluindo, implantar seus aplicativos em plataformas de nuvem usando o GitHub Actions pode agilizar muito o processo e melhorar a eficiência.
Ao automatizar o processo de implantação, você pode garantir que seus aplicativos estejam sempre atualizados, permitindo que sua equipe entregue valor de forma mais rápida e consistente.

Lembre-se de seguir as práticas recomendadas, como configurar ambientes separados para cada estágio do seu pipeline de implantação, para minimizar possíveis problemas e manter um processo de implantação estável, seguro e eficiente.

### Deploying to On-Premises Servers
Nesta seção, discutiremos a implantação de seus aplicativos em servidores locais usando o GitHub Actions. A implantação local se refere à hospedagem de seu aplicativo em seus próprios servidores físicos ou virtuais, em vez de utilizar plataformas de nuvem. Embora a implantação em servidores locais possa exigir mais gerenciamento de infraestrutura em comparação às plataformas de nuvem, ela pode oferecer maior controle sobre sua infraestrutura, segurança aprimorada e possíveis economias de custos.

Certifique-se de criar um ambiente dedicado para cada estágio do seu pipeline de implantação (desenvolvimento, preparação e produção).

- [x] Preparando sua infraestrutura local
Antes de implantar seu aplicativo em servidores locais, certifique-se de que sua infraestrutura esteja configurada e configurada corretamente. Isso inclui:
- [x] Provisionamento de servidor: provisione e configure os servidores que você usará para seu aplicativo. Isso pode envolver a configuração de máquinas virtuais, a instalação do sistema operacional e software necessários e a configuração de configurações de rede e firewall.
- [ ] Configuração do ambiente: crie ambientes separados para cada estágio do seu pipeline de implantação (desenvolvimento, preparação e produção) para minimizar possíveis problemas e manter um processo de implantação estável.
- [ ] Segurança: garanta que sua infraestrutura esteja segura implementando mecanismos fortes de autenticação e autorização, bem como criptografando a comunicação entre seu aplicativo e suas dependências.
- [x] Configurando o acesso aos seus servidores locais
Para implantar seu aplicativo em seus servidores locais usando o GitHub Actions, você precisa estabelecer uma conexão segura entre o executor do GitHub Actions e seus servidores. Isso pode ser alcançado usando vários métodos
- [ ]SSH: Configure uma conexão SSH entre seu executor do GitHub Actions e seus servidores locais. Gere um par de chaves SSH, adicione a chave pública às chaves autorizadas do seu servidor e armazene a chave privada como um segredo do GitHub. Você pode usar o ssh-action disponível no GitHub Actions Marketplace para executar comandos em seus servidores por meio de SSH.
- [ ]VPN: Se sua organização usa uma rede privada virtual (VPN), configure o executor do GitHub Actions para se conectar à VPN. Armazene credenciais de VPN e arquivos de configuração como segredos do GitHub e use o openvpn-action do GitHub Actions Marketplace para configurar a conexão VPN.
- [ ] Executor auto-hospedado: Como alternativa, você pode usar um executor do GitHub Actions auto-hospedado instalado diretamente em seu servidor local ou em sua rede privada. Essa abordagem elimina a necessidade de configurar uma conexão segura entre o executor do GitHub Actions e seu servidor. No entanto, tenha em mente que os corredores auto-hospedados exigem manutenção adicional e considerações de segurança.
- [ ]
- [x] Criando um fluxo de trabalho do GitHub Actions para implantação local
Depois que sua infraestrutura estiver preparada e o acesso aos seus servidores locais estiver configurado, crie um fluxo de trabalho do GitHub Actions para criar, testar e implantar seu aplicativo. O fluxo de trabalho deve incluir as seguintes etapas:
- [ ] Checkout: use a ação actions/checkout para buscar o código-fonte do seu aplicativo.
- [ ] Build and test: crie e teste seu aplicativo usando ferramentas de construção e estruturas de teste apropriadas. Você pode usar ações disponíveis no GitHub Actions Marketplace para várias linguagens de programação e estruturas, como actions/setup-node para Node.js ou actions/setup-python para Python.
- [ ] Implantação: implante seu aplicativo em seus servidores locais usando um dos métodos de acesso mencionados anteriormente (SSH, VPN ou executor auto-hospedado). Por exemplo, se você estiver usando SSH, empregue a ação ssh para executar os comandos de implantação em seu servidor.
- [ ] Notificações: configure notificações para manter sua equipe informada sobre o status de suas implantações. Você pode usar ações como actions-gh-notifier para enviar notificações para sua equipe por e-mail, Slack ou outros canais de comunicação.
- [ ] Configurações específicas do ambiente: use os segredos e configurações específicos do ambiente do GitHub Actions para gerenciar diferentes configurações para seus ambientes de desenvolvimento, preparação e produção. Isso ajuda a manter uma separação limpa entre ambientes e garante que dados confidenciais, como chaves de API ou credenciais de banco de dados, não sejam expostos acidentalmente.
- [x] Manutenção e monitoramento de sua implantação
Após implantar com sucesso seu aplicativo em seus servidores locais, é importante monitorar e manter sua infraestrutura para garantir desempenho, segurança e confiabilidade ideais. Isso pode envolver:
- [ ] Monitoramento: implemente ferramentas de monitoramento para rastrear o desempenho do seu aplicativo, o uso de recursos e possíveis erros. Ferramentas como Prometheus, Grafana e ELK Stack (Elasticsearch, Logstash e Kibana) podem fornecer insights valiosos sobre a saúde do seu aplicativo e ajudar a identificar e resolver problemas rapidamente.
- [ ] Registro: garanta que seu aplicativo e infraestrutura gerem registros abrangentes que podem ser facilmente acessados e analisados. Configure soluções de registro centralizadas, como ELK Stack ou Graylog, para agregar registros de várias fontes e facilitar a pesquisa, visualização e análise de dados de registro.
- [ ] Alerta: configure mecanismos de alerta para notificar sua equipe sobre possíveis problemas, como erros de aplicativo, restrições de recursos ou incidentes de segurança. Ferramentas como PagerDuty, Opsgenie ou VictorOps podem ajudar a gerenciar e responder a alertas de forma eficaz.
- [ ] Backup e recuperação de desastres: estabeleça planos de backup e recuperação de desastres para proteger seu aplicativo e dados contra possíveis perdas ou corrupção. Faça backup regularmente de seus dados e teste seus procedimentos de recuperação para garantir que funcionem conforme o esperado.
- [ ] Melhoria contínua: avalie e melhore continuamente seu processo de implantação incorporando feedback de sua equipe, aprendendo com incidentes e mantendo-se atualizado com as melhores práticas e novas tecnologias.

Concluindo, a implantação em servidores locais usando o GitHub Actions pode oferecer várias vantagens, incluindo maior controle, segurança e potencial economia de custos. Ao preparar cuidadosamente sua infraestrutura, configurar acesso seguro e criar um fluxo de trabalho de implantação eficiente, você pode agilizar o processo de implantação e garantir que seu aplicativo permaneça com desempenho, confiável e seguro. Além disso, implementar estratégias de monitoramento, registro, alerta e backup ajudará você a manter a integridade de sua infraestrutura local e permitirá que você responda rapidamente a quaisquer problemas que possam surgir. Ao avaliar e melhorar continuamente seu processo de implantação, você pode garantir que sua estratégia de implantação local permaneça eficaz e eficiente, permitindo que sua equipe se concentre no desenvolvimento e na entrega de software de alta qualidade para seus usuários.
### Deploying Static Websites and GitHub Pages
- [x] Introdução
Implantar sites estáticos e GitHub Pages com GitHub Actions é uma maneira poderosa e eficiente de automatizar o processo de construção e implantação para seus projetos web. Sites estáticos oferecem várias vantagens sobre os dinâmicos, incluindo tempos de carregamento mais rápidos, melhor segurança e carga reduzida do servidor. GitHub Pages é uma plataforma de hospedagem popular que permite hospedar sites estáticos diretamente de um repositório GitHub. Nesta seção, exploraremos como usar GitHub Actions para automatizar a implantação de sites estáticos e GitHub Pages.
- [x] Geradores de sites estáticos
Geradores de sites estáticos são ferramentas que convertem arquivos de origem, normalmente escritos em Markdown ou outras linguagens de marcação, em arquivos HTML, CSS e JavaScript estáticos. Alguns geradores de sites estáticos populares incluem Jekyll, Hugo e Gatsby. Esses geradores oferecem vários recursos, como modelos, organização de conteúdo e suporte para plug-ins personalizados, o que facilita a criação e o gerenciamento de sites estáticos.
- [ ] Escolhendo um gerador de site estático: Selecione um gerador de site estático que melhor se adapte às necessidades e requisitos do seu projeto. Considere fatores como facilidade de uso, desempenho, suporte da comunidade e plugins disponíveis ao tomar sua decisão.
- [ ] Integrando com GitHub Actions: Depois de escolher um gerador de site estático, crie um fluxo de trabalho GitHub Actions para automatizar o processo de construção. Isso normalmente envolve instalar as dependências necessárias, executar o comando de construção e gerar os arquivos estáticos. Você pode encontrar ações pré-construídas para geradores de site estáticos populares no GitHub Actions Marketplace, como actions/setup-node para Gatsby, actions/setup-ruby para Jekyll e actions/setup-hugo para Hugo.
- [x] Implantando no GitHub Pages
O GitHub Pages fornece uma maneira fácil de hospedar sites estáticos diretamente do seu repositório GitHub. Para implantar seu site estático no GitHub Pages usando GitHub Actions, siga estas etapas:
    - [ ] Configurar GitHub Pages: Nas configurações do seu repositório GitHub, habilite GitHub Pages selecionando o branch e o diretório onde seus arquivos estáticos serão armazenados. Normalmente, esse é o branch gh-pages ou o diretório docs no branch principal.
    - [ ] Criar um fluxo de trabalho GitHub Actions: Crie um novo fluxo de trabalho GitHub Actions para automatizar o processo de construção e implantação. O fluxo de trabalho deve incluir etapas para verificar o código-fonte, instalar as dependências necessárias, construir os arquivos estáticos e implantá-los no branch ou diretório GitHub Pages.
    - [ ] Usar a ação GitHub Pages Deploy: Para simplificar o processo de implantação, você pode usar a ação peaceiris/actions-gh-pages, que manipula automaticamente a implantação de seus arquivos estáticos no branch ou diretório GitHub Pages configurado. Configure a ação com as entradas necessárias, como o diretório de construção, branch e token GitHub.
    - [ ] Domínios personalizados e SSL: Se você quiser usar um domínio personalizado para seu site GitHub Pages, configure as configurações de domínio em seu repositório e atualize os registros DNS do seu domínio adequadamente. O GitHub Pages fornece certificados SSL gratuitos para domínios personalizados, garantindo conexões seguras para seus usuários.

- [x] Implantando em outras plataformas de hospedagem estática
Além do GitHub Pages, há várias outras plataformas de hospedagem estática disponíveis, como Netlify, Vercel e Firebase Hosting. Para implantar seu site estático nessas plataformas usando GitHub Actions, siga a documentação e as diretrizes da respectiva plataforma.
    - [ ] Crie um fluxo de trabalho do GitHub Actions: semelhante à implantação no GitHub Pages, crie um novo fluxo de trabalho do GitHub Actions para automatizar o processo de construção e implantação para sua plataforma de hospedagem escolhida. O fluxo de trabalho deve incluir etapas para verificar o código-fonte, instalar dependências, construir os arquivos estáticos e implantá-los na plataforma de hospedagem.
    - [ ] Ações específicas da plataforma: a maioria das plataformas de hospedagem estática oferece GitHub Actions oficiais para simplificar o processo de implantação. Por exemplo, o Netlify fornece as ações netlify/actions/build e netlify/actions/deploy, enquanto o Vercel oferece a ação vercel/action. Use essas ações para integrar seu fluxo de trabalho de implantação com sua plataforma de hospedagem escolhida.
    - [ ] Gerenciando variáveis de ambiente e segredos: certifique-se de que qualquer informação sensível, como chaves de API ou tokens de acesso, seja armazenada com segurança usando o GitHub Secrets. Você pode então referenciar esses segredos em seu fluxo de trabalho do GitHub Actions para manter a segurança do seu processo de implantação.

Concluindo, implantar sites estáticos e GitHub Pages usando GitHub Actions é uma maneira eficiente de automatizar o processo de construção e implantação para seus projetos web. Ao aproveitar o poder dos geradores de sites estáticos e integrar com plataformas de hospedagem populares, você pode garantir uma experiência de implantação perfeita que mantém seu site atualizado e acessível aos seus usuários. Ao seguir as melhores práticas e técnicas descritas nesta seção, você pode criar um fluxo de trabalho simplificado e seguro que permite que sua equipe se concentre no desenvolvimento de conteúdo e recursos de alta qualidade para seu site estático, enquanto o GitHub Actions lida com o processo de implantação nos bastidores.

Ao aproveitar o poder do GitHub Actions, você pode estabelecer um pipeline robusto de Continuous Deployment que mantém seus aplicativos atualizados, seguros e altamente disponíveis para seus usuários.

Como resultado, sua equipe pode se concentrar em fornecer recursos e melhorias de alta qualidade, mantendo um ciclo de lançamento rápido, garantindo que seus projetos permaneçam competitivos e responsivos às necessidades em constante mudança de seus usuários.

### Securing and Optimizing Your GitHub Actions Workflows
À medida que você continua a expandir e refinar seus fluxos de trabalho do GitHub Actions, torna-se cada vez mais importante garantir sua segurança e otimizar seu desempenho. Neste capítulo, exploraremos práticas essenciais para proteger seus fluxos de trabalho e aumentar sua eficiência.

Aprofundaremos tópicos como proteger dados confidenciais com segredos, mitigar riscos de segurança e aderir ao princípio do menor privilégio. Além disso, discutiremos as melhores práticas para otimizar seus fluxos de trabalho, reduzir os tempos de compilação e minimizar o consumo de recursos. Ao implementar essas estratégias, você não apenas garantirá a integridade e a confiabilidade do seu pipeline de CI/CD, mas também maximizará sua eficácia.

Ao final deste capítulo, você terá uma compreensão sólida das várias técnicas para proteger e otimizar seus fluxos de trabalho do GitHub Actions, capacitando você a criar pipelines de CI/CD mais resilientes e de alto desempenho para seus projetos.

#### Workflow Security Best Practices
O GitHub Actions pode otimizar significativamente seu pipeline de CI/CD, mas é crucial priorizar a segurança ao projetar e gerenciar seus fluxos de trabalho. Nesta seção, discutiremos as melhores práticas essenciais de segurança para ajudar a proteger seus fluxos de trabalho do GitHub Actions e proteger seus projetos de ameaças potenciais.

- [x] Proteja dados confidenciais com segredos: armazene informações confidenciais como chaves de API, tokens de acesso e credenciais usando os segredos criptografados do GitHub. Os segredos podem ser definidos no nível do repositório, organização ou ambiente e são expostos apenas a fluxos de trabalho em execução no mesmo repositório ou organização. Ao usar segredos, você pode evitar que dados confidenciais sejam acidentalmente vazados ou expostos em logs.
- [x] Limite o uso de ações de terceiros: embora o GitHub Actions Marketplace ofereça uma ampla variedade de ações pré-construídas para aprimorar seus fluxos de trabalho, é crucial ser cauteloso ao incorporar ações de terceiros. Use apenas ações confiáveis de fontes confiáveis e considere fixá-las em uma versão ou confirmação específica para evitar possíveis problemas de segurança introduzidos por atualizações.
- [x] Restringir acesso a repositórios e ambientes: siga o princípio do menor privilégio ao conceder acesso aos seus repositórios e ambientes. Limite o acesso de gravação a um número mínimo de colaboradores confiáveis e restrinja o acesso ao ambiente usando as regras de proteção de ambiente do GitHub. Ao fazer isso, você pode minimizar o risco de acesso não autorizado aos seus fluxos de trabalho e dados confidenciais.
- [x] Validar a entrada do usuário e higienizar dados externos: quando seu fluxo de trabalho aceitar entrada do usuário ou processar dados externos, valide e higienize as informações para evitar potenciais vulnerabilidades de segurança, como injeção de código ou ataques de script entre sites (XSS). Use funções e bibliotecas integradas para processar a entrada com segurança e evitar a execução de código não confiável em seus fluxos de trabalho.
- [x] Implementar práticas de codificação seguras: aplique práticas de codificação seguras às suas ações personalizadas e scripts de fluxo de trabalho. Isso inclui evitar o uso de funções potencialmente inseguras, validar e higienizar a entrada e seguir as melhores práticas para desenvolvimento seguro, como as recomendações do OWASP Top Ten Project.
- [x] Monitore e audite a atividade do fluxo de trabalho: revise regularmente seus logs de fluxo de trabalho e a atividade do GitHub Actions para identificar possíveis problemas de segurança ou acesso não autorizado. Use as ferramentas de monitoramento integradas do GitHub e integre-se com soluções de registro e monitoramento de terceiros para manter uma visão abrangente da atividade do seu fluxo de trabalho.
- [x] Mantenha suas ações e dependências atualizadas: atualize regularmente suas GitHub Actions e suas dependências para garantir que você esteja usando os patches e melhorias de segurança mais recentes. Considere usar ferramentas como Dependabot para monitorar e atualizar automaticamente suas dependências, reduzindo o risco de vulnerabilidades de segurança conhecidas.
- [x] Habilite a proteção de ramificação e revisões de código: use os recursos de proteção de ramificação do GitHub para impor revisões de código e evitar confirmações diretas em ramificações críticas, como principal ou mestre. Isso ajuda a manter a integridade da sua base de código e garante que as alterações em seus fluxos de trabalho sejam revisadas por colaboradores confiáveis antes de serem mescladas.
- [x] Use confirmações assinadas: para garantir a autenticidade das alterações de código, considere usar confirmações assinadas com GPG. Isso adiciona uma camada de segurança ao verificar se os commits são genuinamente criados pelo colaborador designado, ajudando a evitar alterações não autorizadas ou maliciosas em seus fluxos de trabalho.
- [x] Implemente verificações de segurança automatizadas: integre ferramentas de varredura de segurança automatizadas, como o CodeQL do GitHub, em seu pipeline de CI/CD para detectar vulnerabilidades potenciais em sua base de código. Ao escanear regularmente seu código em busca de problemas de segurança, você pode abordar vulnerabilidades proativamente antes que elas se tornem exploráveis na produção.

Ao seguir essas práticas recomendadas de segurança de fluxo de trabalho, você pode reduzir significativamente o risco de violações de segurança e proteger seus projetos de ameaças potenciais. Implementar uma estratégia de segurança robusta é um processo contínuo, e é essencial manter-se atualizado com as recomendações de segurança e práticas recomendadas mais recentes para manter a integridade e a segurança de seus fluxos de trabalho do GitHub Actions.
### Caching and Artifact Management
Gerenciar caches e artefatos de forma eficaz é essencial para otimizar seus fluxos de trabalho do GitHub Actions, pois pode reduzir significativamente os tempos de compilação e o consumo de recursos. Nesta seção, exploraremos estratégias de cache e técnicas de gerenciamento de artefatos para ajudar você a melhorar a eficiência e o desempenho do seu pipeline de CI/CD.
#### Caching in GitHub Actions
O cache é uma técnica poderosa que permite armazenar e reutilizar os resultados de tarefas demoradas, como instalação de dependências ou processos de construção. Ao armazenar esses resultados em cache, você pode evitar trabalho desnecessário em execuções subsequentes, levando a uma execução mais rápida do fluxo de trabalho e uso reduzido de recursos.
- [x] Dependências de cache: Um dos usos mais comuns do cache no GitHub Actions é armazenar em cache as dependências do seu projeto. Ao armazenar em cache as dependências, você pode economizar tempo e recursos ao não ter que buscá-las e instalá-las para cada execução do fluxo de trabalho. O GitHub Actions fornece uma ação de cache integrada que simplifica o cache e a restauração de dependências para vários gerenciadores de pacotes, como npm, yarn ou pip. Para usar a ação de cache, inclua-a no seu fluxo de trabalho e especifique o caminho para as dependências e uma chave de cache. A chave de cache deve incluir o hash do arquivo de configuração do pacote relevante, garantindo que o cache seja invalidado quando as dependências forem alteradas.
- [x] Cache de saídas de build: além de armazenar em cache as dependências, você também pode armazenar em cache saídas de build intermediárias ou ativos compilados, como binários ou arquivos CSS e JavaScript compilados. Isso pode reduzir significativamente os tempos de build em casos em que o processo de compilação consome muito tempo ou recursos.
Para armazenar em cache as saídas de build, use a ação cache e especifique os caminhos apropriados e a chave de cache. Esteja atento ao tamanho do cache, pois armazenar grandes saídas de build pode consumir sua cota de armazenamento do GitHub Actions.
- [x] Cache de camadas do Docker: se seus fluxos de trabalho dependem do Docker, armazenar em cache as camadas do Docker pode ajudar a acelerar o processo de build. Ao armazenar em cache as camadas do Docker, você pode evitar a reconstrução de camadas inalteradas e reduzir o tempo necessário para extrair ou enviar imagens.
Para armazenar em cache as camadas do Docker, use a ação cache do GitHub em combinação com o plugin buildx do Docker. Como alternativa, você pode usar uma ação dedicada, como a ação satackey/action-docker-layer-caching, que simplifica o armazenamento em cache de camadas do Docker em seus fluxos de trabalho do GitHub Actions.

### Artifact Management in GitHub Actions
Artefatos são arquivos ou coleções de arquivos produzidos por seus fluxos de trabalho, como saídas de build, resultados de testes ou documentação. Gerenciar artefatos de forma eficiente é crucial para otimizar seus fluxos de trabalho do GitHub Actions, pois permite que você compartilhe, armazene e acesse esses arquivos em diferentes trabalhos, fluxos de trabalho ou até mesmo repositórios.
- [x] Carregar e baixar artefatos: o GitHub Actions fornece ações integradas, upload-artifact e download-artifact, que permitem que você carregue e baixe artefatos em seus fluxos de trabalho. Essas ações permitem que você compartilhe arquivos entre trabalhos ou os armazene para uso posterior, como implantar seu aplicativo ou distribuir ativos de build. Ao usar a ação upload-artifact, especifique o caminho para os arquivos que deseja carregar e forneça um nome para o artefato. Para baixar o artefato em outro trabalho, use a ação download-artifact e especifique o nome do artefato.
- [x] Armazenar artefatos por períodos mais longos: por padrão, o GitHub Actions armazena artefatos por 90 dias. No entanto, você pode precisar armazenar artefatos por períodos mais longos, como por motivos de conformidade ou análise histórica. Nesses casos, considere usar um serviço de armazenamento externo, como Amazon S3 ou Google Cloud Storage, para persistir seus artefatos. Para armazenar artefatos em um serviço de armazenamento externo, use uma ação ou script dedicado em seu fluxo de trabalho para carregar os artefatos no local de armazenamento desejado. Certifique-se de gerenciar o controle de acesso e as permissões para garantir a segurança e a privacidade de seus artefatos.
- [x] Otimize o armazenamento de artefatos: gerenciar com eficiência o armazenamento de artefatos é essencial para otimizar seus fluxos de trabalho do GitHub Actions e evitar limitações de cota de armazenamento. Aqui estão algumas estratégias para ajudar você a otimizar o armazenamento de artefatos:
- [x] Compactar artefatos: compactar seus artefatos pode reduzir significativamente seu tamanho e consumo de armazenamento. Use ferramentas como gzip ou zip para compactar seus arquivos antes de carregá-los como artefatos. Além disso, alguns formatos de arquivo, como imagens ou arquivos de texto, podem se beneficiar de algoritmos de compactação especializados, como WebP para imagens ou Brotli para arquivos de texto.
- [x] Excluir artefatos desnecessários: com o tempo, seus fluxos de trabalho podem gerar um grande número de artefatos, alguns dos quais podem não ser mais necessários. Revise e exclua periodicamente artefatos desnecessários para liberar espaço de armazenamento. Você pode usar a API do GitHub ou um script do GitHub Actions para automatizar o processo de identificação e exclusão de artefatos desnecessários.
- [x] Limitar a retenção de artefatos: por padrão, o GitHub Actions retém artefatos por 90 dias. No entanto, você pode configurar um período de retenção personalizado para melhor atender às suas necessidades. Por exemplo, se você só precisa manter artefatos por um curto período, pode reduzir o período de retenção para economizar espaço de armazenamento. Seja cauteloso ao definir um período de retenção mais curto, pois isso pode afetar sua capacidade de acessar e analisar artefatos históricos.

Concluindo, gerenciar caches e artefatos de forma eficaz é crucial para otimizar seus fluxos de trabalho do GitHub Actions. Ao empregar estratégias de cache e técnicas eficientes de gerenciamento de artefatos, você pode reduzir significativamente os tempos de compilação, o consumo de recursos e os requisitos de armazenamento, levando a um pipeline de CI/CD mais eficiente e econômico.

#### Performance Optimization Tips
Ao trabalhar com o GitHub Actions, otimizar o desempenho dos seus fluxos de trabalho é essencial para garantir um pipeline de CI/CD rápido e eficiente. Um pipeline bem otimizado reduz o tempo de execução, minimiza o consumo de recursos e permite que você obtenha feedback mais rápido sobre suas alterações de código. Nesta seção, exploraremos várias dicas e práticas recomendadas para otimizar o desempenho dos seus fluxos de trabalho do GitHub Actions. Abordaremos aspectos como estrutura do fluxo de trabalho, uso do executor, paralelismo, otimização de imagem do Docker, execução condicional, avaliação de ação de terceiros e monitoramento de desempenho.
Ao implementar essas estratégias de otimização, você pode melhorar significativamente a eficiência dos seus fluxos de trabalho do GitHub Actions e garantir um processo de CI/CD tranquilo e econômico para seus projetos.

#### Optimize Workflow Structure
Uma estrutura de fluxo de trabalho eficiente do GitHub Actions pode impactar significativamente o desempenho geral do seu pipeline de CI/CD. Ao projetar seus fluxos de trabalho com o desempenho em mente, você pode reduzir o tempo de execução e o consumo de recursos. Aqui estão algumas dicas para otimizar sua estrutura de fluxo de trabalho:

- [x] Organize os trabalhos de forma eficiente: divida seu fluxo de trabalho em trabalhos menores e focados que podem ser executados em paralelo ou sequencialmente, dependendo de suas dependências. Ao organizar seus trabalhos de forma eficiente, você pode minimizar o tempo ocioso e aproveitar ao máximo os recursos de execução paralela do GitHub Actions. Garanta que tarefas independentes sejam executadas simultaneamente, enquanto tarefas dependentes sejam organizadas sequencialmente.
- [x] Minimize as dependências de trabalho: embora alguns trabalhos possam depender da saída de outros trabalhos, minimizar as dependências de trabalho pode ajudar a reduzir o tempo geral de execução. Ao minimizar as dependências, você permite maior paralelismo, o que pode levar à conclusão mais rápida de seus fluxos de trabalho.
- [x] Reutilizar etapas comuns: se seus fluxos de trabalho contiverem etapas comuns, como configurar o ambiente ou instalar dependências, considere consolidar essas etapas em componentes reutilizáveis, como ações compostas ou scripts de shell compartilhados. Reutilizar etapas comuns pode ajudar a manter uma estrutura de fluxo de trabalho limpa e eficiente e reduzir a duplicação de código entre fluxos de trabalho.
- [x] Dividir fluxos de trabalho por evento ou ramificação: em vez de ter um único fluxo de trabalho que lida com vários eventos ou ramificações, considere dividir seus fluxos de trabalho com base no evento de disparo ou na ramificação de destino. Essa abordagem permite que você adapte cada fluxo de trabalho à sua finalidade específica, facilitando a otimização e a manutenção. Por exemplo, você pode ter fluxos de trabalho separados para solicitações de pull, pushes para a ramificação principal e eventos agendados.
- [x] Otimizar compilações de matriz: compilações de matriz permitem que você execute um trabalho em várias combinações de sistemas operacionais, versões de tempo de execução ou outras configurações. Embora as compilações de matriz possam ser incrivelmente poderosas, elas também podem consumir uma quantidade significativa de recursos se não forem gerenciadas com cuidado. Para otimizar as compilações de matriz, limite o número de combinações que você testa e concentre-se nas configurações mais importantes ou relevantes para seu projeto. Você também pode aproveitar as opções de exclusão ou inclusão para ajustar sua configuração de matriz.
- [ ] Priorize tarefas críticas: organize seu fluxo de trabalho de forma a priorizar tarefas críticas, como compilar e testar seu aplicativo. Ao garantir que essas tarefas sejam executadas primeiro, você pode identificar rapidamente quaisquer problemas e falhar o fluxo de trabalho antecipadamente, evitando trabalho desnecessário e consumo de recursos.
- [x] Use artefatos de forma eficaz: os artefatos permitem que você compartilhe dados entre trabalhos ou armazene saídas de compilação para uso posterior. Ao usar artefatos de forma eficaz, você pode evitar a duplicação de trabalho entre trabalhos e melhorar a eficiência geral do seu fluxo de trabalho. Esteja atento ao tamanho e ao número de artefatos que você gera, pois armazenar artefatos grandes ou numerosos pode impactar suas cotas de armazenamento.

Ao otimizar sua estrutura de fluxo de trabalho, você pode melhorar significativamente o desempenho e a eficiência do seu pipeline de CI/CD do GitHub Actions. Uma estrutura de fluxo de trabalho bem projetada não apenas reduz o tempo de execução e o consumo de recursos, mas também melhora a manutenibilidade e a legibilidade, facilitando a colaboração entre você e sua equipe em seus projetos.

### Runners
Um runner é simplesmente um servidor que tem o aplicativo runner GitHub Actions instalado.

Um executor é um servidor que executa seus fluxos de trabalho quando eles são disparados. Cada executor pode executar um único trabalho por vez. GitHub fornece executores Ubuntu Linux, Microsoft Windows e macOS para executar seus fluxos de trabalho. Cada execução de fluxo de trabalho é executada em uma máquina virtual nova e recém-provisionada.

A integração contínua (CI, Continuous Integration) é uma prática de software que exige commits frequentes de códigos para um repositório compartilhado.

GitHub fornece executores que você pode usar para executar seus trabalhos ou você pode hospedar seus próprios executores, cada executor hospedado em GitHub é uma nova VM (máquina virtual) hospedada por GitHub com o aplicativo executor e outras ferramentas pré-instaladas e está disponível com Ubuntu Linux, Sistemas operacionais Windows ou macOS.

No plano GitHub Team ou GitHub Enterprise Cloud, poderá provisionar um executor com mais núcleos ou um executor alimentado por um processador de GPU.

Você pode instalar software adicional em executores hospedados no GitHub como parte do seu fluxo de trabalho.

O Runner determina o cálculo subjacente e o SO em que o fluxo de trabalho será executado. O runner pode ser:

### GitHub-hosted — Ambientes de tempo de execução predefinidos dos provedores do GitHub

- [x] Standard size
- [x] Linux: self-hosted, ubuntu-22.04, ubuntu-20.04
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

Self-Hosted Runner Follow Along: Hands-On Setup -  GitHub Actions Course
Estas notas de laboratório orientam você na configuração de um executor auto-hospedado para GitHub Actions. Este tutorial é benéfico para entender o processo de configuração, mesmo que não concluamos todas as etapas devido a limitações com ambientes como GitHub Codespaces. Se você estiver trabalhando localmente ou em um provedor de nuvem, as etapas devem funcionar de forma semelhante.

Etapa 1: verificar o acesso ao repositório e preparar a computação
1.1 Vá para o seu repositório onde você configurará o executor auto-hospedado.
1.2 Confirme se você tem acesso à computação (um sistema com SO apropriado, como Linux, Windows ou macOS).
1.3 Se estiver usando GitHub Codespaces ou uma máquina local, abra o ambiente onde você trabalhará.
Etapa 2: acessar as configurações do GitHub Actions Runner
2.1 Navegue até as configurações do seu repositório GitHub:
Na visualização do repositório, vá para Configurações.
Na barra lateral esquerda, localize e clique em Ações > Runners.
2.2 Configurar um novo executor:
Selecione Adicionar novo executor.
Escolha um SO (neste exemplo, usaremos Linux).
Siga as instruções fornecidas pelo GitHub para baixar e configurar o runner.
Etapa 3: Instalar dependências
3.1 Abra o Terminal/Console: Inicie um terminal no seu ambiente de computação.
3.2 Crie um diretório para o Runner:
Execute:
mkdir actions-runner && cd actions-runner
3.3 Baixe o aplicativo GitHub Actions Runner:
Use o comando curl fornecido pelo GitHub para baixar os arquivos necessários.
3.4 Extraia os arquivos:
Descompacte ou extraia o arquivo baixado (o GitHub pode fornecer os comandos tar -xzf).
3.5 Configure o Runner com Token:
Obtenha seu token na página de configuração do GitHub e siga as etapas de configuração.
Execute:
./config.sh --url URL_DO_SEU_REPOSITÓRIO --token SEU_TOKEN
3.6 Insira detalhes adicionais de configuração conforme solicitado:
Se solicitado, especifique:
Grupo do Runner: (pressione Enter para o padrão).
Nome do Runner: Escolha um nome descritivo (por exemplo, "Enterprise".
Rótulos: Opcional, mas você pode adicionar rótulos personalizados.
Pasta de trabalho: Padrão para ./_work pressionando Enter.
Etapa 4: Inicie o Runner auto-hospedado
4.1 Execute o Runner:
Inicie com:
./run.sh
4.2 Verifique se o Runner está online:
Verifique a guia Ações do seu repositório para ver se o Runner está listado.
Etapa 5: Crie e teste um fluxo de trabalho de ação do GitHub
5.1 Navegue até a pasta .github/workflows/ no seu repositório.
5.2 Crie um novo arquivo YAML (por exemplo, self-hosted-runner.yml) com o seguinte código:

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

5.3. Commit e Push este arquivo para acionar o fluxo de trabalho.
5.4. Monitore o fluxo de trabalho: vá para a aba Ações e verifique se o fluxo de trabalho é acionado. Você pode ver um status "aguardando executor" se o executor não puder se conectar.
Solução de problemas de rede e conectividade
Certifique-se de que as portas estejam abertas: para um executor auto-hospedado se comunicar com o GitHub, certifique-se de que ele possa acessar a porta 443 para HTTPS.
Revise os requisitos de rede: certifique-se de que todas as configurações de firewall permitam que o executor se comunique de volta com os servidores do GitHub.
Se os problemas de conectividade persistirem, considere testar em uma máquina local ou provedor de nuvem com as permissões apropriadas.
Resumo
Este passo a passo apresentou a você os princípios básicos da configuração de um executor GitHub Actions auto-hospedado. Este método, embora possível em Codespaces, pode encontrar problemas de rede ou dependência e geralmente é mais fácil de testar em um ambiente local ou hospedado na nuvem.

```
# specify a specific GitHub-self hosted
runs-on: self-hosted
runs-on: windows-latest
runs-on: macos-latest

# specify multiple possible runners
runs-on: [macos-14, macos-13, macos-12]

# specify Self-Hosted runner


## Contextos
Os contextos são uma forma de acessar informações sobre execuções de fluxo de trabalho, variáveis, ambientes dos executores, trabalhos e etapas. ${{ <context> }}


### github actions to build & deploy book, following https://github.com/executablebooks/cookiecutter-jupyter-book/blob/main/.github/workflows/deploy.yml

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
        os: [self-hosted]
        python-version: [3.8]
    steps:
    - uses: actions/checkout@v4

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

### Minimize Use of GitHub-hosted Runners
Os executores hospedados no GitHub são uma opção conveniente para executar seus fluxos de trabalho, pois fornecem um ambiente pré-configurado com várias ferramentas e suporte para vários sistemas operacionais. No entanto, usar executores hospedados no GitHub pode ter algumas desvantagens, incluindo recursos limitados, possíveis tempos de fila e implicações de custo, especialmente para projetos ou organizações de grande escala.
Aqui estão algumas estratégias para minimizar o uso de executores hospedados no GitHub e otimizar o desempenho do seu fluxo de trabalho:
- [x] Use executores auto-hospedados: ao configurar executores auto-hospedados, você obtém mais controle sobre o ambiente, hardware e recursos disponíveis para seus fluxos de trabalho. Os executores auto-hospedados podem ser personalizados de acordo com as necessidades específicas do seu projeto e podem ajudar a reduzir os tempos de fila, especialmente se sua organização tiver muitos fluxos de trabalho simultâneos. Além disso, usar executores auto-hospedados pode ser mais econômico a longo prazo, especialmente para projetos de grande escala ou que exigem muitos recursos.
- [x] Otimize o uso de recursos: aproveite ao máximo os recursos disponíveis nos executores hospedados no GitHub otimizando seus fluxos de trabalho para usar menos recursos. Isso pode incluir a redução do número de trabalhos paralelos, a limitação de configurações de build de matriz e a otimização de processos de build e teste. Ao usar os recursos de forma mais eficiente, você pode reduzir as chances de atingir limites de recursos ou experimentar gargalos de desempenho.
- [x] Dependências de cache: o cache de dependências pode reduzir significativamente o tempo gasto na instalação e configuração do seu ambiente em cada trabalho. Ao aproveitar os mecanismos de cache integrados do GitHub Actions, você pode minimizar a necessidade de transferências de rede e reduzir a carga nos executores hospedados no GitHub.
- [x] Agende fluxos de trabalho não críticos: se você tiver fluxos de trabalho não críticos, como builds noturnos ou tarefas de manutenção programadas, considere executá-los fora do horário de pico para reduzir a carga nos executores hospedados no GitHub. Isso pode ajudar a aliviar os tempos de fila e garantir que os fluxos de trabalho críticos, como aqueles acionados por solicitações de pull ou pushes, tenham acesso mais rápido aos executores.
- [x] Limitar a simultaneidade do fluxo de trabalho: use a palavra-chave concurrency para limitar o número de execuções simultâneas para um fluxo de trabalho ou tarefa específica. Ao limitar a simultaneidade, você pode evitar o uso excessivo de recursos em executores hospedados no GitHub e garantir que os recursos estejam disponíveis para outros fluxos de trabalho críticos.
- [x] Otimizar os tempos de compilação: invista tempo na otimização de seus processos de compilação e teste para reduzir o tempo geral de execução de seus fluxos de trabalho. Compilações e testes mais rápidos não apenas economizam tempo, mas também reduzem o consumo de recursos em executores hospedados no GitHub.

Ao minimizar o uso de executores hospedados no GitHub e implementar essas estratégias de otimização, você pode melhorar o desempenho de seus fluxos de trabalho do GitHub Actions, reduzir o consumo de recursos e gerenciar custos de forma mais eficaz. Essas otimizações podem ser particularmente valiosas para projetos ou organizações de grande porte, onde as demandas e os custos de recursos podem aumentar rapidamente.
### Limit Parallelism and Concurrency
Embora o paralelismo e a simultaneidade possam melhorar significativamente o desempenho dos seus fluxos de trabalho do GitHub Actions, é essencial encontrar um equilíbrio entre maximizar a velocidade e minimizar o consumo de recursos. Sobrecarregar seus fluxos de trabalho com muitos trabalhos paralelos ou execuções simultâneas pode levar a maiores tempos de fila, contenção de recursos e custos mais altos.

Aqui estão algumas estratégias para limitar o paralelismo e a simultaneidade em seus fluxos de trabalho:
- [x] Limite as configurações de compilação de matriz: embora as compilações de matriz possam simplificar sua configuração de fluxo de trabalho, elas também podem multiplicar rapidamente o número de trabalhos paralelos. Limite o número de configurações de matriz concentrando-se nas combinações mais críticas de plataformas, linguagens e dependências. Além disso, use a palavra-chave exclude para remover combinações desnecessárias que não agregam valor significativo ao seu pipeline de CI/CD.
- [x] Use dependências de trabalho: organize seu fluxo de trabalho em uma sequência lógica de trabalhos com dependências, usando a palavra-chave needs. Ao definir dependências de trabalho, você pode garantir que apenas os trabalhos necessários sejam executados em paralelo, limitando o consumo de recursos e mantendo um pipeline de CI/CD simplificado.
- [x] Limitar a simultaneidade de trabalho: use a palavra-chave concurrency para limitar o número de execuções simultâneas para um trabalho específico. Isso pode ajudar a evitar a contenção de recursos e garantir que os recursos estejam disponíveis para outros trabalhos críticos em seu fluxo de trabalho.
- [ ] Avaliar a execução de testes paralelos: paralelizar testes pode acelerar seu fluxo de trabalho, mas também pode levar ao aumento do consumo de recursos. Analise seu conjunto de testes para determinar se a execução paralela é necessária e benéfica. Se possível, considere otimizar seus testes ou organizá-los em conjuntos de testes menores e mais focados que podem ser executados mais rapidamente com menos paralelismo.
- [x] Otimizar a configuração de trabalho paralelo: revise cuidadosamente sua configuração de fluxo de trabalho para identificar oportunidades de otimizar trabalhos paralelos. Certifique-se de que cada trabalho paralelo forneça valor significativo e evite executar trabalhos redundantes ou desnecessários em paralelo.
- [x] Monitore o uso de recursos: monitore continuamente o uso de recursos dos seus fluxos de trabalho do GitHub Actions. Use as métricas de desempenho integradas e as ferramentas de monitoramento fornecidas pelo GitHub para identificar gargalos de desempenho, contenção de recursos e oportunidades de otimização.

Ao limitar o paralelismo e a simultaneidade nos seus fluxos de trabalho do GitHub Actions, você pode gerenciar efetivamente o consumo de recursos, reduzir os tempos de fila e controlar os custos, mantendo um pipeline de CI/CD rápido e eficiente. Encontrar o equilíbrio certo entre paralelismo e uso de recursos é essencial para otimizar seus fluxos de trabalho para desempenho e custo.

### Optimize Docker Image Usage
As imagens do Docker desempenham um papel significativo no desempenho e no consumo de recursos dos seus fluxos de trabalho do GitHub Actions. O uso e o gerenciamento eficientes de imagens do Docker podem ajudar a reduzir o tempo necessário para configurar e executar seus fluxos de trabalho, minimizar o uso de recursos e, por fim, economizar custos. Aqui estão algumas estratégias para otimizar o uso de imagens do Docker em seus fluxos de trabalho do GitHub Actions:
- [x] Use imagens de base leves: ao criar imagens personalizadas do Docker para seus fluxos de trabalho ou construir seus aplicativos, sempre use imagens de base leves para minimizar o tamanho e a sobrecarga de recursos. As imagens de base leves populares incluem Alpine Linux e outras distribuições mínimas que contêm apenas os componentes essenciais necessários para executar seus aplicativos.
- [x] Armazene em cache imagens do Docker: aproveite os mecanismos de cache integrados do GitHub Actions para armazenar em cache imagens e camadas do Docker entre execuções de fluxo de trabalho. Ao armazenar em cache imagens do Docker, você pode reduzir o tempo gasto no download de imagens e minimizar a sobrecarga da rede, resultando em uma execução mais rápida do fluxo de trabalho e menor uso de recursos.
- [x] Otimize as camadas do Docker: Ao criar suas imagens personalizadas do Docker, estruture seu Dockerfile para otimizar a disposição em camadas de suas imagens. Agrupe comandos e arquivos relacionados em cada camada para minimizar o número de camadas e reduzir o tamanho geral da imagem. Além disso, coloque camadas que mudam com frequência na parte inferior do seu Dockerfile para melhorar a eficiência do cache.
- [x] Remova arquivos e pacotes desnecessários: Mantenha suas imagens do Docker enxutas e focadas, incluindo apenas os arquivos e pacotes necessários para executar seu aplicativo ou fluxo de trabalho. Remova quaisquer arquivos, dependências ou ferramentas estranhas que não sejam necessárias, pois podem aumentar significativamente o tamanho da imagem e o uso de recursos.
- [x] Use compilações de vários estágios: as compilações de vários estágios permitem que você use várias instruções FROM em seu Dockerfile, permitindo que você crie imagens menores e mais otimizadas. Ao usar compilações de vários estágios, você pode separar o processo de compilação do ambiente de tempo de execução, incluindo apenas os artefatos e dependências necessários em sua imagem final.
- [x] Atualize e mantenha imagens regularmente: revise e atualize continuamente suas imagens do Docker para garantir que estejam atualizadas com os últimos patches de segurança, melhorias de desempenho e atualizações de dependência. Manter suas imagens regularmente ajuda a evitar potenciais riscos de segurança e garante desempenho ideal.

Ao otimizar o uso de imagens do Docker em seus fluxos de trabalho do GitHub Actions, você pode melhorar significativamente o desempenho e a eficiência de recursos do seu pipeline de CI/CD. Implementar essas práticas recomendadas pode ajudar a reduzir o tempo gasto na configuração e execução de seus fluxos de trabalho, minimizar o consumo de recursos e gerenciar custos de forma mais eficaz.

### Leverage Conditional Execution
A execução condicional é um recurso poderoso do GitHub Actions que permite que você controle quando tarefas ou etapas específicas devem ser executadas com base em várias condições. Ao aproveitar a execução condicional, você pode otimizar o desempenho e o uso de recursos dos seus fluxos de trabalho executando apenas as tarefas ou etapas necessárias com base no contexto atual, como o tipo de evento, ramificação ou até mesmo as alterações feitas em uma solicitação de pull.
Aqui estão algumas estratégias para usar a execução condicional para otimizar seus fluxos de trabalho do GitHub Actions:

- [x] Filtrar por tipo de evento ou ramificação: use a palavra-chave if na configuração do seu fluxo de trabalho para definir condições com base no tipo de evento ou ramificação. Por exemplo, você pode executar tarefas ou etapas específicas apenas quando uma solicitação de pull for mesclada ou quando um evento push ocorrer em uma ramificação específica. Isso ajuda a evitar a execução de tarefas ou etapas desnecessárias em determinados cenários, economizando tempo e recursos.
- [x] Ignorar tarefas ou etapas com base em alterações: utilize as palavras-chave paths e paths-ignore para definir condições com base nas alterações feitas em uma solicitação de pull ou evento push. Isso permite que você pule trabalhos ou etapas quando arquivos ou diretórios específicos não forem afetados pelas alterações, resultando em execução mais rápida do fluxo de trabalho e consumo reduzido de recursos.
- [x] Use contexto e expressões: aproveite o rico conjunto de contexto e expressões fornecido pelo GitHub Actions para criar condições complexas com base no ambiente de tempo de execução, resultados de trabalhos anteriores ou outros fatores dinâmicos. Isso permite que você adapte a execução do seu fluxo de trabalho às necessidades específicas de cada execução, otimizando o desempenho e o uso de recursos.
- [x] Combine condições com operadores lógicos: use operadores lógicos como && (e), || (ou) e ! (não) para combinar várias condições e criar regras mais sofisticadas para execução condicional. Isso permite que você ajuste sua configuração de fluxo de trabalho e garanta que os trabalhos ou etapas sejam executados somente quando todas as condições necessárias forem atendidas.
- [x] Tratamento de erros e continue-on-error: utilize a palavra-chave continue-on-error para controlar o comportamento do seu fluxo de trabalho quando uma etapa falhar. Isso pode ajudar você a evitar o consumo desnecessário de recursos ao interromper a execução de etapas ou trabalhos subsequentes quando ocorrer uma falha crítica.

Ao aproveitar a execução condicional em seus fluxos de trabalho do GitHub Actions, você pode melhorar significativamente o desempenho e a eficiência de recursos do seu pipeline de CI/CD. Implementar essas práticas recomendadas pode ajudar você a reduzir o tempo gasto na execução de seus fluxos de trabalho, minimizar o consumo de recursos e gerenciar custos de forma mais eficaz, mantendo um processo de CI/CD rápido e eficiente.

### Evaluate and Optimize Third-Party Actions
Ações de terceiros do GitHub Actions Marketplace podem melhorar significativamente seus fluxos de trabalho, fornecendo soluções pré-criadas para tarefas comuns e integrações com vários serviços. No entanto, usar ações de terceiros também pode impactar o desempenho e o uso de recursos de seus fluxos de trabalho. Para otimizar o uso de ações de terceiros em seus fluxos de trabalho do GitHub Actions, siga estas estratégias:
- [x] Revise e avalie ações: antes de adicionar uma ação de terceiros ao seu fluxo de trabalho, revise e avalie cuidadosamente sua documentação, código-fonte e feedback do usuário. Certifique-se de que a ação seja bem mantida, segura e eficiente. Evite usar ações que tenham problemas de desempenho conhecidos, vulnerabilidades de segurança ou que não sejam mais mantidas ativamente.
- [x] Limite o número de ações: embora possa ser tentador usar várias ações para várias tarefas, é essencial limitar o número de ações em seus fluxos de trabalho àquelas que são realmente necessárias. Cada ação adiciona sobrecarga à execução do seu fluxo de trabalho e pode aumentar o tempo necessário para executar seus trabalhos. Avalie se uma ação específica é necessária ou se a mesma funcionalidade pode ser obtida usando recursos internos do GitHub Actions ou comandos de shell simples.
- [x] Otimize entradas e configuração de ações: ao usar ações de terceiros, certifique-se de fornecer as entradas e configurações corretas para otimizar seu desempenho. Algumas ações podem oferecer parâmetros ou configurações opcionais que podem ajudar a ajustar seu comportamento e uso de recursos. Consulte a documentação da ação para obter detalhes sobre as opções disponíveis e as práticas recomendadas.
- [x] Armazene em cache dependências de ações: algumas ações de terceiros podem exigir dependências externas, como pacotes Node.js, para funcionar. Use os mecanismos de cache internos do GitHub Actions para armazenar em cache essas dependências entre execuções de fluxo de trabalho, reduzindo o tempo gasto baixando e instalando-as e minimizando a sobrecarga da rede.
- [x] Monitore e analise o desempenho das ações: monitore regularmente o desempenho das ações de terceiros que você usa em seus fluxos de trabalho. Analise o tempo gasto executando cada ação e identifique quaisquer gargalos ou problemas de desempenho. Se você descobrir uma ação que consistentemente tem desempenho inferior
ou consome recursos excessivos, considere substituí-la por uma alternativa mais eficiente ou implementar a funcionalidade necessária usando scripts personalizados ou recursos integrados.

Ao avaliar e otimizar cuidadosamente o uso de ações de terceiros em seus fluxos de trabalho do GitHub Actions, você pode melhorar o desempenho e a eficiência de recursos do seu pipeline de CI/CD. Seguir essas práticas recomendadas ajudará você a reduzir o tempo gasto na execução de seus fluxos de trabalho, minimizar o consumo de recursos e gerenciar custos de forma mais eficaz, ao mesmo tempo em que se beneficia do amplo ecossistema do GitHub Actions.

### Monitor and Analyze Workflow Performance
Monitorar e analisar o desempenho dos seus fluxos de trabalho do GitHub Actions é crucial para identificar gargalos, ineficiências e oportunidades de otimização. O monitoramento contínuo ajuda você a manter um pipeline de CI/CD rápido e eficiente, minimizar o consumo de recursos e gerenciar custos de forma mais eficaz. Aqui estão algumas estratégias para monitorar e analisar o desempenho dos seus fluxos de trabalho do GitHub Actions:

- [x] Aproveite a análise integrada do GitHub: use os recursos de análise integrados fornecidos pelo GitHub para monitorar o desempenho dos seus fluxos de trabalho, como duração média de execução, taxa de sucesso e tempo de fila. Analise essas métricas para identificar tendências e problemas potenciais e use as informações para orientar seus esforços de otimização.
- [x] Inspecione execuções de fluxo de trabalho individuais: examine os logs e detalhes de execução de execuções de fluxo de trabalho individuais para obter insights sobre o desempenho de tarefas e etapas específicas. Isso pode ajudar você a identificar tarefas lentas ou que exigem muitos recursos que podem exigir otimização ou refatoração.
- [x] Monitore o uso de recursos: acompanhe o uso de recursos dos seus executores hospedados no GitHub, como CPU, memória e armazenamento, para garantir que seus fluxos de trabalho estejam sendo executados de forma eficiente e não esgotem os recursos disponíveis. Se você notar restrições consistentes de recursos, considere otimizar seus fluxos de trabalho ou usar executores auto-hospedados com mais recursos.
- [x] Use ferramentas de monitoramento de terceiros: integre seus fluxos de trabalho do GitHub Actions com ferramentas externas de monitoramento e observabilidade, como Datadog ou Grafana, para obter insights mais profundos sobre o desempenho do seu pipeline de CI/CD. Essas ferramentas podem ajudar você a visualizar e analisar métricas de fluxo de trabalho, configurar alertas e identificar tendências ao longo do tempo.
- [x] Estabeleça linhas de base e metas de desempenho: defina linhas de base e metas de desempenho para seus fluxos de trabalho, como duração de execução alvo, taxa de sucesso e consumo de recursos. Revise regularmente o desempenho dos seus fluxos de trabalho em relação a esses benchmarks e tome medidas corretivas quando necessário para garantir que seu pipeline de CI/CD permaneça rápido e eficiente.
- [x] Otimize continuamente: revise e otimize continuamente seus fluxos de trabalho para resolver quaisquer gargalos ou ineficiências de desempenho. Use os insights coletados do monitoramento e da análise para orientar seus esforços de otimização, como refatorar etapas lentas, usar ações mais eficientes ou implementar execução condicional.

Ao monitorar e analisar ativamente o desempenho de seus fluxos de trabalho do GitHub Actions, você pode garantir que seu pipeline de CI/CD permaneça rápido, eficiente e econômico. A implementação dessas práticas recomendadas ajudará você a identificar e resolver problemas potenciais antes que se tornem críticos, melhorando a confiabilidade e a eficácia geral do seu processo de CI/CD.

Concluindo, o Capítulo 9 forneceu insights valiosos e práticas recomendadas para proteger e otimizar seus fluxos de trabalho do GitHub Actions. Garantir a segurança de seus fluxos de trabalho é fundamental, pois evita acesso não autorizado, protege informações confidenciais e mantém a integridade do seu pipeline de CI/CD. A otimização, por outro lado, ajuda você a criar fluxos de trabalho eficientes e econômicos que fazem o melhor uso dos recursos disponíveis e minimizam o tempo de execução.

Seguindo as diretrizes e recomendações descritas neste capítulo, você pode criar um pipeline de CI/CD seguro e eficiente que aprimora seu processo de desenvolvimento e melhora a qualidade geral de seus projetos de software. Lembre-se de que segurança e otimização são processos contínuos; é essencial revisar, monitorar e refinar continuamente seus fluxos de trabalho para abordar potenciais ameaças e ineficiências à medida que elas surgem. À medida que você continua a explorar e aproveitar o poder do GitHub Actions, você estará bem equipado para construir um pipeline de CI/CD robusto e eficiente que acelera seu ciclo de vida de desenvolvimento de software.
### Advanced GitHub Actions Techniques
À medida que você se sentir mais confortável com o GitHub Actions e começar a explorar todo o seu potencial, você pode acabar buscando técnicas mais avançadas para aprimorar ainda mais seu pipeline de CI/CD. Este capítulo se aprofunda em estratégias avançadas do GitHub Actions que podem ajudar você a ajustar seus fluxos de trabalho, estender sua funcionalidade e melhorar sua eficiência geral.
Neste capítulo, abordaremos uma variedade de tópicos avançados, como usar compilações de matriz dinâmica, trabalhar com scripts de shell avançados, integrar com outras plataformas de CI/CD e explorar a API do GitHub para ações personalizadas. Ao dominar essas técnicas avançadas, você será capaz de lidar com cenários de automação complexos e desbloquear todo o potencial do GitHub Actions para agilizar seu processo de desenvolvimento de software.
Quer você esteja procurando otimizar seus fluxos de trabalho existentes ou enfrentar novos desafios com o GitHub Actions, este capítulo fornece o conhecimento e as ferramentas necessárias para elevar seu pipeline de CI/CD para o próximo nível. Então, vamos mergulhar e explorar as técnicas avançadas que ajudarão você a aproveitar ao máximo o GitHub Actions.
#### Workflow Templates and Reusable Workflows
À medida que sua organização cresce e você gerencia vários repositórios, torna-se cada vez mais importante padronizar e manter a consistência em seus fluxos de trabalho do GitHub Actions. Modelos de fluxo de trabalho e fluxos de trabalho reutilizáveis ajudam a simplificar seu gerenciamento de pipeline de CI/CD e reduzem a duplicação de código, facilitando a manutenção e a atualização de seus fluxos de trabalho em vários repositórios. Nesta seção, exploraremos esses dois recursos poderosos e demonstraremos como usá-los de forma eficaz.

#### Workflow Templates
Os modelos de fluxo de trabalho podem simplificar significativamente o processo de criação e manutenção de fluxos de trabalho do GitHub Actions em sua organização. Eles fornecem uma estrutura predefinida que permite criar arquivos de fluxo de trabalho reutilizáveis que podem ser facilmente compartilhados em vários repositórios. Os modelos de fluxo de trabalho são particularmente úteis para organizações com vários repositórios compartilhando pipelines de CI/CD semelhantes ou tarefas de automação, pois permitem consistência e manutenibilidade em todos os projetos.

Para criar um modelo de fluxo de trabalho, siga estas etapas:

- [x] Crie um repositório **.github**: Comece criando um novo repositório chamado .github em sua organização. Este repositório armazenará os modelos de fluxo de trabalho da sua organização e outros recursos compartilhados.
- [x] Crie um diretório workflow-templates: dentro do repositório .github, crie um novo diretório chamado workflow-templates.
    - [ ] `.github/workflow-templates`
- [x] Crie um arquivo de modelo: no diretório workflow-templates, crie um novo arquivo de fluxo de trabalho com uma extensão yaml ou yml. Este arquivo conterá o modelo para seu fluxo de trabalho reutilizável. Defina o fluxo de trabalho como faria para um fluxo de trabalho regular do GitHub Actions, incluindo gatilhos, trabalhos, etapas e ações. No entanto, lembre-se de que esse arquivo deve ser genérico o suficiente para ser usado em vários repositórios.

```
name: Octo Organization CI
on:
  push:
    branches: [ $default-branch ]
  pull_request:
    branches: [ $default-branch ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run a one-line script
        run: echo Hello from Octo Organization
```
- [x] Adicione um arquivo de metadados de modelo: Crie um arquivo de metadados JSON para seu modelo (**octo-organization-ci.properties.json**) com o mesmo nome do arquivo de modelo de fluxo de trabalho, mas com uma extensão properties.json. Esse arquivo deve ser colocado no diretório workflow-templates. O arquivo de metadados contém informações sobre seu modelo, como seu nome, descrição e quaisquer entradas necessárias. Aqui está um exemplo de um arquivo de metadados:

```
{
    "name": "Octo Organization Workflow",
    "description": "Octo Organization CI workflow template.",
    "iconName": "example-icon",
    "categories": [
        "Go"
    ],
    "filePatterns": [
        "package.json$",
        "^Dockerfile",
        ".*\\.md$"
    ]
}
```
| Campo | Entenda |
| ----- | ------  |
| name  | Necessário. O nome do fluxo de trabalho. Isso é exibido na lista de fluxos de trabalho disponíveis. |
|description | Necessário. A descrição do fluxo de trabalho. Isso é exibido na lista de fluxos de trabalho disponíveis.|
|iconName | Opcional. Especifica um ícone para o fluxo de trabalho que é exibido na lista de fluxos de trabalho. pode um dos seguintes tipos:iconName. Um arquivo SVG armazenado no diretório. Para fazer referência a um arquivo, o valor deve ser o nome do arquivo sem a extensão do arquivo. Por exemplo, um arquivo SVG chamado é referenciado como .workflow-templatesexample-icon.svgexample-icon. Um ícone do conjunto de Octicons do GitHub. Para fazer referência a um octicon, o valor deve ser . Por exemplo.octicon <icon name>octicon smiley |
| categories | Opcional. Define as categorias nas quais o fluxo de trabalho é mostrado. Você pode usar nomes de categoria das seguintes listas:|
|            | Nomes de categorias gerais do repositório starter-workflows. |
|            | Idiomas lingüísticos da lista no repositório lingüístico.    |
|            | Pilhas de tecnologia compatíveis da lista no repositório starter-workflows. |
| filePatterns | Opcional. Permite que o fluxo de trabalho seja usado se o repositório do usuário tiver um arquivo em seu diretório raiz que corresponda a uma expressão regular definida. |

- [x] Confirme e envie suas alterações: confirme e envie as alterações para seu repositório .github. O novo modelo de fluxo de trabalho agora estará disponível para uso nos repositórios da sua organização.

Para usar um modelo de fluxo de trabalho em um repositório, siga estas etapas:
- [x] Navegue até a guia Ações do repositório: vá para a guia Ações do GitHub do repositório onde deseja usar o modelo de fluxo de trabalho.
- [x] Selecione o modelo: clique no botão "Novo fluxo de trabalho" e você verá uma lista de modelos de fluxo de trabalho disponíveis. Encontre o modelo que deseja usar e clique no botão "Configurar este fluxo de trabalho".
- [x] Personalize o fluxo de trabalho: o conteúdo do modelo será copiado para um novo arquivo de fluxo de trabalho em seu repositório. Personalize o fluxo de trabalho conforme necessário, como fornecendo quaisquer valores de entrada necessários ou fazendo ajustes específicos do projeto.
- [x] Confirme o novo fluxo de trabalho: salve suas alterações e confirme o novo arquivo de fluxo de trabalho em seu repositório. O fluxo de trabalho agora será executado com base na configuração definida no modelo.

Ao usar modelos de fluxo de trabalho, você pode economizar tempo e esforço reutilizando fluxos de trabalho predefinidos nos repositórios da sua organização. Eles promovem consistência, manutenibilidade e melhores práticas, permitindo que você crie fluxos de trabalho do GitHub Actions mais eficientes e eficazes.

### Reusable Workflows
Os fluxos de trabalho reutilizáveis são outro recurso poderoso no GitHub Actions que permite que você reutilize fluxos de trabalho inteiros ou partes de fluxos de trabalho em um único repositório ou em vários repositórios.
Ao criar fluxos de trabalho reutilizáveis, você pode reduzir a duplicação, manter a consistência e garantir que as melhores práticas sejam seguidas em toda a sua organização.
Ao contrário dos modelos de fluxo de trabalho, que exigem que você copie o conteúdo do modelo em um novo arquivo de fluxo de trabalho, os fluxos de trabalho reutilizáveis são referenciados diretamente de outro fluxo de trabalho usando a palavra-chave uses. Isso significa que quaisquer atualizações no fluxo de trabalho reutilizável serão aplicadas automaticamente a todos os fluxos de trabalho que o referenciam.
Para criar um fluxo de trabalho reutilizável, siga estas etapas:

- [x] Defina o fluxo de trabalho reutilizável: no seu repositório, crie um novo arquivo de fluxo de trabalho do GitHub Actions (por exemplo, reusable-work-flow.yml) ou use um existente. Defina o fluxo de trabalho como de costume, especificando gatilhos, trabalhos e etapas. Se quiser tornar este fluxo de trabalho reutilizável, você pode adicionar o gatilho workflow_call à seção on:

```
on:
  workflow_call:
      inputs:
        input_name:
            description: 'Input description' required: true
            type: 'string'
```
Este exemplo define uma entrada chamada input_name. Quando outro fluxo de trabalho faz referência a esse fluxo de trabalho reutilizável, ele deve fornecer um valor para essa entrada.

- [x] Confirme e envie suas alterações: confirme e envie as alterações para seu repositório. O novo fluxo de trabalho reutilizável agora estará disponível para uso em seu próprio repositório ou em outros repositórios.

Para usar um fluxo de trabalho reutilizável em outro fluxo de trabalho, siga estas etapas:

- [x] Crie ou edite um arquivo de fluxo de trabalho: em seu repositório, crie um novo arquivo de fluxo de trabalho (por exemplo, main.yml ) ou edite um existente.
- [x] Faça referência ao fluxo de trabalho reutilizável: no arquivo de fluxo de trabalho, adicione um novo trabalho que faça referência ao fluxo de trabalho reutilizável usando a palavra-chave uses. Forneça quaisquer valores de entrada necessários usando a palavra-chave with :

```
jobs: my_job:
uses: organization/repository/.github/workflows/reusable-work- flow.yml@branch
with:
input_name: 'My Input Value'
```
Substitua organização, repositório e branch pelos valores apropriados para seu cenário. O trabalho agora executará as etapas definidas no fluxo de trabalho reutilizável.

- [x] Confirme e envie suas alterações: confirme e envie as alterações para seu repositório. O fluxo de trabalho agora será executado usando a configuração do fluxo de trabalho reutilizável.

Ao usar fluxos de trabalho reutilizáveis, você pode compartilhar fluxos de trabalho e seus componentes de forma eficiente entre repositórios, garantindo que atualizações e melhorias sejam propagadas automaticamente. Essa abordagem promove consistência, manutenibilidade e melhores práticas, permitindo que você crie fluxos de trabalho do GitHub Actions mais eficazes e eficientes.

### Handling Workflow Dependencies
Em projetos complexos, é comum ter vários fluxos de trabalho com dependências entre si. Gerenciar adequadamente essas dependências é crucial para garantir a execução eficiente e precisa dos seus fluxos de trabalho do GitHub Actions. Esta seção fornecerá uma visão geral de como identificar e lidar com dependências de fluxo de trabalho, incluindo o gerenciamento de dependências entre fluxos de trabalho, execução de trabalho sequencial e dinâmica, dependências de fluxo de trabalho entre repositórios e tratamento de falhas e erros em fluxos de trabalho dependentes. Ao entender esses conceitos, você poderá projetar fluxos de trabalho do GitHub Actions mais robustos e sustentáveis que abordem os desafios de dependências complexas em seus projetos.
#### Identifying Workflow Dependencies
Antes de gerenciar efetivamente as dependências do fluxo de trabalho, é essencial identificar os relacionamentos entre seus fluxos de trabalho. As dependências do fluxo de trabalho podem existir em diferentes níveis e em diferentes formas. Elas podem incluir dependências entre trabalhos dentro do mesmo fluxo de trabalho, entre fluxos de trabalho dentro do mesmo repositório ou até mesmo entre fluxos de trabalho em vários repositórios. Identificar essas dependências é o primeiro passo para gerenciá-las efetivamente.
Aqui estão algumas etapas para ajudar você a identificar as dependências do fluxo de trabalho:

- [x] Analise a estrutura e os requisitos do seu projeto: comece revisando a estrutura do seu projeto e entendendo seus requisitos. Determine quais tarefas precisam ser executadas em uma ordem específica, quais tarefas podem ser executadas em paralelo e quais tarefas são independentes umas das outras.
- [x] Revise seus fluxos de trabalho existentes: examine seus fluxos de trabalho do GitHub Actions existentes para identificar quaisquer dependências implícitas ou explícitas entre trabalhos e fluxos de trabalho. Procure instâncias em que um trabalho ou fluxo de trabalho depende da conclusão, sucesso ou falha de outro trabalho ou fluxo de trabalho. Essas dependências podem ser indicadas pelo uso de gatilhos, artefatos ou saídas específicos.
- [x] Mapeie dependências: crie uma representação visual das dependências entre seus fluxos de trabalho e trabalhos, como um fluxograma ou gráfico de dependência. Isso ajudará você a obter uma compreensão clara dos relacionamentos entre fluxos de trabalho e identificar quaisquer gargalos ou problemas potenciais em sua configuração atual.
- [x] Considere dependências externas: não se esqueça de levar em conta dependências externas, como serviços de terceiros, APIs ou outros recursos dos quais seus fluxos de trabalho dependem. Essas dependências também podem afetar a execução de seus fluxos de trabalho e precisam ser gerenciadas adequadamente.

Ao identificar cuidadosamente as dependências do fluxo de trabalho, você pode projetar fluxos de trabalho mais eficientes e robustos que levem em conta os vários relacionamentos entre trabalhos e fluxos de trabalho. Esse entendimento servirá como base para gerenciar dependências entre fluxos de trabalho, execução sequencial e dinâmica de trabalhos, dependências de fluxo de trabalho entre repositórios e lidar com falhas e erros em fluxos de trabalho dependentes.

### Managing Inter-Workflow Dependencies
Depois de identificar as dependências entre seus fluxos de trabalho, a próxima etapa é gerenciar essas dependências entre fluxos de trabalho de forma eficaz. Gerenciar dependências entre fluxos de trabalho envolve coordenar a execução de diferentes fluxos de trabalho, garantir que os fluxos de trabalho dependentes sejam acionados no momento apropriado e lidar com a troca de informações entre fluxos de trabalho.

Aqui estão algumas estratégias para ajudar você a gerenciar dependências entre fluxos de trabalho:
- [x] Use gatilhos e eventos: aproveite os gatilhos e eventos do GitHub Actions para coordenar a execução de fluxos de trabalho dependentes. Por exemplo, você pode usar o evento workflow_run para acionar um fluxo de trabalho quando outro fluxo de trabalho for concluído. Ao especificar o workflow_id ou o nome do fluxo de trabalho apropriado e a ramificação na qual o fluxo de trabalho de acionamento deve ser executado, você pode garantir que os fluxos de trabalho dependentes sejam executados na ordem correta.
- [x] Use artefatos de fluxo de trabalho: compartilhe dados entre fluxos de trabalho usando artefatos. Os artefatos podem armazenar arquivos, como saídas de compilação ou resultados intermediários, que podem ser consumidos por fluxos de trabalho posteriores. Carregue artefatos no fluxo de trabalho de produção usando a ação actions/upload-artifact e baixe-os no fluxo de trabalho de consumo usando a ação actions/download-artifact.
- [x] Alavancar saídas: Use saídas de fluxo de trabalho para passar informações entre fluxos de trabalho. No fluxo de trabalho de produção, defina saídas usando a palavra-chave outputs e defina seus valores usando o comando echo "::set-output name=<output_name>::<output_value>". No fluxo de trabalho de consumo, acesse as saídas usando a palavra-chave needs seguida pelo id do trabalho e o nome da saída, por exemplo, ${{ needs.<job_id>.outputs.<output_name> }} .
- [x] Lidar com falhas: Gerencie o comportamento de fluxos de trabalho dependentes em caso de falhas. Você pode usar a palavra-chave if em combinação com a palavra-chave needs para controlar a execução de trabalhos com base no sucesso ou falha de suas dependências. Além disso, você pode usar a palavra-chave continue-on-error para especificar se um trabalho deve continuar sendo executado mesmo se uma de suas etapas encontrar um erro.
- [x] Otimize a execução do fluxo de trabalho: equilibre a execução de fluxos de trabalho dependentes para otimizar o uso de recursos e minimizar o tempo de execução. Use paralelismo, condições de nível de trabalho e outras técnicas de otimização de desempenho para garantir que os fluxos de trabalho sejam executados de forma eficiente e somente quando necessário.

Ao empregar essas estratégias, você pode gerenciar efetivamente as dependências entre fluxos de trabalho na sua configuração do GitHub Actions. Isso ajudará você a criar fluxos de trabalho mais robustos, sustentáveis e eficientes que podem lidar com as complexidades dos requisitos do seu projeto.

### Sequential Job Execution
Em alguns cenários, você pode precisar impor a execução de trabalhos dentro de um fluxo de trabalho em uma ordem específica. A execução sequencial de trabalhos garante que um trabalho seja iniciado somente após o trabalho anterior ter sido concluído com sucesso. Isso pode ser particularmente útil quando a saída de um trabalho é necessária como entrada para outro ou quando a ordem de execução do trabalho é essencial para o funcionamento correto do aplicativo.

Veja como você pode implementar a execução sequencial de trabalhos em seus fluxos de trabalho do GitHub Actions:

- [x] Use a palavra-chave needs: A palavra-chave needs permite que você defina dependências entre trabalhos dentro de um fluxo de trabalho. Ao especificar o(s) trabalho(s) do(s) qual(is) outro trabalho depende, você pode garantir que o trabalho dependente seja executado somente após o(s) trabalho(s) necessário(s) ter(em) sido concluído(s) com sucesso. Por exemplo:
```
jobs:
job1:
runs-on: self-hosted steps:
- name: Execute task 1
run:...
job2:
needs: job1
runs-on: self-hosted
steps:
- name: Execute task 2
run: ...
```
Neste exemplo, job2 depende de job1, então job2 só começará a ser executado após job1 ter sido concluído com sucesso.

Encadeie vários jobs: Para fluxos de trabalho mais complexos que envolvam vários jobs sequenciais, simplesmente encadeie os jobs usando a palavra-chave needs. Isso cria uma ordem de execução linear na qual cada job começa somente após seu predecessor ter sido concluído com sucesso:

```
jobs: job1:
runs-on: self-hosted
steps:
- name: Execute task 1
run: ...

2.
job2:
needs: job1
runs-on: self-hosted
steps:
- name: Execute task 2
run: ...

job3:
needs: job2
runs-on: self-hosted
steps:
- name: Execute task 3
run: ...
```
Neste exemplo, job3 depende de job2, que por sua vez depende de job1. Como resultado, os jobs serão executados na ordem job1 -> job2 -> job3.

Ao usar a palavra-chave needs para definir dependências de job e impor a execução sequencial de job, você pode gerenciar efetivamente a ordem de execução de job dentro de seus fluxos de trabalho. Isso ajuda a garantir que seus fluxos de trabalho sejam executados corretamente e eficientemente, aderindo aos requisitos específicos do seu projeto.

#### Dynamic Job Execution
Em alguns casos, você pode querer ter mais controle sobre a execução de trabalhos dentro do seu fluxo de trabalho com base em condições dinâmicas, como a saída de um trabalho anterior ou o resultado de um script. A execução dinâmica de trabalhos permite que você execute trabalhos somente quando certas condições são atendidas, adicionando flexibilidade e adaptabilidade aos seus fluxos de trabalho.
Para implementar a execução dinâmica de trabalhos em seus fluxos de trabalho do GitHub Actions, você pode utilizar as seguintes estratégias:

- [x] Usar saídas de trabalho: as saídas de trabalho permitem que você armazene e passe dados entre trabalhos em um fluxo de trabalho. Ao usar a saída de um trabalho anterior como entrada para outro trabalho, você pode controlar a execução do trabalho com base no resultado do trabalho anterior. Por exemplo:

```
jobs:
  job1:
    runs-on: self-hosted
    steps:
       - name: Execute task 1
         id: task1
        run: echo "::set-output name=result::success"
outputs:
       result: ${{ steps.task1.outputs.result}}
job2:
  needs: job1
runs-on: self-hosted
if: ${{ needs.job1.outputs.result == 'success' }}
  steps:
    - name: Execute task 2
      run: ...
```

Neste exemplo, job2 depende de job1, e job2 só começará a ser executado se o resultado de saída de job1 for definido como 'success'.

- [x] Aproveite a execução condicional: você pode usar a palavra-chave if para executar jobs com base em condições dinâmicas. Ao combinar isso com saídas de job, variáveis ​​de ambiente ou dados de contexto, você pode criar cenários de execução complexos que se adaptam melhor aos requisitos do seu projeto:

```
jobs:
  job1:
    runs-on: self-hosted
steps:
- name: Execute task 1
run: ...
job2:
runs-on: self-hosted
run: echo "::set-output name=result::success"
if: ${{ github.event_name == 'push' && github.ref == 'refs/heads/main' }}
steps:
- name: Execute task 2
run: ...
```
Neste exemplo, o job2 será executado somente se o evento que disparou o fluxo de trabalho for um push para o branch 'main'.

A execução dinâmica de trabalho fornece a flexibilidade para adaptar seus fluxos de trabalho a vários cenários, melhorando sua eficiência e eficácia. Ao usar saídas de trabalho e execução condicional, você pode criar fluxos de trabalho dinâmicos que são mais adequados aos requisitos exclusivos do seu projeto.

#### Cross-Repository Workflow Dependencies
Em alguns casos, você pode ter vários repositórios com fluxos de trabalho que dependem uns dos outros. Gerenciar dependências entre repositórios pode ser desafiador, mas o GitHub Actions fornece ferramentas e técnicas para lidar eficientemente com dependências de fluxo de trabalho entre repositórios.
Para gerenciar dependências de fluxo de trabalho entre repositórios, você pode usar as seguintes abordagens:

- [x] Eventos de despacho de repositório: você pode usar o Evento de despacho de repositório para acionar um fluxo de trabalho em outro repositório enviando um evento de webhook. Este método permite acionar fluxos de trabalho em diferentes repositórios com base no resultado ou eventos no repositório de origem.

Para configurar um Evento de despacho de repositório, siga estas etapas:

- [x] Crie um fluxo de trabalho no repositório de destino que escute o evento repository_dispatch:
```
name: Target Repository Workflow
on:
repository_dispatch:
types: [custom_event]
jobs:
handle_dispatch:
runs-on: self-hosted
steps:
- name: Execute task
run: ...
```
- [x] No repositório de origem, use um comando curl em seu fluxo de trabalho para enviar o evento webhook para o repositório de destino:
```
steps:
- name: Trigger target repository workflow
run: |
curl -XPOST \
-H "Authorization: token ${{ secrets.TARGET_REPO_TOKEN }}" \ -H "Accept: application/vnd.github.everest-preview+json" \ "https://api.github.com/repos/OWNER/TARGET_REPO/dispatches"\
-d '{"event_type": "custom_event"}"
```

Certifique-se de substituir OWNER, TARGET_REPO e TARGET_REPO_TOKEN pelos valores apropriados. O TARGET_REPO_TOKEN deve ser um token de acesso pessoal ou um token de instalação do GitHub App com o escopo do repositório e armazenado como um segredo no repositório de origem.

Usando o evento workflow_run: Este evento permite que você acione um fluxo de trabalho no mesmo repositório com base na conclusão de outro fluxo de trabalho. Embora ele não suporte diretamente dependências entre repositórios, você pode usá-lo em combinação com o Repository Dispatch Event para gerenciar dependências entre repositórios.

Primeiro, configure um evento de execução de fluxo de trabalho em seu repositório de origem para acionar um Repository Dispatch Event quando o fluxo de trabalho for concluído:

```
name: Source Repository Workflow
on:
workflow_run:
workflows: ["Another Workflow"]
types:
jobs:
- completed
trigger_target_repo:
runs-on: self-hosted
steps:
- name: Trigger target repository workflow
run: ...
# Add the curl command from the previous example to
# send the webhook event
```

Ao aproveitar essas técnicas, você pode gerenciar dependências de fluxo de trabalho entre repositórios e garantir que seus fluxos de trabalho sejam executados na sequência desejada em diferentes repositórios.

### Handling Failures and Errors in Dependent Workflows
Ao trabalhar com fluxos de trabalho dependentes, é crucial lidar com falhas e erros graciosamente para manter a estabilidade e a confiabilidade do seu pipeline de CI/CD. Ao gerenciar erros de forma eficaz, você pode evitar que uma única falha cause problemas em cascata em todo o seu sistema.
Nesta seção, discutiremos várias estratégias para lidar com falhas e erros em fluxos de trabalho dependentes:

- [x] Usando condições if: você pode usar instruções condicionais em seu fluxo de trabalho para determinar se um trabalho ou etapa deve ser executado com base no resultado de um trabalho ou etapa anterior. Por exemplo, você pode usar a palavra-chave needs para especificar dependências de trabalho e, em seguida, usar uma condição if para verificar o status do trabalho necessário:
```
jobs:
job1:
runs-on: self-hosted
steps:
- name: Execute task
run: ...
job2:
needs: job1
runs-on: self-hosted
if: success()
steps:
- name: Execute task
run:...
```

Neste exemplo, job2 será executado somente se job1 for bem-sucedido.

- [x] Implementando novas tentativas: Em alguns casos, erros transitórios podem fazer com que um trabalho ou etapa falhe. Para lidar com essas situações, você pode implementar novas tentativas para dar ao seu fluxo de trabalho chances adicionais de sucesso. Você pode usar a palavra-chave retry em combinação com uma ação personalizada ou uma ação de terceiros como action-retry para tentar novamente uma etapa ou trabalho:
```
steps:
- name: Execute task with retries
uses: nick-invision/retry@v2
with:
max_attempts: 3
delay_seconds: 10
command: your-command-here
```

- [x] Tratamento de erros com continue-on-error: para evitar que uma única etapa com falha cause falha em todo o trabalho, você pode usar a palavra-chave continue-on-error para permitir que o fluxo de trabalho continue mesmo se uma etapa específica encontrar um erro:

```
steps:
- name: Execute task
run: ...
continue-on-error: true
```

- [x] Notificações e monitoramento: acompanhe falhas e erros de fluxo de trabalho configurando notificações e monitoramento. Você pode usar recursos internos do GitHub, como notificações por e-mail, ou integrar ferramentas e serviços de terceiros, como Slack ou PagerDuty, para receber alertas quando seus fluxos de trabalho encontrarem problemas.

Ao incorporar essas técnicas de tratamento de erros em seus fluxos de trabalho dependentes, você pode criar pipelines de CI/CD mais robustos e resilientes que podem lidar com falhas com elegância e manter a integridade geral de seus projetos.

Concluindo, lidar com dependências de fluxo de trabalho de forma eficaz é essencial para manter um pipeline de CI/CD confiável e eficiente. Ao identificar e gerenciar dependências entre fluxos de trabalho, implementar execução de tarefas sequencial e dinâmica e lidar com dependências entre repositórios, você pode criar um pipeline mais robusto e simplificado. Além disso, lidar com falhas e erros usando instruções condicionais, novas tentativas, tratamento de erros com continue-on-error e notificações e monitoramento adequados ajudarão a garantir que seu pipeline permaneça resiliente diante de problemas. À medida que você continua a refinar seus fluxos de trabalho do GitHub Actions, tenha essas técnicas e práticas recomendadas em mente para otimizar seu gerenciamento de dependências e melhorar o desempenho geral do seu processo de desenvolvimento.

#### Automating Project Management and Collaboration
Automatizar tarefas de colaboração e gerenciamento de projetos pode melhorar significativamente a eficiência do seu processo de desenvolvimento e ajudar sua equipe a manter o foco na entrega de código de alta qualidade. O GitHub Actions fornece uma plataforma flexível para criar fluxos de trabalho personalizados para automatizar vários aspectos dos seus esforços de colaboração e gerenciamento de projetos.

Nesta seção, discutiremos vários exemplos de como você pode aproveitar o GitHub Actions para automatizar tarefas de colaboração e gerenciamento de projetos.

#### Automating Issue and Pull Request Management
Problemas e solicitações de pull são o cerne dos recursos colaborativos do GitHub, permitindo que os membros da equipe relatem bugs, sugiram melhorias e enviem alterações de código. Ao automatizar o gerenciamento deles com o GitHub Actions, você pode economizar tempo, melhorar a organização e garantir a consistência em seu projeto.
Aqui estão alguns aspectos importantes da automação do gerenciamento de problemas e solicitações de pull com o GitHub Actions:

- [x] Rotulagem: aplique rótulos automaticamente a novos problemas e solicitações de pull com base em critérios predefinidos. Por exemplo, você pode rotular problemas como "bug" ou "aprimoramento" com base em sua descrição ou usar rótulos específicos para solicitações de pull visando ramificações específicas. Isso ajuda a categorizar e priorizar tarefas em seu projeto.
- [x] Atribuição: atribua problemas e solicitações de pull a membros ou grupos específicos da equipe com base em regras predefinidas. Isso garante que a pessoa certa seja responsável por abordar cada tarefa e ajuda a distribuir a carga de trabalho uniformemente em sua equipe.
- [x] Triagem: mova automaticamente problemas e solicitações de pull por diferentes estágios do seu processo de desenvolvimento. Por exemplo, você pode criar um fluxo de trabalho que mova automaticamente uma solicitação de pull para um estágio de "revisão" quando estiver pronta para revisão e, em seguida, para um estágio de "teste" quando for aprovada.
- [x] Notificações: envie notificações personalizadas para membros da equipe, canais do Slack ou endereços de e-mail quando eventos específicos ocorrerem. Isso pode ajudar a manter sua equipe informada sobre o progresso de problemas e solicitações de pull e garantir que todos estejam na mesma página.
- [x] Verificações automatizadas: implemente verificações e validações automatizadas para solicitações de pull para garantir que atendam a certos padrões de qualidade antes de poderem ser mescladas. Por exemplo, você pode impor que todas as solicitações de pull passem pelo seu pipeline de CI ou atendam a limites específicos de cobertura de código.
- [x] Mesclagem: automatize o processo de mesclagem de solicitações de pull assim que atenderem a certos critérios, como passar em todas as verificações necessárias ou receber um número específico de aprovações. Isso pode ajudar a otimizar seu processo de desenvolvimento e garantir que as alterações de código sejam mescladas de forma rápida e consistente.

Para começar a automatizar o gerenciamento de problemas e solicitações de pull, explore as GitHub Actions disponíveis no mercado que são projetadas para essas finalidades. Você também pode criar fluxos de trabalho personalizados adaptados às necessidades específicas do seu projeto. Ao implementar a automação no gerenciamento de problemas e solicitações de pull, você poderá se concentrar mais no trabalho de desenvolvimento real e manter um ambiente de projeto mais organizado, eficiente e colaborativo.

### Integrating GitHub Actions with Project Boards
Os GitHub Project Boards fornecem uma representação visual do progresso do seu projeto, permitindo que você gerencie tarefas, priorize o trabalho e acompanhe marcos. Integrar o GitHub Actions com os Project Boards pode agilizar o gerenciamento do seu projeto e ajudar você a manter uma visão atualizada do status do seu projeto.

Aqui estão alguns aspectos importantes da integração do GitHub Actions com os Project Boards:

- [x] Criação automática de cartões: crie cartões automaticamente no seu Project Board quando novos problemas ou solicitações de pull forem abertos. Isso garante que todas as tarefas sejam rastreadas em um local centralizado e permite que os membros da equipe tenham uma visão geral do trabalho que precisa ser feito.
- [x] Movimentação de cartões: automatize a movimentação de cartões entre diferentes colunas no seu Project Board com base em gatilhos ou eventos específicos. Por exemplo, quando uma solicitação de pull é aprovada, você pode mover automaticamente seu cartão correspondente para uma coluna "Pronto para mesclagem". Isso ajuda a manter uma representação precisa do progresso do seu projeto e minimiza o trabalho manual para sua equipe.
- [x] Atribuição de cartão: atribua cartões aos membros da equipe automaticamente com base em regras ou condições predefinidas. Isso pode ajudar a distribuir a carga de trabalho de forma mais uniforme e garantir que a pessoa certa seja responsável por cada tarefa.

- [x] Atualizando detalhes do cartão: atualize automaticamente os detalhes do cartão, como rótulos, responsáveis ​​ou datas de vencimento, com base em alterações no problema associado ou solicitação de pull. Isso mantém seu quadro de projeto atualizado e garante que todas as informações relevantes sejam facilmente acessíveis.
- [x] Notificações do quadro de projeto: envie notificações personalizadas para sua equipe quando eventos específicos ocorrerem em seu quadro de projeto, como quando um cartão for movido para uma coluna diferente ou quando uma data de vencimento estiver se aproximando. Isso pode ajudar a manter sua equipe informada e garantir que todos estejam cientes de atualizações ou prazos importantes.

Para integrar o GitHub Actions com seus quadros de projeto, você precisará criar fluxos de trabalho personalizados que interajam com a API do GitHub para executar ações relacionadas aos quadros de projeto. Explore as ações disponíveis no GitHub Actions Marketplace para gerenciar quadros de projeto ou crie suas próprias ações personalizadas adaptadas às necessidades do seu projeto.

Ao integrar o GitHub Actions com seus painéis de projeto, você pode automatizar e otimizar seus processos de gerenciamento de projetos, resultando em maior eficiência e melhor colaboração entre os membros da equipe.

### Collaborating with External Teams and Services
Em muitos projetos de software, a colaboração se estende além da sua equipe imediata para incluir equipes externas ou serviços de terceiros. Integrar o GitHub Actions com esses recursos externos pode facilitar a colaboração perfeita, agilizar a comunicação e garantir que todas as partes permaneçam informadas e sincronizadas.
Aqui estão alguns aspectos importantes da colaboração com equipes e serviços externos usando o GitHub Actions:

- [x] Interação com repositórios externos: configure fluxos de trabalho que interagem com repositórios externos, como criar solicitações de pull, abrir problemas ou atualizar código em um repositório bifurcado. Isso pode ser particularmente útil ao trabalhar com projetos de código aberto ou colaborar com outras organizações em iniciativas compartilhadas.
- [x] Integração de serviços de terceiros: integre o GitHub Actions com serviços populares de terceiros, como Jira, Trello, Slack ou Microsoft Teams para automatizar várias tarefas de gerenciamento de projetos, comunicação e colaboração. Por exemplo, você pode criar um fluxo de trabalho que publique uma mensagem em um canal específico do Slack quando uma nova solicitação de pull for aberta ou sincronizar problemas do GitHub com tíquetes do Jira.
- [x] Fluxos de trabalho e ações compartilhados: compartilhe fluxos de trabalho e ações em vários repositórios ou organizações. Isso permite que você estabeleça as melhores práticas e mantenha a consistência em seus projetos. Você também pode aproveitar o recurso de fluxos de trabalho reutilizáveis ​​do GitHub para minimizar a duplicação de esforços e agilizar o processo de configuração para novos projetos.
- [x] Controle de acesso e permissões: configure controles de acesso e permissões para seus fluxos de trabalho do GitHub Actions para garantir que apenas usuários autorizados possam executar ações específicas ou acessar informações confidenciais. Isso é particularmente importante ao trabalhar com colaboradores externos, pois ajuda a manter a segurança e a integridade de sua base de código.
- [x] Colaboração em ações personalizadas: incentive a colaboração no desenvolvimento de ações personalizadas do GitHub, disponibilizando o código-fonte em um repositório público. Isso permite que colaboradores externos enviem melhorias, relatem problemas ou sugiram novos recursos, promovendo uma abordagem orientada pela comunidade para o desenvolvimento de ações.

Para colaborar com sucesso com equipes e serviços externos usando o GitHub Actions, é essencial planejar e implementar fluxos de trabalho, controles de acesso e integrações apropriados. Isso permitirá que sua equipe trabalhe de forma eficiente com colaboradores externos, aproveite o poder de serviços de terceiros e mantenha a segurança e a integridade de seus projetos.

### Automating Code Review and Feedback
Automatizar os processos de revisão e feedback de código usando o GitHub Actions pode melhorar significativamente a qualidade geral da sua base de código e agilizar a colaboração entre os membros da equipe. Ao incorporar verificações e revisões automatizadas, você pode garantir que seu projeto esteja de acordo com os padrões de codificação estabelecidos e as melhores práticas, minimizando erros humanos e supervisão.
Aqui estão alguns aspectos importantes da automação da revisão e feedback de código usando o GitHub Actions:

- [x] Linting e análise de código estático: integre linters e ferramentas de análise de código estático em seus fluxos de trabalho para verificar automaticamente erros de sintaxe, violações de estilo de código e outros problemas. Essas ferramentas podem fornecer feedback imediato sobre solicitações de pull, garantindo que sua base de código permaneça limpa e sustentável. Ferramentas populares incluem ESLint para JavaScript, Pylint para Python e RuboCop para Ruby.
- [x] Testes automatizados: configure seus fluxos de trabalho para executar testes automatizados em cada solicitação de pull ou confirmação. Isso ajuda a identificar problemas potenciais no início do processo de desenvolvimento e garante que novas alterações não introduzam regressões. Você também pode usar o GitHub Actions para executar testes em paralelo ou em vários ambientes, aumentando ainda mais a confiabilidade e a robustez da sua base de código.
- [x] Automação de revisão de código: use o GitHub Actions para automatizar vários aspectos do processo de revisão de código, como atribuir revisores automaticamente, impor políticas de revisão ou verificar a conformidade com diretrizes específicas. Isso pode ajudar a agilizar o processo de revisão e garantir que todas as alterações de código sejam cuidadosamente verificadas antes de serem mescladas ao branch principal.
- [x] Feedback automatizado: integre o GitHub Actions com plataformas de comunicação como Slack ou Microsoft Teams para fornecer feedback em tempo real sobre alterações de código. Por exemplo, você pode criar um fluxo de trabalho que envie uma mensagem para um canal específico sempre que uma nova solicitação de pull for aberta ou quando os testes automatizados falharem. Isso ajuda a manter sua equipe informada e incentiva ações rápidas sobre problemas.
- [x] Verificações de desempenho e segurança: use o GitHub Actions para analisar automaticamente seu código em busca de gargalos de desempenho, vulnerabilidades de segurança e outros problemas potenciais. Ferramentas como SonarQube ou Snyk podem ajudar você a identificar e abordar essas preocupações no início do processo de desenvolvimento, garantindo que seu código permaneça seguro e com desempenho.

Ao automatizar os processos de revisão e feedback de código usando GitHub Actions, você pode estabelecer um ambiente de colaboração mais eficiente e eficaz para sua equipe. Isso, por sua vez, leva a um código de maior qualidade, menos defeitos e ciclos de desenvolvimento mais rápidos, resultando, em última análise, em um projeto de software mais bem-sucedido e robusto.

### Streamlining Documentation and Knowledge Management
Documentação eficaz e gerenciamento de conhecimento são essenciais para o sucesso de qualquer projeto de software. Eles garantem que todos os membros da equipe tenham acesso às informações necessárias para entender, contribuir e manter a base de código. O GitHub Actions pode ajudar a automatizar e agilizar vários aspectos da documentação e do gerenciamento de conhecimento, facilitando para sua equipe se manter informada e atualizada.
Aqui estão algumas estratégias importantes para agilizar a documentação e o gerenciamento de conhecimento usando o GitHub Actions:

- [x] Geração automatizada de documentação: use o GitHub Actions para gerar e atualizar automaticamente a documentação do projeto com base em comentários de código, arquivos markdown ou outras fontes. Ferramentas como JSDoc, Sphinx e Jekyll podem ajudar você a criar documentação abrangente e bem estruturada com o mínimo de esforço.

Ao integrar essas ferramentas ao seu fluxo de trabalho, você pode garantir que sua documentação permaneça atualizada e precisa conforme sua base de código evolui.

- [x] Linting e validação de documentação: valide sua documentação quanto à sintaxe, estrutura e consistência usando o GitHub Actions. Ferramentas como markdownlint, textlint ou linters reStructuredText podem ajudar você a impor padrões de documentação e melhores práticas. Ao verificar automaticamente a documentação em solicitações de pull ou confirmações, você pode manter uma documentação de alta qualidade que seja fácil de entender e navegar.

- [x] Atualizações automatizadas da base de conhecimento: integre o GitHub Actions ao seu sistema de gerenciamento de conhecimento ou wiki para atualizar automaticamente a documentação e outros recursos quando alterações forem feitas na sua base de código. Por exemplo, você pode criar um fluxo de trabalho que atualize uma página do Confluence ou um GitHub Wiki sempre que um novo recurso for adicionado ou um recurso existente for modificado. Isso garante que sua equipe sempre tenha acesso às informações mais atualizadas.

- [x] Rastreamento e notificação de alterações: use o GitHub Actions para monitorar alterações na documentação e outros recursos de conhecimento e notificar os membros da equipe sobre atualizações relevantes. Isso pode ajudar a manter sua equipe informada sobre mudanças importantes e incentivar a colaboração e o compartilhamento de conhecimento. Integrar o GitHub Actions a plataformas de comunicação como Slack ou Microsoft Teams pode facilitar notificações e discussões em tempo real sobre atualizações de documentação.
- [ ] Automatizando notas de lançamento: gere e publique notas de lançamento automaticamente usando GitHub Actions. Ao extrair informações relevantes de mensagens de confirmação, solicitações de pull e atualizações do rastreador de problemas, você pode criar notas de lançamento detalhadas e precisas que ajudam os usuários a entender as alterações e melhorias em cada nova versão do seu software.

Ao aproveitar o GitHub Actions para automatizar e agilizar os processos de documentação e gerenciamento de conhecimento, você pode promover um ambiente de desenvolvimento mais informado e colaborativo. Isso leva a uma melhor tomada de decisão, fluxos de trabalho mais eficientes e, finalmente, um projeto de software mais bem-sucedido e sustentável.

### Best Practices for Collaborative Workflows Using GitHub Actions
O GitHub Actions pode desempenhar um papel crucial no aprimoramento da colaboração e comunicação dentro das equipes de desenvolvimento. Para aproveitar ao máximo o GitHub Actions para gerenciamento de projetos e colaboração, considere as seguintes práticas recomendadas:

- [x] Escolha as ações certas: avalie cuidadosamente as ações disponíveis no GitHub Actions Marketplace ou crie suas próprias ações personalizadas para atender às suas necessidades específicas de gerenciamento de projetos e colaboração. Selecione ações que sejam bem mantidas, amplamente utilizadas e tenham uma forte reputação na comunidade.
- [x] Use convenções de nomenclatura descritivas: dê aos seus fluxos de trabalho e ações nomes descritivos que indiquem claramente sua finalidade. Isso torna mais fácil para os membros da equipe entenderem a função de cada ação e como ela contribui para o processo geral de gerenciamento de projetos e colaboração.
- [x] Mantenha os fluxos de trabalho simples e focados: projete seus fluxos de trabalho para serem simples e focados em tarefas específicas. Evite criar fluxos de trabalho complexos que tentam atingir vários objetivos de uma vez. Em vez disso, divida-os em partes menores e mais gerenciáveis ​​que podem ser facilmente compreendidas e mantidas.
- [x] Documente seus fluxos de trabalho: documente claramente seus fluxos de trabalho, incluindo o propósito de cada ação, as entradas e saídas esperadas e quaisquer dependências ou serviços externos envolvidos. Isso ajuda a garantir que os membros da sua equipe entendam como os fluxos de trabalho funcionam e possam contribuir mais facilmente para seu desenvolvimento e manutenção.
- [x] Aproveite contextos e expressões: use contextos e expressões para tornar seus fluxos de trabalho mais dinâmicos e flexíveis. Isso permite que você adapte seus fluxos de trabalho a diferentes cenários e condições, como executar ações específicas apenas para determinados ramos, eventos ou ambientes.
- [x] Monitore e melhore seus fluxos de trabalho: revise regularmente seus fluxos de trabalho para identificar possíveis melhorias e otimizações. Isso inclui monitorar o desempenho, rastrear erros e falhas e analisar padrões de uso. Ao iterar continuamente em seus fluxos de trabalho, você pode aumentar sua eficácia e dar melhor suporte aos esforços de colaboração de sua equipe.

- [x] Comunicar alterações no fluxo de trabalho: mantenha sua equipe informada sobre alterações nos fluxos de trabalho, incluindo novas ações, atualizações em ações existentes e quaisquer modificações na estrutura ou comportamento do fluxo de trabalho. Isso ajuda a manter a transparência e incentiva a colaboração e a contribuição de todos os membros da equipe.
- [x] Estabelecer práticas recomendadas e diretrizes: desenvolva e aplique práticas recomendadas e diretrizes para usar o GitHub Actions em sua organização. Isso pode incluir orientação sobre como criar ações personalizadas, integrar com serviços externos e gerenciar segredos e variáveis ​​de ambiente. Ao estabelecer expectativas e padrões claros, você pode garantir que seus fluxos de trabalho permaneçam consistentes, seguros e eficazes.

Ao implementar essas práticas recomendadas, você pode maximizar os benefícios do GitHub Actions para gerenciamento de projetos e colaboração. Isso ajudará a criar um ambiente de desenvolvimento mais eficiente, transparente e coeso que ofereça suporte às metas e objetivos de sua equipe.

Concluindo, automatizar o gerenciamento de projetos e a colaboração usando o GitHub Actions pode aumentar significativamente a eficiência, a transparência e a comunicação dentro das equipes de desenvolvimento. Ao aproveitar o poder do GitHub Actions, você pode automatizar várias tarefas, como gerenciamento de problemas e solicitações de pull, integração do quadro de projetos, colaboração com equipes e serviços externos, revisão e feedback de código e gerenciamento de documentação.

Para garantir que seus fluxos de trabalho do GitHub Actions sejam eficazes e bem mantidos, é crucial seguir as práticas recomendadas, incluindo escolher as ações certas, usar convenções de nomenclatura descritivas, manter os fluxos de trabalho simples e focados, documentar fluxos de trabalho, aproveitar contextos e expressões, monitorar e melhorar seus fluxos de trabalho, comunicar alterações no fluxo de trabalho e estabelecer diretrizes e padrões para sua organização.
Ao investir tempo e esforço na otimização de seus fluxos de trabalho de gerenciamento de projetos e colaboração, você criará um ambiente de desenvolvimento mais produtivo e harmonioso, capacitando sua equipe a atingir suas metas e objetivos de forma mais eficiente.

Este capítulo aprofundou-se nos aspectos mais complexos do GitHub Actions, fornecendo insights e estratégias valiosos para ajudar você a aproveitar ao máximo esta poderosa plataforma de automação. Exploramos modelos de fluxo de trabalho e fluxos de trabalho reutilizáveis, lidando com dependências de fluxo de trabalho e automatizando tarefas de gerenciamento de projetos e colaboração.

Entender e implementar essas técnicas avançadas permitirá que você e sua equipe criem fluxos de trabalho mais eficientes, escaláveis ​​e sustentáveis, aproveitando todo o potencial do GitHub Actions. Conforme você continua aprendendo e experimentando o GitHub Actions, lembre-se de se manter atualizado com os últimos desenvolvimentos e melhores práticas para garantir que seus fluxos de trabalho permaneçam de ponta e eficazes para levar seus projetos ao sucesso.

## Conclusion
Bem-vindo ao capítulo final de "GitHub Actions Essentials". Neste capítulo final, vamos refletir sobre os principais conceitos, estratégias e técnicas abordados ao longo do livro. Nossa jornada começou com uma sólida compreensão dos fundamentos do GitHub Actions e nos aprofundamos progressivamente em tópicos mais avançados, capacitando você a criar fluxos de trabalho eficientes, poderosos e sustentáveis ​para seus projetos.

Ao concluirmos nossa exploração do GitHub Actions, revisitaremos os temas principais e forneceremos insights sobre como você pode continuar a desenvolver sua expertise nesta área. Nosso objetivo é garantir que você saia deste livro com a confiança e o conhecimento necessários para aproveitar todo o potencial do GitHub Actions, permitindo que você automatize tarefas, otimize fluxos de trabalho e simplifique a colaboração dentro de suas equipes de desenvolvimento.

## Recap of Key Concepts
Nesta seção, recapitularemos brevemente os principais conceitos e técnicas que abordamos em "GitHub Actions Essentials", resumindo os elementos essenciais que você precisa dominar para aproveitar ao máximo o GitHub Actions para seus projetos.

- [x] Introdução ao GitHub Actions: começamos com uma visão geral do GitHub Actions, seus benefícios e seu papel na automação de fluxos de trabalho de desenvolvimento de software.
- [x] Introdução ao GitHub Actions: discutimos os conceitos básicos do GitHub Actions, incluindo fluxos de trabalho, sintaxe YAML e configuração do seu primeiro fluxo de trabalho.
- [x] Construindo seu primeiro fluxo de trabalho: mergulhamos no processo de criação de fluxos de trabalho, com foco em gatilhos, definição de trabalhos e etapas e uso de ações pré-construídas.
- [x] Gerenciando a execução do fluxo de trabalho: examinamos as melhores práticas para gerenciar fluxos de trabalho, abrangendo variáveis ​​de ambiente e segredos, condições de nível de trabalho e etapa e compilações de matriz.
- [x] Criando ações personalizadas do GitHub: exploramos o processo de criação de ações personalizadas, comparando ações baseadas em Docker e JavaScript e aprendendo como publicá-las.
- [ ] Aproveitando o GitHub Actions Marketplace: discutimos a descoberta, avaliação e integração de ações populares e serviços de terceiros do marketplace.
- [x] Implementando integração contínua com GitHub Actions: examinamos como incorporar testes automatizados, verificações de qualidade de código, linting e relatórios de cobertura de código em seus fluxos de trabalho.
- [x] Implementando implantação contínua com GitHub Actions: analisamos como configurar e automatizar o processo de implantação usando GitHub Actions, incluindo estratégias de implantação, ambientes e mecanismos de reversão.
- [x] Protegendo e otimizando seus fluxos de trabalho do GitHub Actions: nos aprofundamos nas práticas recomendadas de segurança de fluxo de trabalho, cache, gerenciamento de artefatos e técnicas de otimização de desempenho.
- [x] Técnicas avançadas do GitHub Actions: Abordamos tópicos avançados, como modelos de fluxo de trabalho, fluxos de trabalho reutilizáveis, tratamento de dependências de fluxo de trabalho e automação de tarefas de colaboração e gerenciamento de projetos.

Ao entender e implementar esses conceitos-chave, você estará bem equipado para criar, gerenciar e otimizar fluxos de trabalho poderosos do GitHub Actions que ajudarão a conduzir seus projetos de desenvolvimento de software ao sucesso.

### Further Resources and Learning
À medida que você continua a explorar e usar o GitHub Actions, é essencial se manter atualizado sobre os últimos desenvolvimentos, melhores práticas e novos recursos. Esta seção fornece uma lista de recursos que podem ajudar você a se manter informado e a aprofundar seu aprendizado:

- [x] Documentação do GitHub Actions: A documentação oficial do Git-Hub Actions é um recurso inestimável, fornecendo informações detalhadas, exemplos e diretrizes sobre como usar o GitHub Actions de forma eficaz. Acesse aqui: _https:// docs.github.com/en/actions
- [x] GitHub Actions Marketplace: visite o GitHub Actions Marketplace regularmente para descobrir ações, ferramentas e integrações novas e atualizadas que podem ajudar a otimizar seus fluxos de trabalho: https://github.com/marketplace?type=actions
- [ ] GitHub Blog: mantenha-se atualizado com os últimos recursos, melhorias e práticas recomendadas do GitHub Actions seguindo o blog oficial do GitHub: https://github.blog/
- [x] GitHub Actions Community Forum: junte-se ao fórum da comunidade do GitHub Actions para fazer perguntas, compartilhar conhecimento e aprender com outros usuários e especialistas: _https://github.community/c/code-to-cloud/github-actions/
- [x] Cursos e tutoriais online: há vários cursos e tutoriais online disponíveis em plataformas como Udemy, Coursera, YouTube e blogs que abordam o GitHub Actions com mais detalhes. Algumas opções populares incluem:
"Automating Your Workflow with GitHub Actions" por GitHub Training & Guides no YouTube:_https:// www.youtube.com/playlist?
list=PLg7s6cbtAD15G8lNyoaYDuKZSKyJrgwB-
"GitHub Actions: Automatize Your Workflow" por Sam Julien no Pluralsight:_https://www.pluralsight.com/
courses/github-actions-automate-workflow
- [x] Siga o GitHub nas mídias sociais: fique por dentro das últimas notícias e atualizações seguindo o GitHub no Twitter, LinkedIn e Facebook.

Ao se envolver ativamente com esses recursos, você ficará informado sobre novos desenvolvimentos no GitHub Actions, expandirá seu conhecimento e garantirá que continuará aproveitando ao máximo essa ferramenta poderosa em seus projetos de desenvolvimento de software.

Ao concluirmos nossa jornada pelo "GitHub Actions Essentials", esperamos que agora você tenha uma sólida compreensão do GitHub Actions, seus recursos e como ele pode revolucionar seus fluxos de trabalho de desenvolvimento de software. Desde automatizar tarefas repetitivas, garantir a qualidade do código e implementar integração e implantação contínuas até colaborar efetivamente com sua equipe, o GitHub Actions abre um mundo de possibilidades.

O conhecimento e as habilidades que você adquiriu ao longo deste livro ajudarão você a desenvolver fluxos de trabalho mais eficientes, confiáveis e seguros, permitindo que você e sua equipe se concentrem na construção de software de alta qualidade. À medida que você coloca esses conceitos em prática, continua aprendendo e se adapta a novos avanços no ecossistema do GitHub Actions, você estará bem equipado para enfrentar quaisquer desafios que surgirem.

Lembre-se, a chave para o sucesso com o GitHub Actions é a melhoria contínua e se manter informado sobre os últimos desenvolvimentos. Abrace o poder da automação e deixe o GitHub Actions ser seu companheiro de confiança em sua jornada de desenvolvimento de software. Boa sorte e boa codificação!

### GitHub Actions Secrets: Security Best Practices
Os segredos podem ser configurados no nível da empresa, organização, repositório ou ambiente, permitindo que você armazene informações confidenciais no GitHub.
Para ajudar a evitar vazamentos acidentais, de fato, o GitHub remove quaisquer segredos que aparecem nos logs de execução e substitui seus valores por asteriscos ( ***).

- [x] Do not use structure data; (Evite usar um blob de JSON, XML, YAML ou similar como valor secreto)
- [x] Register all Secrects ... Secrets
- [x] Audit the Secrets Handling (Auditar como os segredos são tratados)
- [x] Use minimally Scoped credencials (Privilégio mínimo - e não apenas para os segredos do GitHub Actions, usar credenciais com escopo mínimo
- [x] Audit and Rotate Secrets
- [X] Review for access to secrets

### Appendix A: GitHub Actions
#### YAML Reference
This appendix provides a reference for commonly used YAML elements in GitHub Actions workflows. You can use this reference as a quick guide when building and managing your GitHub Actions workflows.
#### Workflow Syntax
A GitHub Actions workflow file is written in YAML and must be placed in the .github/workflows directory of your repository. The file should have a .yml or yaml extension.
#### Workflow Elements
name: Defines the display name of the workflow.
on: Specifies the events that trigger the workflow. env: Declares global environment variables for the workflow. defaults: Sets default configurations for all jobs in the workflow.
#### Job Elements
- [x] jobs: A collection of one or more jobs.
- [x] runs-on : Defines the type of runner the job will be executed on.
- [x] needs: Specifies the job dependencies.
- [x] if: Sets a condition for the job to run.
- [x] timeout-minutes : Limits the maximum duration of the job.
- [x] strategy: Configures a job strategy, such as matrix builds.
- [x] continue-on-error : Determines whether to continue the work- flow if the job fails.
- [x] env: Declares environment variables for the job.
#### Step Elements
- [x] steps : A collection of one or more steps in a job. name: Defines the display name of the step. if : Sets a condition for the step to run.
- [x] uses: Specifies an action to run as part of the step.
- [x] run: Executes a shell command.
- [x] with : Provides input parameters for the action. env: Declares environment variables for the step.
#### Contexts and Expressions
- [x] `${{ }}`: Expression syntax used to evaluate variables and functions.
- [x] `github`: Provides access to GitHub context data, such as github.event.
- [x] `secrets`: Contains the encrypted secrets available in the workflow.
- [x] `env`: References environment variables. steps: Accesses outputs from previous steps.
- [x] `jobs`: Accesses outputs from previous jobs. needs : Accesses outputs from dependent jobs.
- [x] `matrix`: References matrix build variables.
- [x] `runner`: Contains information about the current runner.

#### Functions
- [x] fromJson: Converts a JSON string to an object.
- [x] join: Concatenates elements of an array.
- [x] toJSON: Converts an object to a JSON string.
- [x] format: Replaces placeholders in a string with values. hashFiles: Generates a hash for a set of files.
- [x] startsWith: Checks if a string starts with a specified substring.
- [x] endsWith: Checks if a string ends with a specified substring. contains: Determines if a string contains a specified substring.

Example
```
Here is an example which uses commonly used GitHub Actions YAML elements:
name: Example Workflow
branches:
- main
jobs:
build:
runs-on: self-hosted
steps:
- name: Checkout repository
uses: actions/checkout@v4
- name: Set up Node.js
uses: actions/setup-node@v4 with: node-version: '14'
- name: Install dependencies run: npm ci
- name: Run tests
run: npm test
Remember, this appendix is only a brief reference. Consult the Git- Hub Actions documentation for a comprehensive guide on the syntax and usage of GitHub Actions YAML.
on:
push:
```

### Appendix B: List of Useful GitHub
### Actions and Integrations
This appendix provides a curated list of useful GitHub Actions and integrations that can enhance your workflows and improve your development process. While this list is not exhaustive, it should help you discover the potential of GitHub Actions and encourage you to explore the GitHub Actions Marketplace for more actions.

- [x] actions/checkout: This action checks out your repository so your workflow can access its contents. It is one of the most commonly used actions in GitHub Actions workflows.Repository: https://github.com/actions/checkout
- [x] actions/setup-node: Sets up a Node.js environment on the runner, allowing you to run Node.js scripts and tools in your workflow.Repository: https://github.com/actions/setup-node
- [x] actions/setup-python: Sets up a Python environment on the runner, allowing you to run Python scripts and tools in your workflow.Repository: https://github.com/actions/setup-python
- [x] actions/cache: Caches dependencies and build outputs to improve workflow execution times.Repository: https://github.com/actions/cache
- [x] actions/upload-artifact and actions/download-artifact: Uploads build artifacts from a job and downloads them for use in subsequent jobs.Repository: https://github.com/actions/upload-artifact_and__https://github.com/actions/download-artifact
- [x] actions/create-release: Creates a new release on GitHub and uploads assets to the release. Repository: https://github.com/actions/create-release - [x] actions/github-script: Allows you to write inline scripts that interact with the GitHub API and other GitHub Actions features using Octokit and the actions-toolkit libraries. Repository: https://github.com/actions/github-script
- [ ] codecov/codecov-action: Uploads your code coverage re- ports to Codecov, a popular code coverage analysis and reporting tool.Repository: https://github.com/codecov/codecov-action
- [x] deployments/ftp-deploy: Deploys your repository to a re- mote server via FTP or SFTP.Repository: https://github.com/deployments/ftp-deploy
- [x] jakejarvis/lighthouse-action: Runs Google Lighthouse au- dits on your web application and generates reports.Repository: https://github.com/jakejarvis/lighthouse- action
- [x]  peter-evans/create-pull-request: Automates the creation of pull requests from within your GitHub Actions workflows. Repository: https://github.com/peter-evans/create- pull-request
- [x]  semantic-release/semantic-release: Fully automated ver- sion management and package publishing based on seman- tic versioning rules.Repository: https://github.com/semantic-release/ semantic-release
- [x] snyk/actions: Scans your dependencies for vulnerabilities using Snyk, a popular open-source security platform.Repository: https://github.com/snyk/actions
- [x] SonarCloud/github-action: Integrates SonarCloud, a cloud- based code quality and security analysis platform, into your GitHub Actions workflows.Repository: https://github.com/SonarCloud/github-action
- [x] stale/stale: Automatically marks issues and pull requests as stale after a period of inactivity, and eventually closes them if no further activity occurs. Repository: https://github.com/stale/stale
https://spacelift.io/blog/ci-cd-pipeline
https://spacelift.io/blog/ci-cd-pipeline
https://github.com/sottlmarek/DevSecOps?tab=readme-ov-file
https://app.exampro.co/student/material/gha/6770?autoplay=true
https://docs.edgeimpulse.com/docs/tutorials/lifecycle-management/gitactions-docker
https://davecross.substack.com/p/github-actions-essentials-is-published?utm_campaign=post&utm_medium=web
https://docs.openedx.org/en/latest/developers/references/developer_guide/testing/github-actions.html
https://medium.com/@ravipatel.it/key-concepts-of-github-actions-a-guide-from-beginner-to-advanced-abb95c59e0f4
https://davecross.substack.com/p/github-actions-essentials-is-published?utm_campaign=post&utm_medium=web

https://docs.openedx.org/en/latest/developers/references/developer_guide/testing/github-actions.html


https://docs.github.com/pt/actions/about-github-actions/understanding-github-actions
https://docs.github.com/pt/actions/writing-workflows/quickstart

https://docs.github.com/en/actions/guides

https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions

https://github.com/marketplace/actions/setup-node-js-environment
https://docs.github.com/pt/actions/learn-github-actions/using-starter-workflows
https://docs.github.com/pt/actions/automating-builds-and-tests
https://docs.github.com/pt/actions/publishing-packages
https://docs.github.com/pt/actions/deployment
https://docs.github.com/pt/actions/managing-issues-and-pull-requests
https://docs.github.com/pt/actions/examples

## Alguns Exemplos de Fluxos

```
jobs:
  example-job:
    runs-on: self-hosted
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
    runs-on: self-hosted
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
    runs-on: self-hosted
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
    runs-on: self-hosted
    steps:
    - name: Check out the repo
      uses: actions/checkout@v4

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
    runs-on: self-hosted
    steps:
steps:
  - name: Checkout code
    uses: actions/checkout@v4

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
    runs-on: self-hosted
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
    runs-on: self-hosted
    name: Close Pull Request
    steps:
      - name: Close Pull Request
        uses: Azure/static-web-apps-deploy@1a947...
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          action: 'close'
```

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
          os: [self-hosted, macos-latest, windows-latest]
      steps:
        - uses: actions/checkout@v4
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
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v4
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

    runs-on: self-hosted
    strategy:
      matrix:
        python-version: [3.8]

    steps:
    - uses: actions/checkout@v4
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
 runs-on: self-hosted

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


```
name: Push into main branch
  on:
    push:
      branches: [ master ]

  jobs:
    context:
      runs-on: self-hosted
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
    runs-on: self-hosted
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

# GitHub Actions vs. Azure DevOps Pipelines - Escolhendo a ferramenta CI/CD certa para suas necessidades

A automação é essencial para acelerar a entrega de software no mundo de desenvolvimento acelerado de hoje.

Duas ferramentas líderes de CI/CD — GitHub Actions e Azure DevOps Pipelines — oferecem excelentes recursos de automação, mas cada uma atende a diferentes casos de uso. Agora, vamos aprender como escolher a certa.

GitHub Actions: CI/CD contínuo para projetos do GitHub

Melhor para:

Equipes profundamente integradas ao ecossistema do GitHub.
Projetos de código aberto
Aplicações nativas da nuvem
Fluxos de trabalho baseados em YAML

Principais vantagens:

✅ Integração nativa com GitHub - Os fluxos de trabalho são automatizados sem seus repositórios GitHub

✅ Event-Driven Triggers - Triggers baseados em eventos Git

✅ Ações de Marketplace - Disponibilidade de ações de marketplace pré-construídas com suporte da comunidade

✅ Escalabilidade e flexibilidade - Execute os fluxos de trabalho em Custom Runners e Github Runners com amplo suporte de sistema operacional.

Azure DevOps Pipelines: CI/CD de nível empresarial para cargas de trabalho complexas

Melhor para:

Manutenção de infraestrutura de nuvem híbrida e local
Organizações que usam serviços do Azure ou implantações em várias nuvens.
Equipes que exigem controles profundos de governança, segurança e conformidade.

Principais vantagens:

✅ Suporte a vários repositórios e várias nuvens - Fácil integração com várias nuvens - AWS, Azure, GCP, etc.

✅ Segurança e conformidade robustas - Segurança de nível empresarial, controles de acesso e aplicação de políticas.

✅ Pipelines gráficos e YAML - Suporta pipelines baseados em YAML e UI

✅ Integração DevOps de ponta a ponta - Azure Boards, Planos de teste, Conjuntos de teste, Artefatos

Fazendo a escolha certa

🔹 Use o GitHub Actions se sua equipe gosta muito do GitHub e está interessada em trabalhar com ecossistemas simples e de código aberto.

🔹 Escolha o Azure DevOps Pipelines se precisar de segurança de nível empresarial, gerenciar implantações em várias nuvens ou precisar de uma abordagem mais estruturada para DevOps.

Preparando sua estratégia de CI/CD para o futuro

As empresas precisam ser adaptáveis conforme o cenário do DevOps muda. Para equipes focadas no GitHub, o GitHub Actions é a solução preferida; no entanto, o Azure DevOps Pipelines continua sendo uma vantagem para automação de nível empresarial. Em alguns casos, usar os dois juntos pode fornecer o melhor.




---
GITHUB ACTIONS: UM GUIA PRÁTICO
A história do GitHub
e GitHub Actions
A maioria das pessoas confunde quando se trata de Git, GitHub, GitLab, GitFlow e outros git-alguma coisa.

## Git
Git é um "software de controle de versão descentralizado" e este termo bárbaro explica precisamente o que é e o que não é
. Git é um software, o que significa que não é uma metodologia como seria "DevOps", não é uma sigla como "CI/CD" ou nem mesmo uma maneira de fazer como "gitflow". É um aplicativo que é necessário instalar em um servidor cuja função principal é gerenciar as diferentes versões do nosso código-fonte. Essas versões, em vez de um simples backup, permitem, particularmente no mundo do software, manter uma cópia de cada modificação do código-fonte, com a capacidade de voltar e/ou selecionar uma versão precisa. Este tipo de software existe há décadas com os famosos CVS (1990), ClearCase (1992), SVN (2000), Visual SourceSafe (1994), Team Foundation Server (2005) mas também muitos outros, menos conhecidos, como o BitKeeper (que foi usado para o código fonte do Linux), etc. Todos eles têm suas vantagens e desvantagens, mas acima de tudo, eles têm um ponto em comum: a necessidade de um único servidor onde o código fonte é armazenado e no qual tudo acontece. É o famoso conceito de "centralizado".
É justamente para quebrar esse modelo que Linus Torvalds (também o inventor do Linux!) inventou o Git em 2005. Se o Git também funciona com um servidor "principal", cada software cliente também traz recursos de gerenciamento de código-fonte (ramificação, confirmação, etc.). Isso significa que todo desenvolvedor que instala o Git em seu computador pode usar todos os recursos localmente, incluindo a criação/gerenciamento de ramificações e a mesclagem de código, registro de dados, etc. Isso levou ao surgimento de novas formas de trabalho entre os desenvolvedores. Um bom exemplo é uma nova forma de criar uma ramificação por recurso ou desenvolvedor. No passado, geralmente era uma única ramificação correspondente a um software de versão, com os riscos de que essa ramificação, quando "quebrada", impedisse todos os desenvolvedores de trabalhar.
Hoje, o Git, graças à sua flexibilidade, se tornou o software de gerenciamento de versão de referência e dominou completamente todos os outros do cenário. Mas com grande poder, o GitHub Actions também vem com uma complexidade.



## GitHub
É justamente essa complexidade e capacidade de suporte (nenhuma empresa editou ou suportou o Git) que as empresas e equipes de desenvolvedores temiam migrar para essa nova ferramenta. É quando as pessoas decidem criar plataformas de hospedagem de código-fonte baseadas em Git (SaaS, Software as a Service) e a Internet então vê aparecer GitHub, GitLab ou Bitbucket.
O objetivo dessas plataformas é esconder a complexidade do Git por meio de uma interface intuitiva e então adicionar recursos adicionais, como gerenciamento de projetos, rastreamento de bugs, varredura de código e muitos outros. Assim nasceu o GitHub no final de 2007, que neste momento era apenas uma oferta comercial de Git hospedado (apenas armazenamento de código-fonte).
O GitHub, com mais de 50 milhões de usuários no início de 2021, é claramente o líder do mercado de plataformas de gerenciamento de código-fonte, mas há muito tempo é insuficiente para um projeto real.

De fato, era necessário para cada equipe que esperava usá-lo como parte de um projeto real, adicionar:

• Software de terceiros para gerenciar o backlog (problemas do GitHub e "Projetos" estão longe de serem perfeitos)
. Outro software para gerenciamento de testes
. Outro software para a parte de compilação/construção


E, finalmente, software para a implantação.

Para competir com essas plataformas mais avançadas/completas, o GitHub começou a implementar recursos para preencher essas lacunas. Assim, entre vários novos recursos, nasceu um GitHub Actions.
Nota: GitHub, Inc, o editor do GitHub.com, foi adquirido pela Microsoft em junho de 2018, mas continua sendo uma empresa totalmente independente. Se sinergias e co-investimentos técnicos forem feitos entre as duas empresas, o GitHub mantém sua orientação e independência total. Se você estiver interessado no futuro do GitHub, esteja ciente de que a lista de próximos recursos e cronograma de implementação são públicos e acessíveis neste endereço: `https://github.com/github/roadmap/`.

## GitHub Actions
Em agosto de 2019, o GitHub anunciou o beta público do GitHub Actions, embora eles tenham sido realmente acessíveis desde o verão de 2018 para alguns sortudos.
As GitHub Actions são então descritas como "Seu fluxo de trabalho, criado por você, executado pelo GitHub. As GitHub Actions permitem que você compile facilmente, empacote, versione, atualize e implante seu projeto em qualquer linguagem, no GitHub ou em qualquer sistema externo, sem precisar executar nenhum código sozinho".
As GitHub Actions, um sistema de automação, são mais do que isso, pois também podem interagir com os diferentes elementos de um projeto, como criar bugs, enviar e-mails automaticamente, atualizar os elementos do roadmap, etc. Mas vão muito além, pois você pode automatizar quase tudo com ele, como acionar o aspirador de pó robô, acender as luzes de uma árvore de Natal, fazer jogo da velha, etc. Os usos são infinitos, desde que sua criatividade esteja lá e que você esteja pronto para escrever algum código.
GitHub Actions prometem grandes coisas que confirmaremos neste livro.

## Seu primeiro fluxo de trabalho
Nada é mais irritante do que a teoria sem prática, então iremos diretamente para a prática criando um fluxo de trabalho usando GitHub Actions. Isso permitirá que você manipule vários elementos que detalharemos mais tarde nos capítulos seguintes. Acredito que será mais fácil entender esses conceitos quando você os tiver visto e aplicado pelo menos uma vez.
## Criando uma conta GitHub
Se isso ainda não tiver sido feito, você precisará criar uma conta GitHub para criar e usar fluxos de trabalho em seu ambiente. A criação de uma conta é totalmente gratuita e é realizada na seguinte URL: `https://github.com/join`.

Embora o GitHub ofereça várias assinaturas pagas que permitem acesso a recursos adicionais, você precisará de uma conta gratuita neste livro.

Os recursos do GitHub Actions são totalmente acessíveis gratuitamente, mas alguns recursos estão disponíveis para contas gratuitas apenas em repositórios públicos. Assim, se você decidir criar um repositório privado (visível apenas para você), certos recursos como ambientes, varredura de código ou publicação de páginas não estarão acessíveis para você; o livro mencionará essas limitações quando apropriado.

## Criação do repositório
Você pode começar com um novo repositório vazio, mas para mais simplicidade neste primeiro capítulo, criamos um repositório pronto para uso que você só precisa copiar para sua conta. Para fazer isso, visite a seguinte URL: https://github.com/lgmorand/book-github-actions-repo e bifurque o repositório.

## Fork do repositório
Um fork é uma cópia de um repositório, mantendo uma conexão com o arquivamento do qual é copiado. Isso permite que você edite a cópia como quiser (é sua cópia), mas também lhe dá a capacidade de "empurrar" suas alterações para reaplicar o repositório original para contribuir (se o autor aceitar, é claro). É como operamos a maioria dos projetos de código aberto. Cada colaborador executa e trabalha na cópia e então propõe adicionar emendas ao rascunho original.

O proprietário do repositório de origem pode então ver as alterações que você deseja fazer e aceitar ou rejeitar as alterações, que são automaticamente incluídas em seu código. Em breve, veremos como as Ações do GitHub são precisamente um ativo líder para facilitar o trabalho múltiplo em um repositório, para contribuir com outro projeto ou realizar controles de qualidade quando um terceiro deseja contribuir com seu projeto.

Assim que o fork for alcançado, o que deve levar alguns segundos, você deve pousar em um novo repositório chamado NOME_DA_SUA_CONTA/book-github-action-repo. Você observa que o repositório já contém várias pastas e arquivos. Ignore-os por enquanto.

## Criando um fluxo de trabalho
Observe as guias disponíveis em seu repositório e anote aquela que nos interessa: Actions.
Na aba do seu projeto em Actions é que você pode criar, editar e, principalmente, visualizar o status de seus vários fluxos de trabalho.
Entre na guia Ações para chegar ao Assistente de criação de fluxo de trabalho. Observe a mensagem que informa que os fluxos de trabalho foram deliberadamente desabilitados pelo GitHub neste repositório devido aos riscos que eles podem causar. A mensagem recomenda que você inspecione o código-fonte dos fluxos de trabalho e certifique-se de que não haja nada perigoso lá.

Se, após sua leitura cuidadosa, não houver nada suspeito, você pode clicar em "Eu entendo meus fluxos de trabalho, vá em frente e habilite-os" para reativar a funcionalidade do repositório GitHub para suas Ações.

Esta etapa só é necessária porque você **bifurcou** um repositório de outra pessoa; no caso de um novo repositório de código pessoal, esta etapa não existe.

1. Crie um fluxo de trabalho "vazio" que lhe dará a estrutura de um fluxo de trabalho genérico que apenas envia uma mensagem no console
2. Crie um fluxo de trabalho a partir de um modelo predefinido. O GitHub oferece modelos que devem se alinhar com o que ele acha que detectou em seu repositório ou permitindo que você escolha entre dezenas de modelos predefinidos. Esses fluxos de trabalho são um bom ponto de partida e uma excelente maneira de aprender quando você está começando com o GitHub Actions. Sinta-se à vontade para ler o conteúdo deles.

## Escolha um modelo de fluxo de trabalho
Crie, teste e implante seu código. Faça revisões de código, gerenciamento de ramificação e triagem de problemas funcionarem da maneira que você deseja. Selecione um modelo de fluxo de trabalho para começar.

## Implantação
No nosso caso, criaremos nosso fluxo de trabalho completamente à mão.

Clique em Configurar um fluxo de trabalho você mesmo, o que abre uma nova página com um arquivo em modo de edição. Você pode observar vários elementos importantes:

O arquivo tem uma extensão .yml e uma sintaxe que pode parecer simplista, mas, no momento, totalmente absurda.

Esta é a "linguagem" YAML (YAML Ain't Markup Language) que quer ser um formato minimalista (mais leve que JSON) para descrever as propriedades de um objeto. está, portanto, em um único arquivo e escrito usando YAML que descreveremos nosso fluxo de trabalho. O arquivo é chamado de "main.yml", mas você pode renomeá-lo como achar melhor, desde que mantenha a extensão correta.

• O arquivo é criado diretamente no seu repositório, junto com seu código-fonte, mas localizado na pasta `.github/workflows`. Esta pasta deve ser nomeada exatamente assim; é o caminho onde o GitHub espera encontrar os fluxos de trabalho para usar.

Isso significa que toda vez que você quiser adicionar seu próprio fluxo de trabalho, é nesta pasta específica que ele terá que registrá-lo e não em outro lugar `.github` corresponde a uma pasta oculta no Linux. Neste caso, você também pode encontrar fluxos de trabalho em uma subpasta chamada workflows, templates e outros arquivos usados para personalizar o uso do GitHub. Esses outros elementos não serão abordados neste livro, mas são explicados em detalhes na documentação do GitHub.

Reserve um tempo para olhar o conteúdo pré-preenchido do arquivo my-workflow.yml, mas não se preocupe se você não entendeu tudo ainda.

Agora, construiremos um fluxo de trabalho associado ao código-fonte do nosso repositório.
No repositório que você bifurcou, há dois arquivos na pasta src:
  • Um arquivo chamado main.css que contém estilo CSS Web
  • Um arquivo index.pug, que é uma página da Web, mas usando o formato de modelo PUG.

A sintaxe PUG simplifica o código, ao contrário do XHTML, é muito prolixo com seu sistema de iluminação. O resultado final, no entanto, será exatamente o mesmo.

```
link(rel="stylesheet",href="main.css")
.bear
.left-ear
.right-ear
.left-eye
.right-eye
.nose
.mouth
.hand
.container
```

Info: Se você estiver um pouco curioso e quiser saber mais sobre o mecanismo de template PUG, dê uma olhada no site oficial https://pugjs.org/

Vamos construir juntos um fluxo de trabalho que transforma nosso código-fonte PUG em uma página da Web HTML padrão e fazer um entregável que pode ser implantado em produção.

Retorne ao fluxo de trabalho que está sendo criado, que mudaremos voluntariamente com pouca explicação para ir mais rápido. Veremos cada seção em mais detalhes neste livro.

O primeiro passo é nomear nosso fluxo de trabalho:

```
on:
push:
#When code is pushed
branches: [ main] # on the main branch
pull_request: # When a pull request is made
branches: [ main] # on the main branch
name: My first workflow # The name of your choice
workflow_dispatch: #manual trigger
```

A segunda seção pode ser deixada como está. Ela define os casos de acionamento do nosso fluxo de trabalho.

Aqui indicamos que nosso fluxo de trabalho terá que ser acionado no caso de um commit em um branch, no caso de uma solicitação de pull ou após um lançamento manual.

A seção a seguir simplesmente indica o tipo de máquina virtual que ativará nosso fluxo de trabalho, aqui usando o Ubuntu.

Esta máquina virtual é criada perfeitamente em servidores GitHub. Você não precisa se preocupar com isso por enquanto.

```
jobs:
  build:
   uses: actions/setup-node@v4
   runs-on: self-hosted
```

A última seção é a mais interessante, pois adicionaremos nossas ações para atingir. Primeiro, exclua as duas ações run que mostram apenas uma mensagem no console, o que não é útil.
Em seguida, adicione as seguintes tarefas na parte inferior do arquivo (preste atenção ao recuo):
1- Uma ação indica que queremos instalar o NodeJS na máquina virtual que executará o fluxo de trabalho.

```
- name: User Nodes
  uses: actions/setup-node@v4
```

2- Uma ação que inicia um comando npm install, que analisará os pacotes necessários do nosso código-fonte (eles estão listados no arquivo /src/packages.json) e os instalará localmente (=na máquina virtual).

- run: npm install

3- Uma ação executa o comando gulp build, que usa os pacotes baixados pelo NPM para transformar nosso código PUG em XHTML e, em seguida, copiará o resultado gerado em uma pasta /dest. Todas essas mecânicas ocultas estão escritas no arquivo gulpfile.js, mas você não precisa se preocupar com isso.

- run: gulp build

4- Uma ação que pegará todos os arquivos gerados na pasta /dest, nossa página HTML gerada e o arquivo CSS, compactará como MyPackage e, em seguida, fará o upload deste arquivo para o portal do GitHub.

```
on:
push:
- uses: actions/upload-artifact@v4
  with:
    name: MyPackage # Coloque qualquer nome que você quiser
branches: [ main]
pull_request:
branches: [ main]
path: dest #pasta que será carregada no pacote
workflow_dispatch:
```

O resultado final do seu arquivo YAML deve ser algo como isto:

```
name: My first workflow

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

  workflow_dispatch:
jobs:
  build:
    runs-on: self-hosted

    steps:
    - uses: actions/checkout@v4

    - name: Use Node.js
      uses: actions/setup-node@v4

    - run: npm install

    - run: gulp build

    - uses: actions/upload-artifact@v4
      with:
        name: MyPackage
        path: dest
```

Salve seu fluxo de trabalho clicando no botão "Start commit".

Então, no pop-up que aparece, deixe todas as configurações padrão e clique em "Commit new file".



## Retorne à aba Ações.

Desta vez, você deve descobrir que seu fluxo de trabalho agora está listado como GitHub detectou automaticamente um arquivo válido na pasta .github/workflows.

Você também percebe que uma execução do seu fluxo de trabalho também foi acionada. Ela foi acionada porque você salvou (enviou) código no branch principal no momento do commit e que seu fluxo de trabalho tem um gatilho correspondente a este caso específico.

## Analisando os resultados
Se você clicar na execução do seu fluxo de trabalho (chamado run), você chegará na tela de resultados.

Os fluxos de trabalho mais recentes do Ubuntu usarão o Ubuntu-20.04 em breve.
Para mais detalhes, consulte https://github.com/actions/virtual-environments issues/1816

## Resultados
Esta tela é separada em várias subpartes:
1. No lado esquerdo está a lista de trabalhos no seu fluxo de trabalho.
2. O status geral do fluxo de trabalho, seu tempo de execução, o tempo cobrado (livre até um certo número) e o número de elementos (artefatos) que foram gerados.
3. Logo abaixo está a visualização do gráfico. No caso de um fluxo de trabalho simples, geralmente é inútil. Ainda assim, para fluxos de trabalho mais complexos, permite ver as relações entre os diferentes elementos e o status dos diferentes estágios.
4. A seção Anotações que lista todos os avisos e erros importantes do fluxo de trabalho.
5. Todos os fluxos de trabalho não geram artefatos, mas quando o fazem como aqui, eles são listados aqui.
6. No lado esquerdo, se você clicar no trabalho chamado build, verá os resultados detalhados de cada ação do fluxo de trabalho. Este é o lugar onde você verifica os logs para validar se seu fluxo de trabalho se comporta conforme o esperado.

Clique no artefato MyPackage e baixe o arquivo zip, e então configure-o. Ele deve conter dois arquivos: index.html e main.css. Se você abrir o arquivo com um navegador da web, você deve ver o resultado: nosso adorável panda animado.

As Ações do GitHub não são mais complexas do que isso para casos simples e, graças aos conceitos mais avançados deste livro, você pode aperfeiçoar seu conhecimento e ser capaz de cobrir os assuntos mais complexos.

## Algumas observações sobre YAML
O formato YAML já tem 20 anos, mas só recentemente é amplamente conhecido, a ponto de substituir os formatos XML e JSON para tudo o que está relacionado à configuração ou descrição. Além disso, seu formato simples, em formato livre e sem nenhuma tag, o torna um formato leve, muito legível e utilizável para qualquer necessidade; portanto, o GitHub tornou o elemento central das Ações do GitHub.
Se você nunca escreveu nenhum YAML em sua vida, nós o cobriremos junto com o básico. Em vez de cobrir toda a especificação YAML, vamos nos concentrar nas partes relevantes para o GitHub Actions.


Um arquivo YAML pode, no caso do GitHub Actions, ser resumido com três elementos:
1. Elementos de chave/valor
2. Elementos aninhados
3. Matrizes de elementos
Os elementos de chave/valor são compostos de um nome de chave, seguido pelo caractere de coluna ":" e finalmente por seu valor. Aqui estão alguns exemplos:
key: value # observe o espaço após os dois pontos ":", mas não antes
```
keyNumeric: 1235
keyBoolean: false
OtherKey: "Hello world" # entre aspas porque o valor contém espaços
cmd: "echo"
```

O valor deve estar em uma linha. No entanto, se você precisar de um valor multilinha, é necessário usar o caractere pipe "|":
```
key: # caractere que indica que as linhas a seguir
$var = "hello" # fazem parte de um único bloco
echo $var # atribuído à chave
```
Então vêm os elementos aninhados. É uma chave que não tem nenhum valor, mas tem subelementos que precisam ser recuados. O recuo em YAML é feito com dois espaços (sem tabulações):

```
a_nested_key:
   key: value    # subelemento recuado por dois espaços
   other_key: other value # sub-element at the same level
   other_nested_key: #sub-element too
   hello: hello # sub sub-element indented by two spaces
   weekDay: ['Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday'] # string array
   oddNumbers: [1,3,5,7,9] # List of numeric values
   os: [self-hosted, windows-latest, macos-latest]
jobs: # new first-level element so no indented
build:
runs-on: self-hosted
```
Por fim, vêm os elementos cujo valor é uma lista de objetos. Eles estão disponíveis em duas formas.
Primeiro vem a lista de valores escritos na mesma linha em um array, representados por colchetes.
Depois vêm os objetos mais complexos, inclusive quando cada valor do array também é um objeto. Neste caso, o formato acima não funciona, e um novo formato é necessário. Nele, cada elemento é representado por um traço sem recuo.
```
students:
    - firstname: Jean    # element, no indentation
      name: Dupont       # property of the same element
    - firstname: Marine  # new element
      name: Leblanc      # property of the second element
addresses:
    - name: "personal address"
      street: 1 Wisteria Lane
city:
  name: Paris   # sub-property and therefore indentation
  postalCode: 75001
 - name: "second address"
 - street: 2 Geek street

  city:
    name: Courbevoie
     postalCode: 92400
```
O formato YAML tem outras sutilezas, mas essas bases devem ser suficientes para usar o GitHub Actions serenamente e escrever qualquer fluxo de trabalho.
Aviso: Mais um lembrete: seja muito rigoroso ao escrever seus arquivos, copiando exemplos deste livro e seja particularmente vigilante ao recuo. Ao menor erro de recuo ou espaço ao redor do sinal ":", o GitHub rejeitará o fluxo de trabalho.


# Workflow syntax
Você criou seu primeiro fluxo de trabalho sem realmente entender a estrutura nem os mecanismos. Neste capítulo, você descobrirá em detalhes os diferentes elementos que compõem um fluxo de trabalho e, especialmente, como usá-los para atender às suas necessidades.

## Triggers
Os gatilhos são, como o nome indica, os meios para especificar o critério de início de um fluxo de trabalho, e todo fluxo de trabalho deve conter um ou mais gatilhos.

Existem três categorias de gatilhos:
1. Gatilhos automáticos
2. Gatilhos de programação
3. Gatilhos manuais

### The automatic trigger
Ao criar um fluxo de trabalho, você deve primeiro definir sua finalidade e as condições para acioná-lo. O caso mais comum é querer um gatilho sempre que uma nova versão do código-fonte estiver disponível, para verificar se tudo pode ser compilado corretamente. No mundo do Git, significa agir assim que um dos desenvolvedores envia seu código para o servidor. Portanto, estamos falando aqui sobre integração contínua ("CI").

Em termos de sintaxe, em nosso arquivo, usaremos a palavra-chave "on" que significa "no caso de", e especificaremos o termo "push" para indicar cada vez que um commit é enviado para o servidor.

`on: push`

Da mesma forma, é possível disparar o fluxo de trabalho quando uma solicitação de pull é realizada quando o desenvolvedor solicita "push" seu código para uma ramificação de outra ramificação. A pequena diferença com o caso anterior é que ele é disparado antes que seu código seja mesclado na ramificação de destino. É possível agir e bloquear modificações se um problema for detectado. No caso de "push", é tarde demais, o código já está na ramificação e, se o código tiver algum erro, a ramificação será quebrada, o que pode impactar outros desenvolvedores.

```
on:
push: # inicia em cada push
pullrequest: # ou solicitação de pull
```

Também pode ser escrito como:

```on: push, pullrequest```

Eventos como push e pullrequest são numerosos. Aqui está uma lista não exaustiva dos mais comuns. Você verá alguns deles neste livro:

| Evento           | Disparo                                                    |
| ----             | ----                                                       |
| create           | Quando uma ramificação ou uma tag é criada                 |
| delete           | Quando uma ramificação ou uma tag é excluída               |
| gollum           |  Quando uma página wiki é criada ou modificada             |
| issue_comment    | Quando um problema do GitHub é criado, editado ou excluído |
| registry_package | Quando um pacote* é publicado                              |
| release          | Quando uma versão é criada, excluída, editada              |

* Um "pacote" como citado aqui é diferente de um artefato, como vimos no capítulo anterior. Pacotes são abordados no capítulo Gerenciamento de artefatos.

## Filtros
Se um gatilho for executado a cada modificação de código, seria normal nos questionarmos como lidar com isso no caso de um projeto mais complexo, seja porque ele contém várias ramificações ou porque apenas um repositório tem vários aplicativos dentro dele e cada um requer um fluxo de trabalho dedicado que não queremos ver ser acionado quando não deveria. Essa especialização do fluxo de trabalho é feita com os filtros que se aplicam em combinação com o critério de gatilho.

### Filtros por branch
Em alguns eventos como push e pullrequest, é possível especificar o branch que deve disparar o fluxo de trabalho (main por exemplo). Então, se um novo código de versão for enviado para outro branch, o fluxo de trabalho não será acionado.

```
on: #fires
  push: # quando o código for enviado
   branches: # quando o código for enviado
   # um dos seguintes branches
   - main
```

```
Também é possível especificar múltiplos branches nominalmente ou, ao contrário, um conjunto de branches

```
on: #fires
push:
# quando o código for enviado
   # qualquer main
   - branch1 # qualquer branch1
    branches: # no branch
     - main # nomeado "main"
     - features/** # qualquer um dos branches na pasta "features"
     - "**bug**' # ou qualquer branch que contenha 'bug' em seu nome



Mas também é possível excluir certos branches.

```
on: #fires
  push:
   branches-ignore: # on all branches
     - main #except the main branch
```

Aviso: Você não pode usar branches e branches-ignore no mesmo fluxo de trabalho. Você deve usar a listagem explícita (white-Listing) ou a exclusão explícita (black-listing). Se precisar de ambas, é necessário usar o caractere "!" para fazer um padrão negativo escolhendo apenas uma das duas palavras-chave.

```
on: #fires
 push: # as soon as a change is made
   branches: #on one of the following branches
     - 'releases/*** #starting with releases
     - '!releases/**-alpha' # except those who end up with "-alpha"
```
## Os filtros por caminho
Também é possível ser ainda mais granular com base na adição de código, mas apenas quando ele está localizado em um arquivo específico ou em uma pasta específica. Isso é particularmente útil quando você tem vários aplicativos no mesmo repositório, mas cada um precisa de um fluxo de trabalho dedicado, como um aplicativo Android e iOS.

```
on: #fires
  push: # as soon as a change is made
    paths:# on the files
      - '**.cs' #which have the extension **.cs'
      - 'android/*** # or that are in the code folder

Aviso: Não é possível usar paths e paths-ignore no mesmo fluxo de trabalho. Quanto aos branches, você pode excluir paths com o uso do caractere "!'
Ou, por outro lado, é possível ignorar alguns paths:

```
on: #fires
push: # As soon as a change is made
  paths-ignore: # unless it concerns
    - 'docs/** # A file in the 'docs' folder
```

## Scheduled trigger
Este gatilho serve em particular para as compilações que são comumente chamadas de Nightly Builds. Essas compilações são (geralmente) iniciadas à noite, mas descorrelacionadas do processo de CI/CD, seja porque realizam tratamentos longos (ex.: varredura de código mais avançada) ou porque as ações do fluxo de trabalho não são necessárias para o escopo da Integração Contínua (ex.: geração de um relatório de qualidade de código)
Essa configuração é feita adicionando a propriedade schedule e um parâmetro cron, conforme mostrado no exemplo abaixo:

```
on:
  schedule:
    - cron: '00** *' #Every day at midnight
```

Esta formatação usa a terminologia crontab que permite que você defina qualquer agendamento. No exemplo anterior, "0 0 *** " 0 significa 0 minutos, às 0 horas (meia-noite), todos os dias, todos os meses, todos os dias da semana. Você pode especificar qualquer coisa, desde que respeite o intervalo mínimo de 5 minutos.

Link útil: http://www.cronmaker.com é um site para construir sua expressão cron facilmente.

Um exemplo de uso pode ser um fluxo de trabalho que começa toda segunda-feira às 9h antes da reunião standup e fecha os problemas abertos que não estão mais ativos (inativos por mais de 60 dias) graças à ação stale (https://github.com/actions/stale).


```
name: "Close the old issues"
on:
schedule:
- cron: "0 9 ** 1" # every Monday at 9 am
jobs:
  stale:
   runs-on: self-hosted
   steps:
   - uses: actions/stale@v9
    with:
    repo-token: ${{ secrets.GITHUB_TOKEN }}
   stale-issue-message: 'This bug is closed because of too long inactivity (60jrs by default)'
```

Por motivos de sustentabilidade, o GitHub desabilita qualquer fluxo de trabalho agendado quando não há atividade no repositório nos últimos dois meses. Você recebe um e-mail para estender manualmente a atividade do seu fluxo de trabalho por 60 dias. Uma alternativa é usar esta ação (https://github.com/gautamkrishnar/keepalive-workflow) que simula a atividade no repositório.

## Manual triggering
O gatilho manual é particularmente útil quando você quer que a ação seja disparada por um humano, como implantar em um ambiente após uma fase de teste.
Este gatilho é especial porque você tem que usar o evento workflow_dispatch que indica que o fluxo de trabalho pode ser iniciado a partir de um item externo (por exemplo, outro fluxo de trabalho, uma chamada de API ou... um humano).

```
 on: workflow_dispatch
```

Uma vez configurado, o fluxo de trabalho pode ser acionado a partir de um fluxo de trabalho de terceiros e manualmente a partir do portal GitHub. Abra a aba Ações.

## Iniciar manualmente um fluxo de trabalho
Os gatilhos manuais também podem fornecer parâmetros de entrada ao iniciar o fluxo de trabalho para dar a eles um pouco de dinamicidade.
Essas configurações são declaradas com as entradas de propriedade.
É possível então definir um parâmetro que tenha propriedades diferentes:

* Seu nome que serve como uma "chave". É por meio desse nome que você pode se referir a ele no fluxo de trabalho, como um nome de variável
* description: uma dica que será exibida no formulário gerado pelo GitHub
* required: indica se o valor do parâmetro é obrigatório ou não
• default: o valor padrão e pré-preenchido no formulário de entrada


```
input:
    nameOfMyParameter:
    description: 'my first parameter'
    required: true
    default: 'hello'

```
É claro que é possível definir vários parâmetros, cada um com sua configuração. O GitHub cuida apenas de gerar um formulário contendo os parâmetros de entrada e então transmitir os valores para seu fluxo de trabalho. Você ainda precisa configurar seu fluxo de trabalho para usar esses parâmetros.
Aqui está um exemplo de um fluxo de trabalho que pede para fornecer dois parâmetros obrigatórios, um dos quais já tem um valor padrão.

```
name: My workflow with params
on:
workflow_dispatch:
inputs:
myParam:
description: 'my first param'
required: true
default: 'hello'
myParam2:
description: 'my second param'
required: true
jobs:
  my-job:
   runs-on: self-hosted
   steps:
    run: echo "${{ github.event.inputs.myParam }} $ {{ github.event.inputs.myParam2 }}"
```

O resultado ao iniciar o fluxo de trabalho fica assim:

## Manually trigger with parameters
O formato um tanto particular $ {{ github.event.inputs.myParam }} que representa uma variável do GitHub é abordado no capítulo As variáveis.
Lembre-se apenas por um momento que este formato informa o fluxo de trabalho:

- [x] Entre as variáveis do GitHub
- [x] Look in the properties of the event that triggered the workflow
- [x] Search among its input parameters (inputs)
- [x] Then retrieves the value of the parameter named "myParam"

Desde novembro de 2021, agora é possível atribuir tipos para parâmetros. Se as configurações fossem todas string (agora o tipo padrão), agora é possível especificar tipos como boolean, choice ou environment:

```
workflow_dispatch:
inputs:
name:
type: choice
description: Who to greet
options:
- monalisa
- cschleiden
message:
required: true
use-emoji:
type: boolean
description: Include emojis
environment:
type: environment
```

Também é possível dar um nome dinâmico ao fluxo de trabalho usando essas entradas. Em vez de usar a propriedade name, você pode usar a propriedade run-name

run-name: O fluxo de trabalho cumprimentará ${{ inputs.name}} por @${{ github.actor}}

## Desabilitar/ignorar gatilhos temporariamente
Pode acontecer de você querer alterar um ou mais arquivos, mas não querer acionar o fluxo de trabalho associado a este evento (push ou pull-request). Por exemplo, quando você edita um arquivo que não é relevante para a implantação, como um arquivo README.md.
Um truque não documentado consiste em inserir uma palavra-chave no comentário de um commit ou pull request, e o GitHub ignorará o evento e não acionará o fluxo de trabalho.

A lista de possíveis palavras-chave para desabilitar temporariamente um fluxo de trabalho é a seguinte: [skip ci], [ci skip], [no ci], [skip actions] ou [actions skip] (não se esqueça dos colchetes).

## Desativar um fluxo de trabalho
Se desabilitar temporariamente for útil, isso requer nunca omitir a inserção de uma das palavras-chave de desativação para cada commit. Uma alternativa é desabilitar um fluxo de trabalho totalmente (until reactivated);
O arquivo YAML permanece presente e funcional, mas tecnicamente o GitHub não o acionará até novo aviso.

A desativação (ou reativação) é realizada por meio da aba Ações do repositório; ao clicar em um dos fluxos de trabalho no canto superior direito, clique no botão "..." e escolha "Desativar fluxo de trabalho".

## Desativar fluxo de trabalho
Se a desativação for efetiva, uma mensagem indicando o status e como reativar o fluxo de trabalho será exibida:

## Habilitar fluxo de trabalho
Com o que você acabou de aprender, escolher o gatilho relevante para sua necessidade deve ser fácil.

### Exercícios
Agora, vamos aplicar o que você acabou de aprender fazendo alguns exercícios.

Exercício n°1
Aqui está um fluxo de trabalho que fecha os bugs que são muito antigos. Modifique-o para que ele seja executado todas as noites às 19h30, de segunda a sexta-feira.

```
name: "triggers - exercise 1"
on:
# to complete
jobs:
stale:
runs-on: self-hosted
steps:
uses: actions/stale@v9
with:
 repo-token: ${{ secrets.GITHUB_TOKEN }}
stale-issue-message: 'This issue is stale because it has been open 30 days with no activity. Remove stale label or comment or this will be closed in 5 days'
days-before-stale: 30
days-before-close: 5
```

### Exercise n°2
Para este segundo exercício, altere este fluxo de trabalho para ser acionado sempre que o código for enviado em qualquer branch. Adicione um segundo gatilho quando uma solicitação de pull for feita no branch principal

```
name: "triggers - exercise 2"
on:
# to complete
jobs:
stale:
runs-on: self-hosted
steps:
- run: echo "I check that the code compiles correctly"

```

Exercício n°3
Para este último exercício, você deve disparar o fluxo de trabalho quando os arquivos com extensão ".yml" forem modificados durante um pull request, exceto aqueles que têm uma pasta pai chamada "test".

```
name: "triggers - exercise 3"
on:
# to complete
jobs:
stale:
runs-on: self-hosted
steps:
 - run: echo "I'm checking the YAML files"
```

Lembrete: As soluções podem ser encontradas no capítulo dedicado no final deste livro.

## Jobs
Cada fluxo de trabalho é composto de um ou mais jobs, que são um grupo de tarefas que um único agente executará. Essas tarefas, chamadas steps, serão abordadas no próximo capítulo.

### A execução de um job
Um job representa um conjunto de tarefas que serão executadas sequencialmente pelo mesmo agente. Um fluxo de trabalho, portanto, contém pelo menos um job, mas pode ter dezenas deles, se necessário. O importante a lembrar é que cada job é executado por um agente diferente.
Cada job é composto de vários elementos:

. Um nome simples e chave que será exibido se a propriedade name não for preenchida
• Um nome de propriedade (opcional), que serve apenas para legibilidade em logs
· Uma propriedade runs-on, a mais importante, define o tipo de máquina virtual na qual o job será executado.
· Uma propriedade Steps, que contém um conjunto de tarefas a serem executadas

Aqui está um exemplo de sintaxe de job:
```
jobs:
job1:
#Job's key
name: "My first job" #Job's name
runs-on: self-hosted # type of machine on which the job will be executed
steps:
[...] # The different tasks to perform
```

## Jobs
Cada fluxo de trabalho é composto de um ou mais jobs, que são um grupo de tarefas que um único agente executará. Essas tarefas, chamadas steps, serão abordadas no próximo capítulo.

### A execução de um job
Um job representa um conjunto de tarefas que serão executadas sequencialmente pelo mesmo agente. Um fluxo de trabalho, portanto, contém pelo menos um job, mas pode ter dezenas deles, se necessário. O importante a lembrar é que cada job é executado por um agente diferente.
Cada job é composto de vários elementos:

. Um nome simples e chave que será exibido se a propriedade name não for preenchida
• Um nome de propriedade (opcional), que serve apenas para legibilidade em logs
· Uma propriedade runs-on, a mais importante, define o tipo de máquina virtual na qual o job será executado.
· Uma propriedade Steps, que contém um conjunto de tarefas a serem executadas

Aqui está um exemplo de sintaxe de job:

| Virtual machine     | Label                           |
| ----                | ----                            |
| Windows Server 2022 |  windows-latest or windows-2022 |
| Windows Server 2019 |  windows-2019                   |
| Ubuntu 24.04        | self-hosted ou ubuntu 22.04   |
| macOS Sequoia 15.0  | macos-latest or macos-15        |
| macOS Sonoma 14.0   | macos-latest or macos-14        |
| macOS Ventura 13.0  | macos-13                        |


Executores ARM: Os executores ARM estão disponíveis apenas para planos Teams/Enterprises
A maioria dessas VMs vem com 2 CPUs, 7 Gb de RAM e 14 Gb de armazenamento (SSD), mas CPU/RAM são duplicados se seu repositório for público. Se você estiver procurando por executores com

processadores Arm64 ou GPU, eles são reservados apenas para os planos de preços Teams/Enterprise.

Aviso: Um fluxo de trabalho pode conter vários trabalhos. É importante observar que cada um desses trabalhos será executado em uma máquina virtual diferente, mesmo se o mesmo sistema operacional for especificado. Portanto, se você planeja transmitir dados de um trabalho para outro, será necessário usar mecanismos mais complexos ou serviços de terceiros.

Dependências entre seus trabalhos
Por padrão, os trabalhos do mesmo fluxo de trabalho são executados em paralelo e independentemente um do outro (=iniciar simultaneamente). Isso permite, por exemplo, compilar um aplicativo para Android em um agente Linux e um aplicativo para iOS em um agente macOS simultaneamente, em vez de um após o outro.

No entanto, há muitos casos em que precisaremos executar os jobs sequencialmente. Para isso, é necessário adicionar o atributo needs no job que queremos ver executando após o outro:

```
jobs:
  job1:
job2:

needs: job1
job3:
needs: [job1, job2]
```
No exemplo anterior, o job1 deve ser executado inteiramente e com sucesso para que o job2 comece.
Uma vez que o job2 for concluído com sucesso, o job3 será iniciado porque depende do job1 e do job2. Poderíamos ter apenas colocado uma dependência no job2 neste caso.

Também é possível configurar um job para que ele seja executado após outro job que foi concluído com sucesso ou não.

Útil para um job de limpeza final, por exemplo. Este comportamento é configurado usando a palavra-chave condicional if e o valor always().

```
  jobs:
    job1:
      job2:
        needs: job1
        if: always()  # says it will run whatever happens# but after job1
```

Por outro lado, é possível executar um job somente se o job do qual ele depende falhou. Portanto, é comum usar esse tipo de etapa de configuração para ações de cancelamento que não foram bem-sucedidas (rollback):

```
      job1:
        job2:
          needs: job1
       if: failure() # indicates that it will only run if Job1 fails
```

Os status possíveis são:

| Condição    | Descrição                                  |
| -----       | ----                                       |
| success()   | Quando o trabalho anterior foi (implícito) |
| failure()   | Quando o trabalho anterior falhou          |
| cancelled() | Quando o trabalho anterior foi cancelado   |
| always()    | O tempo todo, se os trabalhos anteriores foram bem-sucedidos ou não |

## Limitações

Embora alguns limites sejam altos, há limitações no número de trabalhos executados em paralelo na mesma conta do GitHub.

| Plano       | Max Parallel Jobs | Max Parallel Jobs MacOS |
| ----        | ---- | ---- |
| Free        |  20  |  5   |
| Pro         |  40  |  5   |
| Team        |  60  |  5   |
| Enterprise  | 150  | 50   |

Essas limitações devem ser consideradas ao dividir seus fluxos de trabalho, especialmente se você os usa em projetos profissionais com várias pessoas trabalhando em paralelo.

Também há limites no tempo de execução. Por exemplo, cada tarefa não pode ser executada por mais de 6 horas e o total de horas de um fluxo de trabalho que está executando várias tarefas (ou usa uma matriz) não pode exceder 72 horas.

## Exercícios - jobs
Vamos passar para alguns exercícios práticos para validar o que você acabou de aprender.

### Exercício n°1
Analise o próximo fluxo de trabalho e tente adivinhar o que será exibido no console.

```
jobs:
  job1:
    runs-on: self-hosted
     steps:
        - run: echo "Hello"
 job2:
   needs: job1
   runs-on: self-hosted
   steps:
     -- run: echo "how"
 job3:
      needs: [job1, job2]^
    runs-on: self-hosted
      steps:
       - run: echo "are"
 job4:
   runs-on: self-hosted
       steps:
         - run: echo "you?"
```



Exercício n°2
Neste segundo exercício, você é solicitado a concluir o fluxo de trabalho para que o job2 seja disparado somente se o job1 falhar e o job3 seja iniciado, aconteça o que acontecer. Por exemplo, o job1 falha se o fluxo de trabalho for executado durante o fim de semana. Novamente, não altere nenhuma propriedade ou linha de código existente; você só pode adicionar novas linhas.

```
jobs:
  job1:
     runs-on: self-hosted
      steps:
        - run: |
            dayOfWeek=$(date +%u) # calculates the day of the week
            if ($dayOfWeek > 5)
             then
               exit 1
            fi
   job2:
     runs-on: self-hosted
       needs: job1
      steps:
        - run: echo "Something went wrong"
  job3:
    runs-on: self-hosted
      needs: job2
      steps:
        - run: echo "I am running whatever happens"
```

Exercício n°3
É comum que um fluxo de trabalho tenha vários trabalhos. Aqui está um exemplo simples em que a primeira parte escreve alguma mensagem em um arquivo de texto, e a segunda etapa, que dispara após a primeira, lê e exibe o conteúdo do arquivo de texto. Qual é a exibição do fluxo de trabalho a seguir?

```
name: jobs - exercice 3
   on:
     workflow_dispatch:
     jobs:
       job1:
         runs-on: self-hosted
         steps:
           - run: echo "hello job2" > test.txt # writes in test.txt
       job2:
         runs-on: self-hosted
           needs: job1
           steps:
              - run: cat test.txt # reads the content of test.txt and displays it in the console

## The steps
A parte mais rica de um fluxo de trabalho é representada pelo bloco steps que contém todas as ações que um fluxo de trabalho executa. Essas ações são precisamente essas famosas GitHub Actions, módulos que executam uma tarefa específica e que podem ser facilmente combinados dentro de um fluxo de trabalho.

Você pode escolher entre:

- [x] Executar um comando, uma linha de comando simples ou uma série de comandos
- [ ] Executar uma Action, um módulo rico, personalizável e reutilizável criado anteriormente por outra pessoa

## Executar um comando
A execução de um comando é o equivalente a uma tarefa CMD no Windows ou um comando bash no Linux. Ele executa uma linha de comando simples e retorna o resultado para o console. Frequentemente usado para exibir uma mensagem, para executar uma operação em arquivos, às vezes é usado para iniciar comandos do sistema ou scripts de terceiros como vimos no capítulo anterior com "npm install" e "gulp build". Este tipo de tarefa é reconhecível pela presença da palavra-chave run.

Uma etapa de execução se parece com isso: `- run: echo 'Execução do meu comando'`

Caso você queira executar vários comandos, você terá a opção entre duplicar cada etapa com um único comando ou usar um caractere pipe (1) e combinar comandos com o seguinte formato:
```
steps:
 #way of doing no 1
  - run: echo 'Hello'
  - run: echo 'World'
#way of doing n°2-
run: | # Indicates that multiple commands have to be executed
      echo 'Hello'
      echo 'World'
```

A escolha de um ou outro tem forte incidência porque cada tarefa (passo) é executada em um contexto diferente. Assim, se um comando define uma variável local, o próximo passo não pode acessar essa variável. Veremos mais adiante como é possível fazer a mesma coisa usando variáveis de saída e/ou ambientes.

```
steps:
    - run: MY_VARIABLE="hello"
    - run: echo $MY_VARIABLE # does not work
```

Também é comum dar um alias para cada etapa por meio do nome da propriedade, o que, embora completamente opcional, traz mais clareza:

```
  steps:
    - name: My first command
      run: echo 'Execution of my command'
    - name: my second command
      run: echo 'Execution of my second command'

```
Esta propriedade facilita a diferenciação e análise de logs de execução de fluxo de trabalho exibidos no portal da Web GitHub.

Uma das propriedades mais interessantes para execuções de comando é a propriedade shell que permite especificar o interpretador do comando. Assim, é possível executar um comando do PowerShell ou do sistema sem configuração adicional ou instalação de um tempo de execução específico.

```
steps:
 - name: Start a PowerShell command
    run: Write-Host "Hello"
  shell: pwsh # specifies that we want a PowerShell shell
- name: Start a Python command
   run: print("Hello")
   shell: python # specifies that we want a python shell
```

Esta propriedade shell pode ter valores diferentes, cada um direcionando um ambiente de linha de comando específico que depende do ambiente que foi designado para a execução do trabalho (runs-on). Aqui está a lista exaustiva:

```
Platform | Setting | Descriptio | Commandnlaunched  |
All      | bash    | The default shell on non- | bash -noprofile |
```

Essa liberdade permite executar scripts personalizados e especificar o interpretador relevante. No caso a seguir, o código snippet permite que você execute um script bash:

```
 steps:
   - run: ./.github/scripts/build.sh
    shell: bash
```

Além das propriedades name e shell, cada passo de comando (e os "passos de ação" que veremos logo depois) tem propriedades adicionais opcionais que serão vistas em detalhes ao longo dos capítulos deste livro. Entre essas propriedades, você encontrará em particular:

- [x] id: identificador único do passo quando você deseja interagir com o passo, como recuperar suas variáveis de saída ⚫
- [x] with: para transmitir parâmetros para o comando/ação
- [x] env: para declarar variáveis locais no nível do passo
- [x] if: para tornar condicional a execução do passo
- [x] continue-on-error: para evitar que um passo seja considerado como falha mesmo quando um problema surge ou que um de seus comandos retorna um código de erro
- [x] timeout-minutes: para forçar a parada de um passo se ele exceder o limite de tempo

## Execução de uma Ação
Suponha que seja possível fazer quase tudo apenas com passos run. Nesse caso, o verdadeiro poder do GitHub Actions vem da possibilidade de chamar diretamente módulos de script complexos que outras pessoas criaram. Esses módulos (os famosos GitHub Actions) são, como veremos mais adiante no livro, scripts simples colocados em um pacote que facilita seu download, configuração e execução.

Você pode chamar uma Action com a palavra-chave uses, especificando o nome e a "versão" da ação a ser executada. Isso pode ser feito usando três variações:
1. usando a versão da ação: que permite direcionar uma versão específica (um lançamento correspondente a essa versão deve ter sido criado)
2. via branch da ação: que permite usar uma versão em desenvolvimento sem precisar de nenhum lançamento existente
3. via hash da ação: pode direcionar um commit específico. Cada um desses métodos fornece o mesmo resultado em termos de execução, mas corresponde a diferentes casos de uso. Por exemplo, quando criamos nossa ação, e ela está sendo desenvolvida, é mais fácil usar o branch de desenvolvimento dessa ação. Dessa forma, se a criação for feita de forma iterativa, o fluxo de trabalho sempre pegará a última versão, e a publicação do release oficial só precisará ser feita quando o código estiver pronto:

```
- uses: Igmorand/github-action-hello@main # take the main branch
```

Este método deve ser reservado para desenvolvimento e uso de suas ações. Não o use para ações de terceiros; o risco é muito grande para quebrar seu fluxo de trabalho ou de uma perspectiva de segurança. A prática atual é confiar em uma versão "fixa" de uma ação que garanta a estabilidade do código. O conceito de versionamento é visto em detalhes em um capítulo posterior neste livro; veja isso simplesmente como uma versão de software. Quando uma ação é estável e totalmente funcional, é costume que o código seja marcado para congelar sua versão. É então possível direcionar a tag, que serve como o número da versão.

```
- uses: 1gmorand/github-action-hello@v1 # V1 is the tag corresponding to a release
```
Na última maneira, a chamada via hash de uma ação tem como alvo um commit específico. Em alguns casos, essa maneira de fazer as coisas é considerada uma boa prática de segurança, mas vem com limitações. Este tópico é discutido no capítulo Conceitos avançados › Segurança.

```
uses:1gmorand/github-action- hello@4ad9596b7c626f5cef5b66419d00bafac1950066 # hash (SHA)of a commit
```

É o único método para garantir uma versão imutável da ação carregada em seu fluxo de trabalho. Se isso pode ser lógico à primeira vista, isso significa que se a ação, que está em um repositório próprio, altera ou corrige um bug nela, essa correção/melhoria nunca será cobrada pelo seu fluxo de trabalho. Por outro lado, se você referenciar uma ação "v1", seu fluxo de trabalho baixará quaisquer atualizações dela. Então, se o autor da ação publicar uma versão "v1.1",
ela será cobrada pelo seu fluxo de trabalho sem nenhuma intervenção de sua parte ou sem ser notificado porque v.1.1 é uma versão de lançamento menor de v.1.

Importante: Se você quiser saber mais sobre essas mecânicas, leia o capítulo dedicado: Criar uma Ação › Versionamento. Você encontrará todos os pontos de atenção e como usá-los seguindo as boas práticas.

Também há a opção de chamar uma Ação privada. Uma Ação privada é qualquer Ação que vem do mesmo repositório do qual é chamada. Esse mecanismo é útil quando você deseja usar uma Ação de sua criação sem expô-la ao público. Atualmente (embora esteja no roteiro do GitHub), uma ação deve estar em um repositório público para ser utilizável. Portanto, é impossível usar uma ação que viria de outro repositório pertencente a você sem ser exposto ao público.

Para usar uma Ação privada, basta especificar o caminho da pasta que contém os diferentes arquivos em sua ação:

`- uses: ./chemin/github-action-hello`

Por convenção, espera-se que ações privadas sejam armazenadas na pasta .github/actions, mas isso não é obrigatório. Por outro lado, fluxos de trabalho devem estar em .github/workflows.

`- uses: ./.github/actions/github-action-hello`

A combinação de ações e tarefas de execução oferece infinitas possibilidades. Portanto, é normal (até recomendado) usar as Ações o máximo possível e concluir o fluxo de trabalho com tarefas de execução quando nenhuma ação atende à sua necessidade ou se a necessidade é tão simples que o uso de uma ação de terceiros traria mais riscos do que benefícios.

## Execution within a container
A liberdade dada dentro do fluxo de trabalho permite que você instale todos os componentes/ferramentas/programas necessários para executar as tarefas definidas no seu fluxo de trabalho. No entanto, a instalação dessas ferramentas pode ser longa e tornar cada execução do fluxo de trabalho ineficiente.

O GitHub Actions permite que você execute tarefas dentro de um contêiner que será provisionado sob demanda. Além da vantagem de ser mais rápido, também permite ter o mesmo comportamento/ambiente, seja no computador do desenvolvedor ou por meio de um fluxo de trabalho em uma máquina virtual.

O exemplo a seguir, através da propriedade container, solicita ao fluxo de trabalho que baixe (docker pull) a imagem do contêiner "node", para iniciar uma instância deste contêiner e carregar dentro dele os diferentes comandos. Desta forma, não há necessidade de instalar o NodeJS no agente GitHub, pois a imagem do nó já possui todas as ferramentas necessárias.

```
jobs:
  build:
    runs-on: self-hosted
    container: 'node:current'
    steps:
      - uses: actions/checkout@v4
      - run: |
              npm install
              npm run build
```

Aviso: É necessário especificar o sistema operacional subjacente (propriedade runs-on) porque os contêineres serão necessariamente contêineres Linux ou Windows e precisam de sistemas operacionais correspondentes.

## Descubra novas Ações
A riqueza das Ações do GitHub é amplamente composta pelas ações criadas pela comunidade. No momento em que escrevo estas linhas, há mais de 9000 Ações publicadas no marketplace do GitHub: https://github.com/marketplace?type=actions.

Marketplace: Ações

De lá, você pode acessar a página detalhada de cada ação. Esta página é extremamente importante porque lhe dirá a maneira de integrar esta ação em seu fluxo de trabalho, seus parâmetros, mas também informações importantes, como o autor ou o link para o repositório da ação, o que lhe fornecerá ainda mais informações, como a possibilidade de analisar seu código-fonte:

Marketplace: página detalhada

Quando você tiver alguma necessidade especial em um fluxo de trabalho, incluindo uma tarefa simples como instalar uma ferramenta, comece verificando se uma ação produzida por terceiros já existe. Usar sua ação provavelmente permite que você economize tempo, adicione recursos e simplifique seu fluxo de trabalho. Se você não encontrar o que está procurando entre as ações existentes, não hesite em crie sua própria Ação. Este tópico é abordado em detalhes no capítulo "Criar uma Ação Personalizada".
### O editor de fluxo de trabalho
Com a prática, você ficará mais confiante para escrever fluxos de trabalho manualmente; no entanto, para facilitar sua escrita, o GitHub fornece um editor web dedicado à escrita de fluxos de trabalho que oferece recursos úteis, como um mecanismo de busca integrado para ações, linting de estrutura e preenchimento automático.

### Editor de fluxo de trabalho
Este editor é ativado automaticamente ao abrir um arquivo YAML (a extensão *.yml ou *.yaml é obrigatória) localizado na pasta ".github/workflows". Se o arquivo YAML estiver em outro lugar, o GitHub o ignorará como fluxo de trabalho (= não será acionado) e o editor proposto será o editor de arquivo padrão.
Pessoas que preferem trabalhar diretamente em seu computador com seu editor de código preferido também podem usar o mesmo facilidade, especialmente se o editor fornecer extensões de preenchimento automático. Por exemplo, o Visual Studio Code permite que você instale uma extensão que permite obter o mesmo preenchimento automático, a detecção de erros em seu YAML, mas também ver diretamente do Visual Studio Code os logs e os resultados de seus fluxos de trabalho, permitindo que você trabalhe totalmente localmente sem precisar abrir o portal da web.
Dicas: Esta extensão foi escrita por Christopher Schleiden e pode ser encontrada aqui: `https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions`
É muito mais avançado do que o editor nativo do portal da web.
### Exercícios - As etapas
As etapas são a parte mais importante de um fluxo de trabalho e, se nesta fase do livro, cobrimos apenas o básico, é importante ter bases sólidas adquiridas por meio de alguns exercícios.
### Exercício 1
Para este primeiro ano, escreva um fluxo de trabalho de gatilho manual que exiba qualquer mensagem no console. Para apimentar o exercício, vamos adicionar uma pequena restrição: não use o comando run, apenas ações do marketplace.
### Exercício 2
Uma pessoa publica uma ação chamada "fake-action" no marketplace com uma versão e uma tag igual a "v1.1.0". Esta ação não requer nenhum parâmetro em particular. Em vez disso, seu fluxo de trabalho faz referência à ação com o seguinte formato:

O fluxo de trabalho está funcionando?

E se o formato for o seguinte, o fluxo de trabalho funcionará corretamente?

`- uses: user/fake-action@1.1.0 # note que "v" está faltando`

Então você especifica o seguinte formato.

`- uses: user/fake-action@v1.1 # note que a versão do patch está faltando`

O autor da fake-action publica uma nova versão (versão "1.1.1") e, em seguida, uma segunda alguns dias depois (versão "1.2.1"). Se você executar seu fluxo de trabalho novamente (usando "fake-action@v1.1"), qual versão é carregada entre "1.1.0", "1.1.1" e "1.2.1"?
Não hesite em consultar o capítulo Criar uma ação > Controle de versão para entender a mecânica.
### Exercício 3
Você deseja usar uma ação que não está publicada no mercado e chamada SuperAction. Esta ação está no repositório do usuário "someone". Este usuário não publicou nenhuma versão de sua ação, apenas manteve o repositório público. Além disso, esta Ação recebe dois parâmetros: o "nome" de uma pessoa e sua "idade".
Qual formato seu fluxo de trabalho deve ter para chamar esta ação corretamente?
## As matrizes
Um fluxo de trabalho pode conter vários trabalhos. Essa flexibilidade permite, por exemplo, compilar com um único fluxo de trabalho tanto um aplicativo móvel Android no Linux quanto um iOS no macOS. Também pode ser útil compilar o mesmo código-fonte com diferentes configurações do compilador, como um recurso habilitado ou não (chamado sinalizador de recurso), ou simplesmente compilar o mesmo aplicativo em várias versões da estrutura subjacente (Java, NodeJS, etc.).

Suponha que esses vários trabalhos possam realizar várias ações em uma única execução. Nesse caso, isso tem a desvantagem de ter um arquivo de fluxo de trabalho muito longo e muitas linhas de código duplicadas, levando a uma manutenção mais complexa e possíveis erros. O GitHub Actions oferece uma solução para isso: as matrizes.
Uma matriz, que é declarada como um conjunto de valores-chave, pode gerar proativamente mais trabalhos a partir de uma única definição: cada versão "gerada" é chamada de expansão. Vantagem: um arquivo, uma definição de trabalho, mas n trabalhos gerados automaticamente e configurados em tempo de execução.
As matrizes são declaradas no nível do trabalho, como uma propriedade de uma estratégia e, em seguida, como uma subpropriedade chamada matriz, incluindo uma (ou mais) matriz(s) do tipo "chave: [valor1, valor2]". Os valores declarados serão acessíveis como variáveis por cada expansão.
Neste primeiro exemplo, que visa gerar jobs com base no sistema operacional, a definição do job tem uma matriz cuja chave é os e cujos valores são "self-hosted", "windows-latest" e "macos-latest". A matriz injeta em cada expansão (serão, portanto, três delas, uma para cada valor) a variável chamada os com o respectivo valor. Esta variável fica então disponível como ${{ matrix.os }} dentro de cada job, permitindo, neste exemplo, obter um sistema operacional dinâmico.

A declaração de uma matriz:
```
jobs:
myjob:
strategy:
Jobs
matrix:
os: [self-hosted, macos-latest, windows-latest]
runs-on: ${{ matrix.os }}
steps: # the actions #
```

Ao executar o fluxo de trabalho, você vê uma execução única do fluxo de trabalho, mas ela contém a execução de três tarefas paralelas, para as quais os valores das matrizes são injetados:

## Execution of the matrix
Observe que as matrizes também podem ser declaradas em um formato um pouco mais legível:
```
strategy:
matrix:
OS:
-self-hosted
-macos-latest
-windows-latest
```
Também é possível declarar várias matrizes, o que causará uma combinação de valores. Aqui, teremos 6 combinações possíveis e, portanto, 6 jobs: ubuntu+node10, ubuntu+node16, windows+node10, windows+node 16, macos+node10 e macos +node16:

```
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [node10, node16]
steps:
- name: Setup Node
uses: actions/setup-node@v4
with:
node-version: ${{ matrix.node}}
```

Importante: Um fluxo de trabalho não pode ter mais de 256 expansões de trabalho. Nesse caso, o fluxo de trabalho simplesmente não será iniciado.

## Exclusions
Matrizes combinatórias podem, portanto, gerar todas as combinações desejadas. Você pode querer excluir uma ou mais combinações porque sabe que essa combinação não é útil. Em vez de gerar expansão e adicionar uma condição nas etapas para fazer "nada" neste caso específico, é possível evitar essa expansão em particular usando a propriedade exclude.

No exemplo a seguir, temos duas matrizes (uma com 3 valores, a outra com 2 valores) e, portanto, 6 expansões no total. A adição de exclusão impedirá a combinação "macos-latest + 12":

```
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [10, 12]
exclude:
- os: macos-latest
node: 12 # Note that there is no "-" in front of the key "node" because it is part of the same object as "os"
```

Então, apenas 5 expansões serão executadas:

### Inclusions
Por outro lado, você pode achar mais fácil adicionar combinações específicas. Por exemplo, queremos que as 6 expansões base testem a combinação NodeJS 8 + macOS no caso a seguir.

```
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [10, 12]
include:
- os: macos-latest
  node: 8
```
Esse recurso de inclusão é muito mais útil do que pode parecer à primeira vista. De fato, ele permite, por exemplo, configurar compilações de sombra para verificar se o aplicativo pode operar em casos imprevistos, por exemplo, uma versão do framework normalmente não suportada pelo aplicativo.

Por exemplo, aqui está um fluxo de trabalho destinado a compilar o aplicativo com Java 8 e 11 e adicionar uma combinação para compilar com Java 14. Essa combinação também adiciona uma chave "testing" atribuída à propriedade padrão de um trabalho continues-on-error. Essa propriedade especifica que um trabalho deve continuar, não importa o estado de suas etapas.

```
jobs:
build:
strategy:.
matrix:
java: [8, 11]
testing: [false]
include:
-java: 14
testing: true
continue-on-error: ${{ matrix.testing }}
```

## The concept of fail-fast
Quando você executa uma matriz, cada expansão é executada em paralelo em seu agente para ir mais rápido. Quando uma das expansões falha, as outras expansões são canceladas e param no meio de suas tarefas.

Esse comportamento é o comportamento padrão de uma estratégia porque é padrão pensar que a partir do momento em que parte do fluxo de trabalho falha. Portanto, o fluxo de trabalho em sua totalidade não pode ser considerado um sucesso, e que é necessário parar qualquer trabalho inútil que seria caro em tempo (e financeiramente). Isso é chamado de fail fast para parar o mais rápido possível, para corrigir rapidamente e tentar novamente.
Na captura a seguir, você pode ver que as versões do Windows e do macOS mudaram para o status "cancelado" assim que o fluxo de trabalho do Ubuntu falhou.

No entanto, isso pode acontecer, seja porque você está depurando um fluxo de trabalho ou simplesmente porque deseja que cada expansão de uma matriz conclua suas tarefas. Portanto, você tem que desabilitar esse comportamento fail-fast. Para fazer isso, adicione a propriedade fail-fast (com o valor false) à sua estratégia.

```
strategy:
matrix:
os: [self-hosted, macos-latest, windows-latest]
fail-fast: false # expansions won't stop
```

Neste momento, cada expansão de matriz continuará até que seja concluída com sucesso ou falhe. No nosso caso, as versões macOS e Windows continuaram até o fim, mesmo que a expansão ubuntu tenha falhado:

Aviso: Como você verá no próximo capítulo sobre runners, workflows paralelos impactam a soma dos minutos de execução e, portanto, impactam o custo mensal, principalmente se você desabilitar o fail-fast e deixar os workflows continuarem.

### Exercícios
Vamos colocar em prática através de alguns exercícios.

### Exercício n°1
Neste primeiro exercício, você deve editar o próximo workflow para compilar a aplicação com duas versões do .NET Framework (4.2.x e 5.0.x), mas também precisa compilar duas versões usando um parâmetro respectivamente debug e release:

```
name: "matrix - exercise 1"
jobs:
build:
strategy:
matrix: # TO BE COMPLETED
steps:
- name: Retrieve source code
  uses: actions/checkout@v4
- name: Install .NET
  uses: actions/setup-dotnet@v4
   with:
dotnet-version: # TO BE COMPLETED
- name: Restore dependencies
  run: dotnet restore
- name: Build
   run: dotnet build --no-restore --configuration ${{ env.buildMode}}
env:
buildMode: # TO BE COMPLETED
```

### Exercise n°2
Quantos trabalhos são gerados com esse fluxo de trabalho?

```
name: "matrix - exercise 2"
on:
workflow_dispatch:
jobs:
build:
runs-on: ${{ matrix.os}}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [10, 12]
include:
- os: macos-latest
 node: 8
exclude:
- os: macos-latest
  node: 10
- os: macos-latest
node: 8
steps:
- run: echo "I run on ${{ matrix.os }} with the Node version $ {{ matrix.node }}"
```

### Exercise n°3
Nossa necessidade é criar um fluxo de trabalho que implante nosso aplicativo em oito servidores de produção. O número de servidores no futuro pode aumentar, e é inaceitável duplicar etapas. Portanto, queremos usar as matrizes para simplificar nosso fluxo de trabalho, conforme mostrado pelo seguinte YAML:
```
runs-on: self-hosted
strategy:
matrix:
server: [prod1, prod2, prod3, prod4, prod5, prod6, prod7, prod8]
steps:
 - name: Deploy application
    run: echo "Deploy on ${{ matrix.server}}"
```

Este fluxo de trabalho funciona perfeitamente, mas a implantação em paralelo em todos os servidores de produção pode causar interrupção do serviço para os usuários. Nossa equipe de DevOps propõe fazer a implantação progressiva (implantação canário) e implantar nos servidores, no máximo 2 por vez. Altere o YAML para obter o comportamento esperado.

Dica: leia a documentação oficial sobre matrizes para descobrir como fazer isso. Procure controlar o paralelismo.

## Runners
Os agentes, também conhecidos como runners ou "runners hospedados no GitHub", são pequenos programas com apenas uma coisa a fazer: executar as tarefas dadas a eles e transmitir seus resultados de volta.

## How it works
Um agente é um orquestrador; sua única "inteligência" é executar as tarefas descritas em um arquivo de fluxo de trabalho. O comportamento interno é o seguinte:
1. Um evento é acionado no GitHub (push, pull_request, etc.)
2. O GitHub verifica os fluxos de trabalho do repositório para ver se um ou mais fluxos de trabalho têm um gatilho correspondente ao evento
3. O GitHub aciona a criação de um novo agente hospedado (é uma pequena máquina virtual, chamada de ambiente virtual)
4. O GitHub reserva o agente para um fluxo de trabalho específico (o agente só funcionará para este fluxo de trabalho)
5. O GitHub lê o arquivo YAML do fluxo de trabalho para detectar informações para injetar (segredos, variáveis de ambiente, variáveis do GitHub)
6. O GitHub envia tudo para o agente recém-criado
7. O agente executa as tarefas uma por uma, enviando o resultado para o GitHub
8. O GitHub integra os resultados, armazena-os em seu banco de dados e os exibe no portal, o que nos permite monitorar em "tempo real" o que acontece
9. Uma vez que o agente concluiu seu trabalho, o agente é destruído
No entanto, um agente é um programa com capacidades muito limitadas; ele só pode executar comandos sequencialmente e retornar seu resultado. Qualquer ação (compilar código, converter um arquivo, implantar, escanear, etc.) só é possível por meio da instalação de ferramentas de terceiros no sistema, ou por estarem presentes por padrão no sistema operacional escolhido, ou porque você solicita ao agente para instalá-las por meio de uma linha de comando durante o fluxo de trabalho.

## Pre-installed tooling
Se for possível instalar qualquer ferramenta em um agente usando uma tarefa que baixaria e iniciaria um instalador, os agentes fornecidos pelo GitHub têm vários softwares e frameworks pré-instalados. Isso permite que esses agentes já estejam prontos para uso e tornem os fluxos de trabalho mais rápidos.
Nos agentes do Windows, você encontrará .NET, Java, GO, PHP sendo pré-instalados e ferramentas CLI para implantar no Azure, AWS ou até mesmo AliCloud. No Linux, você terá, entre outras coisas, Mono, Ruby, GNU C++, Google Cloud SDK, etc.
Se quiser saber em detalhes a lista de ferramentas pré-instaladas em cada sistema, a lista atualizada é mantida no repositório oficial: https://github.com/actions/virtual- enviroments/tree/main/images

Se um programa necessário para seu fluxo de trabalho não estiver presente, basta instalá-lo você mesmo. Crie (ou use uma existente) uma tarefa que baixe a ferramenta necessária no início do seu fluxo de trabalho. Por exemplo, o livro que você está lendo atualmente foi escrito em Markdown, mas precisava de ferramentas para ser transformado em PDF/EPUB. Para fazer isso, o fluxo de trabalho precisa instalar duas ferramentas (Pandoc e LaTeX) antes que você possa usá-las.

```
runs-on: ubuntu-20.04
steps:
name: installing Pandoc
run: sudo apt-get install --assume-yes pandoc
- name: installing pdflatex + modules
run: |
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-xetex
- name: Generating the PDF version
run: pandoc -V documentclass-memoir --pdf-engine-xelatex from=markdown-blank_before_header -s $(cat _includes.txt) -o './ dist/GitHub Actions-par la pratique.pdf'
working-directory: ./book
```

As possibilidades de ferramentas são infinitas; desde que o fluxo de trabalho possa baixar uma ferramenta e iniciar uma linha de comando (sem nenhuma interface gráfica de usuário) para instalá-la ou executá-la, qualquer software de terceiros deve ser fácil.

## Network considerations
O fato de os agentes gerenciados pelo GitHub (GitHub hosted runners) serem hospedados na nuvem Microsoft Azure é uma vantagem clara: isso evita qualquer custo de manutenção específico (hardware, licença do sistema operacional, salário de pessoas, etc.). No entanto, isso também implica que esses agentes estão fora da rede da sua empresa.

Se isso não é um problema para a maioria dos fluxos de trabalho, incluindo fluxos de trabalho de compilação (CI) que geralmente não precisam de nenhuma conexão específica, isso pode ser muito diferente para fluxos de trabalho de implantação. De fato, é comum que redes corporativas sejam fechadas para qualquer acesso externo por motivos de segurança; portanto, um agente de implantação externo (por estar na nuvem) seria bloqueado, conforme mostrado no diagrama a seguir:

![](img/github-runners-network.png)

Devido a essa restrição de rede, alguns casos de uso em que os agentes do GitHub não atendem à necessidade ou em que a equipe de rede/segurança proíbe seu uso. A resposta para esse problema é o uso de agentes "auto-hospedados".

## The self-hosted runners
O GitHub fornece agentes (chamados de "hosted runners" ou "managed agents") que fornecem para cada execução um ambiente "descartável" para compilar e/ou implantar seus aplicativos. Se eles são adequados para a maioria dos usos, em muitos casos, infelizmente não são suficientes. Se tivéssemos, por exemplo:
- [x] A necessidade de compilar em um sistema operacional diferente dos propostos por padrão
- [x] A necessidade de compilar um aplicativo com acesso a hardware específico ou licença associada a este hardware (uso comum em IoT)
- [x] A necessidade de implantar em servidores que não são acessíveis pela Internet (onde os agentes hospedados do GitHub estão)
- [x] Só precisa de um servidor de compilação com mais poder de computação (memória, CPU)

Para muitos cenários possíveis em que os agentes padrão não são suficientes, existe uma solução: os "self-hosted runners", agentes que você mesmo gerencia.

![](img/github-runners-network-01.png)

## Adding a new agent
Os agentes auto-hospedados têm a vantagem de serem mais flexíveis e são livres do ponto de vista da licença. Ainda assim, eles têm um custo de manutenção, pois é sua responsabilidade garantir que eles estejam atualizados (a versão do agente do GitHub) e em servidores continuamente protegidos/corrigidos. Também devemos adicionar o custo implícito do servidor onde o agente está instalado (por exemplo, licença do sistema operacional, equipamento, eletricidade) e garantir a resiliência da plataforma, o que pode implicar ter vários servidores. Apesar desse custo, os agentes auto-hospedados geralmente fazem parte da solução em projetos corporativos.
Você pode adicionar um número infinito de agentes por projeto, e sua instalação leva apenas alguns minutos. A declaração de um runner auto-hospedado é feita na tela Configurações > Ações do seu repositório. Nesta tela, à direita, está localizado um bloco listando todos os runners registrados deste repositório:

Clique em "Adicionar agente" para abrir uma nova tela que permite selecionar o sistema operacional correspondente ao servidor que hospedará seu runner. Essa escolha é crítica porque, ao instalar um runner em um runner do Windows, apenas fluxos de trabalho do "windows" (propriedade runs-on) serão executados por esse runner. Portanto, se um dos seus fluxos de trabalho exigir a execução de um trabalho no Windows e outro no Linux, você precisará de dois servidores diferentes com dois sistemas operacionais e dois runners.

Aviso: se um agente estiver vinculado a apenas um repositório (exceto com o GitHub Enterprise), ainda será possível instalar vários agentes gerenciando vários projetos lado a lado no mesmo computador. Além dos problemas de segurança, os riscos de colisão (aplicativos instalados por cada projeto, incompatíveis entre si) são altos. Além disso, os diretórios de trabalho contêm uma cópia do código-fonte baixado e outros itens que potencialmente contêm dados confidenciais. No final do livro, no apêndice, um capítulo aborda em detalhes a criação de um agente em contêiner auto-hospedado, permitindo substituir essas limitações e reduzir esses riscos.

Declarar um novo runner requer duas etapas. Primeiro, a instalação do runner. Após escolher o sistema operacional, o portal da Web fornece um comando para executar no servidor de destino; esse comando baixa e instala o runner corretamente.

Ações / Adicionar runner auto-hospedado
Adicionar um runner auto-hospedado requer que você baixe, configure e execute o GitHub Actions Runner. Ao baixar e configurar o Github Actions Runner, você concorda com os Termos de Serviço do GitHub ou os Termos de Serviço Corporativos do GitHub, conforme aplicável.

## Download the latest runner package
Uma vez instalado, o segundo passo é configurar o runner para interagir com seu repositório de forma segura. O portal da Web gera um comando contendo a URL do repositório e um token de autenticação, que permite que o runner acesse o acesso de leitura/gravação ao seu repositório. O comando se parece com isso:

```
# Runner configuration
$ ./config.cmd --url https://github.com/lgmorand/book-github-actions --token C3C13STUNF4K3TOK3N
```

Quando executado, o comando pede várias informações para personalizar o agente, como seu nome, seus rótulos e o tipo de execução (como um serviço ou manual). Claro, você também pode deixar esses valores vazios e deixar que a configuração use os valores padrão:

## Runner configuration
Após a conclusão da configuração, o agente deve aparecer registrado no portal do GitHub com seu nome e rótulos. No entanto, seu status é inativo (offline). Esse status indica que o GitHub não se comunica com o agente porque um firewall está bloqueando as comunicações ou simplesmente porque o agente, embora instalado, não foi iniciado.

Aviso: Um agente auto-hospedado é vinculado a um e apenas um repositório. Se você quiser compartilhar um agente entre repositórios, deverá ter uma conta do GitHub Enterprise e o executor no nível da organização.

Para iniciar o executor, uma linha de comando é suficiente. Durante a execução deste comando, o agente se reporta ao GitHub como disponível e começa a escutar/aguardar.
Após iniciado, o executor aparece como "Ocioso", o que significa que está pronto e aguardando para receber um fluxo de trabalho.

Executor disponível e ativo

Informações: Como veremos mais adiante neste capítulo, os rótulos são usados ​​para reconhecer os executores e suas capacidades ou selecionar explicitamente um executor específico que executará o fluxo de trabalho.

### How to use our self-hosted runner?
Quando um agente está devidamente registrado (status Idle), precisamos apenas informar ao workflow para usá-lo. Essa atribuição é feita por meio da propriedade "runs-on: self-hosted".

`runs-on: self-hosted`

A propriedade, como escrito acima, informa ao GitHub que o fluxo de trabalho deve ser executado por um dos agentes auto-hospedados. O texto "auto-hospedado" é um dos rótulos adicionados automaticamente ao agente durante sua configuração. Vários rótulos padrão são adicionados de acordo com a máquina na qual o agente está instalado:

- [X] auto-hospedado: adicionado a todos os agentes auto-hospedados
- [X] linux, windows ou macOS: correspondente ao sistema operacional subjacente
- [X] x64, ARM ou ARM64: especifica a arquitetura do processador

Esses rótulos, chamados de "rotas", permitem que você direcione um agente ou um grupo de agentes específico. Assim, ao combiná-los, é possível direcionar especificamente um agente cujas características técnicas executarão tarefas de fluxo de trabalho; na realidade, essas tarefas decidem implicitamente o tipo de agente necessário para sua conclusão adequada. O exemplo a seguir informa ao GitHub que o fluxo de trabalho deve ser executado por um agente auto-hospedado com um processador de 64 bits e instalado em um sistema operacional Windows:

``runs-on: [self-hosted, windows, x64]``

Os rótulos são declarados ao registrar o agente, mas também podem ser adicionados posteriormente usando a interface do portal do GitHub:

Esta prática é especialmente útil quando seu agente está localizado em um servidor específico (por exemplo, um servidor de produção) ou um servidor fisicamente conectado a um dispositivo de hardware (IoT ou robótica). Ela permite que você dê um rótulo exclusivo a este agente e o direcione de forma muito específica. A escolha de um agente pelo GitHub é feita procurando os agentes candidatos que correspondem a todos os rótulos.

```runs-on: self-hosted, raspberry1 # target the runner which has both these labels```

## Network access
Suponha que o principal ativo dos executores auto-hospedados esteja sendo executado dentro da sua rede local e tenha apenas comunicações de saída. Nesse caso, é necessário permitir que o agente se comunique com o GitHub e abra os fluxos de comunicação relevantes. Aqui está a lista completa de URLs que devem ser abertas no seu firewall para permitir que o agente se comunique, coloque ou recupere itens no/do GitHub.

Necessário para operações essenciais:
```
github.com
api.github.com
*.actions.githubusercontent.com
````

Necessário para baixar ações:
```
codeload.github.com
Needed for uploading/downloading job summaries and logs
actions-results-receiver-production.githubapp.com
*.blob.core.windows.net
```

Necessário para atualizações da versão do runner:
```
objects.githubusercontent.com
objects-origin.githubusercontent.com
github-releases.githubusercontent.com
github-registry-files.githubusercontent.com
````

Necessário para carregar/baixar caches e artefatos de fluxo de trabalho:
```
*.blob.core.windows.net
Needed for retrieving OIDC tokens:
*.actions.githubusercontent.com
````

Necessário para baixar ou publicar pacotes ou contêineres no GitHub Pacotes:
```
*.pkg.github.com
ghcr.io
```

It will also be necessary to open access to the servers in your local network on which you want the agent to deploy your applications.

## Differences between the two types of runners
Os runners autogerenciados trazem mais liberdade e mais recursos, mas vêm com mais restrições. Toda a parte normalmente gerenciada pelo GitHub (gerenciamento de atualizações, atualização dos componentes do sistema) agora deve ser gerenciada manualmente com uma sobrecarga não desprezível.

### Runners managed by GitHub:

- [X] Atualização automática do sistema operacional, ferramentas/pacotes pré-instalados e o próprio agente.
- [X] Mantido e gerenciado inteiramente pelo GitHub
- [X] Fornece uma nova instância limpa para cada execução
- [X] Use o tempo de execução gratuito oferecido pelo GitHub e, em seguida, inclua um custo se o limite for excedido

### Self-managed runners (self-hosted):
- [X] O próprio agente atualiza automaticamente. Você é responsável por atualizar o sistema operacional e todos os outros componentes
- [X] Ele pode ser instalado em quase todos os lugares, no computador local, em um servidor físico, em uma máquina virtual na Nuvem
- [X] Permite ser associado a uma configuração completamente personalizada (hardware, capacidade de computação ou software)
- [X] Reutiliza a mesma instância para cada novo pipeline
- [X] São completamente gratuitos, independentemente da duração do uso

Se globalmente, os executores do GitHub responderão à maioria dos casos de uso e, portanto, devem ser sua primeira escolha. Nesse caso, os executores auto-hospedados serão relevantes para necessidades de implantação feitas com fortes restrições de segurança de rede. A combinação de ambos traz o melhor dos dois mundos para atender a todos os cenários possíveis.

### Exercises - Runners
Os Runners são a base do GitHub Actions; vamos tentar usá-los por meio de alguns exercícios práticos.

#### Exercise n°1
Neste primeiro exercício, no repositório de sua escolha, declare um runner auto-hospedado que você instalará em seu computador local. Nomeie-o como "my-agent" e garanta que ele esteja listado no portal da web do GitHub como um agente ativo (status "Idle").
Em uma segunda etapa, declare qualquer fluxo de trabalho e faça-o ser executado pelo seu runner. Quais são os meios à sua disposição para garantir que este agente execute seu fluxo de trabalho?

#### Exercise n°2
Altere seu fluxo de trabalho para navegar na raiz da unidade de disco onde ele está sendo executado atualmente (ou qualquer outra pasta), liste os arquivos e adicione um comando para criar um arquivo de texto vazio.
Como o fluxo de trabalho se comporta e o que você pode concluir?

#### Exercise n°3
O projeto terminou; é hora de limpar os recursos não utilizados. Para este último exercício, desinstale corretamente o runner. O procedimento de desinstalação é feito clicando nas opções do seu runner listadas no portal da web. Em seguida, siga as instruções e confirme se o agente não está mais listado.

#### Exercise n°4
Você não tem mais um runner, mas um fluxo de trabalho sempre faz referência a ele. O que acontece se nenhum runner auto-hospedado estiver disponível? O fluxo de trabalho inicia ou não inicia? O fluxo de trabalho inicia e então trava? O fluxo de trabalho retorna a um runner gerenciado pelo GitHub? Inicie o fluxo de trabalho e confirme se sua previsão estava correta.

## The variables
Como qualquer linguagem de programação ou script, as variáveis ​​permitem que você defina chaves com valores reutilizáveis ​​dentro dos fluxos de trabalho.

### Declaration of a variable
A declaração de uma variável é feita adicionando a propriedade env e declarando valores-chave, conforme mostrado no exemplo a seguir:
```
env:
MY_VARIABLE_FIRSTNAME: John
MY_VARIABLE_NAME: "Doe" # quotation marks are not mandatory even if the value contains spaces
MY_VARIABLE_MULTILINE:|
hello
to all
!
```

Os nomes de variáveis ​​diferenciam maiúsculas de minúsculas; para evitar confusão e melhorar a legibilidade, é um uso comum escrevê-los todos em letras maiúsculas, mas isso não é obrigatório. Além disso, a nomenclatura permite caracteres alfanuméricos e o caractere sublinhado (_).
Uma vez definida uma variável, estaticamente ou dinamicamente, ela pode ser chamada com a sintaxe ${{ env.MY_VARIABLE }} que diz para carregar a MY_VARIABLE do contexto env, que representa o contexto do nível em que estamos, seja o fluxo de trabalho, o trabalho ou a etapa atual.

```
env:
#definition at job level
MY_VARIABLE: hello
#variable definition
steps:
- run: echo ${{ env.MY_VARIABLE }} # display "hello" in the console
```
The variable can be used to replace any value (but not a key), to be used within a command (example above) or an action.

### Dynamic variables
Em alguns casos, a variável é desconhecida e será definida durante o fluxo de trabalho, potencialmente passando de uma etapa para outra. Com o GitHub Actions, você não pode atribuir uma variável como faria normalmente, como $MYVARIABLE=my value. Em vez disso, é necessário concatenar a chave e o valor e transferi-los para a variável global $GITHUB_ENV:

`echo "NAME_VARIABLE=value" >> $GITHUB_ENV`

Tecnicamente falando, você escreve o nome da variável e seu valor em um arquivo temporário. Este arquivo é lido no final da etapa, e seus dados são injetados nas variáveis de ambiente. Portanto, quando você define dinamicamente o valor de uma variável em uma etapa, o novo valor desta variável só estará acessível para as etapas seguintes, não para a etapa atual. O fluxo de trabalho a seguir exibe "amarelo - amarelo - verde".

```
job:
runs-on: self-hosted
env:
VARIABLE: yellow
steps:
 - run: echo $VARIABLE # displays "yellow", default value
 - run: |
echo "VARIABLE=green" >> $GITHUB_ENV
echo $VARIABLE # displays "yellow", because we're still in the same step
run: echo $VARIABLE # displays "green"
```

### Scope of variables
As variáveis podem ser definidas em diferentes níveis de um fluxo de trabalho e, portanto, operar com diferentes escopos. Vimos um exemplo com variáveis definidas em um nível de trabalho, mas é possível defini-las:

- [X] No nível do fluxo de trabalho
- [X] No nível do trabalho
- [X] No nível da etapa

Dependendo do nível, a variável será acessível por todos os níveis subjacentes. Assim, uma variável definida em um nível de fluxo de trabalho será acessível por todos os trabalhos e etapas, enquanto uma variável definida em um nível de etapa será acessível apenas por ela. Isso é importante se você precisar passar uma variável de uma etapa para outra.

Se diferentes variáveis com o mesmo nome forem declaradas em níveis diferentes, então será a variável de escopo mais específica (nível mais baixo) que será escolhida. Analise o seguinte fluxo de trabalho e o mecanismo de prioridade:

```
env:
MYVARIABLE: value1
MYVARIABLE2: value1
jobs:
test_variables:
runs-on: self-hosted
env:
MYVARIABLE: value2
steps:
 run: echo $MYVARIABLE #value2 appears because variable at the job level
 run: echo ${{env.MYVARIABLE}} # value2 appears because variable at the job level
- name: variable env we redefinition at step level
env:
MYVARIABLE: value3
run: echo ${{env.MYVARIABLE}} # value3 appears because variable at step level
- name: variable direct MYVARIABLE2
  run: echo $MYVARIABLE2 #value1 displays because variable at the workflow level
```

## Output variables
O uso de variáveis globais ($GITHUB_ENV) permite que você responda à maioria dos usos para transmitir uma variável entre duas etapas. Isso, no entanto, requer que você tenha controle total dos nomes das variáveis dentro do fluxo de trabalho completo. Isso não pode ser garantido se você usar ações de terceiros que definem variáveis internamente. Além disso, isso pode causar uma colisão de variáveis se você usar a mesma ação duas vezes com configurações diferentes. A resposta perfeita é usar uma variável de saída: uma variável de saída é uma variável associada a uma etapa específica, mas é visível de outras etapas.

A definição de uma variável de saída de uma etapa é feita usando o comando ">> $GITHUB_OUTPUT". Isso torna possível definir uma variável vinculada a esta etapa e cujo escopo de nomenclatura também será vinculado.

``run: echo "NAMEVARIABLE=hello" >> $GITHUB_OUTPUT``

É necessário então realizar um segundo passo, para acessar um passo: dar a ele um nome através do id da propriedade.

```
steps:
-id: myStep
echo "NAMEVARIABLE=hello" >> $GITHUB_OUTPUT
```

Depois que uma etapa obtém um id, é possível referenciar sua variável de saída com a fórmula $ {{ steps.STEPID.outputs.NAMEVARIABLE }}.

```
steps:
-id: myStep
run: echo "NAMEVARIABLE=hello" >> $GITHUB_OUTPUT
- run: echo ${{ steps.myStep.outputs.NAMEVARIABLE}}
```


Muitas vezes, você encontrará variáveis ​​de saída ao usar ações do marketplace porque é a maneira mais limpa de retornar informações ao fluxo de trabalho pai.

## The built-in environment variables
Além das variáveis ​​que você cria, há muitas variáveis ​​predefinidas disponíveis dentro do seu fluxo de trabalho. Aqui está uma lista (parcial) delas:

| Variable     | Description |
| ----         | ----        |
| CI           | It is always equal to true |
| GITHUB_WORKFLOW | The name of the workflow |
| GITHUB_RUN_ID   | A unique number for each run within a repository. This number does not change if you re-run the workflow run. |
| GITHUB RUN_NUMBER |  An incremental number representing the number of executions of the same workflow. This number begins  at 1 for the workflow's first  run and increments with each new run. This number does  not change if you re-run the workflow run. |
| GITHUB JOB        |  The job_id of the current job. |
| GITHUB_ACTION     | Unique identifier (id) of an action |
| GITHUB_ACTIONS    | true if executed by GitHub Actions. false if running locally  on your computer; useful for  testing |

```
GITHUB_ACTOR
Name of the person or application that started the workflow
runner/work/my-repo-name/
my-repo-name.
GITHUB_SHA
The Hash (SHA-1) of the
GITHUB REPOSITO Full name of the repository
RY
GITHUB_EVENT_N Name of the event that
commit that triggered the
workflow. For example,
dc57e9addd1bbba026c5c71f5
6ad9285139967ec
AME
triggered the workflow
GITHUB_REF
The branch or tag that
GITHUB_EVENT_PA The path of the file comprising
TH
all data from the webhook
event. For example, /github/
workflow/event.json.
GITHUB_WORKSPA The path of the current
CE
workspace. This workspace is a copy of the repository if the workflow uses the action actions/checkout. If you do not use it, the folder is simply empty. For example, /home/vtriggered the workflow. For example, refs/heads/my- branch. If no branch or tag is available for this event, then
the variable is not available.
GITHUB_HEAD_REF Only for pull requests. Contains the name of the branch head
GITHUB_BASE_REF Only for pull requests. Contains the name of the branch base
GITHUB_SERVER_URL Returns the GitHub server
GITHUB_API_URL
URL. For example, https:// github.com.
Returns the URL of the
API. For example, https:// api.github.com.
GITHUB GRAPHQL Returns the URL of the _URL GraphQL API. For example, https://api.github.com/graphql.
```

Uma das variáveis que você usará com mais frequência é a variável GITHUB_TOKEN que está no contexto dos segredos. Esta variável contém um token de autenticação que permite que você interaja como "você". O usuário acionou o fluxo de trabalho e permite que você execute tarefas no repositório onde o fluxo de trabalho está localizado. Se seu fluxo de trabalho quiser criar elementos (issues, pr, releases, etc.), ele precisará deste token de autenticação.

```
steps:
- run: ./script --token {{ secrets.GITHUB_TOKEN }}
```

Essas poucas variáveis predefinidas são apenas uma pequena parte das informações que é possível usar. Algumas não têm uma variável predefinida, mas ainda são recuperáveis dentro de um dos contextos existentes. O contexto do github é o principal e tem uma centena de propriedades detalhadas relativas ao fluxo de trabalho, como o evento que disparou o fluxo de trabalho, o repositório, seu proprietário e muitos outros.

Para exibi-lo, como outros contextos (env, strategy, matrix, steps, runner), uma solução simples consiste em converter o contexto em JSON e depois exibi-lo no console:

``run: echo "${{ toJson(github)}}" # Do not forget the quotation marks, or the JSON will crash your workflow``

Bom saber: A função toJson() é uma das várias funções disponíveis por padrão no GitHub Actions. O GitHub oferece os métodos toJson(), fromJson(), contains(), startsWith(), endsWith(), format() e hashFiles(). A documentação oficial é suficientemente detalhada sobre seu uso para não cobri-lo neste livro.

Isso permite ter o nome de todas as propriedades do contexto (seu número muda dependendo do evento de gatilho do fluxo de trabalho):

```
{
"token":
"job": "build",
"ref": "refs/heads/main",
"repository": "lgmorand/test",
"repository_owner": "lgmorand",
#"repositoryUrl": "git://github.com/lgmorand/test.git",
"run_id":"587245182",
"run_number": "8",
"retention_days": "90",
"actor": "lgmorand",
"workflow": "Test Wkf",
"head_ref": "",
"base_ref": "",
"event_name": "workflow_dispatch",
"event": {
"inputs": null,
"ref": "refs/heads/main",
"repository": {
|| ...
// many other properties
[] ...
}
}
}
```

### Protect the content of variables with masks
Pode haver casos em que a variável contenha um valor confidencial. Se o valor for definido manualmente, a boa prática deve ser definir um "secreto" (em vez de uma variável), um objeto do GitHub que é abordado no próximo capítulo. No entanto, se o valor for gerado durante a execução do fluxo de trabalho, o uso de secret é impossível, e apenas variáveis podem armazenar esse valor. O risco é então que o conteúdo dessa variável seja inadvertidamente exibido nos logs, expondo completamente o valor que gostaríamos de manter em segredo.

O GitHub oferece uma solução que não é perfeita, mas que permite evitar que um valor seja exibido nos logs. Essas mecânicas permitem adicionar uma máscara sobre o conteúdo do valor (e não a variável em si!). Isso requer o uso do comando add-mask, para quem o valor é transmitido para ser oculto. Então, se o valor for, de qualquer forma, exibido nos logs, seu conteúdo será substituído por asteriscos ("***").

```
- run: "::add-mask::hello"
- run: echo "hello" # displays *** in the logs
```

If the variable is not known in advance (e.g., a generated token or password), masking its value can be done like this:
```
- run: "::add-mask::$MYVARIABLE"
- run: echo "$MYVARIABLE" # displays
```

Um efeito perverso é que se o conteúdo de uma variável também for o valor (ou parte do valor) de outra variável, proteger o conteúdo da primeira variável fará com que o conteúdo da segunda variável também fique oculto. Fica bem claro com o exemplo a seguir, onde o conteúdo de VAR2, que não é estritamente idêntico a VAR1, fica parcialmente oculto quando exibido nos logs. Coisa boa ou ruim? Isso vai depender dos seus casos de uso, mas não ter controle preciso torna o comando add-mask um recurso propenso a bugs.

```
env:
VAR1: hello
VAR2: hello2
steps:
- run: echo "::add-mask::$VAR1" # we hide the value of VAR1
- run: echo $VAR1 # displays
- run: echo $VAR2 # displays ***2
```
## Exercises - variables
Aplique o que você acabou de aprender fazendo alguns exercícios.

### Exercício n°1
Este primeiro exercício visa validar a teoria sobre escopos de variáveis. Primeiro, crie um fluxo de trabalho simples com uma variável de ambiente VAR1. Em seguida, crie uma tarefa que coloque o conteúdo desta variável em uma segunda variável, VAR2. Por fim, exiba o conteúdo de VAR2 no console de outra etapa sem usar as variáveis de saída.

### Exercício n°2
Pesquise no marketplace a ação get-current-time, cujo autor é "josStorer". Use esta ação em um fluxo de trabalho e, em seguida, exiba no console a data atual usando o formato francês (25/01/1984).

### Exercício n°3
É comum usar informações contextuais para enriquecer seu fluxo de trabalho, suas ações ou para tomar uma decisão com base nessas informações. Crie um fluxo de trabalho que exibirá as seguintes informações no console:

- [X] O nome do fluxo de trabalho atual
- [X] O link para o perfil do proprietário (owner) do repositório do qual o fluxo de trabalho é iniciado
- [X] Gera um alerta como uma anotação se o repositório atual for público

Todas as informações podem ser encontradas no contexto github.

### Os segredos
Os segredos são o equivalente a variáveis de ambiente, mas criptografados e armazenados fora do arquivo YAML do fluxo de trabalho. Eles são usados para transmitir chaves de segurança ou strings de conexão para seu fluxo de trabalho sem que sejam expostas porque nunca são armazenadas no código-fonte. Os segredos são criptografados com um módulo libsodium (https://libsodium.gitbook.io), garantindo que eles sejam protegidos quando saem do seu navegador e sejam descriptografados apenas quando seu fluxo de trabalho os usa. O GitHub não tem como acessá-lo, nem um pirata.

#### Declaração de um segredo
Alguns padrões de nomenclatura devem ser observados para definir um segredo:
- [X] O nome pode conter apenas caracteres alfanuméricos ([a-z], [A-Z], [0-9]) e o caractere sublinhado (_)
- [X] Eles não podem começar com um número
- [X] Eles não podem começar com "GITHUB_", porque esse prefixo é reservado para os segredos internos do GitHub, como GITHUB_TOKEN
- [X] Os nomes não diferenciam maiúsculas de minúsculas, mas por questões de visibilidade, como para variáveis, é uma boa prática sempre escrevê-los usando letras maiúsculas
- [X] Os nomes dos segredos devem ser exclusivos dentro de um repositório. Essa limitação pode ter um impacto se seu repositório tiver muitos fluxos de trabalho, pois a interface gráfica lista todos os segredos no mesmo lugar. Vários fluxos de trabalho do mesmo repositório podem usar o mesmo segredo. Como resultado, há sérios riscos de colisão ou efeitos indesejados.

A criação de um segredo é feita no nível do repositório. O link para a tela de gerenciamento de segredo pode ser encontrado no menu esquerdo dentro da tela de Configurações. Você pode lá, clicar em "Novo segredo de repositório".

A partir desta nova tela, é possível criar um segredo cujo valor nunca mais poderá ser visto (por medidas de segurança) uma vez que o botão Adicionar segredo for clicado.
Ações segredos / Novo segredo

Ambientes: Os segredos dos ambientes são apenas segredos que são particionados juntos. O assunto dos ambientes é abordado no próximo capítulo.

Uma vez que um segredo é definido, o GitHub declara uma variável no contexto segredos acessíveis por fluxos de trabalho. É então possível recuperar o valor de um segredo usando o seguinte formato $ {{ secrets.MY_SECRET }}.
```
etapas:
- executar: echo "${{ secrets.MY_SECRET }}"
```

O GitHub adiciona automaticamente uma máscara (add-mask) em cada segredo. Dessa forma, o conteúdo do segredo não deve vazar nos logs de execução de fluxos de trabalho.

Importante: os segredos podem sugerir que eles estão perfeitamente lacrados e protegidos. No entanto, backdoors estão permitindo que o fluxo de trabalho exiba os valores dos segredos nos logs. O assunto dessa "falha de segurança" é abordado no capítulo Segurança > Gerenciamento de segredos.

### Os limites dos segredos
Cada repositório não pode ter mais de 100 segredos e 100 segredos de ambiente também. Além disso, cada segredo não pode ter mais de 64 KB, o que é suficiente para a maioria dos casos; no entanto, se você fosse armazenar um segredo maior, como um certificado ou proteger um arquivo de configuração completo. Nesse caso, é possível armazenar o segredo criptografado no repositório de código-fonte e declarar a chave de descriptografia dentro de um segredo.

A abordagem não é muito intuitiva, mas é possível:
1- No seu disco local, criptografe seu arquivo usando a criptografia AES256 (ou qualquer criptografia suportada pelo GPG).
`gpg --symmetric --cipher-algo AES256 my_secret.txt`
Executar o comando GPG pede que você defina uma senha (passphrase) e criptografa o conteúdo do arquivo para criar uma cópia criptografada com a extensão ".gpg".
2- Copie a senha que foi definida e, no seu repositório, crie um novo segredo cujo valor seja a senha, por exemplo, MY_LARGE_SECRET_PASSPHRASE
3- Copie o arquivo "my_secret.txt.gpg" no seu repositório e salve (commit) ele.
4- Crie um arquivo de script (no nosso caso chamado decrypt_secret.sh) que será responsável por decifrar o arquivo usando o segredo previamente configurado
```
#!/bin/sh
gpg --quiet --batch --yes --decrypt passphrase="$MY_LARGE_SECRET_PWD" --output my_secret.txt my_secret.txt.gpg
```

5- Certifique-se de que o arquivo é executável antes do commit:
`chmod +x decrypt_secret.sh`

6- No seu fluxo de trabalho, crie uma etapa que defina uma variável local com um valor contendo o segredo protegido e, em seguida, execute o script para regenerar o arquivo my_secret.txt cujo conteúdo será decifrado.

```
jobs:
my-job:
runs-on: self-hosted
steps:
 - uses: actions/checkout@v4
  - run: decrypt_secret.sh
env:
MY_LARGE_SECRET_PWD:
{{ secrets.MY_LARGE_SECRET_PASSPHRASE}}
```
### Exercícios - Segredos
#### Exercício n°1
O primeiro exercício, crie um segredo e passe-o diretamente para a ação Igmorand@github-action-hello (https://github.com/ lgmorand/github-action-hello). Depois, verifique se seu valor não aparece nos logs.

#### Exercício n°2
O repositório que contém a ação lgmorand@github-action-hello (https://github.com/lgmorand/github-action-hello) tem um segredo chamado MY_SECRET. Este repositório tem um fluxo de trabalho disparado no push e/ou pull request e tem como objetivo validar que a ação ainda esteja totalmente funcional em um teste unitário. Execute um pull request no repositório e altere o fluxo de trabalho para obter o valor de sigilo.

### Exercício n°3
De outra conta, tente bifurcar um dos seus repositórios que contém um segredo (ou bifurcar um repositório de terceiros que contém um segredo, por exemplo este: https://github.com/lgmorand/aks-checklist). Em seguida, abra a aba Configurações e altere o valor de um dos segredos.

## Variáveis de configuração
Desde janeiro de 2023, o GitHub também permite a declaração de variáveis de configuração. As variáveis de configuração são estritamente idênticas aos segredos, exceto que seu conteúdo não é protegido e pode ser visualizado dentro do fluxo de trabalho. É perfeito quando você quer adicionar dinamicidade ao seu fluxo de trabalho sem codificá-lo dentro do arquivo YAML ou colocá-lo em um segredo porque você não pode necessariamente ver/editar seu conteúdo facilmente.

As variáveis de configuração são declaradas em uma nova tela, no mesmo lugar que os segredos.

### Variáveis de configuração
As variáveis de configuração são acessíveis dentro dos fluxos de trabalho por meio de novas variáveis de contexto:

```
jobs:
display-variables:
runs-on: self-hosted
steps:
- name: Use variables
run: |
echo "Here is my first variable : ${{ vars.MY_VARIABLE1 }}"
echo "And my second one : ${{ vars.MY_CONFIG }}"
```

## The creation of multienvironment workflows
O GitHub Actions permite que você faça qualquer tipo de fluxo de trabalho, como enviar um e-mail, criar aplicativos ou até mesmo automatizar uma máquina de café. Mas se houver um domínio no qual as ações são esperadas, é para implantação de aplicativos. Seja qual for a complexidade do seu aplicativo, monolítico, n-tier, microsserviços, ele geralmente será implantado em vários ambientes, como um para desenvolvedores, um para testes e outro para Produção. Embora fazer uma implantação de vários ambientes com o GitHub Actions possa ser alcançado de diferentes maneiras, a primeira solução é fazer um fluxo de trabalho pelo ambiente, cada um com sua lógica e variáveis para se conectar a cada servidor de destino. Mas essa prática deve ser evitada por dois motivos principais:

- [x] O gerenciamento de segredos e variáveis pode se tornar muito complexo, com riscos de colisão entre fluxos de trabalho. Segundo, se seus fluxos de trabalho tiverem um grande número de segredos, seu gerenciamento dentro de uma tela única pode se tornar bastante complexo.
- [x] Um dos mantras do DevOps requer que um único aplicativo binário seja gerado e implantado em diferentes ambientes sequencialmente; a única maneira de garantir que a versão implantada na Produção seja a mesma que foi testada em ambientes anteriores. Embora tecnicamente viável por meio de vários fluxos de trabalho, é complexo e propenso a erros.

O GitHub Actions introduz ambientes, que são simplesmente configurações externas nomeadas para atender a esse requisito. Essas configurações podem ser aplicadas a um ou mais trabalhos dentro de um fluxo de trabalho. Além disso, cada uma dessas configurações pode definir várias regras que queremos ver aplicadas a uma parte específica do fluxo de trabalho. Essas configurações se enquadram em duas categorias:

1. As regras de proteção
2. Os segredos

Vamos analisar em detalhes como definir e usar esses ambientes.

## Creating an environment
Os ambientes são vinculados a um projeto e, portanto, (apenas) a um repositório. Dentro de um repositório GitHub, o gerenciamento de ambientes é feito por meio da tela Configurações > Ambientes. O nome do ambiente é livre para escolher, mas é a ele que você precisará se referir no fluxo de trabalho.

```
Environments
You can configure environments with protection rules and secrets. Learn more.
PRD
TST
DEV
1 protection rule
New environment
```
Importante: Recursos relacionados ao ambiente não são permitidos em repositórios privados.

Ao criar um ambiente, uma tela de configuração é exibida. Semelhante ao conceito de "gates" no DevOps, as regras de proteção são etapas de verificação pré-implantação. Elas tornam possível acionar apenas parte de um fluxo de trabalho somente quando todos os controles de validação estão verdes. No caso do GitHub Actions, os três controles possíveis são:

1. controle sobre os branches válidos para implantação
2. aprovação manual por uma pessoa (revisor)
3. timer: tempo mínimo de espera antes de desbloquear a continuação do fluxo de trabalho

### Protections rules screen
Os revisores são pessoas que aprovarão manualmente a continuação do fluxo de trabalho. É possível especificar até 6 pessoas ou grupos de pessoas. Veremos mais adiante o comportamento do fluxo de trabalho e a interação que deve ser alcançada.

A adição de um timer, como o nome sugere, permite atrasar a execução do fluxo de trabalho e especificar uma pausa. Seu valor é configurado usando minutos e pode assumir um valor entre 0 e 43200, correspondendo a um limite máximo de 30 dias. Uma pausa em um fluxo de trabalho faz sentido ao configurar a entrega contínua, especialmente ao usar a implantação progressiva (implantação canário). É possível fazer um fluxo de trabalho que implementa uma nova versão em um ambiente (por exemplo, Produção) em um segundo servidor e configura o tráfego para que 5% dos usuários sejam redirecionados para o segundo servidor, aguarde um dia para garantir que nenhum problema chegue, então acione uma alteração para enviar 40% do tráfego e aguarde mais 24 horas e, finalmente, se nenhum problema for detectado, redireciona todos os usuários no segundo servidor com a nova versão do aplicativo.

O filtro por branch garante controle de qualidade implícito no código a ser implantado. Três modos estão disponíveis:
1. Todos os branches são permitidos: nenhum controle é feito
2. Alguns branches específicos são permitidos: esses branches são listados explicitamente
3. Somente branches com regras de proteção são permitidos: esta é uma funcionalidade do GitHub que permite aplicar controles no código-fonte. Por exemplo, é possível enviar o código em um branch somente se ele vier de uma solicitação de pull ou quando houver uma revisão de código.

### Branch filter
Se um filtro de ramificação for implementado para um ambiente, ele será interrompido com um erro quando o fluxo de trabalho for iniciado a partir de uma ramificação não autorizada.

### Filtro de branch desrespeitado
Os segredos do ambiente operam na mesma mecânica que os segredos do fluxo de trabalho discutidos anteriormente, mas diferem pelo seu escopo de acesso. Eles são acessíveis apenas pelos trabalhos (e suas ações) que referenciam o ambiente ao qual pertencem. Mais do que uma questão de segurança, isso simplesmente torna possível separar os segredos uns dos outros, para poder manipulá-los mais facilmente, evitando qualquer erro humano. Também permite criar um segredo com um nome único, mas declará-lo em dois ambientes com dois valores diferentes, facilitando a chamada do fluxo de trabalho ao reutilizar o mesmo YAML.

### Referenciando um ambiente
Depois que o(s) ambiente(s) são criados e configurados, ainda temos que vincular nossos estágios de fluxos de trabalho a cada um deles. A conexão é extremamente simples adicionando no nível do trabalho a propriedade environment e o nome do ambiente ao qual você deseja ser vinculado. Cada trabalho só pode ser vinculado a um ambiente, mas todos os trabalhos de fluxo de trabalho não precisam ser vinculados a um ambiente.

```
Build:
runs-on: self-hosted # not linked to an environment
steps: #...
DeployDev:
runs-on: self-hosted
environment: #...
name: DEV # Indicates the name of the environment linked to this job
steps: #...
DeployPRD:
runs-on: self-hosted
environment:
name: PRD # Indicates the name of the environment linked to this job
steps:
```

Percebemos que a implantação de produção está pausada no exemplo anterior, aguardando uma aprovação manual definida no ambiente PRD. Então, um dos aprovadores tem que clicar na caixa do ambiente, para abrir um pop-up de aprovação.

### Manual approval
Assim que a aprovação for realizada e nenhuma outra regra estiver pendente (por exemplo, um cronômetro), o fluxo de trabalho continua sua execução.

### The use of custom URLS
Os ambientes oferecem uma funcionalidade discreta, mas podem ser muito úteis, a configuração da URL do ambiente. Esta URL é exibida diretamente abaixo do nome do ambiente (na verdade, o trabalho) dentro do visualizador de fluxo de trabalho. Ele permite com um simples clique ir para o ambiente de destino e verificar se ele está funcionando corretamente.

```
environment:
name: DEV
url: https://dev.my-application.com
```

No entanto, codificar essas informações não tem muito mais valor do que um favorito em um navegador da Web. Esse recurso faz sentido quando a URL não é conhecida com antecedência, mas será descoberta (ou gerada) durante a implantação do aplicativo. Esse é frequentemente o caso quando o fluxo de trabalho gera a infraestrutura que hospeda o aplicativo (infraestrutura como código) e, em seguida, implanta o aplicativo; caso de uso muito comum ao trabalhar com um provedor de nuvem pública, como o Microsoft Azure.
Vamos pegar o exemplo de uma implantação de um aplicativo em contêiner em um cluster Kubernetes. A implantação é feita por meio de um arquivo manifesto (escrito em YAML) que indica ao Kubernetes qual contêiner implantar, mas também se esse contêiner deve ser exposto na Internet. Se for esse o caso, o Kubernetes fornece um endereço IP automaticamente, o que permite o acesso ao aplicativo implantado.

```
deploy:
name: Deployment on Dev
runs-on: self-hosted
environment:
name: DEV
url: ${{ steps.retrieve_ip.outputs.IP }} # retrieves the output variable of the step retrieve_ip
steps:
- name: Deploying the Kubernetes manifest
run: kubectl apply -f myapp.yaml
- name: Recovery of the IP of the service
id: retrieve_ip
run: |
IP=$(kubectl get SVC my-app jsonpath="{.status.loadBalancer.ingress[0].ip}') # Ask Kubernetes which IP it was created for the application
echo 'IP=https://$IP' >> $GITHUB_OUTPUT # puts the IP in a variable
```
O resultado fornece a URL diretamente do aplicativo exposto pelo Kubernetes; então, essa URL é prefixada com "https://" (obrigatório porque o GitHub espera uma cadeia no formato de URL) antes de ser inserida em uma variável de saída e então recuperada automaticamente na propriedade "url".

### Exercícios
### Exercício n°1
Crie um fluxo de trabalho multiambiente que permita que você obtenha exatamente (incluindo cada rótulo) o seguinte resultado:

Informações adicionais:
. Os quatro trabalhos são chamados de job1, job2, job3 e job4
. O estágio Teste de carga requer esperar 5 minutos antes do início
. O estágio Teste requer aprovação manual de uma pessoa

### Exercício n°2
Você lidera uma equipe de desenvolvimento com vários desenvolvedores que trabalham no mesmo código-fonte no mesmo repositório. Cada desenvolvedor trabalha em uma parte do aplicativo e, sempre que um desenvolvedor envia seu código para o branch principal, a implantação no ambiente DEV é acionada. Quando dois desenvolvedores enviam seu código em um curto espaço de tempo, duas implantações são acionadas em paralelo no ambiente e ocorrem erros. Você deve alterar o fluxo de trabalho para garantir que apenas um ambiente possa ocorrer ao mesmo tempo no ambiente DEV.
A implementação dessa restrição não é explicada neste livro, mas está presente na documentação do GitHub. Dica: simultaneidade.

## Controle de fluxo
Um fluxo de trabalho executa sequencialmente as tarefas descritas em seu arquivo YAML da mesma maneira para cada execução para fornecer a confiabilidade que esperamos de um processo automatizado, ao contrário de um processo humano sujeito a erros. O arquivo YAML, no entanto, representa a versão otimista do fluxo de trabalho: a execução das tarefas sendo bem-sucedida sem que nada venha a prender as rodas. Mas, infelizmente, a experiência da vida real nos ensina, especialmente em TI, que nada é previsível em 100% e surpresas (ruins) são comuns.
O GitHub Actions, no entanto, nos oferece vários elementos para controlar nosso fluxo de trabalho mais finamente, especialmente em erros ou comportamentos imprevistos.

### Defina uma condicionalidade de execução
Como você faria com uma linguagem de programação, o GitHub Actions permite considerar as etapas como blocos de execução e acioná-las dinamicamente de acordo com um teste condicional retornando verdadeiro/falso. Além disso, cada etapa tem uma propriedade opcional if que permite indicar uma fórmula que será avaliada no início da etapa para definir se a uma deve ser ignorada ou não. Então é possível, por exemplo, testar se uma variável específica tem um valor específico:

```
steps:
- if: ${{MY_VAR}} = 'value'
run: blahblah
```

Ou para fazer condições mais complexas usando valores contextuais:

```
steps:
- if: github.repository == 'Igmorand/book' && github.event_name == 'pull_request'
  run: blahblah
```

Também é possível controlar a execução de uma etapa quando uma etapa anterior falhou, por exemplo, usando o método failure().

```
steps:
- run: mycommand
- if: failure() # If previous step fails
run: blahblah
```

Se você quiser verificar o status de uma etapa específica, que não foi colocada imediatamente antes, é necessário usar o contexto de execução das etapas e observar o status registrado pelo agente por meio do resultado da propriedade.

```
steps:
- name: Step 1
  id: step1
  run: mycommand
continue-on-error: true
- name: Step 2
run: echo 'still processing'
- if: steps.step1.outcome != 'success' # check
run: blahblah
```
## Ignore execution errors
A mecânica dos fluxos de trabalho e agentes é simples: um fluxo de trabalho para assim que um erro é encontrado. Para que esse erro venha de uma linha de comando ou de uma ação de terceiros que retornaria um código de erro (código de saída diferente de O), a etapa é marcada como falha nos logs de erro, o fluxo de trabalho para instantaneamente e as outras etapas são ignoradas.
A sintaxe do GitHub Actions permite o atributo continue-on-error que permite indicar ao agente em execução para ignorar os códigos de erro retornados pelas etapas.

```
- uses: 1gmorand/action-which-can-fail@v1
continue-on-error: true
```

Esta palavra-chave é usada principalmente quando você tem etapas que podem falhar, mas deseja que as etapas seguintes ainda sejam executadas, aconteça o que acontecer, como etapas de limpeza.

```
- uses: 1gmorand/action-which-can-fail@v1
continue-on-error: true
- name: Cleaning
run: ./cleanup.sh
```

Uma alternativa é usar a função always(), idêntica à usada com jobs. Ela controla a execução do passo. Assim, no caso a seguir, o segundo passo executará o que quer que aconteça.


```
- name: main command
run: failing command
name: cleaning
run: ./cleanup.sh
if: always()
```

## Control of execution time
Normalmente, um fluxo de trabalho é executado por um "robô", seu tempo de execução não é um problema, pois não consome o tempo de um humano. Às vezes, no entanto, algumas etapas do fluxo de trabalho falham em executar sua tarefa atribuída e caem em um modo de loop infinito. Esses casos que podem ser acionados por vários motivos apresentam muitos problemas:
• A tarefa esperada nunca é concluída.
• O fluxo de trabalho pode durar horas antes de ser encerrado pelo GitHub (tempo máximo de execução de um trabalho de 6 horas), e os usuários só serão notificados quando o limite de tempo for atingido.

O tempo de execução tem um custo porque consome parte do tempo de execução alocado a você. Isso pode ter um custo financeiro. Portanto, é importante limitar esse desvio potencial.

Para responder a isso, o GitHub Actions permite que você aplique um atributo timeout-minutes em uma etapa para limitar a execução.

Assim, se você acha que uma etapa pode entrar em um loop infinito, você pode aplicar um limite após o qual o GitHub irá pará-la e considerá-la como falha se a etapa não tiver terminado a tempo.

```
- run: ./my-script.sh
timeout-minutes: 5 # max limit of 5 minutes
```
## Os emblemas
A vantagem de automatizar processos usando fluxos de trabalho automáticos é simplificar o gerenciamento desses processos, pois eles não exigem interações/tratamentos humanos. No entanto, a desvantagem é que é fácil perder de vista o estado do processo e esquecer de verificar a boa execução de cada fluxo de trabalho. O GitHub oferece um sistema de alertas, mas quando você deseja dar visibilidade dos fluxos de trabalho a pessoas externas, isso pode ser mais complexo ou precisar implementar mecanismos dentro dos fluxos de trabalho, como enviar um e-mail ou enviar uma mensagem de bate-papo em um grupo do Teams/Slack.

Existe outra alternativa: os emblemas. Os emblemas são botões "inativos" que permitem uma olhada para indicar se um fluxo de trabalho foi bem-sucedido ou não. É possível criar um (ou mais) emblema(s) por fluxo de trabalho. A criação de um emblema é realizada por meio da tela de execução do fluxo de trabalho e por meio do menu de contexto oculto no canto superior direito desta tela:

O portal da Web exibe então um formulário que permite definir o emblema, incluindo a ramificação ou o evento que acionou o fluxo de trabalho. Por exemplo, isso permite que você tenha um emblema de combinação no caso de um fluxo de trabalho ter vários gatilhos ou poder ser executado por várias ramificações.

## Configurando um emblema
Os emblemas são então gerados dinamicamente, e um portal fornece a você um bloco de texto de empréstimo que pode ser integrado aos arquivos Markdown do GitHub. Em particular, é comum incluir emblemas no arquivo README do Repositório para dar uma visão clara e direta sobre o status dos fluxos de trabalho, seja implantação, teste de segurança ou simplesmente compilação. Aqui está um exemplo do uso de emblemas:

README.md
A lista de verificação do serviço Azure Kubernetes
Crie e implante na licença MPL-2.0 de aprovação prévia do último commit de ontem

Emblemas em um arquivo README

Também é possível incluir o emblema em um site externo ao GitHub. Isso requer o uso do seguinte formato:

`https://github.com/<OWNER>/<REPOSITORY>/actions/workflows/<WORKFLOW_FILENAME>/badge.svg`

Aqui está um exemplo de um emblema injetado em uma página HTML:

`<img src="https://github.com/lgmorand/aks-checklist/actions/ workflows/generate-offline.yml/badge.svg" />`

Esses emblemas são mais do que um elemento estético; eles podem dar visibilidade centralizada, sem precisar ir para a parte de ações restaurativas e analisar cada fluxo de trabalho.

## Fluxos de trabalho reutilizáveis
Em vez de duplicar e transferir conteúdo entre diferentes fluxos de trabalho, é possível estabelecer fluxos de trabalho reutilizáveis. Esses fluxos de trabalho reutilizáveis podem ser invocados por você ou qualquer pessoa autorizada a acessá-los, permitindo a integração em outros fluxos de trabalho.

A prática de reutilizar fluxos de trabalho elimina a redundância, simplificando o gerenciamento do fluxo de trabalho. Isso acelera a criação de novos fluxos de trabalho, aproveitando a base estabelecida por outros, semelhante a como você constrói sobre ações existentes. Além disso, a reutilização de fluxos de trabalho promove a adoção de melhores práticas, facilitando a utilização de fluxos de trabalho bem elaborados, pré-testados e comprovadamente eficazes. Essa abordagem capacita sua organização a cultivar um repositório de fluxos de trabalho reutilizáveis que podem ser controlados centralmente, contribuindo para uma manutenção eficiente.

### Como funciona?
De um lado, você simplesmente cria um fluxo de trabalho reutilizável que é um fluxo de trabalho padrão com uma exceção, se você quiser passar parâmetros, você precisa declará-los como workflow_call:

```
name: Reusable workflow example
on:
workflow_call:
inputs:
message:
required: true
type: string
jobs:
myjob:
runs-on: self-hosted
steps:
- run: echo ${{inputs.message }}
```

E então, do outro lado, a partir de um fluxo de trabalho de chamada, você apenas referencia o YAML que deseja carregar:

```
name: Reusing workflow example
on:
workflow_dispatch:
jobs:
call-workflow-in-other-repo:
uses: ./.github/workflows/reusable.yaml
with:
 message: 'hello my friend'
```

Neste exemplo anterior, nós o carregamos usando um arquivo YAML local, o que significa que o fluxo de trabalho reutilizável é armazenado no mesmo repositório. Você pode imaginar um cenário onde você tem um repositório externo com todo o seu fluxo de trabalho reutilizável. Nesse caso, você deve especificar a organização (ou conta do GitHub) e o branch do seu arquivo.

```
call-workflow-in-local-repo:
uses: lgmorand/REPO-REUSABLE/.github/workflows/reusable.yaml@main

```

Note que você pode criar fluxos de trabalho mais ricos carregando diferentes fluxos de trabalho reutilizáveis, onde cada fluxo de trabalho reutilizável pode conter várias etapas, mas você não pode misturar fluxos de trabalho reutilizáveis e etapas "normais" em um único trabalho. No entanto, você pode ter algo assim:
```
name: Reusing workflow example
on:
workflow_dispatch:
jobs:
call-workflow-1-in-local-repo:
uses: lgmorand/test/.github/workflows/reusable.yaml@main
with:
message: 'hello my friend'
job2:
runs-on: self-hosted
steps:
- run: echo 'a normal step'
call-workflow-1-in-remote-repo:
uses: lgmorand/test/.github/workflows/another-reusable.yaml@main
```
Você já deve estar se perguntando: qual é a diferença com Composite Actions que permite injetar vários passos de uma vez? Essa é uma boa pergunta porque a diferença é muito (muito) sutil e, como ambos os recursos continuam a remover limitações, eles se tornam cada vez mais idênticos. Use o que você acha que se encaixa em suas necessidades ou sua preferência.
acessado.

## Access to reusable workflows
Fluxos de trabalho reutilizáveis significam que um fluxo de trabalho deve ser capaz de acessar o YAML que contém o fluxo de trabalho chamado. Isso significa que pelo menos um dos seguintes requisitos deve ser verdadeiro:

- [x] Ambos os fluxos de trabalho (chamador e chamado) estão no mesmo repositório.
- [x] O fluxo de trabalho chamado é armazenado em um repositório público, e sua organização permite que você use fluxos de trabalho públicos reutilizáveis.
- [x] O fluxo de trabalho chamado é armazenado em um repositório privado e as configurações para esse repositório permitem que ele seja acessado.

### Be aware of some limtations
A reutilização é superimportante para a governança e também para a eficiência e legibilidade dos seus fluxos de trabalho, mas vem com algumas limitações:
- [x] Um fluxo de trabalho pode carregar um fluxo de trabalho que carrega outro modelo e assim por diante, até 4 níveis no máximo (para evitar loop infinito)
- [x] Você pode chamar até 20 fluxos de trabalho reutilizáveis ​​de um arquivo de fluxo de trabalho raiz. A contagem inclui todos os fluxos de trabalho reutilizáveis aninhados também.
- [x] Variáveis de ambiente não são propagadas para fluxos de trabalho chamados. Você tem que passá-las como parâmetros de entrada
- [x] Da mesma forma, variáveis de ambiente definidas no contexto env, definidas no fluxo de trabalho chamado, não são acessíveis no contexto env do fluxo de trabalho do chamador. Você deve usar saídas do fluxo de trabalho reutilizável

Não se esqueça desse recurso quando sentir que está se repetindo em seus fluxos de trabalho.

### Create your own custom GitHub Actions
O poder do GitHub Actions não é seu modelo ou tecnologia (pipeline como código) que já existe. É sua extensibilidade, permitindo que qualquer um crie uma Action e a disponibilize para todos. As possibilidades de coisas alcançáveis com o GitHub Actions se tornam quase infinitas.
Ao criar seus fluxos de trabalho, você provavelmente encontrará a maioria de suas necessidades com Actions criadas e disponíveis no mercado (mais de 8.000 no momento em que escrevo
estas linhas). Mas a tecnologia e as necessidades mudam rapidamente e inevitavelmente chegará um dia em que você estará enfrentando uma necessidade para a qual nenhuma ação já existe, ou se você deseja oferecer mais do que o que torna uma ação existente. Nesse dia, você terá a possibilidade de criar sua própria GitHub Action.
A segunda seção deste livro é dedicada à criação de GitHub Actions em diferentes formas. Primeiro, abordaremos os diferentes conceitos e, em seguida, criaremos diferentes Actions, cada uma delas, usando recursos mais avançados.

### Create your first Action
Ao criar sua própria Ação do GitHub?
Uma ação é um módulo que contém código personalizado que será executado por um dos agentes para executar uma tarefa específica. É reconhecido que uma ação deve operar no modelo de componente Linux, o que significa um componente que executa apenas algumas coisas, mas as executa perfeitamente. Você pode se deparar com ações ricas e complexas, mas esse não é o objetivo principal delas. Portanto, é preferível ter duas Ações simples enfileiradas do que apenas uma Ação complexa.
O mercado está cheio de Ações escritas por indivíduos, mas, infelizmente, a Ação que atende às suas necessidades pode não estar lá. Também é possível que seu fluxo de trabalho tenha que executar várias ações que consistem em vários comandos sequenciais que você deseja replicar em diferentes fluxos de trabalho sem ter que copiar e colar cada reutilização. Fatoração e experiência do usuário são os dois primeiros motivos para criar uma ação personalizada.

Este capítulo discutirá a criação de uma Ação, seja para compartilhá-la com a comunidade do GitHub ou mantê-la para uso pessoal.

## The different types of Actions
O primeiro conceito para desenvolver uma ação adequada é considerar um programa: um software com seus parâmetros de entrada e saída, que realiza uma tarefa dada e precisa. Esta ação tem uma versão, uma nomenclatura para chamá-la e lógica de erro (código de saída) como uma ferramenta de linha de comando. A principal diferença é que ela é empacotada para que sua integração em um fluxo de trabalho seja simplificada o máximo possível.

Como qualquer programa, uma Ação tem um código de negócio que é escrito em uma linguagem de programação. Dependendo da escolha desta linguagem ou do sistema operacional de destino (do agente), você terá a oportunidade de compor uma ação de três maneiras:

1. Ação escrita inteiramente em JavaScript (ou TypeScript)
2. Uma Ação escrita em qualquer linguagem, mas empacotada como um contêiner de imagem Docker
3. Ação escrita usando YAML, ações compostas


Dependendo do formulário escolhido, as Ações estarão disponíveis para alguns sistemas operacionais, conforme resumido na tabela a seguir:

| Туре | Sistema operacional |
| ---- | ---- |
| Contêiner Docker | Linux |
| JavaScript | Linux, macOS, Windows |
| Etapas de execução de Composites | Linux, macOS, Windows |

## Pros and cons, what to choose?
A escolha do formato da sua ação também terá impactos no seu uso diário, seja em termos de desenvolvimento/manutenção ou desempenho. Cada tipo de ação tem suas vantagens e desvantagens. Além do seu conforto para qualquer tecnologia, reserve um tempo para pesar os prós e contras de cada escolha, dependendo da sua necessidade e uso feito da sua ação.

VER TABEL:A 163

## Creation of your Action
Nos próximos capítulos, você aprenderá como construir suas ações usando conceitos avançados. No entanto, para ser mais didático, começaremos criando uma ação simples e personalizada para aprender todos os conceitos básicos, ou seja, a estrutura da ação, seus vários componentes e sua publicação. Começaremos com o famoso "Hello World", uma ação que recebe um primeiro nome e exibe uma mensagem no console.

Comece criando um repositório dedicado chamado github-action-hello (o nome não importa, mas ele terá que ser chamado da mesma forma dentro dos fluxos de trabalho). Este repositório deve ser público; é de fato um pré-requisito para poder hospedar uma Ação.

Nota: Desde 2023, é possível usar uma ação de um repositório privado se ela pertencer ao mesmo proprietário (ou organização) e tiver sido explicitamente compartilhada por meio do
menuConfigurações > Ação >Geral>Acesso.

Depois que o repositório for criado, clone-o localmente no seu computador, pois algumas ações não podem ser realizadas no portal online.

## Creating the manifest
Uma ação é um conjunto de arquivos enviados em um repositório. Para que o mecanismo GitHub carregue e use dentro dos fluxos de trabalho, essa ação deve seguir um formato predefinido. Assim, as Ações geralmente observam a seguinte estrutura:

- [x] Um arquivo README.md (opcional, mas fortemente recomendado) que descreve sua ação, mas também como usá-la, como seus parâmetros de entrada-saída
- [x] Um arquivo LICENSE (opcional) para esclarecer se alguém pode ou não reutilizar o código para sua ação
- [x] Um arquivo manifesto action.yaml (obrigatório!).
- [x] Scripts que compõem a lógica de sua ação e o que ela executa

Comece criando o manifesto de sua futura Ação: action.yml (ou action.yaml). Este arquivo permite que o GitHub "descubra" sua ação, suas propriedades, mas também seu comportamento. Ele contém várias propriedades que você definirá para criar sua primeira ação. O primeiro bloco descreve sua ação; ele contém o nome, uma pequena descrição e, potencialmente, o autor da Ação.

```
name: 'Hello World' # The name of your action (mandatory)
description: 'Says hello to someone' # a simple description (mandatory)
author: 'Louis-Guillaume MORAND' # The name of the creator (optional)
```

Um segundo bloco descreve a parte técnica: o formato da ação (JavaScript ou Docker). No nosso caso, ele também contém o ponto de entrada e a versão do JavaScript usada. No nosso caso, começaremos criando uma ação JavaScript baseada no NodeJS 12 e cujo arquivo principal será index.js.

```
runs:
using: 'node20' #JavaScript action using NodeJS 20
main: 'index.js' # The entry point (main script)
```
Uma seção é dedicada aos parâmetros de entrada e saída. Não há necessidade de parâmetros de saída em nosso caso, mas um parâmetro chamado who contém o nome da pessoa para passar como parâmetro. Vamos dar a ele um valor padrão.

```
inputs: # List of input parameters
firstname: # (mandatory) the name of the parameter
description: 'Name of the person' # (mandatory) a sentence that describes the parameter
required: true # (mandatory) indicates whether the parameter is required or not
default: 'World' # (optional) gives a default value to the parameter
default: 'World' # (optional) gives a default value to the parameter
```

Por fim, um bloco opcional está relacionado à marca da sua ação. Este é o ícone que aparecerá no marketplace se você publicá-lo.
```
branding:
icon: 'message-circle' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

A lista de ícones disponíveis está bem acima de cem se a lista de cores for limitada (branco, amarelo, azul, verde, laranja, vermelho, roxo ou cinza-escuro). Os nomes desses ícones e a exibição esperada podem ser encontrados no site FeathersIcon: https://feathericons.com/.

O conteúdo final do seu arquivo manifesto deve ser semelhante a este: (a ordem dos blocos não importa)

```
name: 'Hello World' # The name of your action (mandatory)
description: 'Say hello to someone' # a simple description (mandatory)
author: 'Louis-Guillaume MORAND' # The name of the creator (optional)
runs:
using: 'node20' #JavaScript action using NodeJS 20
main: 'index.js' # The entry point (main script)
inputs: # List of input parameters
firstname: # (mandatory) the name of the parameter
description: 'Name of the person' # (mandatory) a sentence that describes the parameter
required: true # (mandatory) indicates whether the parameter is required or not
default: 'World' # (optional) gives a default value to the parameter
branding:
icon: 'message-circle' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

## The business logic file
É hora de criar o script que executará as ações desejadas. Se o nome dele estiver livre, ele deve corresponder ao que você colocou no manifesto; no nosso caso, index.js.
Nosso arquivo deve conter a seguinte lógica:
1. Recuperar o primeiro nome da entrada
2. Colocar o valor em uma variável local
3. Exibir uma mensagem no console

Vamos começar recuperando o parâmetro da ação. Nada complicado, especialmente porque o GitHub fornece um kit de ferramentas que facilita o desenvolvimento de ações. Este kit de ferramentas tem muitos módulos, mas precisamos apenas de um aqui: @action/core. Este tem métodos diferentes, incluindo getInput(), que pode recuperar o valor de um parâmetro de entrada:

```
const core = require('@actions/core'); // loading the Toolkit's core module
const firstname = core.getInput('firstname'); // recovery of the parameter's value
```

Para a exibição, nada complicado, uma linha pura de JavaScript:

`console.log(Hello ${firstname}!`);`

Se essas três linhas forem suficientes para fazer uma ação que funcione perfeitamente, adicionaremos um bloco try-catch que permite que o módulo não trave se ocorrer uma exceção ou problema.

Finalmente, adicionamos no bloco de tratamento de erros uma chamada para o método setfailed() que informa ao agente que a ação deve ser considerada falha. Claro, as chances de o código não funcionar são muito baixas neste caso, mas sem essa mecânica, o fluxo de trabalho pai não consegue adivinhar se o script se comportou como esperado ou se ocorreu um problema grave.

```
const core = require('@actions/core'); // loading the Toolkit's core module
try
{
const firstname = core.getInput('firstname'); // recovery of the parameter's value
console.log(`Hello ${firstname}!`);          // writes a message in the console
}
catch (error)
{
core.setFailed(error.message); // tells the agent that the process has failed and transmits the details of the problem
}
```
Seu arquivo de script está completo; no entanto, se você conhece um pouco de JavaScript, a primeira linha deve questioná-lo. Com a função require(), esta indica que carrega um módulo, mas em nenhum momento disponibilizamos este módulo. Devemos instalá-lo usando o NPM (Node Package Manager), que pode ser baixado no seguinte endereço: https://nodejs.org.

Abra um prompt de comando cuja pasta atual deve ser uma das cópias locais do seu repositório.

Primeiro, execute o comando "npm init" para preparar o NPM para usar um package.json para configurar os módulos. Este comando fará várias perguntas. Você pode deixar os valores como padrão ou personalizá-los; eles são de pouca importância.

`npm init`

Then run "npm install" to install the module @actions/core.

`npm install @actions/core`

Este comando cria uma pasta node_modules na qual o módulo @actions/core é baixado, e um novo arquivo package-lock.json registra a lista de todos os submódulos dependentes. Esses são dois arquivos técnicos importantes, mas nunca devem ser modificados manualmente.

Nossa ação está pronta; só precisamos testá-la em um fluxo de trabalho. Para fazer isso, basta usar a palavra-chave uses e fornecer o nome completo da nossa ação: Igmorand/github-action-hello@main

`- uses: lgmorand/github-action-hello@main`

Você pode então fazer commit e enviar seu código para o repositório que está no GitHub.

Observe que "lgmorand" deve ser substituído pelo nome da sua conta no GitHub, depois vem o nome do repositório da sua ação e, finalmente, "@main", que indica usar o branch principal. Usar um nome de branch é incomum; veremos em um capítulo vindouro versionamento como sua ação e chamar esse número de versão explicitamente.

O YAML final deve ser parecido com isto:

```
steps:
- uses: Igmorand/github-action-hello@main # loading our action
with:
  firstname: 'Louis-Guillaume' # parameter to provide, indicate the name of your choice
```

## Versioning
Cada Action GitHub tem um número de versão exclusivo. Esta versão é importante porque permite que você implemente alterações em suas GitHub Actions sem impactar negativamente os usuários que consomem sua ação. Você deve estar ciente de que assim que seu primeiro rascunho do seu trabalho for publicado, os usuários poderão usá-lo. É sua responsabilidade nunca interromper seus fluxos de trabalho, seja removendo a ação ou fazendo qualquer alteração importante sem alterar o número da versão. Portanto, é fundamental estar atento à definição da versão.

O GitHub recomenda seguir a especificação SemVer ("Semantic Versioning) para construir e manter o número da versão da sua Ação. Uma versão compatível com SemVer contém pelo menos três blocos de números no formato MAJOR.MINOR.PATCH. Para cada produto, o trabalho de script sempre começa com a versão 1.0.0.

Mas é especialmente a mudança de versão que chamamos de incremento, que depende do que é feito dentro do aplicativo. Assim, incrementamos a parte:

- [x] MAJOR: sempre que grandes mudanças ou que causam mudanças de quebra são implementadas
- [x] MINOR: sempre que recursos compatíveis com versões anteriores são adicionados
- [x] PATCH: sempre que você corrige um bug ou um problema de segurança

`MAJOR Breaking changes 2.1.7 PATCH Bug fixes`
Semantic versioning

Às vezes, você verá um quarto bloco especificando um número de compilação (por exemplo, a data e um incremento) ou um modo de lançamento, por exemplo, um rótulo "pré-lançamento" ou "beta".

Certifique-se de entender completamente esse versionamento porque você inevitavelmente precisará dele para usar sua ação, pois ajudará os usuários a entender qual versão de sua ação usar.

## Exercícios
Vamos praticar com alguns exercícios sobre versionamento de ações.

### Exercício n°1
Vamos verificar se você entendeu bem as regras de versionamento. Para todas as versões a seguir, indique quais estão corretas ou não:

1. v1
2. v2.3
3.3.2024.5
4. 1.10.3.23230
5. plop1.3
6.2.0.0.pre-alpha
7. 3.56.42.win-x64
Easy, isn't it?

### Exercício n°2
Vamos trabalhar um pouco no ciclo de vida de uma ação. Vamos pegar o exemplo da nossa Ação HelloWorld publicada como versão 2.0.0 e rapidamente usada por muitas pessoas. Como parte de sua evolução, faremos várias atualizações e novas publicações no Marketplace.

Com a primeira evolução, nossa ação 2.0.0 agora recebe dois primeiros nomes em parâmetro e permite exibi-los dentro da mensagem no console. Aqui está a assinatura para chamar a ação:

```
steps:
-uses: YOUR-REPO/github-action-hello@v2
with:
firstname: 'XXX'
firstname2: 'YYY'
```
Você percebe que a ação trava se o primeiro nome contiver um caractere especial como um apóstrofo ou um traço. Você corrige sua ação e a republica. Qual novo número de versão você deve dar a ela?
Então, você decide adicionar um recurso à sua ação que permite personalizar o idioma da mensagem exibida. Definindo o idioma com um novo parâmetro obrigatório, mas um valor padrão é igual a "fr". Qual novo número de versão você deve colocar?

Finalmente, você decide alterar como os nomes são fornecidos com um novo parâmetro, "firstnames", que pega uma matriz contendo todos os primeiros nomes como valores. O valor padrão é uma tabela incluindo apenas o primeiro nome "Louis-Guillaume".

A nova assinatura para chamar a ação tem o seguinte formato:

```
steps:
- uses: YOUR-REPO/github-action-hello@v???
with:
firstnames: ['John', 'Jane', 'Bob']
```
Qual novo número de versão você deve colocar?

### Exercício n°3
Você criou uma ação para integrar com um produto de terceiros. Depois de alguns meses, o publicador deste produto de terceiros decide criar uma ação oficial do GitHub, tornando sua ação obsoleta. Você decide interromper o suporte da sua ação, mas em vez de abandoná-la brutalmente; você planeja alertar todas as pessoas que usam sua ação que uma ação oficial agora está disponível.
Você decide adicionar um aviso dentro da sua ação, que mostrará uma mensagem ao executar seu fluxo de trabalho. Você quer que a mensagem seja visível e integrada diretamente na interface do GitHub, não apenas por meio dos logs do fluxo de trabalho. Sua ação deve continuar a funcionar corretamente.

Dica: Se você não sabe como exibir um aviso adequado (=anotação), leia o capítulo "Melhorar ações".

## Publicar no Marketplace
Sua ação é perfeitamente funcional e agora pode ser usada por outras pessoas porque seu repositório é público. Uma pergunta ainda surge: qual o interesse em publicá-la no GitHub Marketplace? A resposta é simples: para melhorar sua capacidade de descoberta. É improvável que uma pessoa encontre o repositório da sua ação por acaso, e sua ação pode nunca ser referenciada automaticamente pelos mecanismos de busca. A maneira mais eficaz de permitir o uso mais amplo da sua ação e, assim, participar do esforço coletivo em torno do GitHub
Actions é publicá-la no mecanismo de busca dedicado a essas ações: o Marketplace.

A publicação é extremamente simples e leva apenas alguns cliques. Requer quatro etapas:

- [x] Documentando sua ação: como os usuários esperam aproveitar sua ação sem instruções para usá-la?
- [x] Versionamento: como acabamos de ver no capítulo anterior
- [x] Branding: dê uma identidade à sua ação por meio de seu logotipo e título
- [x] Release: a criação de um release oficial e sua tag

A seção de documentação é a mais simples, mas também a mais importante. Ela permitirá que você use sua ação e faça com que os usuários queiram usá-la. A documentação pode ser completa e rica em seu repositório e conter várias páginas, mas o Marketplace exibirá apenas uma página: o arquivo readme.me na raiz do repositório de sua Action.

Este arquivo deve conter informações diferentes sobre sua Ação, como:

- [x] Uma descrição de sua Ação
- [x] Os parâmetros de entrada e saída e uma descrição de cada um deles e seus valores padrão
- [x] Segredos e variáveis de ambiente usados por sua Ação
- [x] Um exemplo de uso (trecho YAML para chamar a Ação)

Para a parte de versionamento, você precisa seguir rigorosamente as regras semânticas explicadas no capítulo anterior ou correr o risco de perder usuários de sua ação ou potencialmente quebrar seus fluxos de trabalho e atrair seus miseráveis.

Quanto à marca, esta é rápida, pois você só pode escolher um ícone de uma lista e uma cor de fundo. Você pode encontrar ações que tenham um ícone personalizado, como um logotipo da empresa. Saiba que é impossível personalizar o logotipo, a menos que seja um "parceiro" do GitHub, um longo processo administrativo reservado para empresas que oferecem integração com o GitHub ou serviços de nuvem. Se sua empresa estiver interessada, o processo para se tornar um parceiro é descrito no site dedicado: https://partner.github.com/.

Como lembrete, a marca é feita por meio de duas propriedades do manifesto de ação:
```
branding:
icon: 'message-circle' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

Então vem a parte final: a criação de um release. O propósito deste ato é congelar uma versão, ou seja, uma versão única do seu código-fonte que não pode mais mudar no futuro para este release específico, uma versão estável. Comece abrindo o repositório do seu custom

Ação. Se estiver bem configurado com seu manifesto, o GitHub exibirá automaticamente um pop-up para facilitar sua implantação:

Clique em Draft a release para chegar à tela que pede para você preencher um nome de release e uma tag (o famoso número da versão). Este identificador git exclusivo permite que você direcione uma versão muito específica do código-fonte do seu repositório.

Marque a caixa para publicar no Marketplace
Se esta caixa estiver desmarcada, sua ação ainda poderá ser usada pelos usuários, mas eles não terão como saber/descobri-la a menos que alguém lhes dê a URL do seu repositório.

Quando a caixa de seleção estiver marcada, o GitHub realiza várias verificações, como a exclusividade do nome da sua ação. Você não pode publicar no Marketplace se todos os LEDs não estiverem verdes:

Pag.183

Se tudo estiver bem, clique no botão "Criar Release" na parte inferior da tela. Você pode então ir para o Marketplace (https://github.com/marketplace?type=actions) e encontrar
lá sua Ação:

Você encontrará o conteúdo da descrição, mas também o ícone (laranja neste exemplo) definido na seção de branding do manifesto.

## Exercícios
Vamos praticar um pouco.

### Exercício n°1
Se você ainda não fez isso, publique uma Ação Hello World de acordo com o capítulo que você acabou de ler. Certifique-se de encontrar sua Ação entre as ações do Marketplace: https://github.com/marketplace/actions/

### Exercício n°2
Para este segundo exercício, modifique sua ação para ser chamada pelo seguinte YAML (adicionando um parâmetro e alterando o número da versão). A ação deve exibir a seguinte mensagem no console: "Hello XXX & YYY." Você deve alterar o script, mas também seu manifesto.

```
steps:
- uses: YOUR-REPO/github-action-hello@v2
with:
firstname: 'XXX'
firstname: 'YYY'
```

### Exercício n°3
Para o último exercício, você deve cancelar a publicação de sua ação do Marketplace. Novamente, não queremos "poluir" o Marketplace com nossos testes. Portanto, certifique-se de que sua ação não esteja mais visível nos resultados de pesquisa do Marketplace.

O processo de cancelamento de publicação não foi abordado neste capítulo, mas é explicado na documentação oficial, e as etapas também serão detalhadas nas soluções dos exercícios no final deste livro.

Dica: basta reverter as etapas de publicação, mas isso deve ser feito para cada lançamento da Ação. Ou procure pelo pequeno botão mágico ;-)

Crie sua segunda ação
A primeira Ação está concluída, agora construiremos uma segunda ação que aborda novos conceitos. Esta segunda ação visa simplificar a criação de uma versão do GitHub automatizando a criação da tag e gerando automaticamente um histórico de alterações (changelog). Esta nova Ação, mais relevante para casos de uso reais, cobrirá as noções de execução de código de terceiros, pré/pós script, geração de variável de saída, mas também interações com o GitHub.

Um ponto de atenção em particular, a Action, contém dezenas de arquivos e conceitos que não estão relacionados ao GitHub Actions (ex: como configurar a estrutura do projeto Typescript). Esses conceitos não serão abordados neste livro, mas você pode baixar uma cópia totalmente funcional da action do repositório que contém algumas indicações adicionais: https://github.com/lgmorand/github-action-generate-relnotes.

Aviso: O código-fonte da action é minimalista e está longe de ser perfeito, mas visa ser o mais conciso possível para evitar explicar centenas de linhas de código. Você pode se concentrar nas partes que têm um valor técnico real.

## Estabelecimento dos pré-requisitos
Esta segunda Ação será escrita em TypeScript, uma linguagem de programação que visa escrever um código JavaScript melhor por meio de uma sintaxe mais rigorosa. Os arquivos Typescript (*.ts) são então transpirados (transformados) em JavaScript puro e, em seguida, executados pelo NodeJS dentro do fluxo de trabalho. Você frequentemente encontrará no mercado Ações escritas com Typescript, que se tornou a linguagem de programação mais favorecida para projetos da Web nos últimos anos.

Nosso código Typescript chamará vários módulos do GitHub Actions Toolkit para simplificar algumas de suas operações. A Ação usa:

- [x] @actions/core: módulo que fornece funções para gerenciar variáveis de entrada/saída, gerenciamento de log, acesso ao segredo/variáveis, etc.
- [x] @actions/exec: módulo para executar programas de terceiros e executar linhas de comando. @actions/github: fornece um objeto para interagir com o GitHub, pré-configurado com o contexto atual (usuário + repositório do qual o fluxo de trabalho é executado)

Esses módulos devem ser declarados no arquivo package.json, que será usado pelo NPM (npm install) para baixar o código-fonte desses módulos que nossa ação exigirá.

```
"dependencies": {
"@actions/core": "^1.10.0",
"@actions/exec": "^1.1.1",
"@actions/github": "^5.1.1",
"actions-toolkit": "^6.0.1"
},
"devDependencies": {
  "typescript": "^3.7.4"
},
```

Recurso: Como um lembrete, o GitHub Actions Toolkit é o SDK que simplifica muito o desenvolvimento de ações JavaScript usando módulos ricos, mas ainda simplificados. Sua documentação está localizada no repositório dedicado: https://github.com/actions/toolkit.

## The manifest and its variables
Naturalmente, nossa Ação precisa de um manifesto action.yml, e seu conteúdo se parece com o criado para a primeira ação. Mas é diferente para a declaração de variáveis de entrada que são definidas:

- [x] githubToken: Token de autenticação que permite que você interaja com o repositório no GitHub. Será uma questão de transmitir a variável GITHUB_TOKEN que o GitHub cria automaticamente para cada fluxo de trabalho
- [x] newTag: Número da tag Git que também servirá como nome da versão
- [x] generateArtifact: parâmetro opcional que indica se a ação deve ou não gerar um arquivo changelog.txt

Aqui está um trecho do manifesto contendo a declaração de parâmetros de entrada:

```
inputs:
github Token:
description: 'Token to access GitHub'
required: true
newTag:
description: 'New tag'
required: true
generateArtifact:
description: 'Generation of changelog?'
required: true
default: true
```

A ação também declara uma variável de saída relnotes que contém o conteúdo do changelog gerado. Embora a ação seja autônoma para reutilizar diretamente o changelog que gerou, retornar seu conteúdo ao fluxo de trabalho pai é uma boa prática se o usuário fizer outro uso do fluxo de trabalho, como enviar uma publicação por e-mail de tal lançamento.

```
outputs:
relnotes:
description: 'Content of the release note"
```
O arquivo de manifesto global é o seguinte. Observe que a ação carregará o arquivo index.js enquanto escreve nosso código em um arquivo index.ts. O arquivo JavaScript será gerado durante a compilação do TypeScript, que deve ser realizada antes de carregar seu código. Não é o GitHub Actions que fará isso automaticamente.

```
name: 'Generate release'
description: 'Generates a release and release notes based on commits'
author: 'Louis-Guillaume MORAND'
branding:
icon: 'award'
color: 'orange'
inputs:
githubToken:
description: 'Token to access GitHub'
required: true
description: 'New tag'
required: true
generateArtifact:
description: 'Generate changelog?'
required: true
default: false
outputs:
relnotes:
description: 'Content of the release note'
runs:
using: 'node20'
main: 'dist/index.js'
```

## The generation of the changelog
Claro, se os desenvolvedores trabalham com metodologia, eles comentam ao enviar seu código para o repositório, o que corresponde à funcionalidade que eles adicionam ao aplicativo. Então, por exemplo, neste comentário no commit, nossa ação simplesmente listará todos os commits desde a última tag (que era logicamente o release anterior) e então usará
suas mensagens associadas para gerar um novo arquivo, o famoso changelog.

Convenção: Não será muito fácil gerar um arquivo de release limpo e legível se os desenvolvedores não respeitarem uma certa homogeneidade para suas mensagens de commit. Existe uma convenção para escrever essas mensagens; essa convenção é uma referência hoje em desenvolvimento. Ela pode ser encontrada no seguinte site: https://www.conventionalcommits.org

Temos dois métodos para recuperar esses commits, seja usando a API do GitHub para listar esses commits ou simplesmente usando a linha de comando do Git. Esta segunda solução é a mais simples e pode ser testada facilmente em seu computador.

O comando para listar todos os comentários de commits (com uma exibição simplificada sem metadados) de uma tag até agora é o seguinte:

`git log MONTAG..HEAD --oneline --pretty-format:"%s"`
Falta-nos um comando para encontrar automaticamente a última tag para o usuário, não fornecendo-a explicitamente para nossa ação. O comando para listar as tags é "git describe -tags" e o comando para exibir apenas a última tag:

`git describe --tags --abbrev=0`

Agora que temos nossos comandos CLI, como fazê-los serem executados por nossa Ação JavaScript? O GitHub Actions Toolkit tem um módulo exec; este módulo torna possível chamar uma ferramenta externa (aqui git.exe instalado por padrão no agente) para passar parâmetros e controlar sua execução (modo silencioso, códigos de erro e até mesmo recuperar logs de saída).

Graças a este módulo, podemos criar um método getLastTag() que retorna o nome da última tag.

```
import * as exec from '@actions/exec'
await exec.exec('git',
['describe',
'--abbrev=0',
'--tags'],
options);
```

Código-fonte: O código é simplificado aqui para facilitar a leitura. Encontre o código completo no repositório da Action, incluindo como recuperar o valor de retorno da linha de comando: https://github.com/actions/toolkit

Então, no mesmo princípio, podemos criar um método getCommits() que retornará a lista de mensagens de commits da nossa tag:

```
let tagFilter= tag+'..HEAD';
await exec.exec('git',
['log',
tagFilter,
'--oneline',
'--pretty-format:"%s"],
options);
```
Finalmente, para formatar a exibição de nossas notas de lançamento, um pequeno método toList(). O método formata cada mensagem em uma nova linha com um traço para fazer uma lista legal:
```
export function toList(text: string): string {
return text
.split('\n')
`-
.map(line => (line? - ${line} :"))
.join('\n')
}
```

## The creation of a release
O objetivo principal da nossa Ação é criar uma versão do GitHub. O GitHub, sendo uma plataforma moderna, expõe a maioria dos seus serviços como API REST. No nosso caso, queremos usar a API dedicada à criação de uma versão documentada aqui: https://docs.github.com/en/rest/ reference/repos#create-a-release. No entanto, antes de escrever nosso código chamando essa API, vamos ver o que o GitHub oferece em seu kit de ferramentas. Ao ler a documentação do módulo @actions/ do github, você encontrará um objeto octokit. Este objeto contém muitas propriedades e métodos, incluindo um chamado createRelease(). Parece promissor, não é?

O método pronto para uso se encaixa exatamente na nossa necessidade, mas requer vários argumentos (alguns deles são opcionais):

- [x] owner: o nome do proprietário que criará o release deve ser um dos usuários do repositório
- [x] repo: o link para o repositório que conterá o release
- [x] tag_name: o nome da tag
- [x] name: o título do nosso release
- [x] body: um texto que descreve o conteúdo do nosso release (onde queremos colocar nosso changelog)

Já temos todas as informações, exceto o nome do repositório e o proprietário. Eles estão localizados no contexto de um fluxo de trabalho, e seria possível usar as variáveis de ambiente no fluxo de trabalho. Aqui, novamente, o GitHub nos ajuda fornecendo um objeto pré-preenchido dentro do módulo @actions/ github, o famoso octokit.

```
// Creating a context object with our GITHUB_TOKEN
const octokit = github.getOctokit(repoToken);
// Creation of the release
const response = await octokit.repos.createRelease({
owner: github.context.repo.owner, // owner's name
repo: github.context.repo.repo, // repository's name
tag_name: newTag, // The tag we found
name: newTag, // The tag we found
body: releaseNotes, // release notes
})
```
Aviso: Dependendo da versão do pacote NPM @actions/github, a assinatura para chamar o método é octokit.rest.repos.createRelease() ou octokit.repos.createRelease(). Uma nova versão foi publicada após a escrita deste livro.

## The core of our Action
Agora que todos os métodos estão prontos, ainda temos que conectá-los e viver nossas ações. Primeiro, criaremos um arquivo index.ts, que corresponderá ao ponto de entrada da nossa ação.
O primeiro passo do método é ler os parâmetros conforme declarado no manifesto acima:

```
const token = core.getInput("githubToken");
const newTag = core.getInput("newTag");
const isChangeLogEnabled = core.getInput("generateArtifact");
```

Então obtemos a última tag:

```
const tag = await git.getLastTag();
```

Essa tag é então passada para o método getCommits() para recuperar a lista de mensagens. Essas mensagens são então formatadas por toList().
```
const messages = await git.getCommits(tag)
const releaseNotes = text.toList(messages);
```
Em seguida, são transmitidos para o método que cria a liberação.

`release.createRelease(newTag, token, releaseNotes);`

Por fim, um pedaço de código funcional correspondente ao parâmetro generateArtifact para decidir se um arquivo (changelog.txt) deve ou não ser gerado.

```
if (isChangeLogEnabled)
{
  io.writeOutput("changelog.txt", releaseNotes);
}
```
O código completo deste arquivo (index.ts) é:

```
import * as core from '@actions/core'
import * as git from './git'
import * as release from './release'
import * as text from './text'
import * as io from './io'

export async function start(): Promise<void>
{
try {
// retrieving parameters
const token = core.getInput("githubToken");
const newTag = core.getInput("newTag");
const isChangeLogEnabled = core.getInput("generateArtifact");
core.debug("Token: ${token}");
core.debug("Tag: ${newTag}");
core.debug("Generate changelog: ${isChangeLogEnabled}");
// retrieving tag
const tag = await git.getLastTag();
// retrieving history message
if (tag != ")
{
const messages = await git.getCommits(tag)
const releaseNotes = text.toList(messages);
core.debug("Releases notes: ${releaseNotes}");
// create release
release.createRelease(newTag, token, releaseNotes);
if (isChangeLogEnabled)
{
  io.writeOutput("changelog.txt", releaseNotes);
}

// set output variable
core.setOutput("relnotes", releaseNotes);
}
}
catch (error)
{
core.setFailed(error.message)
}
}
start();
```

## TypeScript compilation
A geração do código final da nossa ação é extremamente simples, pois requer apenas dois comandos:

- [x] npm install
- [x] npm run build

O comando "npm install", baixa na pasta node_modules todos os pacotes declarados em package.json, ou seja, todos os pacotes necessários para a nossa Ação e o módulo typescript que adicionamos manualmente. Além disso, dentro deste mesmo package.json são declaradas as configurações de script, uma das quais, chamada build, irá lançar o "TSC", o compilador Typescript.

```
"scripts" :{
  "build": "tsc",
"test": "echo \"Error: no test specified\" && exit 1"
},
"build": "tsc",
"test": "echo \"Error: no test specified\" && exit 1"
```

Por fim, um arquivo tsconfig.json é criado manualmente para definir a compilação do typescript. É declarado onde encontrar os arquivos de origem (**.ts*), mas o diretório de destino onde os arquivos JavaScript gerados serão colocados.

```
{
"compilerOptions": {
"target":"es6",
"module": "commonjs",
"outDir": "./js",
"rootDir": "./src",
"strict": true,
"noImplicitAny": true,
"esModuleInterop": true
},
```

É como a mecânica funciona dentro de um projeto TypeScript, um pouco complexo de configurar para neófitos, mas muito flexível. Sinta-se à vontade para verificar o repositório de amostra para analisar os diferentes arquivos: https://github.com/lgmorand/github-action-generate-relnotes

Nossa ação está tecnicamente pronta, mas ainda temos que enviar todos os arquivos de origem (incluindo arquivos baixados/gerados) para o repositório GitHub.

## Integration with a workflow
Outros usuários agora podem referenciar e usar nossa ação usando sua ramificação, já que nenhuma versão foi publicada ainda. Nossa responsabilidade é garantir que nossa Ação seja funcional, e a melhor maneira é criar um fluxo de trabalho de teste dentro do mesmo repositório.

```
- uses: ./ # called the action from the current repository
with:
githubToken: ${{ secrets.GITHUB_TOKEN }}
newTag: ${{ github.event.inputs.tag}}"
generateArtifact: true
```

Pequena sutileza, por padrão, quando um fluxo de trabalho baixa o código-fonte usando a ação checkout, ele realiza um "shallow checkout", um download apenas da versão mais recente do código-fonte, sem o histórico dos commits para ter o download mais rápido possível. No entanto, esse histórico é necessário porque contém as informações necessárias para encontrar tags e comentários. Portanto, é importante definir a ação checkout e indicar para retornar mais informações para nossa necessidade. Isso pode ser feito modificando o valor fetch-depth e dando a ele "O" para dizer à ação para baixar o histórico completo do Git.

```
- uses: actions/checkout@v4
with:
fetch-depth: 0
```

Um exemplo de um fluxo de trabalho que permite especificar a tag no momento do acionamento manual:

```
on:
workflow_dispatch:
inputs:
tag:
description: 'Tag'
required: true
jobs:
build:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
  with:
  fetch-depth: 0
- name: Generate release + changelog
- id: genRelease # an ID is required to recover relnotes
uses: ./ # called the action from the current repository
with:
githubToken: ${{ secrets.GITHUB_TOKEN }}
newTag: ${{ github.event.inputs.tag}}"
generateArtifact: true
- name: Test the generated release notes
- run: echo "${{ steps.genRelease.outputs.relnotes }}"

- uses: actions/upload-artifact@v4
  with:
name: changelog
path: changelog.txt
```
Quando o fluxo de trabalho é executado, um artefato contendo o arquivo changelog.txt contendo o histórico das mensagens dos commits é criado.
Artefato contendo o changelog
E um release com uma descrição profissional também é gerado.

## Our release and its changelog
E aqui para nossa segunda ação que mostra a interação com o GitHub. Também é possível fazer ações que interagem com outros itens, como criar issues quando um problema é detectado, interagir com repositórios, gerenciar usuários, além, é claro, de poder interagir com qualquer serviço de terceiros. Conto com sua imaginação para criar todos os tipos de fluxo de trabalho que atendam às suas necessidades.

## Create a docker Action
Além das Ações JavaScript, as Ações GitHub suportam ações no formato Docker (somente Linux). Se precisamos lembrar do interesse das ações Docker em comparação com as Ações JavaScript, nesse caso, é a capacidade de pré-empacotar vários elementos juntos: ferramentas, bibliotecas, intérpretes, etc., e garantir a consistência de um ambiente que nunca mudará ao longo do tempo. Reuni-los em um único pacote torna possível simplificar o fluxo de trabalho e evitar surpresas ruins criando uma imagem de contêiner imutável (que nunca mudará novamente). Assim, a ação sempre se comportará da mesma maneira. Infelizmente, as Ações JavaScript baixam e instalam essas mesmas ferramentas a cada execução. Portanto, pode haver conflitos de versão, pacotes que não estão mais disponíveis, etc.

## How does it work?
Integrar uma ação do tipo Docker em um fluxo de trabalho é feito da mesma forma que uma Ação JavaScript (autor/ repositório@versão), mas a mecânica por trás disso é diferente. Um fluxo de trabalho, quando executado, realiza tarefas muito específicas:
1. Ao iniciar o fluxo de trabalho, o GitHub cria uma nova máquina virtual cujo sistema operacional é baseado na propriedade runs-on que você definiu no fluxo de trabalho
2. Nesta máquina virtual é iniciado um runner que baixa o manifesto do fluxo de trabalho para saber as tarefas a serem executadas
3. A primeira ação (primeiro passo) deste runner é geralmente a ação checkout que baixa o código-fonte do repositório localmente
4. Então, quando se trata da nossa ação Docker, ele baixa todo o código-fonte do repositório que hospeda a ação
5. O runner busca um arquivo Dockerfile dentro do código-fonte e o usa para criar uma imagem Docker usando o comando "docker build"
6. Uma vez que a imagem é criada, o runner inicia uma instância de contêiner local e lhe dá acesso à pasta atual (mount). Dessa forma, seu container pode interagir com seus arquivos de código-fonte
7. O container executa sua ação e devolve o controle ao runner, que pode continuar a executar as próximas tarefas
8. Os logs são enviados ao GitHub para serem exibidos no portal

A mecânica usada para Docker Actions foi projetada para facilitar seu uso sem nenhuma adaptação do seu container (sua ação) ou mesmo da estrutura do seu repositório.

## Creating a Pandoc Action
Neste capítulo, para misturar teoria e prática, criaremos uma Docker Action contendo a ferramenta "Pandoc". O Pandoc é uma ferramenta de conversão de documentos. Ele pode pegar um formato de entrada e convertê-lo para outro, por exemplo, converter do HTML markdown ou texto bruto para arquivo do Microsoft Word, de um formato científico latex para PDF ou uma combinação de todos esses, porque o Pandoc sabe como gerenciar cerca de trinta formatos; ele é frequentemente chamado de canivete suíço da geração de documentos.
O livro que você está lendo atualmente foi escrito no formato Markdown em um repositório do GitHub e transformado com o Pandoc em diferentes formatos (Microsoft Word, PDF, epub) para ser compartilhado com meus leitores. Aqui está parte do fluxo de trabalho que gera o arquivo PDF; ele contém várias etapas. O tempo de instalação das diferentes ferramentas não é insignificante (2 minutos e 30 segundos no total para gerar o livro).

```
steps:
- uses: actions/checkout@v4 # downloading source code
  name: Apt-get update # update the package database
run: sudo apt-get update
- name: install pandoc #installing pandoc
run: sudo apt-get install --assume-yes pandoc
- name: install pdflatex # installing latex and several additional modules
run: |
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-xetex
- name: Build PDF version # Generating a PDF from markdown
run: pandoc -V documentclass-memoir --pdf-engine-xelatex -- from=markdown-blank_before_header -o './dist/GitHub Actions-a
practical guide.pdf'
working-directory: ./book
```

O fluxo de trabalho não é tão complicado (mesmo que você veja apenas uma pequena parte), mas gostaríamos de reduzi-lo a uma única etapa para facilitar a leitura. Além disso, explicamos anteriormente que as ações baseadas em um arquivo docker eram mais lentas, especialmente porque leva o GitHub para gerar uma imagem docker e, em seguida, implantar (girar) um contêiner. No entanto, esse tempo de processamento do Docker pode ser menor do que o tempo cumulativo de diferentes ações sequenciais de um fluxo de trabalho padrão, especialmente como veremos, a instalação do Pandoc e suas extensões leva 2 minutos atualmente, onde uma ação do docker realizando a mesma coisa levaria apenas 30 segundos. Portanto, para responder a esse tipo de cenário, é interessante que você aprenda como criar ações do Docker.
Para hospedar sua ação, é necessário criar um novo repositório, nomeie-o "github-action-pandoc". Se você escolher outro nome, terá que adaptar os exemplos de código de acordo.

## The structure of a Docker Action
Uma Docker Action é geralmente mais sintética do que uma JavaScript Action; ela geralmente contém quatro arquivos:
- [x] Um arquivo action.yaml, o manifesto do aplicativo para sua publicação no Marketplace (o mesmo formato das JavaScript Actions)
- [x] Um Dockerfile contendo as instruções para criar a imagem Docker
- [x] Um arquivo de script que será executado dentro do nosso contêiner
- [x] Um arquivo README.md para descrever sua ação

O arquivo README.md contém a descrição da sua ação e um exemplo de YAML para usar nossa Action:
```
- uses: lgmorand/github-action-pandoc@v1
with:
args: "--standalone --output-readme.pdf README.md"
```

A seção manifest difere muito ligeiramente daquela das ações JavaScript. A seção runs será específica, pois especificamos o tempo de execução do Docker, mas também um nome de arquivo que serve para gerar a imagem do contêiner. É um uso comum chamá-lo de Dockerfile.

```
runs:
using: "docker"
image: "Dockerfile"
```
O manifesto também contém as seções descritivas e de marca:

```
name: 'Pandoc Converter'
description: 'GitHub Action to Convert Documents via Pandoc'
author: 'Louis-Guillaume MORAND'
runs:
using: "docker"
image: "Dockerfile"
branding:
icon: 'book-open'
color: 'green'
```

Depois vêm os dois arquivos mais importantes: o arquivo docker de receitas e o script principal (que pode, é claro, ser composto de vários scripts dependendo de sua complexidade). O arquivo Dockerfile é uma lista de comandos que o Docker usará para criar sua imagem de contêiner; esta "receita" especifica todos os ingredientes a serem integrados, começando pelo sistema operacional, depois os módulos a serem instalados nele e, finalmente, os comandos a serem executados na inicialização.

Nota: Este livro não aborda em detalhes a escrita do Dockerfile e suas boas práticas. Se este tópico lhe interessa, a melhor fonte de informação continua sendo a documentação oficial: https://docs.docker.com/engine/reference/builder/. Em particular, existem boas práticas para iluminar imagens de contêiner, mas não as aplicaremos para manter o máximo de simplicidade e legibilidade.

O primeiro reflexo para atender à nossa necessidade de criar um contêiner Pandoc é escrever uma receita como esta, perfeitamente funcional:

```
# We choose a base OS Image: alpine is very lightweight
FROM alpine: 3.12
# Installing pandoc
RUN apk update && apk --no-cache add pandoc
# Installing additional modules and various tools
RUN apk add texlive-full\
texlive-xetex\
biber\
make\
rsync\
tar\
libarchive-tools\
gmp\
curl
ADD entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x","/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
```

No entanto, a geração desta imagem é relativamente lenta devido ao grande número de ferramentas para instalar (vários minutos), e o interesse de uma ação do Docker seria muito limitado em comparação ao nosso fluxo de trabalho original. Felizmente, os editores do Pandoc fizeram uma imagem de contêiner do Pandoc, permitindo-nos usá-la como base de trabalho e adicionar os módulos ausentes de que precisamos.

O novo arquivo Dockerfile é bastante simplificado e muito mais rápido de gerar:

```
# Base OS image: Alpine with already integrated Pandoc
FROM pandoc/latex:2.6
# Reduced installation of modules because many tools are already in the base image
RUN apk update\
&& apk add texlive-full\
texlive-xetex\
biber
# Integration of our script
ADD entrypoint.sh /entrypoint.sh
#Allowing script execution
RUN ["chmod", "+x", "/entrypoint.sh"]
#Defining the script to run at startup of the container
ENTRYPOINT ["/entrypoint.sh"]
```

Você certamente notou esse arquivo estranho chamado entrypoint.sh. Este é um arquivo de script simples para colocar ao lado do Dockerfile. Este é o ponto de entrada do nosso contêiner, o que significa que ele será chamado quando o contêiner iniciar e que os parâmetros foram enviados para o contêiner. Intrinsecamente, quando o runner executa sua ação, ele percebe algo como isto:

`docker run image-of-my-action --parameter-of-my-choice`

Assim, os parâmetros de uma ação são transmitidos para o container e então para o arquivo Entrypoint.sh que pode então usá-los. A estrutura de um script é geralmente da seguinte forma:

```
#!/bin/sh # the "shebang", header that tells the system by which interpreter
set -e

[...] # commands to run
```
No nosso caso, nada complicado, pois queremos apenas chamar a ferramenta Pandoc, pré-instalada em nosso contêiner, e então passar parâmetros que podem ser recuperados com "$ *":
```
#!/bin/sh
set-e
sh -c "pandoc $*" # opens a shell, and runs Pandoc by giving him the arguments
```

De quais argumentos estamos falando? Argumentos que estão no arquivo YAML. O runner os lê e então os passa para um contêiner que pode, por sua vez, transmiti-los para o script:

```
- uses: 1gmorand/github-action-pandoc@main # replace with your action
   with:
   args: "--standalone --output-readme.pdf README.md"
```
Portanto, o comando final é "pandoc standalone -output=readme.pdf README.md", que diz ao Pandoc para pegar o arquivo README.md e transformá-lo em readme.pdf. Finalmente, se você ainda não fez isso, crie um arquivo README.md com conteúdo markdown.

Nota: Você pode encontrar minha ação pronta para o usuário e bifurcá-la se desejar. Ela está localizada neste repositório: https://github.com/lgmorand/github-action-pandoc. Eu recomendo que você pegue o arquivo sample.md e coloque seu conteúdo em seu arquivo README.md. O resultado deste arquivo transformado em PDF pode surpreendê-lo.

Seu repositório deve ser parecido com isto:

Resta testar sua Ação. Para fazer isso, vamos criar um fluxo de trabalho dentro do repositório de sua Ação. Temos que testar várias coisas:

- [x] Que o arquivo dockerfile seja válido e gere com sucesso uma imagem de contêiner (isso será feito automaticamente ao chamar nossa função)
- [x] Que a chamada para nosso contêiner passando parâmetros seja executada sem erros
- [x] Que o arquivo gerado esteja no formato correto e não contenha nenhum erro

Isso pode ser feito com um fluxo de trabalho muito simples que contém três ações:

1. A primeira ação baixa o código-fonte (checkout)
2. A segunda, a ação Pandoc, transforma o README.md em um arquivo PDF
3. A terceira ação carrega o arquivo PDF como um artefato

```
name: Generate PDF
on:
workflow_dispatch: # manual trigger
push:
# and each commit on the main branch
jobs:
generate:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- uses: lgmorand/github-action-pandoc@main # replace with your action and your branch
with:
args: "--standalone --output-readme.pdf README.md"
- uses: actions/upload-artifact@v4
with:
name: "PDF"
path: readme.pdf

```
A execução deste fluxo de trabalho permite que você gere uma imagem de contêiner na inicialização antes de executar as ações. De fato, o GitHub começa validando todos os pré-requisitos de execução cuja validade das ações antes de executá-las.

Finalmente, você notará que entre os artefatos associados ao seu fluxo de trabalho está um arquivo pdf.zip que contém o arquivo readme.pdf que acabamos de gerar. Se você usou o conteúdo do arquivo sample.md, você deve ter um PDF com uma página de rosto, um índice e um layout bonito. Novamente, é o poder do Pandoc.

## How to optimize Docker Actions
A principal lentidão de uma Docker Action é a "compilação" da própria imagem. Em nosso fluxo de trabalho de exemplo, em quase 4 minutos para executar todo o fluxo de trabalho, 3 minutos e 33 segundos são consumidos apenas pela criação desta imagem.

Mais problemático, uma imagem de contêiner é recriada com cada execução do fluxo de trabalho, o que significa que tempo é perdido a cada vez (o que também não é favorável ao meio ambiente!). Como a ação em si não muda entre duas execuções, a solução elegante seria gerar a imagem uma vez e reutilizá-la depois.

Esta solução é viável com GitHub Actions ao atingir três etapas:
1. Geração da imagem de contêiner da sua ação
2. Publicação da ação no Docker Hub (ou qualquer registro de contêiner)
3. Edite seu fluxo de trabalho para carregar a ação do Registro do Docker Hub

Se você ainda não tiver uma, precisará criar uma conta no Docker Hub (https://hub.docker.com/). Isso permitirá que você tenha um registro de contêiner pessoal, ou seja, uma biblioteca onde armazenar suas imagens de contêiner que podem ser baixadas de qualquer lugar. Anote seu login e sua senha porque você precisará deles.

No repositório da sua ação, crie um novo fluxo de trabalho de publicação de imagem do Docker. Para o exemplo, escolheremos um gatilho manual para publicar somente quando uma versão estável estiver pronta. Adicionamos dois parâmetros para fornecer no momento do gatilho: o nome da imagem e sua tag (número da versão). A primeira parte do nome da imagem deve incluir seu login do Docker e corresponde ao seu "namespace".

```
name: Publish Docker Image
on:
workflow_dispatch:
inputs:
version:
description: 'name of the container image'
required: true
image:
description: 'version of the container image'
required: true
default: "lgmorand/github-action-pandoc"
```
Isso tem a consequência de exibir um formulário durante a inicialização do fluxo de trabalho:

Então vem a parte dos passos. O primeiro passo baixa o código-fonte e os arquivos que precisaremos (Dockerfile e entrypoint.sh).
```
jobs:
publish:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
```

O próximo passo é conectar-se ao Docker Hub. Ao fazer isso, uma chave de conexão (token) é baixada localmente pelo runner e será reutilizada pelos seguintes comandos:

```
- name: Docker Hub login
run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "$ {{ secrets.DOCKER_USERNAME }}" --password-stdin
```

Depois vem o último passo, responsável por recuperar as variáveis que você insere no workflow iniciado, para construir a imagem docker da nossa ação, marcá-la com um número de versão e, finalmente, publicar a imagem no seu Docker Hub. A imagem então estará disponível e reutilizável:

```
- name: Push image to Docker Hub
run:|
VERSION="${{ github.event.inputs.version}}"
IMAGE_NAME="${{ github.event.inputs.image }}"
TAG="$IMAGE_NAME: $VERSION"

docker build --file Dockerfile --tag $IMAGE_NAME --label "org.opencontainers.image.version= $VERSION"
docker tag $IMAGE_NAME $TAG
docker push $TAG
```

O resultado final do fluxo de trabalho é:

Recurso: em caso de problemas ou se você não quiser reescrever o fluxo de trabalho completamente, você pode encontrar uma versão pronta para uso no repositório https://github.com/ lgmorand/github-action-pandoc

```
name: Publish Docker Image
on:
workflow_dispatch:
inputs:
version:
description: 'version of the container image'
required: true
image:
description: 'name of the container image'
required: true
default: "lgmorand/github-action-pandoc"
jobs:
publish:
runs-on: self-hosted
steps:
uses: actions/checkout@v4
- name: Docker Hub login
run: echo "${{ secrets.DOCKER_PASSWORD}}" | docker login -u "${{ secrets.DOCKER_USERNAME}}" --password-stdin
name: Push image to Docker Hub
run: |
VERSION="${{ github.event.inputs.version}}"
IMAGE_NAME="${{ github.event.inputs.image}}"
TAG="$IMAGE_NAME:$VERSION"
docker build. --file Dockerfile --tag $IMAGE_NAME --label "org.opencontainers.image.version= $VERSION"
docker tag $IMAGE_NAME $TAG
docker push $TAG
```

Quando o fluxo de trabalho é executado com sucesso, o contêiner da sua ação pode ser encontrado no seu namespace no Docker Hub.

Agora que a imagem foi gerada, é necessário indicar ao fluxo de trabalho para usá-la em vez de gerar uma do Dockerfile. Isso é feito com uma nova maneira de chamar uma
Ação do Docker e o prefixo "docker://":

```
- uses: docker://NAMESPACE/NAME_DOCKER_IMAGE:VERSION
with:
args: "--blahblah" # parameters
```

Isso nos permite escrever um fluxo de trabalho substancialmente idêntico ao que havíamos escrito anteriormente:

```
name: Generate PDF - optimized version
on:
workflow_dispatch:
jobs:
generate:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- uses: docker://lgmorand/github-action-pandoc:1.0.1
with:
args: "--standalone --output-readme.html README.md"
- uses: actions/upload-artifact@v4
with:
name: "Artifact"
path: readme.html
```

Mas cujo tempo de execução será significativamente menor:

Tempo de execução reduzido

Concluindo, criar uma Docker Action nos permitiu ir de um fluxo de trabalho "JavaScript" que levava 2 min 30 para um fluxo de trabalho usando Docker, que levava 3 min 30 antes de otimizá-lo para atingir um tempo de execução de 20 segundos. Em larga escala ou simplesmente dentro de uma equipe de desenvolvimento, ganhar velocidade em cada execução do fluxo de trabalho é uma prioridade para a eficiência geral e faz parte da mentalidade DevOps.

No entanto, lembre-se de que uma parte do tempo de execução do fluxo de trabalho vem do download da imagem do Docker. Portanto, deve-se manter seu tamanho o menor possível, o que pode ser feito usando imagens minimalistas básicas (Alpine e outras versões chamadas distroless) e por meio do procedimento "multiestágio" dentro dos arquivos Dockerfile. Esta parte, embora não seja complexa, não é abordada neste livro; no entanto, você encontrará facilmente informações sobre ela na Internet.

## Create composite Actions
Depois de abordar ações JavaScript e sua alternativa Docker, vamos abordar ações compostas (etapas de execução compostas na documentação). Ação composta é uma ação composta de outras ações. Ela simplifica fluxos de trabalho (legibilidade) e facilita a reutilização quando uma ação de grupo é repetida várias vezes em vários fluxos de trabalho. Essas ações compostas são "partes" de fluxo de trabalho que serão injetadas em seus fluxos de trabalho de chamada.

Ação composta não é muito diferente de ação JavaScript ou Docker. Ela tem o manifesto action.yaml contendo os mesmos campos com uma exceção para o campo runs. Este contém o valor "using: composite" bem como uma propriedade "steps", que conterá as diferentes etapas no mesmo formato de um fluxo de trabalho "padrão":

```
runs:
using: "composite" # Specific mode that means that this module is a composite action
steps:
- run: echo "I'm the first step"
name: step1
- run: echo "I'm the second step"
name: step2
```

Nada realmente complexo. Especialmente porque no fluxo de trabalho pai, chamar uma ação composta é feito da mesma forma que para qualquer ação padrão:

```
jobs:
test:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- uses: 1gmorand/mon-action-composite@v1
```

Vamos colocar isso em prática criando juntos uma ação composta verdadeira. Nosso exemplo é uma ação que escaneia o código-fonte para verificar se as senhas foram codificadas no código-fonte, o que seria uma prática ruim e mereceria bloquear uma compilação/lançamento.

Crie um novo repositório chamado "github-action-composite- credscanning" e crie lá um arquivo manifesto action.yaml. Comece adicionando os metadados padrão:

```
name: 'Credentials scanning'
description: 'Scan source code to find if credentials have been hardcoded'
branding:
icon: 'lock' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

Nota: O código-fonte completo desta ação de exemplo está no repositório público: https://github.com/lgmorand/github-action-composite-credscanning

Em seguida, adicione um parâmetro de entrada folderToScan que especifica a pasta (e subpastas) que você deseja que o scanner. Útil quando não queremos escanear o repositório completo.

```
inputs:
folderToScan: #path
description: 'The folder where to scan files'
required: true
default: '/src'
```

Então adicione o primeiro passo. Graças ao seu comando Bash particular, ele faz uma busca recursiva que permite que você encontre todos os arquivos contendo a palavra "password" e salva a lista de arquivos "em risco" em um arquivo chamado result.txt. Note que seu diretório de trabalho é especificado por meio da propriedade working- directory, que recupera o valor do parâmetro de entrada. Assim, seremos capazes de ter uma ação composta cujo caminho será dinâmico de um fluxo de trabalho para outro:

```
runs:
using: "composite"
steps:
- run: grep "password" . -R > ../result.txt
shell: bash
working-directory: ${{ inputs.folderToScan }} # Retrieves the input parameter
```
Adicione uma segunda etapa que conta o número de arquivos encontrados contando o número de linhas que foram escritas no arquivo result.txt. Para isso, você pode usar o comando "wc" (significa "contagem de palavras") e passar o parâmetro "-1" para pedir que ele conte as linhas.

```
- shell: bash
run: COUNT=$(wc -1 < result.txt) # counts and puts the result in the variable COUNT
```

Exporte essa variável como saída em seu passo para então ser transmitida ao pai do fluxo de trabalho. Para isso, é necessário dar um ID exclusivo ao seu passo.

```
-id: count-files # unique ID of your step
shell: bash
run: |
      COUNT=$(wc-1 < result.txt)
      echo "filesCount=$(echo $COUNT)" >> $GITHUB_OUTPUT # export of our variable
```

Por fim, resta apenas recuperar a saída desta etapa e transformá-la em uma saída de ação. Assim, o valor da variável é acessível pelo fluxo de trabalho pai. Isso acontece declarando um bloco de saída compreendendo uma variável de saída "scanned-files", que será mapeada para o valor de saída da etapa de contagem "count-files".

```
outputs:
scanned-files: # name of the output variable
description: "Number of files scanned"
value: ${{ steps.count-files.outputs.filesCount}}
```

O resultado completo do arquivo YAML deve ficar assim:

```
name: 'Credentials scanning'
description: 'Scan source code to find if credentials have been hardcoded'
inputs:
folderToScan:
description: 'The folder where to scan files'
required: true
default: '/src'
outputs:
scanned-files:
description: "Number of files scanned"
value: ${{ steps.count-files.outputs.filesCount}}
runs:
using: "composite"
steps:
· run: grep "password" . -R > ../result.txt
shell: bash
working-directory: ${{inputs.folderToScan }}
-id: count-files
 run: |
      COUNT=$(wc -l < result.txt)
      echo "File count: $COUNT ">> $GITHUB_OUTPUT
      shell: bash
```

Qualquer ação deve sempre ter seu próprio fluxo de trabalho de teste para garantir que esteja totalmente funcional, integrando-a de alguma forma. Por exemplo, crie um fluxo de trabalho de gatilho manual no repositório da sua ação e proponha um parâmetro de entrada "pasta" para personalizar a pasta escaneada.
```
name: Test composite action
on:
workflow_dispatch:
inputs:
folder:
required: true
jobs:
test:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
 [...] our steps
```

Em seguida, basta chamar sua ação composta transmitindo o parâmetro de entrada do fluxo de trabalho (pasta) por meio do parâmetro de entrada da ação (folderToScan):

```
-id: myCompositeAction
uses: 1gmorand/github-action-composite-credscanning@main
default: "src"
with:
folderToScan: "${{ github.event.inputs.folder }}" # Using the input parameter
```

Em seguida, adicione uma etapa que recupere a variável de saída da ação e gere uma mensagem de erro do GitHub se senhas codificadas forem encontradas.


```
- run: |
if [ ${{ env.COUNT }}> 0]
then
echo "::error::Some files contain hardcoded passwords"
exit 1
fi
env:
COUNT: ${{ steps.myCompositeAction.outputs.scanned-files }}
```

Idealmente, deveríamos colocar o gerenciamento da exceção e sua configuração dentro da ação composta para esconder a lógica de negócios e simplificar seu uso. Primeiro, no entanto, é interessante entender como retornar variáveis internas ao fluxo de trabalho pai para pedagogia.

Limitações
Ações compostas, infelizmente, ainda têm muitas limitações. Se algumas podem desaparecer em breve, elas ainda estão presentes (verão de 2021) e podem ser suficientemente impactantes em muitos casos para tornar essas ações inutilizáveis.
A primeira limitação importante foi a impossibilidade de usar a palavra-chave "uses" nessas ações e chamar uma ação de terceiros. Felizmente, esse recurso está disponível desde agosto de 2021 e fornece uma unidade maior de reutilização, como:

```
runs:
using: "composite"
steps:
- uses: docker/setup-buildx-action@v3
- uses: docker/login-action@v3
with:
username: ${{inputs.registry_username}}
password: ${{inputs.registry_password}}
- uses: docker/build-push-action@v5
with:
context: .
push: true
tags: user/app:latest
```

Outros recursos estão, no momento, indisponíveis ao usar Ações compostas:
- [x] Não é possível usar dependências (palavra-chave "needs")
- [x] Recursos de tempo limite não funcionam (timeout-minutes)
- [x] Falha silenciosa de uma etapa (continue-on-error)
- [x] Acesso a segredos. Eles devem ser recuperados pelo fluxo de trabalho pai e passados para a Ação como parâmetros

Esses recursos estão atualmente em desenvolvimento pelas equipes do GitHub, e esses limites podem desaparecer em um futuro próximo. Minhas fontes internas no GitHub me dizem que o uso da palavra-chave uses deve estar disponível por volta de agosto de 2021.

## GitHub Script
Vimos que é possível criar vários tipos de ações do github, algumas das quais são desenvolvidas usando JavaScript e que podem tirar proveito do framework octokit.js (https://octokit.github.io/rest.js). Este framework permite que você faça quase tudo no GitHub usando um cliente REST que pode chamar as diferentes APIs. Qualquer ação na sua conta do Github (repositórios, branches, segurança, etc.) que você queira fazer pode ser feita facilmente por meio deste framework.

GitHub Script https://github.com/actions/github-script é uma Action que permite que você acesse a API do GitHub a partir de qualquer fluxo de trabalho e permite, entre outras coisas, chamar todos os métodos disponíveis no octokit sem precisar criar uma ação personalizada do github. O exemplo a seguir mostra como criar facilmente um Issue :

```
- uses: actions/github-script@v7
with:
github-token: ${{secrets.GITHUB_TOKEN}}
script:
github.rest.issues.create({
owner: context.repo.owner,
repo: context.repo.repo,
title: "You've created this issue using GitHub Script!!!"
})
```


Isso também permite que você crie cenários avançados, como enviar uma mensagem para qualquer colaborador iniciante:

```
on: pull_request_target
jobs:
welcome:
runs-on: self-hosted
steps:
- uses: actions/github-script@v7
with:
script: |
// We get all issues created by the user
// because issues and PR are mixed up together in events
const creator = context.payload.sender.login
const opts = github.rest.issues.listForRepo.endpoint.merge({
...context.issue,
creator,
state: 'all'
})
const issues = await github.paginate(opts)
for (const issue of issues) {
if (issue.number === context.issue.number) {
continue
}
if (issue.pull_request) {
return // person already contributed, we stop here
}
}

await github.rest.issues.createComment({
issue_number: context.issue.number,
owner: context.repo.owner,
repo: context.repo.repo,
body: ***Welcome**, new contributor!

Certifique-se de ler nosso [guia de contribuição](CONTRIBUTING.md) e estamos ansiosos para analisar sua solicitação de Pull em breve.})
```
## Interact on other repositories
O GitHub Script é uma ação que fornece um cliente octokit autenticado. Ele recupera automaticamente o contexto do fluxo de trabalho atual e o usa para executar suas ações. Por padrão, quando um fluxo de trabalho é acionado, ele preenche uma variável (GITHUB_TOKEN) com direitos de acesso no repositório atual, e a ação do GitHub Script carrega essa variável implicitamente. No entanto, pode acontecer de você querer interagir em um repositório de terceiros ou alterar algo na configuração da sua conta/organização. Para isso, é necessário fornecer um token de autenticação com direitos de acesso suficientes.

Informações: A criação de um token PAT é feita no portal GitHub, clicando no seu perfil, depois em Configurações, Configurações do desenvolvedor e, finalmente, Tokens de acesso pessoal.

No exemplo a seguir, criamos um token que colocamos em um segredo e o passamos para a ação por meio da propriedade github-token. Este token tem um escopo maior do que o repositório atual e, portanto, torna possível interagir nos elementos de uma conta de usuário ou de uma organização. No caso a seguir, simplesmente listamos os repositórios existentes, mas também podemos completar o código para configurar esses repositórios com proteções de ramificação ou gerenciar usuários.


```
- uses: actions/github-script@v7
id: get-repos
with:
github-token: ${{secrets.MY_GITHUB_TOKEN}}
script:|
return github.rest.repos.listForUser({
username: "lgmorand"
});
```

Então, mesmo que não seja uma Ação que você mesmo cria, pareceu essencial apresentá-la para que você possa usá-la para enriquecer seus fluxos de trabalho.

Agora, vamos dar uma olhada em como melhorar suas Ações.

## Improve the user experience of your actions
Ao criar uma ação para seu uso pessoal ou compartilhá-la com o maior público, é importante tornar a experiência do usuário a mais simples e agradável possível. Portanto, o uso de sua Ação pode ter uma boa experiência do usuário se você seguir regras básicas. Aqui estão algumas:

- [x] Qualquer ação deve ter um README claro e completo, idealmente escrito em inglês
- [x] Forneça exemplos de como usar sua ação (trechos YAML)
- [x] Considere também fornecer fluxos de trabalho de amostra abrangentes. Um trecho de código às vezes omite mostrar o que acontece antes e depois
- [x] Simplifique seu uso com parâmetros explícitos e de nome curto, mas também com valores padrão
- [x] Se você criar uma ação docker, mesmo que ofereça uma imagem de contêiner pronta para o usuário, forneça o arquivo Dockerfile para permitir que as pessoas vejam o que ele contém e para permitir que reconstruam a imagem do seu lado
- [x] Considere, dependendo da complexidade da sua ação, fornecer um modo DEBUG/VERBOSE para exibir mais detalhes se ocorrerem problemas de configuração
- [x] Se sua ação gerar arquivos, exponha um parâmetro para permitir que o usuário especifique o nome e o caminho do arquivo gerado

Existem outras boas práticas, que exigem algum esforço, mas cujo valor agregado, por menor que seja, melhora muito o uso da sua ação.

## Improving logs
Os logs da sua ação são a principal maneira de um usuário verificar se o comportamento esperado ocorreu bem e o melhor lugar para obter informações sobre as várias atividades realizadas. Os logs da sua ação aparecem nos logs de execução do fluxo de trabalho no portal do GitHub e são mais ou menos legíveis.

No entanto, há muitas maneiras de melhorar a legibilidade. A primeira maneira é usar os métodos dedicados para mensagens de aviso e erro, respectivamente: error() e warning().

```
core.warning('my warning message');
core.error('my error message');
```

Também pode ser usado sem o kit de ferramentas:

```
echo '::error::my error message'
echo '::warning::my warning message'
```

Além de serem enfatizadas dentro dos logs, as mensagens digitadas como "aviso" ou "erro" também são exibidas na tela de resumo do fluxo de trabalho.

Isso permite que você destaque mensagens importantes no meio de centenas de linhas de logs que um fluxo de trabalho pode produzir.

## Annotations
Essa coloração também pode ser realizada manualmente, seja para a cor do texto, cor de fundo ou estilo do texto (negrito, itálico, sublinhado). Então, prefixe o texto a ser exibido com um código de escape, com base nos códigos ANSI (https://en.wikipedia.org/wiki/ANSI_escape_code), que torna possível controlar totalmente o layout do texto que o segue:


```
core.info("\u001b[38;5;6mText in blue')
core.info("\u001b[48;2;255;0;0mOr a blue background')
core.info("\u001b[1mOr just bold text')
```
Posso brincar com cores

Também é possível injetar ícones nos logs para tornar uma mensagem mais visual.

Também posso incorporar ícones se quiser 13 qualquer tipo de ícone

Inclusão de ícones

A lista de ícones possíveis é baseada na lista de emojis suportados pelo portal GitHub. A lista inclui várias centenas deles, o suficiente para atender a cada uso. A lista completa de códigos de ícones e a imagem associada a cada um deles está na seguinte página: https://github.com/ikatyang/emoji-cheat-sheet.

Por fim, saiba que também é possível agrupar logs em blocos dobráveis usando os métodos startGroup() e endGroup(), conforme mostrado no exemplo a seguir:

```
core.startGroup('A group of logs')
core.info('my first log')
core.info('my second log')
core.info('my third log')
core.endGroup()
```

## Customizando Sumário Job
Assim como as anotações que já discutimos, que permitem enfatizar alguns avisos ou mensagens de erro, é possível adicionar informações na página de resumo da execução de um fluxo de trabalho. Pode ser um link, detalhes, um status da implantação ou qualquer coisa que você queira fornecer ao usuário final.

Para gerar um resumo do Job, você só precisa anexar conteúdo markdown na variável $GITHUB_STEP_SUMMARY e esse conteúdo será formatado e adicionado ao portal GitHub automaticamente.

echo "{markdown content}" >> $GITHUB_STEP_SUMMARY

Os recursos são tão infinitos quanto o markdown permite, como layout, lista, tabelas, ícones, mas também esquemas (usando o formato Mermaid https://mermaid-js.github.io/mermaid).

```
- run: |
echo "# This is a title"                               >> $GITHUB_STEP_SUMMARY
echo ""                                                >> $GITHUB_STEP_SUMMARY # this is a blank line build summary
echo "- My first element"                              >> $GITHUB_STEP_SUMMARY
echo "- My second one"                                 >> $GITHUB_STEP_SUMMARY
echo " How about a third one with an icon :thumbsup:?" >> $GITHUB_STEP_SUMMARY
```

## Job Summary
Observe que, dentro das Ações personalizadas do GitHub, você pode carregar o SDK (pacote NPM @action/core) para formatar facilmente o Resumo do Trabalho, como:

```
import * as core from '@actions/core'
await core.summary
.addHeading('Test Results')
.addTable([
[{data: 'Test', header: true}, {data: 'Result', header: true}],
['Test n°1', 'Pass'],
['Test n°2', 'Fail'],
['Test n°3', 'Pass']
.addLink('View deployed application!', 'https://my-link.com')
.write()
```
## Set up a DEBUG mode
Como você verá mais adiante neste livro durante o capítulo sobre depuração, o GitHub oferece a possibilidade de ativar o "Debug Mode", um tipo de variável global que diz a um fluxo de trabalho para ser mais verboso. Este capítulo explicará diferentes técnicas de depuração, mas para a que nos interessa agora, é suficiente que você crie um segredo chamado ACTIONS_STEP_DEBUG com o valor "true" no repositório onde o fluxo de trabalho é executado (e não o da sua Action!). Naturalmente, isso tem o efeito de tornar o agente mais verboso sobre as tarefas que ele realiza.

### Activation du mode DEBUG
Estando ciente desse modo, sua ação pode então tirar vantagem dele para exibir informações adicionais ao usuário. A maneira mais fácil é usar o GitHub Actions Toolkit (https://github.com/actions/toolkit) e, em particular, seu módulo core que fornece métodos para exibir uma mensagem no console somente se o usuário tiver ativado o modo DEBUG.


```
#Loading the module
const core = require('@actions/core');
#Displaying a message
core.debug('This is my DEBUG message');
```
Caso você não consiga usar o kit de ferramentas de ação JavaScript, há um método alternativo com a seguinte formatação para escrever uma mensagem no console que funciona com todas as tecnologias:

`echo "::debug::This is my DEBUG message"`

O Toolkit também fornece uma função (isDebug()) que permite que você execute o processamento somente se o modo Debug estiver habilitado. Útil para iniciar diferentes comandos ou executar ações em arquivos, por exemplo. Conforme mostrado no exemplo a seguir:

```
if (!core.isDebug()) // Normal mode > Note the "!" meaning NOT
{
//curl https://github.com
// Deletes temporary files
}
else // Mode Debug
{
  //curl -v https://github.com
// does not delete temporary files for analysis
}
```
Cada uma dessas boas práticas é importante porque, com esses pequenos detalhes, sua ação será adotada por um número maior de pessoas.

## Using Pre and Post Scripts
A ação torna possível executar um conjunto de comandos quando o agente a inicia, mas infelizmente é impossível para ela controlar sua posição dentro do fluxo de trabalho; pode estar no início, no meio ou no final, de acordo com o autor do fluxo de trabalho. Às vezes, no entanto, podemos precisar que nosso processamento de trabalho seja feito em várias etapas, potencialmente no início do fluxo de trabalho para executar tarefas de inicialização ou às vezes no final do fluxo de trabalho para executar um script de limpeza. Criar uma ação padrão não dá liberdade para fazer isso fora da própria ação: a limpeza será feita após o código principal terminar, mas antes que a próxima ação seja chamada. Não é o que queremos. Depois de todas as outras ações que desconhecemos, como executar um script no final do fluxo de trabalho?

O GitHub Actions fornece um recurso específico para essa necessidade usando palavras-chave pre e post, que devem ser definidas no manifesto action.yaml da nossa ação. Como a palavra-chave main que especifica o script principal, essas palavras-chave especificam um script para executar no início do fluxo de trabalho e outro no final dele. O exemplo a seguir declara um script (pre.js) acionado antes de qualquer outra ação e outro script (post.js) acionado no final do fluxo de trabalho.

```
runs:
using: 'node20'
main: 'index.js'
pre: 'pre.js'
post: 'post.js'
```

A ação é então carregada três vezes no fluxo de trabalho e executada a cada vez apenas o script correspondente à etapa do fluxo de trabalho:

## Conditionality
Durante suas experiências, você descobrirá que é costume compactar os diferentes arquivos JavaScript de um único arquivo para facilitar o gerenciamento e reduzir o tamanho do código-fonte (as pessoas geralmente usam o módulo CNN do npmJS para fazer isso). Você encontrará ações que chamam o mesmo arquivo que o script principal, pre ou post. Por exemplo, se você olhar o código-fonte da ação CHECKOUT (muito informativo: https://github.com/actions/checkout/), você descobrirá que é um uso duplo do mesmo arquivo index.js:

```
runs:
using: node20
main: dist/index.js
post: dist/index.js
```

Como explicar que o script não executa a mesma coisa que é chamada como script principal ou pós-script? O script simplesmente tem uma lógica interna que o faz executar um código diferente dependendo do momento no fluxo de trabalho. Isso é feito com a variável de ambiente STATE_isPost. Por exemplo, o código JavaScript poderia ser assim:

```
const isPost = Boolean(process.env['STATE_isPost'])
if (isPost)
{
  myPostCode();
}
else
{
  myStandardCode();
}
```

Existe uma alternativa se você tiver scripts separados e não quiser colocar uma lógica de negócios dentro do script. Por exemplo, você quer ter um script de inicialização que seja acionado somente no Windows. Em vez de colocar esse controle da versão do Windows dentro do script que será iniciado e potencialmente não fará nada depois, é possível pedir ao agente para fazer esse teste para você usando a propriedade pre-if.

```
pre: 'pre-script.js'
pre-if: runner.os == 'windows'
```

Existe a propriedade post-if que funciona da mesma forma. Ela também pode ser baseada no resultado da execução do script principal. Assim, no caso a seguir, o script post.js só será executado se o script principal tiver sucesso sem error:

```
post: 'post.js'
post-if: 'failure()'
```
Docker: Existe uma mecânica idêntica para ações do Docker, mas ela usa propriedades como pre-entrypoint e post-entrypoint.
Com essas poucas opções adicionais, agora você pode criar uma ação que controla perfeitamente seu fluxo de trabalho. Quando este capítulo for assimilado, vire a página para começar a próxima seção que aborda conceitos ainda mais avançados do GitHub Actions.

## Conceitos avançados
Esta terceira seção do livro lida com conceitos avançados. Esses conceitos não são necessariamente complexos, mas vêm como um segundo passo na jornada de aprendizado e uso da plataforma.

### Artifact management
Os fluxos de trabalho podem executar qualquer tipo de tarefa e, para muitos deles, durante sua execução, gerarão elementos: binários, ativos de aplicativos da Web, arquivos compactados, resultados de testes ou logs. Esses elementos gerados, comumente chamados de artefatos, são criados nas máquinas virtuais usadas para executar o fluxo de trabalho e são perdidos permanentemente no final do fluxo de trabalho quando o GitHub reinicializa automaticamente a máquina virtual.

Às vezes, é necessário manter esses artefatos, seja para necessidades de arquivamento ou simplesmente porque o objetivo principal do fluxo de trabalho é gerar um elemento que deve ser recuperado e preservado. Além disso, é claro, é possível pedir ao fluxo de trabalho para copiá-los por meio de ações em serviços de terceiros (hosts da web, servidor FTP, etc.). Ainda assim, o GitHub oferece um serviço de arquivamento diretamente integrado ao seu portal da web.

### Artifacts vs. Packages
Os elementos gerados podem ser armazenados em duas categorias, dependendo do uso que será feito deles.

A primeira categoria está relacionada aos elementos técnicos. É aceito que todos os elementos gerados por um fluxo de trabalho se enquadrem nessa categoria (arquivo zip, binários, logs, imagem de contêiner, etc.). Combinar esses elementos para executar um fluxo de trabalho e disponibilizar seu download sob demanda é possível. É nessa categoria que o GitHub nomeia os Artefatos.

A segunda categoria contém os elementos técnicos reutilizáveis por outros fluxos de trabalho/projetos: pacotes ou bibliotecas que são baixados automaticamente por alguns projetos que os referenciam. Esses elementos específicos, que devem ser baixáveis por outros fluxos de trabalho, serão salvos em outro serviço do GitHub: Pacotes do GitHub. Isso é o equivalente a outros produtos com os quais você pode estar familiarizado, como Nexus, Artifactory ou Azure DevOps Artifacts. Os seguintes formatos são suportados:

- [x] Pacotes NuGet, usados por projetos .NET
- [x] Maven para projetos Java
- [x] NPM para projetos JavaScript
- [x] Gradle para projetos Java
- [x] RubyGems para projetos Ruby

E mais do que isso, o GitHub Packages oferece um registro de contêiner docker.

Assim, dependendo do tipo de item gerado e seu uso, você pode usar o GitHub Artifacts ou o GitHub Packages.

### Publication of an artifact
A publicação de um artefato é extremamente simples e consiste em usar a ação actions/upload-artifact. Esta requer apenas dois parâmetros:
- [x] path: o(s) arquivo(s) ou pasta(s) a serem incluídos no arquivo zip gerado
- [x] name: o nome do arquivo Zip gerado

```
- name: Archiving the binaries of the application
uses: actions/upload-artifact@v4
with:
path: myapplication.exe # Take and zip a particular file
name: Release           # And upload it as Release.zip
- name: Archiving the technical logs
uses: actions/upload-artifact@v4
with:
path: logs # Take all files in the logs folder
name: logs # Upload them as logs.zip
```

Após executar o fluxo de trabalho na tela de resultados, são listados todos os artefatos gerados. Eles podem ser facilmente baixados.

### Retention
No entanto, esses artefatos não podem ser considerados um arquivo confiável. Primeiro, os arquivos associados são destruídos porque o histórico do fluxo de trabalho pode ser excluído manualmente (ou por engano). Mas, acima de tudo, esses elementos têm um tempo máximo de retenção, após o qual o GitHub os remove automaticamente. Essa duração é configurável nas configurações do repositório do GitHub:

- [x] 90 dias máximos de retenção para repositórios públicos.
- [x] 400 dias máximos de retenção para repositórios privados.

Essa é a duração máxima padrão aplicada a cada artefato. Também é possível personalizar essa duração de retenção (menor que o limite padrão) para um determinado elemento, especialmente onde os artefatos são significativamente maiores. Como lembrete, a cota de armazenamento gratuito no GitHub é de apenas 500 MB para uma conta gratuita do GitHub. Portanto, para liberar algum espaço limitando o tempo de retenção de um artefato específico, é necessário usar a propriedade retention-delay:

```
- uses: actions/upload-artifact@v4
with:
name: my-artifact
path: /output
retention-days: 5 # days of retention
```
Dica: Se você atingir o tamanho máximo de armazenamento da sua conta, o upload de um novo artefato falhará. É possível abrir os resultados de fluxos de trabalho antigos e remover os artefatos manualmente e um por um. Há também uma Ação para excluí-los todos de uma vez: kolpav/purge-artifacts-action. Por fim, observe que, uma vez que a remoção é feita, o GitHub pode levar uma ou duas horas antes de considerar o espaço e permitir que você faça o upload novamente.

Se sua necessidade é manter esses itens indefinidamente, várias possibilidades estão disponíveis para você:
- [x] Para baixá-los manualmente e armazená-los no seu disco rígido
- [x] Adicione ao seu fluxo de trabalho a capacidade de salvá-los em um serviço de hospedagem de terceiros (servidor FTP, armazenamento de blobs, etc.)
- [x] Adicione-os a uma versão do seu projeto

Essa noção de arquivo de versão (ativo) é abordada um pouco mais adiante neste capítulo.

### Downloading an artifact
O download de um artefato também é possível (com a ação actions/ download-artifact), mas apenas para os artefatos que a execução do fluxo de trabalho em andamento publicou. Eles respondem a um caso de uso único: transferir dados de um trabalho para outro dentro do mesmo fluxo de trabalho, conforme explicado nos primeiros capítulos deste livro, os trabalhos são executados em máquinas diferentes. Vamos supor que você queira compilar um aplicativo no primeiro trabalho; o segundo trabalho não pode acessar os binários gerados porque eles não estão no mesmo disco. A única alternativa, editar o primeiro trabalho para carregar um artefato chamado e pedir ao segundo para baixar esse artefato.

```
job1:
steps:
- name: Archiving the binaries of the application
uses: actions/upload-artifact@v4
with:
path: /bin # takes the bin folder and zip it
name: Release # uploads it as that release.zip
job2:
runs-on: self-hosted
needs: job1 # in order for job2 to only start after job1
steps:
- name: Downloading the artifact
uses: actions/download-artifact@v4
with:
name: Release
#performs actions using the artifact
```
Às vezes, você cria um fluxo de trabalho usando as matrizes para construir várias versões do mesmo aplicativo, gerando assim vários artefatos. Você pode baixar todos os artefatos simplesmente omitindo a propriedade "name":


```
- name: Download all artifacts
  uses: actions/download-artifact@v4
```

### Publication of a release element
Se as execuções de fluxos de trabalho não forem retidas para sempre, não será o caso para lançamentos (versões estáveis do projeto). Em vez disso, você deve usar o mesmo procedimento de lançamento que discutimos para publicar uma Ação no Marketplace. Um lançamento de uma Ação requer apenas uma tag para congelar uma versão do código-fonte, mas no nosso caso, aproveitaremos a capacidade de adicionar arquivos ao lançamento para que eles sejam retidos indefinidamente (desde que o lançamento não seja excluído manualmente).

Há duas maneiras de anexar arquivos a um lançamento:
- [x] Adicionar manualmente arquivos (chamados de ativos) a um lançamento existente usando o Portal da Web do GitHub
- [x] Criar um lançamento por meio do fluxo de trabalho e adicionar a ele os arquivos desejados

Para adicionar arquivos a um lançamento existente, potencialmente arquivos que você carregou anteriormente como artefatos e baixou, clique em qualquer lançamento do seu repositório e clique no botão editar. Uma tela permite que você altere as propriedades do lançamento e arraste e solte arquivos na parte inferior desta tela.

Adição manual de arquivos de release

O segundo método, mais simples porque totalmente automatizado, simplesmente substitui a ação de upload de um artefato por uma ação de upload dos arquivos em um novo release. Novamente, a comunidade recomenda usar a ação softprops/action-gh-release que é fácil de usar e completa.

Aviso: Há uma ação oficial do GitHub para gerenciar releases e seus ativos (actions/upload-release-asset), mas o GitHub interrompeu seu suporte e manutenção. Prefira; portanto, é uma alternativa.

Quando essa ação é colocada em um fluxo de trabalho, ela criará automaticamente um release com base na tag do fluxo de trabalho. Além disso, permite usar a propriedade with.files para listar os arquivos que serão adicionados ao release.

```
- name: Create a release
uses: softprops/action-gh-release@v2
env:
GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
with:
files: | # List of files to attach to the release
CHANGELOG.txt
MyApplication.windows.x86.msi
MyApplication.windows.x64.msi
MyApplication.linux.tar.gz
```

Quando o fluxo de trabalho é executado com sucesso, uma nova versão aparece no seu repositório, incluindo seus arquivos anexados e o código-fonte que o GitHub anexa automaticamente.

Adição automática de arquivos de versão
O uso de versões tem muitas vantagens. Além do armazenamento de longo prazo, ele serve principalmente para fornecer aos usuários de seus projetos acesso rápido a binários ou informações de que precisam. Não há necessidade de bifurcar um repositório e gerenciar a compilação você mesmo; você fornece binários prontos para uso para as pessoas.

### Publish a package
Infelizmente, os lançamentos não respondem a todos os usos do compartilhamento de binários; alguns exigem o uso de pacotes. Pacotes, também chamados de dependências, são hoje em dia a maneira moderna de compartilhar bibliotecas entre projetos. Se referenciadas por um projeto, as Dependências são baixadas automaticamente de galerias públicas, como www.nuget.org ou www.npmjs.com. Pacotes do GitHub é uma galeria adicional onde você pode armazenar pública ou privadamente suas próprias dependências.

Publicaremos um pacote Nuget para projetos escritos na linguagem .NET para cobrir a geração de pacotes via GitHub Actions. Os pacotes de projetos .Net, chamados pacotes NuGet (com uma *.nupkg_extension) e sua publicação requerem duas etapas:

1. Criar projeto de aplicativo .Net autônomo
2. (Opcional) Criar um arquivo .nuspec, arquivo de metadados contendo informações como o autor do pacote, o editor, licença, versão, etc.
3. Construir o projeto para gerar uma biblioteca (.dll)
4. Transformar em um arquivo nuget (*.nupkg)
5. Carregar o arquivo em uma galeria listando os pacotes nuget

O primeiro passo é criar um projeto .NET. O comando "dotnet new" gera um projeto .Net vazio, mas perfeitamente válido.

`dotnet new console --name DemoNuGet`

A compilação de um projeto .Net normalmente é feita com o comando "dotnet build", mas o comando que permite criar o arquivo Nuget ("dotnet pack") também cuida da compilação, então podemos omitir o primeiro:

`dotnet pack --configuration Release # Creating the package`

O upload do pacote é feito no repositório do seu projeto. No entanto, a ferramenta de gerenciamento de pacotes (nuget.exe no nosso caso) conhece apenas a galeria oficial. Portanto, é necessário declarar outra galeria (chamada source) e fornecer as credenciais para conectar e fazer upload do nosso pacote.

`nuget sources add -name "github" -Source https://nuget.pkg.github.com/OWNER/ index.json -Username USERNAME -Password PASSWORD`

OWNER representa o nome da sua conta ou organização aqui, enquanto USERNAME é o nome do usuário que carrega o pacote. A senha é um PAT (Personal Access Token). É possível criar uma nova ou simplesmente reutilizar a que é injetada automaticamente em cada fluxo de trabalho: GITHUB_TOKEN.

``nuget sources add -name "github" -Source https://nuget.pkg.github.com/lgmorand/ index.json -Username lgmorand -Password ${{ secrets.GITHUB_TOKEN}}``

Isso tem o efeito de produzir um arquivo de configuração que contém todas as galerias do NuGet, que ele pode acessar para carregar ou baixar pacotes. Por exemplo, aqui está o arquivo após o comando anterior:

```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
<packageSources>
<add key="github" value="https://nuget.pkg.github.com/lgmorand/index.json" protocolVersion="3" />
<add  key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
</packageSources>
</configuration>

```

Por fim, o comando mais importante, "nuget push", permite que você carregue o pacote na galeria Nuget. O comando recebe dois parâmetros: o caminho do arquivo para carregar e onde publicá-lo. Aqui, estamos usando a galeria GitHub declarada anteriormente.

```dotnet nuget push "bin/Release/DemoNuget.1.0.0.nupkg" --source "github"```

O arquivo de fluxo de trabalho completo se parece com isto:

```
jobs:
build:
runs-on: windows-latest
steps:
- uses: actions/checkout@v4
- name: Creating the NuGet package
   run: dotnet pack --configuration Release
- name: Adding the source
   run: nuget sources add
-name "github" -Source https://nuget.pkg.github.com/ lgmorand/index.json -Username lgmorand -Password ${{ secrets.GITHUB_TOKEN }}
- name: Upload package
   run: dotnet nuget push "bin/Release/DemoNuget.1.0.0.nupkg" --source "github"
```
Uma vez que o pacote é publicado, ele fica visível por dois meios. Ou indo para a página inicial da conta e clicando na aba Pacotes que aparece no topo ou na página inicial do repositório de onde ele foi gerado. No lado direito há um link para a página de pacotes

Nota: Embora não seja exigido pelo Nuget Standard, os Pacotes do GitHub podem gerar um erro durante o upload do pacote se ele não contiver a propriedade Meta RepositoryURL. Isso pode ser adicionado manualmente ao arquivo .csproj ou .nuspec do seu projeto.

```
<PropertyGroup>
<OutputType>Exe</OutputType>
<TargetFramework>net5.0</TargetFramework>
<RepositoryUrl>https://github.com/compte-github/name-repo</RepositoryUrl>
</PropertyGroup>
```

O procedimento para publicar pacotes JavaScript, Java e Ruby segue o mesmo princípio, usando cada vez a especificidade e a configuração de cada ferramenta de gerenciamento de pacotes (NPM, Maven, Gradle, Ruby, etc.). Seria muito longo cobrir todos eles neste livro. Em vez disso, sua configuração é explicada em detalhes na documentação oficial GitHub Actions.

### Debugging a workflow
Apesar da experiência adquirida por meio da escrita de fluxos de trabalho, pode ocorrer o dia em que um dos seus fluxos de trabalho não se comportará como esperado, e pode exigir que você execute muitas tentativas e falhas para atingir o resultado desejado.

Um dos truques para economizar tempo analisando o problema é ativar o modo de depuração (verbose). Assim, informações de fundo, parâmetros, testes condicionais e muito mais são adicionados aos logs do fluxo de trabalho. A análise do problema é então bastante simplificada.

Existem duas configurações para habilitar a depuração:

1. ACTIONS_RUNNER_DEBUG: que permite mais informações sobre o executor que executa o fluxo de trabalho
2. ACTIONS_STEP_DEBUG: que fornece mais detalhes sobre as diferentes ações executadas por um fluxo de trabalho

Para ativá-los, basta criar um segredo nas Configurações do repositório e ter um valor de true:
Ao executar o fluxo de trabalho, os logs devem ser enriquecidos com detalhes adicionais:

Logs enriquecidos
Uma solução fácil para habilitar a depuração apenas durante uma execução é esperar que um fluxo de trabalho falhe e usar o botão Re-run que habilitará a depuração apenas durante a próxima execução. Para fazer isso, marque Habilitar registro de depuração

Conexão direta com o executor
Se habilitar a verbosidade permitir algumas informações adicionais, há casos em que o que acontece no agente e especialmente na árvore de arquivos é uma caixa preta; mas é precisamente fácil ter problemas de caminho de arquivo e outros erros de um shell de configuração simples.

A depuração passo a passo por meio de várias execuções de fluxo de trabalho pode se tornar longa e dolorosa antes de encontrar a origem do problema.

A solução mais simples seria conectar-se diretamente na máquina virtual que executa o fluxo de trabalho para ver o que acontece, mas como os agentes do host são gerenciados pelo GitHub e em uma rede particionada, é mais complicado do que parece. No entanto, existe uma solução simples e elegante, o Tmate (www.tmate.io). O Tmate é um produto gratuito que permite que você se conecte a uma máquina remota sem acessar um site que serve como proxy. É ainda melhor conectar-se a uma máquina e executar comandos diretamente por meio de uma página da Web sem instalar ferramentas.

Tudo passa pelo uso da ação mxschmitt/action-tmate. Basta adicionar a etapa ao fluxo de trabalho onde você deseja que o fluxo de trabalho pause e permita que você se conecte.

`- uses: mxschmitt/action-tmate@v3`

Ao executar o fluxo de trabalho, dentro dos logs, o TMATE adicionará regularmente duas maneiras de se conectar. Uma para se conectar diretamente com SSH (funciona de qualquer console de terminal capaz de usar SSH) e outra de um site.

Se você abrir a URL exibida, uma página da Web contendo um terminal será aberta. Este terminal está sendo executado em seu agente e agora você pode interagir diretamente com ele.

Observe que quando você está conectado em SSH, o Tmate bloqueia o fluxo de trabalho e o impede de continuar. Então, pare a sessão e peça para o fluxo de trabalho continuar, volte para o diretório de trabalho do runner e crie um arquivo vazio chamado "continue".

`touch continue`

Depois que o arquivo é criado, o Tmate para e retorna o controle ao fluxo de trabalho para permitir que ele continue sua execução.

Também é possível dizer ao Tmate para parar automaticamente após X minutos com a propriedade timeout-minutes. Se nenhum atraso for especificado, será o tempo máximo de execução de um fluxo de trabalho do GitHub. Ainda assim, seu fluxo de trabalho será "morto" pelo GitHub antes de terminar sua execução se outras etapas forem declaradas após o TMATE.

```
- uses: mxschmitt/action-tmate@v3
   timeout-minutes: 5 # maximum delay before TMATE turns off itself
```

Gosto especialmente de adicioná-lo como a última etapa, mas somente acionado quando ocorre um problema:

```
- name: Setup tmate session
if: ${{failure() }}
uses: mxschmitt/action-tmate@v3
```

Esta dica deve ajudar você a depurar seus fluxos de trabalho mais facilmente.

Há também uma solução alternativa que permite que você execute os fluxos de trabalho do GitHub diretamente no seu computador e sem instalar um agente. Isso requer a ferramenta "Act", que pode ser encontrada no GitHub (https://github.com/nektos/act).

Apesar de algumas limitações, o Act analisa os arquivos YAML e tenta reproduzir o comportamento de um runner. Seu uso não é abordado neste livro, mas adiciona uma corda ao seu arco.

## Improve the performance of your workflows
Se você leu este livro, entendeu que a automação de tarefas e evitar erros humanos durante projetos de computador permite uma economia de tempo significativa porque uma máquina sempre será rápida como um humano e permitirá que ele se concentre em outras tarefas durante esse tempo. No entanto, também é importante que as tarefas automatizadas sejam executadas o mais rápido possível. Tomemos o exemplo de um fluxo de trabalho de compilação e implantação. Este desenvolvedor cria um aplicativo deve esperar que o fluxo de trabalho seja concluído para validar se seu desenvolvimento é confiável ou não. Um desenvolvedor pode fazer isso cerca de cinquenta vezes por dia nesta operação e representa tanto tempo perdido à toa. Multiplicando esse tempo pelo número de desenvolvedores da equipe, podemos facilmente imaginar as horas perdidas todos os dias.

Outro ponto importante, dependendo da sua conta do GitHub, o custo do final do mês depende do tempo de execução dos agentes. Embora o limite seja alto por padrão (2000 minutos por mês para uma conta gratuita), é fácil alcançá-lo. Portanto, é importante acelerar os fluxos de trabalho o máximo possível, e existem vários pontos de melhoria. Abordaremos esses pontos neste capítulo.

### Improving Actions
Ações são as bases dos fluxos de trabalho. Existem tantas possibilidades de Ações que não podemos cobrir tudo sobre otimização, mas existem regras gerais para manter seus fluxos de trabalho saudáveis.

- [x] Desabilite (se: ${{ false }}) ou comente ações que não agregam valor ao seu fluxo de trabalho
- [x] Prefira fluxos de trabalho em execução no Linux, a geração da máquina virtual subjacente sendo um pouco mais rápida
- [x] Paralelize etapas por meio de trabalhos ou matrizes quando não tiverem dependências entre si

O último ponto, quando seu fluxo de trabalho requer o download e a instalação de várias ferramentas e/ou utilitários, usar uma ação do Docker pode melhorar muito o tempo de execução do fluxo de trabalho, ainda mais, se a imagem do Docker da Ação foi gerada upstream. Este ponto de desempenho, embelezado com um exemplo factual, é abordado em detalhes no capítulo "Criar uma ação do Docker".

### Improve the source code checkout
Se for possível fazer coisas infinitas com ações do GitHub. Nesse caso, a maioria dos projetos do GitHub, em algum momento, um fluxo de trabalho usando uma porção de elementos (código-fonte, script, binários) armazenados no repositório. Todos eles usarão a ação checkout que você encontrou várias vezes neste livro:

`
- uses: actions/checkout@v4
`

Este usado no estado não representa um problema porque ele tem, em sua versão 2.x, otimizado com uma configuração padrão que indica para baixar apenas a versão mais recente do código-fonte do branch padrão (geralmente o branch "main" ou "master") e somente este.

No entanto, algumas operações podem exigir o download do histórico de commits para executar algumas operações neles. Isso pode ser feito com o parâmetro fetch-depth:

```
- uses: actions/checkout@v4
with:
fetch-depth: 5 # Number of historic versions to download
```

O valor padrão quando o parâmetro está faltando é 1 (fetch-depth: 1). Também é possível (ou você pode encontrar exemplos na Net) definir o valor fetch-depth como 0. Esse valor indica para baixar o histórico inteiro de todos os branches e todas as tags.

```
uses: actions/checkout@v4
fetch-depth: 0 # WARNING! Do you really want to do that?
```

O tempo de download pode então ser multiplicado por dez e só aumentará com o tempo. Então, certifique-se de verificar cada um dos seus fluxos de trabalho para usar o parâmetro fetch-depth somente quando realmente necessário.

### Caching dependencies
A grande maioria dos projetos de TI, independentemente da linguagem de programação, usa bibliotecas de terceiros (pacotes nuget, npm, maven, ruby, etc.), representando centenas ou até milhares de arquivos para seu código-fonte no momento da compilação de seu aplicativo. Mesmo para um aplicativo pequeno, baixar essas dependências pode levar vários minutos. A ferramenta que baixa essas dependências (nuget.exe, npm.exe, etc.) é inteligente o suficiente para baixar apenas os arquivos ausentes no computador do desenvolvedor. Assim, se a primeira compilação for longa, a segunda é quase instantânea porque todos os arquivos já estão presentes localmente. Infelizmente, essa solução não funciona para fluxos de trabalho do GitHub porque cada nova execução de fluxo de trabalho é acionada em uma nova máquina virtual.

No entanto, o GitHub Actions oferece uma solução elegante para responder a esse problema: um recurso de cache persistente. Essa solução inclui a adição da ação actions/cache dentro do seu fluxo de trabalho que salva e recupera elementos automaticamente de/para um cache persistente localizado nos servidores do GitHub. Essa ação deve ser inserida no início do fluxo de trabalho antes da resolução da dependência. Ele opera da seguinte forma:

1. Durante a primeira execução do fluxo de trabalho, a ação Cache não encontra um cache que atenda ao critério
2. O fluxo de trabalho então baixa as dependências normalmente por meio da ferramenta de resolução de dependência
3. A ação Cache injeta uma etapa no final de um fluxo de trabalho (pós-etapas) que salva os arquivos no cache
4. O fluxo de trabalho para

Na próxima execução do fluxo de trabalho:
1. A ação Cache encontra um cache que corresponde ao critério. Ele baixa o cache localmente e o coloca na pasta de destino
2. A ação cache define uma variável "cache-hit" como true para indicar que um cache foi encontrado
3. A ferramenta de resolução de dependência não precisa baixar arquivos porque eles já estão presentes localmente
4. A ação Cache injeta uma etapa no final do fluxo de trabalho, mas não salva os arquivos no cache porque a variável cache-hit é true. O cache é considerado já atualizado

A implementação é extremamente simples, pois basta colocar a ação no início do fluxo de trabalho, especificar a(s) pasta(s) para fazer backup e dar um nome ao cache.


```
uses: actions/cache@v4
with:
path: # folder to back up (e.g., nodes_modules)
key: # cache's name
restore-keys: # (optional) Alternative cache keys
```

Cada propriedade tem uma mecânica própria. Vamos pegar aqui o exemplo de um projeto JavaScript usando NPM (NodeJS Package Manager) Para baixar as dependências necessárias para o projeto colocadas em uma pasta padrão chamada node_modules. A árvore de dependências, representando todos os arquivos para baixar, é gerada pelo NPM em um arquivo chamado package-lock.json.

A propriedade path é usada para indicar as pastas (e seu conteúdo) que serão salvas no cache. Ela também é a pasta de destino onde o cache é restaurado. Então, para o nosso exemplo, o valor a ser especificado é a pasta node_modules:

```
uses: actions/cache@v4
with:
path: '**/node_modules'
```

A propriedade key indica o nome do cache. A chave com a qual os arquivos serão salvos e a chave com a qual encontraremos nosso cache entre os outros caches do repositório. Este ponto é importante; você pode ter vários caches por projeto, correspondendo para cada um deles, a um fluxo de trabalho específico. Então, para nosso exemplo, podemos chamar o cache de "node-modules", mas como você sabe se o cache corresponde à lista de arquivos listados no arquivo package-lock.json. Se compararmos os arquivos um por um, pode levar anos. A solução é calcular um hash de arquivo e usar esse hash no nome do cache; dessa forma, cada vez que uma dependência é adicionada, removida ou modificada de/para package-lock.json, seu hash muda, e podemos concluir diretamente que o cache contendo outro hash está obsoleto. O resultado então se torna:

```
uses: actions/cache@v4
with:
path: **/node_modules'
key: node-modules-${{ hashFiles("**/package-lock.json')}}
#ex:mode-modules-5805ee260f7996bab5bb7c1e4be38d9653dd02417df04f712d68c7364a6daed2
```

Por fim, a propriedade restore-keys, opcional, permite definir chaves alternativas no cache onde um cache não é encontrado. Por exemplo, tome o caso onde um conjunto de cem dependências são armazenadas em cache, se apenas uma dependência for adicionada ao arquivo package-lock.json, o hash será alterado, e o cache será ignorado, causando o download de 101 dependências. É possível indicar a ação para baixar o cache correspondente ao hash. Se o cache não corresponder, diga para ele procurar se existe outro cache quase equivalente (aqui, aquele com as 100 dependências). Dessa forma, a ação baixará o conteúdo do cache secundário (a variável cache-hit permanece falsa porque não é o cache exato desejado), o NPM então baixa a dependência ausente. Por fim, a ação (cache) injetada no final do fluxo de trabalho recria um novo cache contendo 101 dependências, tornando-se o novo cache primário.

```
uses: actions/cache@v4
with:
path: **/node_modules'
key: node-modules-${{ hashFiles("**/package-lock.json')}}
restore-keys: nodes-modules-
```

O resultado é claro. Em um projeto pequeno, o ganho já é de 30% do tempo total do fluxo de trabalho. Se o download do cache adicionar um pouco de tempo, é muito mais rápido do que baixar os mesmos arquivos por meio do mecanismo de resolução de dependência:

Limitação: O cache é gratuito, mas é limitado a 10 GB por conta para todos os caches salvos. Ao exceder 10 GB, o novo cache (fluxo de trabalho atual) é salvo, mas o cache de dados antigo será excluído para voltar a ficar abaixo de 10 GB. Em paralelo, se um cache não for acessado por 7 dias, o cache será excluído automaticamente.

Usamos aqui o exemplo muito comum das dependências, mas esse cache pode servir a muitos outros casos quando a necessidade é reutilizar o mesmo grupo de dados estáticos durante várias execuções de fluxo de trabalho.

### The usage of matrices
No capítulo dedicado às matrizes, abordamos casos de uso para compilar uma versão iOS e uma versão Android em paralelo, mas também exemplos da necessidade de compilar o código-fonte em duas versões (ou mais) de um framework como o NodeJS. Existem muitos outros casos de usos ainda mais comuns para alavancar matrizes, como a realização de testes.

Vamos pegar o exemplo de um fluxo de trabalho realizando testes de integração contidos no código-fonte. Em um fluxo de trabalho sendo simplificado aqui, por exemplo, um compila o aplicativo, o implementa, realiza alguns testes de integração e, em seguida, empacota tudo se todos os testes estiverem verdes.

```
jobs:
my-project:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- name: build
run: # build project
- name: deploy
run: # deploy the app
- name: Run integration tests
run: # run/tests
- name: Create package
run: # generate a zipped release
```

A realização de testes unitários leva dois minutos e parece incompressível, pois é uma tarefa única. No entanto, as matrizes podem ajudar a acelerar a execução dos testes cortando-os por lote. Além disso, adaptando o fluxo de trabalho e distribuindo as tarefas por jobs, é possível "dividir" a parte dos testes unitários. Assim, o próximo novo fluxo de trabalho realizará as mesmas ações, mas com um tempo de execução muito diferente:

```
jobs:
build:
runs-on: self-hosted
steps:
run: # build project
- name: deploy
run: # deploy the app
testing:
runs-on: self-hosted
needs: build
strategy:
matrix:
test-path:
- tests/integration/login/
steps:
- tests/integration/orders/
- uses: actions/checkout@v4
- tests/integration/basket/
- name: build
- tests/integration/other/
steps:
- name: Run integration tests
run: # run ${{ matrix.test-path}}''
packing:
runs-on: self-hosted
needs: testing
steps:
- name: Create package
run: #generate a zipped release
```

Essa abordagem, como os processadores multithread, pode cortar uma tarefa em tarefas menores e economizar tempo. O resultado do fluxo de trabalho é o mesmo, mas sua árvore de execução (diagrama) e seu tempo de execução são divididos por quatro com uma etapa de teste paralelizada levando mais de vinte segundos:

## The security within GitHub Actions
Hoje em dia, a segurança é muitas vezes deixada de lado quando considerada uma prioridade, especialmente no mundo da computação. No entanto, as últimas notícias têm mostrado que operações de hacking em larga escala podem ser realizadas comprometendo a cadeia de CI/CD. Ao ter acesso à fábrica de software, os invasores podem acessar o código-fonte do aplicativo e, então, procurar mais facilmente por falhas no software, extrair os segredos/strings de conexão/certificados para obter acesso aos ambientes de produção, mas também injetar malware dentro dos aplicativos e, assim, ter um malware quase indetectável que será então distribuído para outras empresas (por exemplo, o caso da pirataria da SolarWinds descoberta em 2021, mas que teria começado em 2015!).

Longe de ser exaustivo, este capítulo tem como objetivo compartilhar as principais boas práticas e os principais erros das pessoas quando usam o GitHub Actions.

## The secrets management
Os "segredos" discutidos aqui se referem a duas coisas que geralmente andam de mãos dadas:
- [x] Informações confidenciais (senha, certificado, string de conexão, chave)
- [x] Segredos GitHub: a funcionalidade que permite que você armazene essas informações críticas em uma variável segura

A primeira boa prática referente a informações confidenciais é estritamente nunca, de forma alguma, escrever esses dados sensíveis no código-fonte, pela simples razão de que qualquer pessoa com acesso ao seu repositório (seja porque o repositório é público ou acessível por um colaborador) pode recuperar esses dados. Uma vez que o segredo é armazenado no histórico de commits, torna-se difícil apagá-lo. Isso permanece tecnicamente viável com comandos como "git rebase -i", mas pode ter consequências infelizes se outra pessoa já usa a versão atual do código-fonte. No próximo push/merge de um ou outro, podem ocorrer erros. Portanto, prefira a vigilância ou crie o hábito de nunca escrever um segredo no código-fonte.

Como um anjo da guarda, o GitHub protege você escaneando automaticamente o código-fonte de seus repositórios públicos (ou privados com a Enterprise Edition). Ele alerta você por e-mail e pelo portal se encontrar segredos, como chaves para Azure, AWS, Dropbox, MailChimp e muitos outros.

Info: A lista completa dos tipos de segredos gerenciados nativamente pelo GitHub pode ser encontrada na página https://docs.github.com/en/github/administering-a-repository/about-secret-scanning

Como o repositório é necessariamente público, o dano está feito, e potencialmente piratas podem ter escaneado seu código-fonte; o segredo deve então ser considerado vulnerável e deve ser revogado instantaneamente por você. O tempo de detecção por um serviço de terceiros é em segundos, com os meios que os piratas possuem hoje; uma vez recebido o alerta, a desativação do segredo deve ser uma prioridade absoluta.

Seu reflexo deve sempre armazenar dados sensíveis dentro dos segredos do GitHub abordados no capítulo "Segredos do GitHub". Mas eles são 100% confiáveis?

### The secrets' flaws
Conforme explicado no capítulo dedicado aos segredos, quando o valor do seu segredo pode ser exibido nos logs, o GitHub substitui o valor do "*' e impede de ver seu conteúdo. O comportamento é o seguinte: o GitHub analisa os valores dos segredos no início do fluxo de trabalho e, sempre que o valor corre o risco de aparecer em um log, ele substitui seu valor usando o recurso add-mask:

```
- run: echo "${{ secrets.MY_SECRET }}" # affiche
```

Isso também pode causar comportamentos inesperados. Vamos pegar o exemplo de um nome secreto MY_SECRET com um valor de "p@ssword". Se outro comando usar o mesmo valor coincidentemente, ele será ofuscado ao mesmo tempo. Se testarmos o seguinte comando:

```
- run: echo "my p@ssword is visible"
```

Será exibida a seguinte mensagem: `my *** is visible`

Não é bem o que queremos, mas é inevitável.

Em contraste, essa proteção não deve ser considerada suficientemente segura. De fato, uma pessoa com direitos suficientes para modificar o arquivo de fluxo de trabalho usa uma falha para obter o valor. Para isso, basta que ele "corte/edite" o valor para que ele não seja mais estritamente idêntico ao valor do segredo. Um exemplo pode ser injetar um espaço entre cada caractere como no comando a seguir:


```
- run: echo "${{ secrets.MY_SECRET }}" | sed 's/./ & /g' # adds a space between each character's secret
```

Isso exibirá a seguinte mensagem no console: `p@ssword`

Nosso segredo não é mais tão secreto quanto o esperado. Lembre-se de que seus segredos são transmitidos para seus fluxos de trabalho e utilizáveis por eles, mas, portanto, expostos dentro deles. Este é um ponto de atenção a ter em mente quando você adiciona colaboradores ao seu repositório.

A situação é complicada durante solicitações de pull em seu repositório. Qualquer um pode bifurcar seu repositório (claro, os segredos não são copiados), editar um fluxo de trabalho ou criar (ou criar um novo) e fazer uma solicitação de pull em seu repositório. Isso resultará no acionamento do fluxo de trabalho modificado dentro do contexto do seu repositório e dará a ele a possibilidade de roubar seus segredos. Desta vez, a proteção padrão do GitHub é mais consistente porque quando uma solicitação de pull vem de um repositório de terceiros (bifurcação), nenhum dos segredos (exceto GITHUB_TOKEN) é transmitido ao executor. Portanto, se o fluxo de trabalho tentar exibir o valor de um segredo, ele receberá uma mensagem de erro "O segredo XXX não existe". Essa proteção é ideal para a maioria dos casos, mas às vezes pode interferir no que queremos fazer. Então, se você criar um fluxo de trabalho de verificação de qualidade de código que dispara quando uma solicitação de pull é feita, mas precisa de um segredo para se conectar a um serviço de terceiros e executar a varredura, isso não é viável porque o segredo estará vazio, a varredura falhará.

Se você realmente precisar disponibilizar um segredo em uma solicitação de pull externa, é possível, mas por sua conta e risco, desabilitando a proteção padrão do GitHub. Para isso, vá para as configurações (Settings) do seu repositório, depois na parte de ações e marque a caixa "Enviar segredos para fluxos de trabalho de solicitações de pull de fork".

Compartilhando segredos com solicitações de pull externas

## Securing self-hosted agents
Agentes auto-hospedados estão sendo executados em seu ambiente (computador, servidor); este é o primeiro ponto de entrada e ataque para comprometê-lo. Portanto, é essencial nunca definir estritamente um agente auto-hospedado em um repositório público, incluindo se nenhum de seus fluxos de trabalho o usar. Qualquer um pode bifurcar o repositório, criar um fluxo de trabalho que tenha como alvo seu agente auto-hospedado (runs-on: self-hosted) e que contenha um script malicioso ou um vírus e, em seguida, executar uma solicitação de pull em seu repositório. Isso potencialmente executaria o fluxo de trabalho perigoso em seu agente e o usaria como um backdoor.

O GitHub desabilita os fluxos de trabalho de bifurcações por padrão para evitar erros humanos, mas você pode ter ativado esse recurso para transmitir segredos, como visto antes.

### Limiting the access
O agente pode ser comprometido de fora e por pessoas com acesso ao repositório, deliberadamente ou porque suas credenciais foram roubadas.

Portanto, é essencial considerar seu agente e a máquina em que está instalado como potencialmente vulneráveis. Algumas boas práticas permitem reduzir o risco em tais casos:
1. Instale o agente com os menores privilégios. Não instale com direitos de administrador; você evitará que ele possa assumir o controle total do servidor em que está localizado
2. Limite o acesso à rede desta máquina. Se o agente não tiver motivo para acessar a rede, não permita que ele o faça, e se o acesso a certos recursos precisar ser feito (por exemplo, um servidor de produção, um banco de dados), abra essas rotas de rede exclusivamente.
3. Não use um agente para vários repositórios (possível com contas do GitHub Enterprise) e não instale vários agentes de vários repositórios na mesma máquina. Existe o risco de "ataque à cadeia de suprimentos" em que, por meio de um repositório corrompido, um fluxo de trabalho pode sair de sua pasta de trabalho e potencialmente acessar/modificar o código-fonte de outro fluxo de trabalho executado por um segundo agente na mesma máquina.

A solução ideal seria implantar agentes em contêineres, mas infelizmente, o GitHub não fornece esses agentes em contêineres. Cabe a você fazer essa tarefa, mas tutoriais podem ser facilmente encontrados online. Fique atento novamente; é melhor ter controle total sobre a imagem de contêiner gerada.

## Using third-party Actions
Ações de terceiros são certamente o primeiro ponto de vigilância a ser levado em conta. Uma regra de ouro a ser lembrada é que usar uma ação de terceiros é potencialmente arriscado, incluindo aquelas publicadas no GitHub Marketplace. De fato, o GitHub não inspeciona nem valida o conteúdo das ações publicadas em seu Marketplace, e cada ação é segura apenas pela boa vontade de seu autor. Como no ecossistema Open Source, todos podem contribuir e ver o que os outros fazem, mas infelizmente é impossível assistir a tudo.

Além disso, encontrar os aplicativos ou ações do GitHub do Marketplace com um selo "validado" pode ser reconfortante. No entanto, não caia na armadilha. Isso significa apenas que o autor da ação faz parte de uma conta do GitHub (organização) que pertence a uma empresa que validou certos critérios, como suas informações (nome real, endereço real, nome de domínio real). Isso simplesmente garante que é o publicador oficial (ex: Microsoft, Terraform, etc.), mas isso não implica que o conteúdo publicado seja seguro ou à prova de bugs.

Sempre inspecione o código-fonte de uma ação que você pretende integrar ao seu fluxo de trabalho. Quanto mais complexo o código-fonte, mais difícil será detectar um comportamento malicioso em potencial que seu autor terá bem escondido. Essa regra é especialmente verdadeira se você usar agentes auto-hospedados, pois você abre a porta para acessar seu servidor ou sua rede.

Se um agente executado pelo GitHub executar seu fluxo de trabalho, os riscos serão reduzidos, mas ainda presentes. De fato, vamos pegar o exemplo de uma ação que permite que você publique um aplicativo no servidor de terceiros de um provedor de nuvem (por exemplo, Azure). Essa ação provavelmente solicitará credenciais para se conectar ao servidor remoto. Que garantia você tem de que essa ação não enviará suas credenciais para um servidor desonesto em paralelo? Nenhuma. Pior, a solução para analisar o código-fonte antes de usar uma Ação não é 100% confiável devido à mecânica de atualizações automáticas abordadas no capítulo Crie sua Ação > Controle de versão.

Lembre-se, se você quiser declarar em seu fluxo de trabalho para carregar uma Ação "v1", não há garantia de que depois disso o código-fonte da ação que será carregada em seu fluxo de trabalho seja sempre o mesmo, porque o autor pode excluir sua versão "v1", modificar o código-fonte para inserir código malicioso e, em seguida, recriar uma versão "v1". A modificação seria então invisível e indetectável do seu lado.

Devemos usar terceiros? A resposta é "sim", mas isso deve ser feito com a maior vigilância possível.

Existem vários níveis de confiança em relação a ações de terceiros. Se todas forem permitidas por padrão, é bem possível limitar o acesso apenas a certas ações. Por exemplo, você pode permitir apenas aquelas de repositórios pertencentes a você, aquelas publicadas pelo GitHub (que podem ser consideradas realmente seguras) e aquelas publicadas por editores confiáveis (lembrete para editores aprovados: isso não prova que a ação em si seja confiável).

Em relação a outras ações que não se encaixam em nenhuma dessas categorias, seu uso dependerá do seu contexto (particularmente da criticidade do seu projeto). Também é possível limitar os riscos de modificações descontroladas, como explicado acima, usando o hash do commit. Este método é explicado no capítulo "steps" e faz referência a uma versão específica do código. Embora o commit seja imutável, ele garante a recuperação da versão do código-fonte quando o commit foi feito.

Somente ações que correspondem a critérios especificados, mais ações definidas em um repositório dentro do Igmorand, podem ser usadas.
Para recuperar o commit, uma pequena manipulação é realizada. Primeiro, vá para o repositório Action que você gostaria de usar, depois vá para sua página listando seus lançamentos. Uma vez nesta página, observe um identificador estranho de 7 caracteres na versão em que você está interessado.

Esta é uma versão curta do hash do commit vinculado a esta versão.
Clique neste número para abrir uma segunda página onde você pode obter a versão completa do hash.

Hash completo

Então use esse hash para referenciar uma versão bem específica da ação.

```
- uses: lgmorand/github-action-hello@7f2e08be313d58f0d0133b76514dda947b4c1f79
  with:
    firstname: 'Louis-Guillaume'
```
Importante: Se antes era possível usar esse hash curto de identificador para referenciar uma Ação, não é mais possível por motivos de segurança, e o GitHub agora autoriza apenas a versão completa do hash. Se você encontrar exemplos usando versões curtas, saiba que elas estão obsoletas.

Um pequeno resumo de pontos de vigilância a serem lembrados sobre o uso de Ações de terceiros:

- [x] Não confie em nenhuma ação
- [x] Sempre dê uma olhada em seu código-fonte
- [x] Limite o uso de ações de terceiros nos fluxos de trabalho implantados por meio de agentes auto-hospedados
- [x] Se tal uso for necessário, seja ainda mais vigilante
- [x] Prefira o uso do hash para referenciar uma ação, mesmo que isso signifique não obter os patches/evoluções automaticamente
- [x] O ideal é bifurcar a ação e usar apenas a versão clonada. Certamente, você não terá atualizações, mas terá total controle sobre o código-fonte da ação e, acima de tudo, dificilmente verá a ação desaparecer porque o autor decidiu fazer isso (não subestime).

### Keep up with the good security practices
O GitHub Actions evolui dia a dia, e devido à sua complexidade, os possíveis maus usos da solução são numerosos, por isso é impossível listar todos e/ou todos os conhecidos.

Quando uma vulnerabilidade é séria o suficiente ou amplamente utilizada (principalmente por ignorância), o GitHub pode desabilitar drasticamente um recurso e substituí-lo por outro. Por exemplo, este foi o caso do uso de hashes de "versões curtas" (risco de colisão) e da desabilitação do set-env para o gerenciamento de variáveis. No entanto, é impossível desativar tudo, e às vezes, o mau uso da funcionalidade causa uma vulnerabilidade.

O GitHub atualiza regularmente sua documentação, especialmente quando um ponto de recurso merece atenção, mas não são cobertos todos os riscos associados ao mau uso do produto. Além disso, um bom hábito é a vigilância tecnológica e o aprendizado das boas e más práticas lendo os "Relatórios de Pesquisa de Vulnerabilidade" publicados pelo GitHub no portal dedicado: https://securitylab.github.com/advisories.

Nada como ver os erros dos outros para aprender a não fazer o mesmo.

## Controlling the GITHUB_TOKEN's authorizations
Por padrão, esse token é gerado automaticamente para cada execução de fluxo de trabalho, o que simplifica a autenticação com o GitHub tem os direitos somente leitura' no repositório, o que é bom, mas até 2023, ele tem gravações de 'contribuidor', o que era fácil, mas poderia ser perigoso. É recomendável reduzir os direitos atribuídos ao token (privilégio mínimo) por motivos de segurança. Esse controle pode ser obtido de duas maneiras:

- [x] No nível do repositório, definindo uma configuração padrão
- [x] No nível de cada fluxo de trabalho

No repositório, por meio do menu Configurações > Ações, você pode especificar que o token tenha apenas direitos de leitura:

Dentro de um fluxo de trabalho, isso pode ser definido usando as permissões de atributo no nível do fluxo de trabalho ou para um trabalho específico:

```
myjob:
  runs-on: self-hosted
     permissions:
       actions: read
       issues: write # checks: read/write/none
                     # contents: read/write/none
                     # deployments: read/write/none
                     # issues: read/write/none
                     #packages: read/write/none
                     #pull-requests: read/write/none
                     #repository-projects: read/write/none
                     #security-events: read/write/none
                     #statuses: read/write/none
```

## Stay protected against command injection
Injeção de comando, é uma reminiscência do princípio de injeção de SQL: envolve enviar a você um texto que será interpretado e executado quando não deveria.

Aqui está um exemplo simples de um fluxo de trabalho que é acionado quando alguém cria um Issue no seu repositório e, portanto, pode ser feito por qualquer pessoa sem direitos específicos.

```
- name: print title
   run: echo "${{ github.event.issue.title}}"
```

A pessoa cria um Issue com um título específico:
Issue with injected command

Devido à maneira como a sintaxe ${{}} é expandida antes da execução por um agente (isso significa que as variáveis são substituídas no YAML), isso faz com que o fluxo de trabalho execute o seguinte comando:

```
- name: print title
run: echo "$(touch pwned.txt)"
```

Dessa forma, um novo comando é executado pelo seu fluxo de trabalho sem o seu consentimento. Assim, o invasor poderia, como mostrado na captura de tela a seguir, criar um arquivo pwnded.txt, mas potencialmente fazer coisas mais perigosas, como baixar um vírus (se você usar um self-agent) ou exportar segredos acessíveis pelo fluxo de trabalho e enviá-los para um servidor remoto.

A solução é usar variáveis intermediárias ao usar uma entrada de fora (parâmetro do fluxo de trabalho, variável de um nome externo (nome do problema, nome da mensagem de confirmação, etc.) dentro do seu fluxo de trabalho.

```
- name: print title
env:
TITLE: ${{ github.event.issue.title}}
run: echo "$TITLE"
```

Dessa forma, o comando é "expandido"  em uma variável, mas como é uma variável, o comando não será executado na seção de execução.

# My Real-World Workflows
Nesta última parte, um pouco abrangente, decidi dissecar alguns fluxos de trabalho que uso em meus projetos. Úteis ou não para você, você verá diferentes fluxos de trabalho, diferentes tópicos abordados e a riqueza de possíveis casos de uso.

Cada fluxo de trabalho é explicado neste livro, mas você encontrará todos os fluxos de trabalho neste repositório: https://github.com/lgmorand/book-github-actions-advanced-workflows.

## PowerPoint
É comum no meu trabalho fazer apresentações técnicas. Embora eu aprecie o software Microsoft PowerPoint, também gosto da flexibilidade do Markdown, que me permite transformar ou traduzir meu texto rapidamente para vários idiomas antes de gerar uma apresentação.

## Prepare the markdown
O fluxo de trabalho

O fluxo de trabalho é bem simples. Em um runner Linux, basta instalar o Pandoc (https://github.com/jgm/pandoc) e pedir para ele gerar uma versão do PowerPoint, bem como uma versão HTML dinâmica (que usa o plugin RevealJS (https://revealjs.com/) e então armazenar os arquivos gerados como anexos do fluxo de trabalho.

```
jobs:
GenerateFile:
runs-on: self-hosted
steps: # retrieve the markdown content from the repo
- uses: actions/checkout@v4
- run: sudo apt-get update # update the agent's packages
- name: Apt-get update # pandoc will transform the markdown into PowerPoint
- name: install pandoc
   run: sudo apt-get install --assume-yes pandoc # create the PowerPoint
- name: Build PPTX version
   run: pandoc content.md --output=demo.pptx
     working-directory: ./powerpoint # create a dynamic HTML version
- name: Build HTML version
 run: pandoc --to-revealjs --standalone content.md --output-demo.html -V revealjs- url="https://cdn.jsdelivr.net/npm/reveal.js@3.9.2"
 working-directory: ./powerpoint # Upload a zip to easily retrieve it
- name: Upload a Build Artifact
  uses: actions/upload-artifact@v4
  with:
    name: Generated documents
    retention-days: 1
    path: |
           ./powerpoint/*

working-directory: ./powerpoint
```

Upon execution, a zip containing your two presentations is published:

## Points of Attention
Observe o parâmetro -assume-yes que diz à linha de comando apt-get para sempre aceitar se uma pergunta for feita ao usuário que está executando o comando. O agente não é "interativo" e, portanto, você deve sempre pensar em passar parâmetros que evitem qualquer interação com o usuário (por exemplo, pedir uma senha, confirmar uma ação, etc.).

O segundo ponto é "retention-days" definido como 1. No GitHub, o armazenamento não é ilimitado nem gratuito. Não há sentido em manter artefatos por muito tempo. Neste caso específico, quero meu PowerPoint hoje, não em dez dias.

## Book Generation
Como vimos anteriormente no livro, embora seja publicado em formato de papel e e-book, ele é, na verdade, inteiramente escrito e gerado via GitHub Actions. Aqui está o fluxo de trabalho quase completo e um exemplo de um livro gerado, caso você sinta vontade de escrever um livro ou publicar um e-book.

```
name: Generate a book
on:
workflow_dispatch:
jobs:
generating-the-book:
name: Generate the books
runs-on: self-hosted
steps:
- name: Apt-get update
run: sudo apt-get update
- name: install pandoc
- run: |
         wget https://github.com/jgm/pandoc/releases/download/3.3/pandoc-3.3-1-amd64.deb
         sudo dpkg -i pandoc-3.3-1-amd64.deb # to make a PDF I need additional plugins
- name: install pdflatex
run: |
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-xetex

- uses: actions/checkout@v4

- name: Create dist folder
   run: mkdir ./book/dist
- #I modify some markdown on the fly
- name: inject date
run: |
today=$(date + "%d-%m-%Y")
echo '' >> 00-01-edition.md
echo '## Edition {.unlisted .unnumbered}' >> 00-01-edition.md
echo '' >> 00-01-edition.md
echo 'Last modification of content' >> 00-01-edition.md
echo $today >> 00-01-edition.md
working-directory: ./book/en
working-directory: ./book/en # I generate an intermediate text version # I prepare a listing that will allow me to give all the files to merge with a single parameter
- name: prepare files to include
- name: Build TXT result EN
run: |
run:
ls *.md >>_includes.txt
cat_includes.txt
working-directory: ./book/en # a PDF version that I send to my printer
- name: Build PDF version EN
toc.txt
pandoc -V documentclass=memoir -s $(cat_includes.txt) -o ../dist/result-en.txt
pandoc -V documentclass-memoir -s $(cat_includes.txt) --toc -o ../dist/result-en-
working-directory: ./book/en # I transform this TXT into Epub
- name: Build EPUB version EN
run: pandoc -V documentclass=memoir -V lang=en --listings --pdf-engine-xelatex --from-markdown-blank_before_header -s $(cat _includes.txt) -o'../dist/Implementing DevSecOps with GitHub Actions.pdf'
run: pandoc -s ../dist/result-en-toc.txt --epub-cover-image-./assets/cover.png epub-metadata=./assets/metadata.xml -o '../dist/Implementing DevSecOps with GitHub
Actions.epub'
working-directory: ./book/en # I can also generate a Word version if I want
- name: Build Word version EN
run: pandoc -s ../dist/result-en.txt -o '../dist/Implementing DevSecOps with GitHub Actions.docx' --reference-doc=../latex/custom-reference.docx --toc
working-directory: ./book/en # I make a zip
- uses: actions/upload-artifact@v4
 with:
name: "Implementing DevSecOps with GitHub Actions - books"
path: book/dist
retention-days: 1
```

Nada muito complicado, são apenas comandos encontrados na documentação do Pandoc. Mas esse fluxo de trabalho é muito útil para mim porque posso rastrear minhas alterações, o que não seria capaz de fazer se tivesse escrito meu livro em um documento do Word. A outra alternativa (LaTex) não me agradou, o Markdown é muito mais simples.

## Documentary Website
É comum precisar gerar documentação para vários projetos, e nada supera um site que fornece uma interface gráfica agradável, um mecanismo de busca e/ou vários links. É mais fácil do que um arquivo PDF que todos precisam baixar. Existem diferentes ferramentas para gerar essas documentações, como Docusaurus (https://docusaurus.io), MKDocs (https://www.mkdocs.org/) ou Hugo (https://gohugo.io/). Este último é muito leve e contém vários temas muito bons, daí minha escolha preferida.

Como bônus, usaremos o GitHub, mais especificamente o GitHub Pages, para hospedar nosso site. Não há necessidade de comprar um servidor de hospedagem, temos um site e uma URL pública.

## Preparing the content
Para isso, nada de mágica, basta seguir a documentação do Hugo (https://gohugo.io/content-management/organization/) e organizar as páginas do site seguindo uma estrutura:

```
content/
blog/
- hugo-is-cool/
- images/
- funnier-cat.jpg
-funny-cat.jpg
cats-info.md
index.md
posts/
post1.md
- post2.md
1-landscape.jpg
- 2-sunset.jpg
_index.md
content-1.md
content-2.md
1-logo.png _index.md
name: Build Hugo site
runs-on: ubuntu-22.04
steps: # installation of the CLI tool
- name: Setup Hugo CLI
run:
wget -O ${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/ download/v0.125.6/hugo_0.125.6_linux-amd64.deb
sudo dpkg -i ${{ runner.temp }}/hugo.deb
Le workflow
jobs:
build-hugo: # installation of prerequisites. Sass allows generating CSS files
- name: Setup Dart Sass
run: sudo snap install dart-sass # we take the content of our site
- name: Checkout
uses: actions/checkout@v4.1.1
with:
submodules: recursive
fetch-depth: 0 # we activate GitHub Pages to host our website
- name: Setup Pages
id: pages
uses: actions/configure-pages@v5.0.0
env: # For maximum backward compatibility with Hugo modules, we put the two possible
variables
HUGO_ENVIRONMENT: production
HUGO_ENV: production
run:
hugo\
--gc\
--minify\
--baseURL"${{ steps.pages.outputs.base_url}}/" # we build the website from our markdown
- name: Build with Hugo
working-directory: website
deploy:
environment:
name: github-pages
>
```

url: ${{ steps.deployment.outputs.page_url}}
runs-on: self-hosted
needs: build-hugo
steps:
- name: Deploy to GitHub Pages
id: deployment
uses: actions/deploy-pages@v4

## Points of Attention
Não foi necessário criar dois jobs, pois eles são sequenciais, no entanto, isso torna a renderização gráfica no portal e a legibilidade do código mais fáceis. Além disso, força o isolamento de etapas principais em um fluxo de trabalho e permite mais flexibilidade em caso de evolução futura (ou divisão).

## DevSecOps
A segurança do projeto começa na estação de trabalho do desenvolvedor, e há uma infinidade de ferramentas de segurança disponíveis. Quando você é um DevOps experiente, você quer ser capaz de implantar na produção com confiança executando uma série de testes que permitirão ou impedirão a implantação na produção.

Como os aplicativos vêm em diferentes formatos (por exemplo, móvel, web, desktop, conteinerizado), você pode precisar implementar diferentes tipos de controles - e até mesmo diferentes tipos de ferramentas para proteger cada componente do seu aplicativo. Vamos dar uma olhada nos principais tipos de testes que você deve usar. Aqui estão os principais tipos:

### STATIC APPLICATION SECURITY TESTING
Ferramentas de Static Application Security Testing (SAST) analisam o código-fonte de um aplicativo (o código escrito por seus desenvolvedores) para detectar vulnerabilidades potenciais sem executar o programa. Ao analisar a base de código durante a fase de desenvolvimento, o SAST fornece aos desenvolvedores informações sobre falhas de segurança e erros de codificação. Uma boa ferramenta SAST pode detectar odores de código, bem como quaisquer práticas ruins que possam levar a vulnerabilidades, como SQL ou injeção de caminho, estouro de buffer, XSS e validação de entrada.

### SOFTWARE COMPOSITION ANALYSIS
A Análise de Composição de Software (SCA) é essencial para identificar e gerenciar riscos de segurança associados a componentes de código aberto usados no desenvolvimento de software, normalmente de pacotes adicionais (por exemplo, pacotes NPM para JavaScript, NuGet para .NET, Maven, gems). A maioria dos desenvolvedores carrega um pacote quando precisa, mas nunca verifica se o pacote tem uma vulnerabilidade conhecida. Uma ferramenta SCA alertará você quando seu aplicativo usar um pacote vulnerável e quando uma correção já existir, mas você não estiver usando a versão corrigida da dependência.

### DYNAMIC APPLICATION SECURITY TESTING
As ferramentas Dynamic Application Security Testing (DAST) avaliam os aplicativos em seu estado de execução, simulando ataques reais para identificar vulnerabilidades. Ao integrar o DAST ao processo de teste, as equipes de DevSecOps podem descobrir fraquezas de segurança que podem não ser aparentes durante a análise estática. Uma ferramenta DAST atua como uma ferramenta de teste de penetração totalmente automatizada que testará as principais vulnerabilidades conhecidas (OWASP) e muitas outras práticas ruins, como vazamento/exposição de informações.

### INTERACTIVE APPLICATION SECURITY TESTING
As ferramentas Interactive Application Security Testing (IAST) são uma combinação de uma ferramenta DAST e uma ferramenta SAST porque, ao permitir acesso ao código-fonte ("caixa cinza"), elas ajudam o DAST a ter um melhor desempenho, mas também limitam o número de falsos positivos. O IAST é superefetivo, mas mais difícil de configurar, pois tende a testar cada aplicativo profundamente.

### CONTAINER SCANNER
Os contêineres oferecem agilidade e escalabilidade, mas também apresentam desafios de segurança exclusivos. Por exemplo, se seu aplicativo for conteinerizado, você precisa implementar controles adicionais. Primeiramente, os scanners examinarão seu Dockerfile para verificar se a imagem base contém vulnerabilidades conhecidas e também procurarão por práticas ruins, como executar como root, usar a tag "latest" ou expor portas perigosas. O exemplo de Dockerfile a seguir contém pelo menos três práticas ruins e pode haver uma vulnerabilidade na imagem base do Node.js:

```
FROM node:latest
WORKDIR /usr/src/app
COPY package*.json
RUN npm install
COPY..
EXPOSE 3000 22
HEALTHCHECK CMD Curl --fail https://localhost:3000 | exit 1
CMD ["node","app.js"]
```

### INFRASTRUCTURE-AS-CODE SCANNER
A infraestrutura como código (IaC) permite que as organizações gerenciem e provisionem infraestrutura por meio de código, trazendo os benefícios do controle de versão e automação para a camada de infraestrutura. A varredura de IaC garante que o código de infraestrutura passe por rigorosas verificações de segurança, como validação de configuração, adesão às melhores práticas, detecção de configurações incorretas de segurança e aplicação de políticas de segurança durante todo o processo de implantação da infraestrutura.

### SECRETS SCANNER
Um segredo (por exemplo, uma chave de API, uma senha, uma string de conexão para um banco de dados) não deve ser armazenado no código-fonte (hardcoded) ou em um arquivo de configuração armazenado no repositório de código, porque se um hacker obtiver acesso ao código, ele poderá acessar ambientes de produção e/ou outros ambientes críticos. Os scanners de segredos podem detectar mais de 150 tipos de segredos que os desenvolvedores podem deixar no código e, uma vez que um segredo tenha sido armazenado no código (commit), ele deve ser considerado "comprometido" e revogado imediatamente.

Depois de ver todas essas ferramentas, vamos configurar um fluxo de trabalho para melhorar a qualidade do que produzimos.

## The Workflow
O fluxo de trabalho consiste em várias etapas:
1. Análise estática, ou seja, todas as verificações que podem ser feitas antes mesmo da compilação (idealmente para serem executadas no momento de uma solicitação de pull): SCA + SAST + linter + credscan
2. Compilação e empacotamento
3. Implantação no ambiente de teste
4. Análise dinâmica (teste de desempenho e teste de penetração): DAST
5. Implantação na produção

Observe que o fluxo de trabalho paraleliza as etapas quando possível e, em seguida, adiciona dependências para que todos os testes sejam aprovados antes de passar para a próxima etapa.

```
workflow DevSecOps
name: DevSecOps
on:
workflow_dispatch:
jobs:
secrets:
  runs-on: self-hosted
    env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN}}
steps:
- uses: actions/checkout@v4
- name: scan secrets with Spectral
uses: spectralops/spectral-github-action@v5
with:
spectral-dsn: ${{ env.SPECTRAL_DSN }}
spectral-args: scan --ok --engines iac --include-tags base,azure
IaC:
runs-on: self-hosted
env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN}}
steps:
- uses: actions/checkout@v4
- name: scan IaC with Spectral
uses: spectralops/spectral-github-action@v5
with:
spectral-dsn: ${{ env.SPECTRAL_DSN}}
spectral-args: scan --ok --engines secrets --include-tags base,audit
SAST:
runs-on: self-hosted
env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN }}
steps:
- uses: actions/checkout@v4
- uses: bearer/bearer-action@v2
with:
path: "./devsecops/src/frontend"
skip-rule: javascript_lang_dynamic_regex,javascript_lang_logger_leak

SCA:
runs-on: self-hosted
env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN }}
steps:
- uses: actions/checkout@v4
- name: Setup .NET
uses: actions/setup-dotnet@v4
- name: Restore dependencies
run: dotnet restore ./devsecops/src/frontend/CafeReadConf.sln
- name: dotnet publish
run: dotnet publish -c Release -o ./myapp --property WarningLevel=0
working-directory: ./devsecops/src/frontend

- name: scan SCA with Spectral
uses: spectralops/spectral-github-action@v5
with:
spectral-dsn: ${{ env.SPECTRAL_DSN }}
spectral-args: scan --ok --engines oss --include-tags base,audit
- name: Run Snyk to check for vulnerabilities
uses: snyk/actions/dotnet@master
env:
SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
with:
args:
--sarif-file-output=snyk.sarif --file=./devsecops/src/frontend/CafeReadConf.sln --severity-threshold=medium

- name: Upload result to GitHub Code Scanning
uses: github/codeql-action/upload-sarif@v3
with:
sarif_file: snyk.sarif
Docker:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
name: hadolint
run: |
echo 'Downloading Hadolint to lint Dockerfile...'
wget https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint- Linux-x86_64
chmod +x hadolint-Linux-x86_64
mv hadolint-Linux-x86_64 hadolint
echo 'Start Dockerfile lint...'
./hadolint Dockerfile -f tty > results.txt

echo 'Results:'
cat results.txt
working-directory: ./devsecops/src/frontend

build:
needs: [secrets, SCA, Docker, IaC, SAST]
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- name: Setup .NET
uses: actions/setup-dotnet@v4
with:
dotnet-version: "8.0.x"
- name: Restore dependencies
run: dotnet restore ./devsecops/src/frontend/CafeReadConf.sln
- name: Build
run: dotnet build --no-restore --configuration Release --property WarningLevel=0
working-directory: ./devsecops/src/frontend
- name: dotnet publish
run: dotnet publish -c Release --property WarningLevel=0
working-directory: ./devsecops/src/frontend
- name: Upload artifact for deployment job
uses: actions/upload-artifact@v4
  with:
    name: .net-app
    path: ./devsecops/src/frontend/bin/Release/net8.0/publish
deployToDev:
 needs: [build]
  runs-on: windows-latest
    environment:
      name: "dev"
      url: ${{ steps.deploy-to-webapp-dev.outputs.webapp-url}}
  steps:
   - name: Download artifact from build job
     uses: actions/download-artifact@v4
     with:
       name: .net-app
   - name: Deploy to Azure Web App
       id: deploy-to-webapp-dev
      uses: azure/webapps-deploy@v2
      with:app-name: "ghactions-dev"
       publish-profile: ${{ secrets. AZUREAPPSERVICE_PUBLISHPROFILE_DEV }}
       package:.
DAST:
  needs: [deployToDev]
  runs-on: self-hosted
steps:
  - uses: actions/checkout@v4
  - name: ZAP Scan
    uses: zaproxy/action-full-scan@v0.8.0
     with:
       token: ${{ secrets.GITHUB_TOKEN }}
       docker_name: "ghcr.io/zaproxy/zaproxy:stable"
       target:https://ghactions-dev-gjbyf4c5hhhzgecw.westeurope-01.azurewebsites.net
        rules_file_name: ".zap/rules.tsv"
        cmd_options: "-a"
LoadTest:
needs: [deployToDev]
runs-on: self-hosted
  steps:
  - uses: actions/checkout@v4
  - name: Login to Azure
  uses: azure/login@v1
  continue-on-error: false
   with:
     creds: ${{ secrets. AZURE_CREDENTIALS }}
  - name: "Azure Load Testing"
    uses: azure/load-testing@v1
    with:
    resourceGroup: "rg-book-gha"
    loadTestConfigFile: "devsecops/.load/loadtest.yaml"
    loadTestResource: "loadtestbookgha"
  deployToProd:
    needs: [LoadTest, DAST]
     runs-on: self-hosted
     environment:name: "production"
     url: ${{ steps.deploy-to-webapp.outputs.webapp-url}}
     steps:
     - name: Download artifact from build job
       uses: actions/download-artifact@v4
         with:
           name: .net-app
    - name: Deploy to Azure Web App
       id: deploy-to-webapp
       uses: azure/webapps-deploy@v2
       with:
       app-name: "ghactions-prd"
       publish-profile: ${{ secrets. AZUREAPPSERVICE_PRD}}
       package:.
```

## Create a Public Container
Às vezes, você precisa distribuir software dentro da sua empresa ou para terceiros. O fluxo de trabalho a seguir usa o exemplo de um Azure Agente de produto DevOps (uma alternativa ao GitHub/Gitlab) e o empacota como um contêiner, publicado na Internet.
O fluxo de trabalho a seguir faz várias coisas:

- [x] Executa análise DevSecOps para verificar vulnerabilidades de segurança
- [x] Compila e empacota vários contêineres em várias plataformas (Windows e Linux)
- [x] Produz manifestos de implantação (HELM Chart dedicado à implantação em um cluster Kubernetes)
- [x] Gera um site de documentação
- [x] Executa testes de integração

## The Workflow
Este fluxo de trabalho tem quase 900 linhas, então cobriremos apenas certos detalhes e a apresentação das etapas. O código-fonte inteiro pode ser encontrado aqui: https://github.com/clemlesne/blue-agent/blob/main/.github/workflows/pipeline.yaml

Dica: para vê-lo em execução completa, recomendo que você o analise diretamente no repositório dedicado: https://github.com/clemlesne/blue-agent/actions/.

A primeira etapa (Inicializar) consiste em criar variáveis de ambiente (notavelmente versão e ramificação) que serão usadas posteriormente para marcar os contêineres.

Em seguida, três etapas de análise estática são executadas: SAST - Credenciais que verifica se uma senha foi esquecida no código, Semgrep estático que analisará a qualidade do código e, finalmente, Teste estático que executará uma análise do arquivo Docker, uma análise de conformidade do código (legibilidade) e também simulará uma implantação de infraestrutura no Azure. Três ações ocultas em um Makefile:

```
test:
Build Helm chart
40s.
@echo' Running Prettier" npx --yes prettier@2.8.8 --editorconfig --check.'
@echo "Running Hadolint"
find. -name "Dockerfile*" -exec bash -c "echo 'File {}:' && hadolint {}" \;


@echo " Running Azure Bicep Validate"
az deployment sub validate\
--location francecentral \
--parameters container/test/bicep/example.json \
--template-file container/src/bicep/main.bicep \
--verbose \
--name lgmorandgha
```

Em seguida vem a parte técnica onde para cada distribuição (sistema operacional), um Dockerfile dedicado é executado, etiquetado, assinado e verificado novamente com uma ferramenta DevSecOps (Snyk). Assim, usando matrizes, o fluxo de trabalho publica 7 versões diferentes em paralelo com um único fluxo de trabalho:

```
build-release-linux:
name: Build & release image (Linux ${{ matrix.os }})
needs:
 - init
 - sast-creds
 - sast-semgrep
runs-on: ubuntu-24.04
strategy:
fail-fast: false
matrix:
include:
- os: bookworm
arch: linux/amd64,linux/arm64
- os: bullseye
#steps to build the container image
arch: linux/amd64,linux/arm64
- os: focal
arch: linux/amd64,linux/arm64
os: jammy
arch: linux/amd64,linux/arm64
- os: noble
arch: linux/amd64
- os: ubi8
arch: linux/amd64,linux/arm64
- os: ubi9
arch: linux/amd64,linux/arm64
steps:
````

Então vêm os passos finais:

- [x] publicar e atualizar o Docker Hub
- [x] publicar um Helm chart que facilitará a implantação de artefatos em clusters Kubernetes
- [x] atualizar e publicar um site de documentação

Este fluxo de trabalho é interessante porque representa excelência quando você quer publicar um componente open-source, garantindo a segurança dos componentes, documentação atualizada e também considerando a experiência do usuário com facilidades de implantação (aqui uma imagem de contêiner e um manifesto Helm opcional).

## Conclusão
É com estas palavras que este livro termina. Espero que através dos capítulos e principalmente dos exercícios, você tenha conseguido descobrir e até mesmo apreciar a facilidade com que é possível construir coisas usando GitHub Actions. Este livro é apenas uma grande introdução às possibilidades que eles trazem, e certamente virão para enriquecer e se tornar um jogador-chave no cenário DevOps.

Ao ler o livro, sinta-se à vontade para olhar os apêndices, que contêm diferentes recursos que considerei apropriado reunir. Além disso, se você encontrar algum erro no livro ou quiser trocar comigo, me fazer uma pergunta ou qualquer coisa, escreva um e-mail para book@morand.me.
Desejo que você se divirta brincando com essas Ações e espero que você automatize com sucesso todos os tipos de tarefas ou coisas.
Louis-Guillaume MORAND


https://github.com/lgmorand/book-github-actions-content?tab=readme-ov-file

## Apêndices
Recursos do livro
Um máximo de códigos, exemplos, exercícios e Ações construídos dentro deste livro estão disponíveis em acesso aberto para seus repositórios dedicados.
Exemplos de código e respostas aos exercícios estão no repositório principal: https://github.com/lgmorand/book-github-actions-content

As Ações podem ser encontradas em:

- [x] Hello World: https://github.com/lgmorand/github-action-hello
- [x] Generate Release: https://github.com/lgmorand/github-action-generate-relnotes
- [x] Pandoc: https://github.com/lgmorand/github-action-pandoc
- [x] CredScanning:https://github.com/lgmorand/github-action-composite-credscanning

## Recursos recomendados

Aqui estão alguns recursos que recomendo para aprofundar o uso do GitHub Actions:

A documentação oficial: https://docs.github.com/en/actions • O blog oficial do GitHub: https://github.blog/
- [x] O GitHub Actions Toolkit: https://github.com/actions/toolkit
- [x] O action github-script que permite interagir facilmente com o GitHub em qualquer fluxo de trabalho: https://github.com/actions/github- script
- [x] O Changelog do GitHub https://github.blog/changelog/
- [x] Os fóruns do GitHub: https://github.community, Você encontrará ajuda, mas principalmente muitas informações ou recursos que o GitHub não julgou relevantes para indicar na documentação.
- [x] The Awesome List: uma lista de Actions consideradas as mais relevantes ou de melhor qualidade https://github.com/sdras/awesome-actions. Ler o código-fonte deles permitirá que você aprenda muito sobre boas práticas
- [x] O blog da equipe de segurança do GitHub: https:// securitylab.github.com/advisories

Alguns exemplos muito úteis de fluxos de trabalho para implantar na Nuvem:

- [x] Azure: https://github.com/Azure/actions-workflow-samples
- [x] AWS: https://github.com/actions/starter-workflows/blob/master/ci/aws.yml
- [x] GCP: https://github.com/google-github-actions/setup-gcloud

Com o passar dos meses, outros recursos certamente surgirão, e você completará sua própria lista de recursos favoritos.
Como criar um runner auto-hospedado dockerizado
No capítulo dedicado aos agentes, é abordada a noção de runners auto-hospedados, a capacidade de instalar um agente que roda em um servidor privado em vez do GitHub com o objetivo principal de fornecer funcionalidade adicional ou acessar uma rede privada. Os agentes auto-hospedados são instalados em um servidor no qual os agentes baixam e instalam conforme necessário em ferramentas de terceiros (SDK, tempo de execução, outros). Se um agente estiver vinculado a um único repositório por padrão (exceto com o GitHub Enterprise). Nesse caso, é possível instalar vários agentes gerenciando vários projetos lado a lado no mesmo computador. Além de problemas de segurança, o risco de colisão (aplicativos instalados por cada projeto, incompatíveis entre si) é real. Além disso, os diretórios de trabalho contêm uma cópia do código-fonte baixado e outros elementos que potencialmente contêm dados confidenciais.
A resposta para esse problema é executar runners dentro de um contêiner para isolá-los uns dos outros e redefini-los sempre que necessário para fornecer um ambiente de trabalho limpo.
A criação de um agente em contêiner é relativamente simples. Sua implementação requer a criação de um contêiner de imagem que baixa automaticamente a versão mais recente do runner, uma ação que você normalmente faz por meio da página Configurações > Ações do seu repositório. Este contêiner então inicia na inicialização, o comando para registrar.
O primeiro passo consiste em criar um Dockerfile que cuida da instalação do agente e inicia um script entrypoint.sh:

```
FROM ubuntu:20.04                                            # we need a default version
ENV RUNNER_VERSION=2.277.1
RUN useradd -m actions
RUN apt-get -yqq update && apt-get install -yqq curl ją wget # calls the GitHub api to retrieve the last version
RUN\
COPY entrypoint.sh.
RUN chmod +x entrypoint.sh
LABEL="$(curl -s -X GET 'https://api.github.com/repos/actions/runner/releases/latest' | jq -r '.tag_name')" \
USER actions
ENTRYPOINT ["./entrypoint.sh"]
RUNNER_VERSION=":
="$(echo ${latest_version_label:1})" \
cd /home/actions && mkdir actions-runner && cd actions-runner\
&& wget
https://github.com/actions/runner/releases/download/v$
{RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
&& tar xzf./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
WORKDIR /home/actions/actions-runner
RUN chown -R actions ~actions && /home/actions/actions-runner/bin/ installdependencies.sh
```

Em seguida, vem o arquivo entrypoint.sh, que é responsável por realizar várias ações
- [x] Autentique-se no GitHub e solicite um novo token de registro. Cada executor requer um token dedicado, e solicitar esse token dinamicamente permite a criação de vários contêineres lado a lado, cada um usando seu próprio token
- [x] Use o arquivo config.sh para registrar-se no repositório GitHub, as variáveis sendo passadas como parâmetros
- [x] Uma vez que o executor é registrado no GitHub, inicia o executor (será visto como "idle" no GitHub)
- [x] No final, quando o contêiner estiver fechando, cancela o registro do executor
A vida do contêiner é efêmera e não deixaria rastros. É possível criar um novo agente original girando um novo contêiner.

```
# set up the starting script
#!/usr/bin/env bash
x
set -eEuo pipefail
GITHUB ACTIONS: A PRACTICAL GUIDE
# retrive a registration token
TOKEN=$(curl -s -X POST -H "authorization: token ${TOKEN}" "https://api.github.com/ repos/${OWNER}/${REPO}/actions/runners/registration-token" | jq -r .token)
cleanup() {
}
./config.sh remove --token "${TOKEN}"
--unattended \
--work_work
#starting
./run.sh
#cleaning
cleanup
# registrering the runner
./config.sh \
--url "https://github.com/${OWNER}/${REPO}" \
--token "${TOKEN}" \
--name "${NAME}" \
```

Agora que todos os elementos estão prontos, você precisa gerar uma imagem de contêiner e publicá-la em qualquer registro docker (ou localmente usando o Docker build). O procedimento é exatamente o mesmo que criar uma Action dockerizada explicada anteriormente neste livro.
Código-fonte: Se você estiver procurando por um exemplo pronto para uso e seu fluxo de trabalho para gerar a imagem docker, você pode encontrar um exemplo deste repositório público: https://github.com/lgmorand/self-hosted-runner-dockerized.


Depois que sua imagem de contêiner for gerada e disponibilizada em um registro, você precisa criar uma instância do contêiner transmitindo os parâmetros necessários:
NAME: nome do runner, deve ser exclusivo
OWNER: o nome da sua conta do GitHub
REPO: o nome do repositório ao qual o runner será vinculado
IMAGE: o nome da sua imagem Docker que você acabou de criar
TOKEN: um Personal Access Token que fornece acesso aos seus repositórios. A criação de um PAT é feita no portal do GitHub clicando em seu perfil e depois em Settings > Developer Settings

O uso dele pode ir além, implantando, por exemplo, instâncias do seu contêiner dentro de um cluster Kubernetes ou uma oferta serverless para contêineres (por exemplo, Azure Container Instance, Cloud Run no GCP, Fargate na AWS). Depende de você, agora você tem mais agilidade do que com um runner instalado diretamente em um servidor.

Personal access tokens
Tokens de acesso pessoal funcionam como tokens de acesso OAuth comuns. Eles podem ser usados em vez de uma senha para o Git sobre HTTPS, ou podem ser usados para autenticar na API sobre Basic Authentication.

Creating a PAT

```
docker run --env OWNER={OWNER} --
--env TOKEN={TOKEN} --env NAME={NAME} --
--env
REPO={REPO} {IMAGE}
Here is an example:
docker run --env OWNER=1gmorand --env TOKEN=ghp_mXkDnajJQjM921W1UqfkO --
env NAME=redtower-runner --env REPO-my-repo lgmorand/self-hosted-runnner
```
