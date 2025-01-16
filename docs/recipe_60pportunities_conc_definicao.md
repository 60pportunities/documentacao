## Catálogo de Serviços visto por outra ótica
| Tipo                                                                           | Descrição                                                                          |
| -----                                                                          | --------                                                                           | 
| Desenvolvidos Internamente (Sistemas Internos – SI)                            | São desenvolvidos dentro da empresa.                                               |
| Prontos para uso (Components off-the-shelf-COTS/Modifiable off-the-shelf-MOTS) | São adquiridos externamente de outra empresa/fornecedor.                           |
| Software de código aberto (Open Source Software (OSS))                         | São obtidos externamente da comunidade OSS. [OpenSource](https://opensource.org/history), [gnu.org](https://www.gnu.org/philosophy/free-sw.pt-br.html#History) e [hacktoberfest](https://hacktoberfest.digitalocean.com/) |
| Componentes Terceirizados (Desenvolvidos por subcontratação)                   | São obtidos por um processo de subcontrato ou de terceirizado. |
| Mobile COTS	                                                                 | São softwares SoE, que são liberados em função de um COTS.     |
| [Digital Public Goods Standard (DPG)](https://www.digitalpublicgoods.net/digital-public-goods)                                           | São softwares de código aberto, padrões abertos, dados abertos, sistemas de IA abertos e coleções de conteúdo aberto que respeitam a privacidade e outras leis e práticas recomendadas aplicáveis, não causam danos e ajudam a atingir os Objetivos de Desenvolvimento Sustentável (ODS). |

## Classificação de Sistemas
| Tipo De Sistema                       |  Objetivo |
| ----                                  | -----     |
| Sistemas de Registro (SoR)            | Estes sistemas incluem um sistema de armazenamento e acesso de dados e são a fonte oficial de dados corporativos. Idealmente, para integridade de dados, governança e segurança, tenha uma única fonte de dados em um sistema de registro para quaisquer dados específicos. Essa configuração oferece o que é conhecido como “**versão única da verdade**”, um recurso muito procurado que garante que a entrada para a tomada de decisão seja a mais precisa possível. Para dados **_históricos e estáticos_**, os sistemas de registro oferecem um caminho rastreável para os dados originais. Para dados que **_continuam a mudar_**, como níveis de estoque e saldos de contas bancárias, os sistemas de registro fornecem as informações mais recentes. |
| Sistemas de Engajamento (SoE)         | Esses sistemas usam tecnologias que se comunicam com eficiência entre várias organizações e redes dentro da empresa para fornecer a experiência colaborativa necessária para que os negócios tenham sucesso no ambiente competitivo. Os sistemas de engajamento referem-se a sistemas centrados no cliente que incentivam ativamente as interações e a colaboração entre pares. Portais web para interações com clientes; e acesso a dispositivos móveis para clientes e funcionários. Um requisito fundamental do sistema de engajamento é a integração entre aplicativos como gerenciamento da cadeia de suprimentos, ERP, sistemas de RH e gerenciamento de produtos. |
| Sistemas de Interaction/Insight (SoI) |  Integram dados do engajamento e de registros para encontrar novos relacionamentos e padrões analisando dados históricos, avaliando a situação atual, aplicando regras de negócios, prevendo resultados e propondo a próxima melhor ação. São sistemas de análise que facilitam a coleta, mineração, organização, transformação, consumo e análise de diversos conjuntos de dados com ferramentas de modelagem estatística para detectar padrões, relatar o que aconteceu, prever resultados com alto grau de confiança, aplicar regras de negócios e políticas, além de fornecer insights acionáveis. |

### Segregação de Ambientes Operacionais
A segregação consiste na disponibilidade de bases distintas para cada ambiente. Esta segregação tem como objetivo **isolar** as diversas alterações solicitadas de modo diminuir riscos de novas implementações com isso gerando impactos menores nos processos já funcionais.

Entender que as práticas convencionais para definição e documentação total da arquitetura e design antes do início da codificação, já se provaram ineficazes, por isso devemos estabelecer claramente estes ambientes para que consigamos entregar no período correto, um produto estável e necessário.

Elaborado um quadro abaixo com o objetivo de fornecer uma maneira clara a identificação e responsabilidade de cada área.

- [x] Os ambientes na qual não se desenvolve, apenas para aplicação de atualizações disponibilizadas pelo Fornecedor, só terão a **HOMOLOGAÇÃO**.
- [x] Os Sistemas Internos, que não possuam volumetria e não apresentem riscos operacionais, deverão possuir apenas o ambiente de **DESENVOLVIMENTO**.
- [x] Salvo contrário, os demais ambiente possuirão **DESENVOLVIMENTO** e **HOMOLOGAÇÃO**.
- [x] Ambientes de **PROJETO** deverão ser disponibilizados através de solicitação e com data de término ativada. Não poderá haver **2(duas) prorrogações** na continuidade do ambiente operacional.
- [x] Deverá haver uma ambiente de **SIT**, para que os dados de **PRODUÇÃO**, sejam mascarados e purgados por um período máximo de 12 meses (**1 ano**).
- [x] Para a PORTA quanto **mais alta**, mais longe da produção e sufixo do servidor não há regras.

#### Development (DEV)
<div class="mdx-columns2" markdown>
- [x] Ambiente de Desenvolvimento;
- [x] História do Usuário atribuídas ao desenvolvedor;
- [x] Código completo e de acordo com os padrões;
- [x] Repositório Central atualizado com a última versão do código;
- [x] **Testes Unitários** executados pelo time de desenvolvimento;
- [x] Estimamos que em breve estaremos liberando **Plataforma do Dsenvolvedor Interno/Internal Developer Platforms (IDP)** que será o conjunto de tecnologias, ferramentas e amostragem de dados que as equipes de  desenvolvimento utilizarão.
</div>

#### System Integration Test (SIT)
<div class="mdx-columns2" markdown>
- [x] Desenvolvedores e/ou Tester/Qualidade
- [x] Planilha de Teste de Aceitação preenchida e atualizada no Repositório Central;
</div>

#### User Acceptance Test (UAT)
<div class="mdx-columns2" markdown>
- [x] Clientes, Donos do Produto ou Gerente de Produto;
- [x] Implantado e configurado no ambiente de Homologação;
- [x] Testes de Aceitação executados e validados pelo cliente;
- [x] Realização da Revisão da Sprint: demonstração pelo time de desenvolvimento;
- [x] Implantado e configurado no ambiente de Produção;
</div>

#### Production(PROD)
<div class="mdx-columns2" markdown>
- [x] Ambiente Público, controlodo por perfil de acesso.
- [x] Documentação do usuário entregue;
- [x] Release criada e armazenada no Repository Management.
</div>