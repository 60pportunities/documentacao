A Governança de Identidade, permite que as organizações definam políticas, calculem riscos, definam e executem revisões e gerenciem identidade e acesso em toda a sua organização.

* Transforme, publique e gerencie dados
* Extraia dados e crie funções técnicas e comerciais
* Atribua responsabilidades de governança
* Revise usuários, contas, funções técnicas e comerciais, definições de funções comerciais e relacionamentos
* Solicite acesso e remoção de acesso
* Atenda ou negue solicitações e verifique alterações
* Execute análises e obtenha insights de governança
* Gerencie a conformidade e corrija violações

Entendendo Autorizações na Governança de Identidade
Depende de autorizações para definir um conjunto fixo de permissões de acesso. 


## Definição de Papéis

| Papel                 | Entenda |
| ----                  | ----    |
| Auditor de Aplicação  | Revisam trilhas de auditoria de transações e operações de banco de dados, em um período de tempo, para certificar que elas são normais e autorizadas.  |
| Atribuições de Responsabilidades | Organizam os aprovadores - geralmente superusuários ou proprietários de processos de negócios.                       |
|                                  | Gera a documentação de auditoria necessária no final do ano para auditorias de SoD e revisões de acesso do usuário.  |
| Segregation of Duties            | Verificação de que as políticas de negócios do SoD são refletidas com precisão nas definições de conflito do SoD Violations Manager, tornando o SoD VM mais confiável. |

# Segregation of Duties 

| Área | Função                             |  Atividade                        | Motivação                                                                 |
| ---- | ------                             |  ----------                       | ---------                                                                 |
|  TI  | Gerenciamento de acesso do usuário | Segregação entre criação de conta | Garantir a responsabilização e impedindo acesso não autorizado.           |
|      |                                    | Aprovação de acesso               |                                                                           |
|      |                                    | Divisão entre segurança de rede   | Melhorar a supervisão e evitando conflitos de interesse.                  |
|      |                                    | Administração de sistema          |                                                                           |

## Controle de Acesso
O controle de acesso autentica usuários verificando várias credenciais de login, incluindo nomes de usuários e senhas, PINs, varreduras biométricas e tokens de segurança. 

| Definição    | Entenda                                                                                                           | 
| ----         | ------                                                                                                            |
| Autenticação | Processo de verificar a identidade de um usuário ou sistema antes de permitir o acesso a recursos ou informações. (Biométrica, detecção de vivacidadde,  autenticação baseada em conhecimento (geração de perguntas), Verificação de senha de uso único (SMS) e Senha ) |
| Autorização  | Controle de acesso baseado em atributos (ABAC) para granularidade incomparável. Estabeleça políticas de acesso com base em atributos do usuário, condições ambientais e características de recursos. |
| Auditoria    | Ferramentas avançadas de análise de log armadas com algoritmos de aprendizado de máquina oferecem uma abordagem proativa à segurança. Elas detectam padrões e anomalias em dados de log, permitindo que você identifique ameaças potenciais ou violações de política antes que elas causem estragos. |

# Controle de acesso em diferentes domínios

| Definição                      | Entenda                             |
| ----                           | ------                              |  
| Tecnologia da Informação (TI)  | Para proteger dados, redes e sistemas sensíveis. |
| Segurança Física               | Restringe a entrada em instalações seguras, gerencia o acesso de visitantes e protege áreas sensíveis. |
| Assistência Médica             | Privacidade do paciente e protege os registros eletrônicos de saúde (EHRs) na assistência médica. O pessoal autorizado pode acessar as informações do  paciente implementando medidas de controle de acesso, minimizando violações de dados e cumprindo os padrões da indústria e regulamentações de privacidade como HIPAA(Health  Insurance Portability and Accountability Act),  |
| Finanças e serviços bancários  | Proteger dados financeiros e informações de clientes.  Medidas robustas como autenticação multifator protegem contas de clientes, previnem  transações não autorizadas e mitigam roubo de identidade, fraude e riscos de segurança. |


## Autorização
A autorização é um lugar onde controlamos o acesso, decidindo o que uma pessoa pode ou não fazer. Abaixo estão os vários tipos de autorização: 

- [x] Controle de acesso baseado em função (RBAC): Atribui permissões a funções e os usuários são atribuídos a essas funções.
      - [x] Casos de uso: sistemas corporativos, onde as funções de trabalho determinam o acesso.
      - [x] Exemplo: uma função de "Gerente" tem acesso a relatórios financeiros e os funcionários nessa função herdam essas permissões.

- [x] Controle de acesso baseado em atributos (ABAC): O acesso é concedido com base nos atributos do usuário, recurso, ambiente ou ação.
      - [x] Atributos: Departamento do usuário, sensibilidade do recurso, tempo de acesso, etc.
      - [x] Exemplo: Um usuário só pode acessar documentos marcados com "Confidencial" se seu "nível de liberação" for "Alto".

- [x] Controle de Acesso Discricionário (DAC): O proprietário do recurso decide quem pode acessar seus recursos.
     - [x] Exemplo: um proprietário de arquivo pode conceder acesso de leitura/gravação a usuários específicos.

- [x] Controle de acesso obrigatório (MAC): O acesso é determinado por uma autoridade central com base nos níveis de classificação.
      - [x] Exemplo: Um documento "Top Secret" só pode ser acessado por indivíduos com autorização "Top Secret".

- [x] Controle de acesso baseado em políticas (PBAC): As decisões são tomadas com base em políticas definidas pelos administradores.
      - [x] Exemplo: o acesso é permitido se o local do usuário for "EUA" e o nível de assinatura for "Premium".

- [x] Controle de Acesso Baseado em Identidade (IBAC): O acesso é concedido diretamente a uma identidade individual, em vez de funções ou atributos.
      - [x] Exemplo: conceder a um usuário específico acesso a um único recurso.

- [x] Controle de acesso refinado: Decisões de acesso granular com base em critérios detalhados, geralmente uma combinação de ABAC e PBAC.
      - [x] Exemplo: um usuário só pode editar seções específicas de um documento durante o horário de trabalho.

- [x] Controle de acesso sensível ao contexto: Considera o contexto, como dispositivo, localização ou padrões de comportamento, para decidir o acesso.
      - [x] Exemplo: permita o acesso somente se o usuário estiver em um dispositivo confiável em um local específico.

- [x] Controle de acesso Zero Trust: "Nunca confie, sempre verifique." O acesso é avaliado continuamente, mesmo após a autenticação inicial.
      - [x] Exemplo: um usuário é obrigado a se autenticar novamente ao acessar um recurso confidencial, mesmo em uma sessão confiável.

- [x] Agosto Controle de acesso baseado em uso (UBAC): O acesso é baseado em padrões e cotas de uso de recursos.
      - [x] Exemplo: um usuário pode fazer upload de arquivos com um limite de até 10 GB por mês.

- [x] Agosto Controle de acesso baseado em tarefas (TBAC): O acesso é concedido com base nas tarefas que o usuário precisa executar.
      - [x] Exemplo: Um usuário pode aprovar um documento somente se fizer parte da cadeia de tarefas de aprovação.
·


