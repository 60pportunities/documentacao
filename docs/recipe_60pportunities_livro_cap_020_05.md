- [x] Elas usam uma estratégia de ramificação específica e qual é sua estratégia de teste, sua estratégia de implantação e sua estratégia de lançamento?
- [x] Além disso, o arranjo do código do aplicativo, do código da infraestrutura e do código do pipeline requer algum pensamento. Você coloca tudo em um repositório ou não?
- [x] O pipeline inclui etapas manuais e como elas se refletem no design?
- [x] O desafio é moldar a organização, os processos e as pessoas.
- [x] Comece pequeno, expanda gradualmente, inspire as pessoas e ajude a moldar uma maneira de trabalhar que se encaixe na filosofia CI/CD;
- [x] CI/CD é geralmente restrito a construir, testar e implantar;
- [x] Os fundamentos da integração contínua/entrega contínua (CI/CD) foram estabelecidos por pessoas como Paul Duvall, Jez Humble e David Farley, e são descritos detalhadamente em seus respectivos livros, Continuous Integration: Improving Software Quality and Reducing Risk e Continuous Delivery: Reliable Software Release through Build, Test and Deployment Automation.
- [x] Integração contínua: é identificar e corrigir erros mais cedo, garantindo que o código esteja sempre em um estado funcional.
- [x] Entrega contínua: há um estado estável linha principal do código, é automatizar o processo de implantação de versões do software em ambientes de produção ou pré-produção de maneira confiável. Cada construção é testada automaticamente em uma máquina de teste que se assemelha ao ambiente de produção real.
- [x] CI/CD é geralmente restrito a construir, testar e implantar.
- [x] Tradicionalmente, CI/CD não abrange todas as atividades associadas ao desenvolvimento de software.
- [x] CI/CD é geralmente restrito a **construir, testar e implantar**.
- [x] Atividades como **planejamento, análise de requisitos, design, operação e monitoramento** geralmente não são consideradas no escopo de CI/CD.

## Arquitetura de Referência IT4IT
<div class="mdx-columns2" markdown>
- [x] Estratégia para fluxo de valor do portfólio (S2P);
- [x] Requisito para implantar o fluxo de valor (R2D);
- [x] Fluxo de valor de solicitação para cumprir (R2F);
- [x] Fluxo de valor de detecção para correção (D2C);
</div>

## Integração contínua e entrega contínua no contexto da IT4IT

## Arquitetura e cadeia de suprimentos de software
A importância do gerenciamento do ciclo de vida do aplicativo

## Gerenciamento do Ciclo de Vida do Aplicativo
<div class="mdx-columns2" markdown>
- [x] Gerenciamento de portfólio;
- [x] Gerenciamento de projetos;
- [x] Gerenciamento de requisitos;
- [x] Arquitetura de software;
- [x] Desenvolvimento de aplicativos;
- [x] integração contínua;
- [x] Garantia de qualidade/testes de software;
- [x] Manutenção/controle de software;
- [x] Suporte;
- [x] Gerenciamento de mudanças;
- [x] Gerenciamento de lançamentos;
- [x] Monitoramento
</div>

Entregar software de qualidade em um ritmo que satisfaça seu negócio é o objetivo.

A organização empresarial tem requisitos aos quais um pipeline deve obedecer?
A equipe DevOps tem requisitos?

| Modo de trabalho              | Restrições de recursos | Monitoramento    |
| ----                          | ----                   | ----             |
| Tecnologia                    | Gerenciabilidade       | Sustentabilidade |
| Informação                    | Operações              | Governança       |
| Segurança                     | Qualidade              |                  |
| Conformidade e auditabilidade | Métricas               |                  |

## Modo de trabalho
- [x] Requisito: Um requisito tem um proprietário. Um requisito sem um proprietário e justificativa não é um requisito.
- [x] A maneira de trabalhar da organização empresarial: alguma forma, esses aspectos influenciam o design do pipeline.
- [x] Estratégia de ramificação da equipe: design do pipeline, dependem fortemente do fluxo de trabalho da equipe;
- [x] A estratégia de Teste da equipe: Testes Unitários, Integração, Funcionais, Regressão, Mnuais, Carga, Estresse, Desempenho, Interrupção e Pré-produção/preparação.
- [x] Estratégia de Lançamentos: define a cadência para lançar artefatos;
- [x] A estratégia de implantação de produção: Estratégia de "Recriar implantação" ou uma estratégia de "Implantação Azul/Verde"?
- [x] Requisito: Use uma estratégia de ramificação simples: Limite sua estratégia de ramificação.
- [x] Limite sua estratégia de ramificação a um fluxo de trabalho baseado em tronco ou fluxo de trabalho de ramificação de recurso.
- [x] Requisito: Mantenha as ramificações de recursos de curta duração
- [x] Um dos princípios básicos do CI/CD é não usar ramificações de recursos, mas se você decidir usá-los, mantenha os ramos de recursos de curta duração.
- [x] Requisito: escolha a estratégia de lançamento desejada, mas mantenha a linha principal pronta para produção.
- [x] Implantar uma versão uma vez por dia, uma vez por semana ou uma vez por mês é um requisito que a empresa define.
- [x] Requisito: execute testes manuais somente se necessário.
- [x] Mostra que testes manuais ou semi-automatizados ainda são necessários
- [x] Tecnologia: Um microsserviço é executado de forma independente CD para pacotes de fornecedores até parece uma contradição do ponto de vista do consumidor e, em essência, é.
- [x] Requisito: A disponibilidade, integridade e confidencialidade da plataforma/servidor
- [x] De integração ALM devem corresponder às do aplicativo com a classificação mais alta.
- [x] Requisito: Criar um pipeline por microsserviço.
- [x] Um microsserviço é um pequeno pedaço isolado de software que roda  de forma independente.
- [x] Requisito: Automatizar a criação de testes efêmeros ambientes.
- [x] O uso de ambientes de teste efêmeros é uma solução para esse problema e  é fortemente recomendado. O ambiente de teste é criado na hora e destruído automaticamente quando não é mais usado.
- [x] Requisito: não recrie ambientes de teste em cada execução de pipeline.
- [x] Uma abordagem melhor é provisionar a infraestrutura, mas excluí-la apenas se não for mais usado ou se não for usado por um longo tempo.
