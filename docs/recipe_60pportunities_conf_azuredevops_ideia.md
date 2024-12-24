## Migração para Azure-Devops
A migração do GitLab para o Azure DevOps foi uma decisão estratégica tomada com base em diversos fatores que visam melhorar a eficiência, integração e escalabilidade dos nossos processos de desenvolvimento. 

### Gerenciamento de Projetos e Work Items
O Azure DevOps possui uma abordagem poderosa e intuitiva para o gerenciamento de projetos, com funcionalidades como boards, sprints, e acompanhamento de work items. A integração dos boards com as funcionalidades de controle de versões e pipelines permite que as equipes acompanhem o progresso de forma mais precisa e transparente. Além disso, os work items podem ser facilmente ligados a commits, builds e releases, proporcionando uma visão unificada do ciclo de vida do desenvolvimento.

|                                         |                                  |
|                                         |                                  |
| ![](img/alm_pt_scrum_wit_artifacts.png) | ![](img/alm-pt-scrum-wf-pbi.png) |

- [x] O que seriam **épicos e features**, no conceita da Empresa? 
- [x] Temos **Product Manager, Owner ou Usuário Chave**? 
- [x] Tínhamos a cultura, ou seria, melhor começar de **PBI, Bug, Task, Spike**?
      - [ ] As Wits poderiam ser **EXCLUÍDAS**?
      - [ ] Quais os campos obrigatórios ou opcionais?
- [x] Tínhamos um **SQUAD**?

### Integração e Ecossistema Microsoft
O Azure DevOps oferece uma integração nativa com outras ferramentas do ecossistema Microsoft, como o Teams, Power BI e Office 365.

### Segurança e Governança
O Azure DevOps possui fortes controles de segurança e governança, incluindo autenticação multifatorial (MFA), integrações com Azure Active Directory (AAD), e opções avançadas de controle de permissões.

### Custo
Embora o GitLab ofereça uma solução de código aberto com boas funcionalidades, o Azure DevOps se destaca por seu modelo de preços competitivo e escalável, permitindo ajustar os custos conforme o uso.

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
