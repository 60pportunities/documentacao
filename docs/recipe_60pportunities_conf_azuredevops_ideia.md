## Ciclo de Vida Desenvolvimento de Software (SDLC)
O processo de desenvolvimento não acolheu o processo definido em 2014, com as ferramentas:
<div class="mdx-columns2" markdown>
- [x] **Projetos**: [Redmine](https://www.redmine.org/)
- [x] **Gerenciador de Artefatos**: [Nexus](https://www.sonatype.com/products/sonatype-nexus-repository)
- [x] **Servidor de automação**: [Jenkins](https://www.jenkins.io/)
- [x] **Análise Estática de Código (SAST)**: [SonarQube](https://www.sonarsource.com/products/sonarqube/)

- [x] [Documentação na Intranet](https://intranet.bbts.com.br/index.php?option=com_content&view=article&id=700:teste-teste&catid=112&Itemid=423)
</div>

<p align="justify">Passou-se a adotar o Supravizio como ferramenta principal e basicamente o processo se desenhava assim:</p>
![](img/projeto-inicial-rj.png){width="225" height="125" style="display: block; margin: 0 auto"}

**Observação**: <p align="justify">O processo de diferimento de software é uma estratégia frequentemente adotada por equipes de desenvolvimento para adiar ou postergar a implementação de certas funcionalidades ou melhorias em software. Este processo pode ser aplicado tanto em projetos de longo prazo quanto em demandas expressas (geralmente solicitadas por clientes ou usuários internos de forma mais imediata).</p>
## Controle de Processo GitHub
<p align="justify">A estrutura de Organização no GitHub é menos hierárquica, mas permite gerenciar múltiplos repositórios com configurações e permissões centralizadas:</p>

- [x] **Organização**: É uma conta compartilhada que permite gerenciar repositórios e permissões em um único lugar.
- [x] **Repositórios**: Representam os projetos de código dentro da organização, podendo ser atribuídos a uma ou mais equipes, cada uma com suas permissões.

![](img/github-projeto.png){width="225" height="125" style="display: block; margin: 0 auto"}

## Controle de Processo [GitLab](https://scm.bbts.com.br/users/sign_in)
<p align="justify">A estrutura de Grupos e Subgrupos no GitLab é hierárquica e organiza os projetos de forma aninhada:</p>

- [x] **Grupo**: É o nível mais alto da hierarquia. Agrupa projetos relacionados e permite gerenciar permissões e configurações compartilhadas entre eles.
- [x] **Subgrupos**: São grupos dentro de um grupo principal. Servem para organizar melhor projetos complexos, dividindo-os por áreas, equipes ou módulos específicos.
- [x] **Projetos**: Ficam dentro dos grupos ou subgrupos. Representam o repositório de código e incluem todas as ferramentas de desenvolvimento, como issues, merge requests e CI/CD pipelines.

![](img/gitlab-projeto.png){width="225" height="125" style="display: block; margin: 0 auto"}

## Produtividade
<p align="justify">Refere-se a eficiência e eficácia com que time consegue entregar software de qualidade, atingindo os requisitos e prazos, utilizando de forma eficaz os recursos disponíveis, como tempo, ferramentas, tecnologias e conhecimento,  estando relacionada à capacidade de produzir código de alta qualidade e entregar funcionalidades ou produtos de software de forma rápida e eficiente, minimizando desperdícios.</p>

- [x] Onde estão os grandes ladrões de ineficiência?
- [ ] Onde o processo parou? 
      - [x] Parou em requisitos?
      - [x] Parou em codificação?
      - [x] Parou em Teste de Aceitação?
- [ ] Se esta pronto, porque esperar até o final da SPRINT? Usar Feature Toggle ou Flag.
      - [x] Deploy é o processo técnico de colocar ou instalar uma versão do software em um ambiente específico, como servidores de produção ou de staging, para que ele esteja disponível para execução.
      - [x] Release refere-se ao processo de tornar o software disponível para os usuários. 
- [x] Explicite o seu fluxo de trabalho;
- [ ] Mítico Homem-mês: Ensaios Sobre Engenharia de Software;
      - [ ] Conhecer as dificuldades inerentes ao trabalho torna mais fácil suportá-las quando elas surgirem;
      - [ ] Projeto de software depende de pessoas;
      - [ ] Não se pode dimensionar um software em termos de homem-mês; A adição de mais força de trabalho não implica na redução do tempo de entrega daquela tarefa;
      - [ ] Integridade Conceitual - Alguém definiu exatamente o que seria cada produto.
      - [ ] Comunicação franca entre equipe de arquitetura e equipe de construção, sem influenciar a clara divisão de tarefas.
- [ ] A única maneira de controlar um projeto grande e de agenda apertada é tendo uma agenda.Defina milestones, datas, prioridades.
- [ ] Ofensor do Tempo de Entrega e descrença
      - [ ] O PO simplesmente ignora a fase de homologação e esta é uma restrição para a próxima fase;
      - [ ] Cada release é uma surpresa, por falta de engajamento do PO;
      - [ ] Aumento do Pacote, ou seja, não entrego na Sprint correta e aumento o risco na Sprint seguinte;
- [ ] eu preciso homologar com o usuário e ele simplesmente me ignora se você não tiver
37:35
habilidade para conseguir engajar a área demandante a área usuária dificilmente você vai conseguir resolver às vezes um
- [x] Eficiência vs Eficácia
      - [x] Eficiência é fazer certo as coisas; 
      - [x] Eficácia é fazer as coisas certas;
## Migração para Azure-Devops
<p align="justify">A migração do GitLab para o Azure DevOps foi uma decisão estratégica tomada com base em diversos fatores que visam melhorar a eficiência, integração e escalabilidade dos nossos processos de desenvolvimento.</p>

### Gerenciamento de Projetos e Work Items
<p align="justify">O Azure DevOps possui uma abordagem poderosa e intuitiva para o gerenciamento de projetos, com funcionalidades como boards, sprints, e acompanhamento de work items. A integração dos boards com as funcionalidades de controle de versões e pipelines permite que as equipes acompanhem o progresso de forma mais precisa e transparente. Além disso, os work items podem ser facilmente ligados a commits, builds e releases, proporcionando uma visão unificada do ciclo de vida do desenvolvimento.</p>

|                                         |                                  |
|                                         |                                  |
| ![](img/alm_pt_scrum_wit_artifacts.png) | ![](img/alm-pt-scrum-wf-pbi.png) |

- [x] O que seriam **épicos e features**, no conceita da Empresa? 
- [x] Temos **Product Manager, Owner ou Usuário Chave**? 
- [x] Tínhamos a cultura, ou seria, melhor começar de **PBI, Bug, Task, Spike**?
      - [x] Como efetuar uma Hierarquia e tornar um Produto único, documentado e transparente?
      - [x] As Wits poderiam ser **EXCLUÍDAS**?
      - [x] Quais os campos obrigatórios ou opcionais?
- [x] Trabalhamos bem com o Git, SVN ou só colocamos porque é conveniente?
- [x] Como anda o nosso processo de Documentação onde elas estão? Consigo pegar de forma coorporativa?
- [x] Tínhamos um **SQUAD**?

### Integração e Ecossistema Microsoft
O Azure DevOps oferece uma integração nativa com outras ferramentas do ecossistema Microsoft, como o Teams, Power BI e Office 365.
![](img/time-scrum-trabalho.png){width="225" height="125" style="display: block; margin: 0 auto"}

### Segurança e Governança
<p align="justify">O Azure DevOps possui fortes controles de segurança e governança, incluindo autenticação multifatorial (MFA), integrações com Azure Active Directory (AAD), e opções avançadas de controle de permissões.</p>

### Custo
<p align="justify">Embora o GitLab ofereça uma solução de código aberto com boas funcionalidades, o Azure DevOps se destaca por seu modelo de preços competitivo e escalável, permitindo ajustar os custos conforme o uso.</p>

## Problemas vistos
- [x] Não tínhamos **conhecimento** no Azure-Devops;
- [x] Não **sabíamos como efetuar alteração e adicionar campos** que eram necessários para atender a unificação das Demandas (Projetos, Demanda Expressa e Bugs);
- [x] Havíamos **automatizado a criação de Projetos no GitLab e voltávamos para o Manual** no Azure-Devops;
- [x] Como poderíamos controlar as horas em um determinado **PROJETO**, sendo que a **maioria** dos projetos são de **INTEGRAÇÃO**.
      - [x] **Environment Management (Gestão dos ambientes)**;
      - [x] **Incident Managment (Gestão de Incidentes)**;
      - [x] **Disaster Recovery (Recuperação de desastres)**;
      - [x] **Reliability Driven Development (Desenvolvimento guiado pela confiabilidade)**;
      - [x] **Informative Workspace (Ambiente Informativo)**: Documentação gerada automaticamente pelo código com um processo de Tech Writer organizado;
      - [x] **Isolated Environments (Ambientes isolados)**: O time de produto dispor de ambientes para validação, desenvolvimento e Sandbox para equipes explorarem os contratos e SLA sobre as APIs;
- [x] Iniciamos com o processo **`xxxx-lab Scrum`**  e desenvolvemos o `xxxxπdev_Scrum`;
- [x] Como fazer o processo de Deploy, sendo que a maioria dos desenvolvimentos eram `legados` e dificilmente entrariam em uma esteira DevSecOps;

[![](https://mermaid.ink/img/pako:eNplks2O2jAQgF9l5ENlJCiwR1StShJ-dllVdGFVqcplSAaS4sSRf7RFiIepeugD9BF4sTreBC3Uhyj2fPPZY8-RJTIlNmJbIV-TDJWBp-e4BDfGA76M1g9hB6DXg6WSP8hI7f57vXsIPh9BZ1jRCFKZ6C4I3JAYQcy-5QZKWfOpNTJmp8Y25KuDHudpp7YFdqf7ERUfJz8rRVojtN43OoDL8KtDHsnEFlQaTFB2_oM8FfJAYZlkTTi8iQ75lNBYRdBg8AHCO-6OAtd5Qx9o8yIeZpTspTUQuqtqoOhaPuFr0obgpczN-ZfK2yNOrrEprxXw1aLIzaFhptfMjD-TINSk-4HNRdpQs2tq7jeEtZRCf-pv1P1UYUGvUu0bfn7Du8cktZWqcJVSXfrc3Ska3Lid_PSOj5cPUFtbw8BTPuY-wdCLHvk4odyVmkp40fZ9sY9w8yALHlEl5AEqVOhP6buifkEnXAz4jBSe_5x_u3aRyuTb819xsS088s72xL9Ix-TJW4r3rQzuaS5FSkrXeXHJuqwgV2WeuqY-1qqYmYwKilndnSlt0QoTs7g8ORRdi64OZcJGRlnqMiXtLmOjLQrtZrZK0VCU485d7mW1wvK7lO389A9jEexr?type=png)](https://mermaid.live/edit#pako:eNplks2O2jAQgF9l5ENlJCiwR1StShJ-dllVdGFVqcplSAaS4sSRf7RFiIepeugD9BF4sTreBC3Uhyj2fPPZY8-RJTIlNmJbIV-TDJWBp-e4BDfGA76M1g9hB6DXg6WSP8hI7f57vXsIPh9BZ1jRCFKZ6C4I3JAYQcy-5QZKWfOpNTJmp8Y25KuDHudpp7YFdqf7ERUfJz8rRVojtN43OoDL8KtDHsnEFlQaTFB2_oM8FfJAYZlkTTi8iQ75lNBYRdBg8AHCO-6OAtd5Qx9o8yIeZpTspTUQuqtqoOhaPuFr0obgpczN-ZfK2yNOrrEprxXw1aLIzaFhptfMjD-TINSk-4HNRdpQs2tq7jeEtZRCf-pv1P1UYUGvUu0bfn7Du8cktZWqcJVSXfrc3Ska3Lid_PSOj5cPUFtbw8BTPuY-wdCLHvk4odyVmkp40fZ9sY9w8yALHlEl5AEqVOhP6buifkEnXAz4jBSe_5x_u3aRyuTb819xsS088s72xL9Ix-TJW4r3rQzuaS5FSkrXeXHJuqwgV2WeuqY-1qqYmYwKilndnSlt0QoTs7g8ORRdi64OZcJGRlnqMiXtLmOjLQrtZrZK0VCU485d7mW1wvK7lO389A9jEexr)

# 