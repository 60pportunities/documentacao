<p align="justify">A Equipe do XXXXXX, passou a adotar o Supravizio como ferramenta  - ITSM e DEMANDAS, tendo para cada tipo de item, um fluxo diferenciado. Os fluxos na maioria das vezes, estava desassociado do processo de desenvolvimento de software.</p>
![](img/projeto-inicial-rj.png){width="600" height="350" style="display: block; margin: 0 auto"}

**Observação**: O processo de diferimento de software é uma estratégia frequentemente adotada por equipes de desenvolvimento para adiar ou postergar a implementação de certas funcionalidades ou melhorias em software. Este processo pode ser aplicado tanto em projetos de longo prazo quanto em demandas expressas (geralmente solicitadas por clientes ou usuários internos de forma mais imediata).

As Equipes de Desenvolvimento, NÃO acolheram o modelo apresentado em 2014. Cada Equipe desenvolveu o seu próprio processo e a utilizaram de inúmeras ferramentas:
<div class="mdx-columns2" markdown>
- [x] **Projetos**: [Redmine](https://www.redmine.org/)
- [x] **Gerenciador de Artefatos**: [Nexus](https://www.sonatype.com/products/sonatype-nexus-repository)
- [x] **Servidor de automação**: [Jenkins](https://www.jenkins.io/)
- [x] **Análise Estática de Código (SAST)**: [SonarQube](https://www.sonarsource.com/products/sonarqube/)

- [x] [Documentação na Intranet](https://intranet.bbts.com.br/index.php?option=com_content&view=article&id=700:teste-teste&catid=112&Itemid=423)
</div>

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
## Migração para Azure-Devops
<p align="justify">A migração do GitLab para o Azure DevOps foi uma decisão estratégica tomada com base em diversos fatores que visam melhorar a eficiência, integração e escalabilidade dos nossos processos de desenvolvimento.</p>
### Integração e Ecossistema Microsoft
<p align="justify">O Azure DevOps oferece uma integração nativa com outras ferramentas do ecossistema Microsoft, como o Teams, Power BI e Office 365.</p>
![](img/time-scrum-trabalho.png){width="370" height="320" style="display: block; margin: 0 auto"}
### Segurança e Governança
<p align="justify">O Azure DevOps possui fortes controles de segurança e governança, incluindo autenticação multifatorial (MFA), integrações com Azure Active Directory (AAD), e opções avançadas de controle de permissões.</p>
### Custo
<p align="justify">Embora o GitLab ofereça uma solução de código aberto com boas funcionalidades, o Azure DevOps se destaca pois toda a instituição já estava usando esta ferramenta.</p>
### Gerenciamento de Projetos e Work Items
<p align="justify">O Azure DevOps possui uma abordagem poderosa e intuitiva para o gerenciamento de projetos, com funcionalidades como boards, sprints, e acompanhamento de work items. A integração dos boards com as funcionalidades de controle de versões e pipelines permite que as equipes acompanhem o progresso de forma mais precisa e transparente. Além disso, os work items podem ser facilmente ligados a commits, builds e releases, proporcionando uma visão unificada do ciclo de vida do desenvolvimento.</p>
|                                         |                                  |
|                                         |                                  |
| ![](img/alm_pt_scrum_wit_artifacts.png) | ![](img/alm-pt-scrum-wf-pbi.png) |

## Problemas a serem enfrentados
- [x] Não tínhamos **conhecimento** no Azure-Devops;
- [x] Temos **Product Manager, Owner ou Usuário Chave**? 
- [x] Não **sabíamos como efetuar alteração e adicionar campos** que eram necessários para atender a unificação das Demandas (Projetos, Demanda Expressa e Bugs);
- [x] O que seriam **épicos e features**, no conceita da Empresa?
- [x] Tínhamos a cultura, ou seria, melhor começar de **PBI, Bug, Task, Spike**?
- [x] Iniciamos com o processo **`xxxx-lab Scrum`**  e desenvolvemos o `xxxxπdev_Scrum`;
- [x] As Wits poderiam ser **EXCLUÍDAS**? Quais os campos obrigatórios ou opcionais?
- [x] Como efetuar uma Hierarquia e tornar um Produto único, documentado e transparente?
- [x] Como anda o nosso processo de Documentação onde elas estão? Consigo pegar de forma coorporativa?
- [x] Tínhamos um **SQUAD**? Trabalhamos bem com o Git, SVN ou só colocamos porque é conveniente?
- [x] Como incluir as métricas de fluxo (Kanban) e eficiência (DORA Metrics) para uma equipe que mudava constantemente de ferramentas?
- [x] Métricas de Fluxo (ex: Kanban) medem como as tarefas se movem através de um sistema, com ênfase no tempo de entrega e na capacidade de conclusão.
- [x] Métricas de Eficiência (ex: DORA Metrics) medem a capacidade de uma equipe de entregar de maneira rápida e confiável, com foco em resultados de produção e manutenção.
- [x] Framework DevEx como estabelecer um método que se concentra na satisfação dos desenvolvedores em relação ao seu trabalho?
- [x] Framework Space como criar um espaço centralizado onde times podem colaborar, acessar recursos e compartilhar conhecimento?
- [x] InnerSource como quebrar silos internos e permitir que diferentes equipes colaborem em projetos internos como fariam em um ambiente open source?

## Qual era o foco?

[![](https://mermaid.ink/img/pako:eNplks2O2jAQgF9l5ENlJCiwR1StShJ-dllVdGFVqcplSAaS4sSRf7RFiIepeugD9BF4sTreBC3Uhyj2fPPZY8-RJTIlNmJbIV-TDJWBp-e4BDfGA76M1g9hB6DXg6WSP8hI7f57vXsIPh9BZ1jRCFKZ6C4I3JAYQcy-5QZKWfOpNTJmp8Y25KuDHudpp7YFdqf7ERUfJz8rRVojtN43OoDL8KtDHsnEFlQaTFB2_oM8FfJAYZlkTTi8iQ75lNBYRdBg8AHCO-6OAtd5Qx9o8yIeZpTspTUQuqtqoOhaPuFr0obgpczN-ZfK2yNOrrEprxXw1aLIzaFhptfMjD-TINSk-4HNRdpQs2tq7jeEtZRCf-pv1P1UYUGvUu0bfn7Du8cktZWqcJVSXfrc3Ska3Lid_PSOj5cPUFtbw8BTPuY-wdCLHvk4odyVmkp40fZ9sY9w8yALHlEl5AEqVOhP6buifkEnXAz4jBSe_5x_u3aRyuTb819xsS088s72xL9Ix-TJW4r3rQzuaS5FSkrXeXHJuqwgV2WeuqY-1qqYmYwKilndnSlt0QoTs7g8ORRdi64OZcJGRlnqMiXtLmOjLQrtZrZK0VCU485d7mW1wvK7lO389A9jEexr?type=png)](https://mermaid.live/edit#pako:eNplks2O2jAQgF9l5ENlJCiwR1StShJ-dllVdGFVqcplSAaS4sSRf7RFiIepeugD9BF4sTreBC3Uhyj2fPPZY8-RJTIlNmJbIV-TDJWBp-e4BDfGA76M1g9hB6DXg6WSP8hI7f57vXsIPh9BZ1jRCFKZ6C4I3JAYQcy-5QZKWfOpNTJmp8Y25KuDHudpp7YFdqf7ERUfJz8rRVojtN43OoDL8KtDHsnEFlQaTFB2_oM8FfJAYZlkTTi8iQ75lNBYRdBg8AHCO-6OAtd5Qx9o8yIeZpTspTUQuqtqoOhaPuFr0obgpczN-ZfK2yNOrrEprxXw1aLIzaFhptfMjD-TINSk-4HNRdpQs2tq7jeEtZRCf-pv1P1UYUGvUu0bfn7Du8cktZWqcJVSXfrc3Ska3Lid_PSOj5cPUFtbw8BTPuY-wdCLHvk4odyVmkp40fZ9sY9w8yALHlEl5AEqVOhP6buifkEnXAz4jBSe_5x_u3aRyuTb819xsS088s72xL9Ix-TJW4r3rQzuaS5FSkrXeXHJuqwgV2WeuqY-1qqYmYwKilndnSlt0QoTs7g8ORRdi64OZcJGRlnqMiXtLmOjLQrtZrZK0VCU485d7mW1wvK7lO389A9jEexr)

