Em 2022, foi realizado uma pesquisa que estimou o custo da má qualidade de software nos EUA, aponta um crescimento para pelo menos US$ 2,41 trilhões, mas não em proporções semelhantes  às vistas em 2020.

A Dívida Técnica (TD) acumulada de software cresceu para ~![US$ 1,52 trilhão](pdf/cpsq-report-nov-22-2.pdf)

As três principais áreas problemáticas nas quais nos concentramos no relatório deste ano são:

- [x] As perdas por crimes cibernéticos devido a vulnerabilidades de software;
- [x] Os problemas da cadeia de fornecimento de software com componentes subjacentes de terceiros (especialmente software de código aberto, também conhecido como OSS) aumentaram significativamente;
- [x] Dívida Técnica (DT) tornou-se o maior obstáculo para fazer quaisquer alterações nas bases de código existentes;

![](img/ISO-25010-Quality-Characteristics-img.png)

## Padrões de qualidade de software – ISO/IEC 5055:2021
A ISO/IEC 5055:2021 é uma norma ISO para medir a estrutura interna de um produto de software em quatro fatores críticos para os negócios: **Segurança, Confiabilidade, Eficiência de Desempenho e Manigurabilidade**.

### Regras de codificação para software
O [CISQ](https://www.it-cisq.org/) enumera 74 pontos críticos de codificação e arquitetura a serem evitados no código-fonte devido ao seu impacto na disponibilidade, tolerância a falhas, capacidade de recuperação e integridade de dados de um aplicativo.

![](pdf/reliability_weaknesses.pdf)

A confiabilidade mede o risco de possíveis falhas de aplicação e a estabilidade de um aplicativo quando confrontado com condições inesperadas. Confiabilidade é o grau em que um sistema, produto ou componente executa funções especificadas em condições especificadas por um período de tempo especificado.

Os padrões de qualidade de código do CISQ são compostos por fraquezas de software (CWEs) que podem ser detectadas no código-fonte através da análise de código estático. CAST e Synopsys (fornecedores de ferramentas) contribuíram para o desenvolvimento dos padrões e para apoiar os padrões em suas ferramentas.

### Estimativa do custo da manutenção corretiva
O padrão Automated Technical Debt estima o esforço para corrigir todas as instâncias das fraquezas de software incluídas nos padrões de qualidade de código CISQ que permanecem no código de um aplicativo de software no lançamento.

Essa estimativa pode ser usada para prever custos futuros de manutenção corretiva. Essa medida é para ferramentas de análise estática.

O custo para consertar problemas estruturais de qualidade constitui o principal da dívida, enquanto as ineficiências que eles causam, como maior esforço de manutenção ou recursos de computação excessivos, representam juros sobre a dívida.

A medida expressa o custo da qualidade do software em termos que uma empresa pode entender estimando custos futuros de manutenção corretiva para remediar defeitos estruturais no código.

O CISQ entrevistou desenvolvedores em várias organizações para estimar quanto tempo levaria para corrigir cada uma das fraquezas em um código bem construído. As estimativas forneceram valores padrão para o esforço para corrigir cada fraqueza. Para calcular a Dívida Técnica, ajustamos o valor padrão para cada ocorrência de uma fraqueza específica por fatores que afetam a dificuldade de corrigi-la, como a complexidade do componente, sua exposição ao resto do sistema, etc. Os esforços ajustados para cada ocorrência são somados para produzir um esforço total de correção para essa fraqueza. O esforço total de correção para as fraquezas em uma característica de qualidade é somado para criar um esforço de correção para essa característica. Finalmente, os esforços de correção para as quatro características de qualidade são somados para produzir a medida da Dívida Técnica.

###
A modernização de TI continua a ser uma prioridade para reduzir o custo, aumentar a flexibilidade e melhorar a resiliência do software.

Estamos vendo mais defensores da qualidade do código DevOps em equipes de desenvolvimento, e a gerência tem os dados sobre o custo do software de baixa qualidade e motivação que precisa para fornecer a cobertura aérea e o suporte para priorizar a qualidade do código DevOps.

As equipes de desenvolvimento estão levando a sério a qualidade do código DevOps e construindo qualidade e segurança no ciclo de vida do desenvolvimento de software. DevOps e DevSecOps estão sendo cada vez mais adotados pelas equipes de TI corporativas para apertar o ciclo de feedback entre TI, operações e clientes.

![](img/devops-toolchain-img.png)

### Regras de codificação para fornecer software resiliente e escalável
Os Padrões de Qualidade de Código para Confiabilidade, Eficiência de Desempenho, Segurança e Manutenibilidade são compostos por um conjunto de pontos fracos de software (CWEs) para mitigar o código-fonte.

| Confiabilidade  | Eficiência de desempenho | Segurança   | Mantenabilidade |
| -----           | ----                     | -----       | -----           |
| Detecção de Condição de Erros Sem Ação | Operações excessivas de consulta de dados em uma tabela de dados grande | Acesso ao Ponteiro Uninitorializado | Complexidade Algorítica |
| Código de Status Inesperado ou Valor de Devolução | Uso de objeto sem invocar o método destruição
| Uso de Operadores Errados em Comparação de Corrings | Excessive Index Range Scan para um recurso de dados | |  Método que contém acesso de um elemento de membro de outra classe |
| Initialização ausente de uma variável | Execução excessiva de buscas sequenciais de recursos de dados | | Uso do Código Redundante (Copy-Paste) |
| Conversão ou Cast de Tipo Incorreto   | Tabela de dados grande com número excessivo de índices | | Código Morto |


Como gerenciar riscos ao comprar software e SaaS

Normalmente, os produtos comerciais prontos para a prateleira (COTS) e Software como serviço (SaaS) são confiáveis como seguros pelos clientes, mas mais atenção está sendo dada nos últimos anos ao risco e vulnerabilidades da cadeia de suprimentos, já que a crescente dependência de fornecedores externos de terceiros coloca os usuários e a empresa em risco devido a software potencialmente explorável e maior responsabilidade.

Os clientes corporativos estão se tornando proativos e realizando a devida diligência, perguntando aos seus fornecedores sobre o suporte para padrões de qualidade de software.

O fornecedor pode produzir certificações ou relatórios de auditoria para demonstrar práticas de qualidade de software, codificação e arquitetura seguras e gerenciamento de riscos da cadeia de suprimentos.

Ele beneficia o provedor de software para ter essas informações disponíveis para facilitar a contratação e a vantagem competitiva, e beneficia o cliente a perguntar aos seus fornecedores sobre o suporte aos padrões, pois a responsabilidade por software seguro, resiliente e confiável está em suas mãos.

### Normas e Diretrizes Relacionadas
#### ISO - Organização Internacional para Padronização
A série de normas ISO/IEC 25000, também conhecida como SQuaRE (Sistema e Requisitos e Avaliação da Qualidade do Sistema e Software), contém uma estrutura para avaliar a qualidade do produto de software.

A ISO/IEC 25010 define um conjunto de oito características de qualidade de software, incluindo Segurança, Confiabilidade e Manutenibilidade.

A ISO/IEC 25023 descreve como medir a qualidade do produto de software usando essas características e descreve em grande parte a qualidade no nível comportamental.

No entanto, as medidas definidas em 25023 medem em grande parte a qualidade ao nível comportamental, em vez de no nível de problemas específicos de qualidade no código-fonte.

Para complementar o nível de medição em 25023, o CISQ definiu medidas de nível de código-fonte de quatro características de qualidade - Confiabilidade, Eficiência de Desempenho, Segurança e Manutenibilidade.

#### Gerenciando dívida técnica no nível arquitetônico
Um estudo da [McKinsey de 2022](https://www.mckinsey.com/capabilities/mckinsey-digital/our-insights/demystifying-digital-dark-matter-a-new-standard-to-tame-technical-debt) descobriu que a dívida técnica chega a 40% de todo o seu patrimônio tecnológico.

Enquanto isso, uma pesquisa de 2024 com executivos e profissionais de tecnologia descobriu que, para mais de 50% das empresas, a dívida técnica é responsável por mais de um quarto do orçamento total de TI, bloqueando inovações viáveis ​​se não for abordada.


![](img/devops-toolchain-img.png)


https://www.it-cisq.org/use-cases/devops-code-quality/

![](https://www.iso.org/standard/65378.html)
![](pdf/formal-14-01-03.pdf)

https://www.it-cisq.org/cisq-supplements-isoiec-25000-series-with-automated-quality-characteristic-measures/


### Pontos de Função Automatizados
O padrão Automated Function Point (AFP) é usado para automatizar o dimensionamento funcional de aplicações de software orientadas a transações.

A especificação CISQ AFP é baseada nas Diretrizes de Contagem de Pontos de Função mantidas pelo International Function Point User Group (IFPUG), a maior e mais ativa comunidade de dimensionamento de software Function Point.

Quando necessário, os julgamentos subjetivos dos elementos de função foram removidos para que a especificação fosse automatizada. Os benefícios de uma medida automatizada incluem velocidade, eficiência de custo e contagens repetitivas e consistentes que eliminam a variação de 10% entre os contadores de pontos de função manual.

As organizações podem aplicar Pontos de Função Automatizados para medir o tamanho de um produto de software. Juntamente com outras medidas selecionadas, os pontos de função podem ser usados nas seguintes atividades:

- [x] Análise de qualidade e produtividade de software
- [x] Estimar os custos e recursos necessários para o desenvolvimento, aprimoramento e manutenção de software
- [x] Calibrar métodos de estimativa em relação aos resultados de estimativas anteriores
- [x] Contratação e gestão de contratos com integradores e terceirizados
- [x] Normalização de dados usados em comparações de software
- [x] Determinar o tamanho de um pacote de aplicativo comprado (COTS ou sistema personalizado) dimensionando toda a funcionalidade incluída no pacote
- [x] Permitir aos usuários determinar o ROI de um aplicativo dimensionando a funcionalidade que corresponda especificamente aos requisitos de sua organização

### Pontos de realce automatizados
Automated Enhancement Points é uma medida padrão do tamanho do software a ser usado na análise de produtividade e no dimensionamento das atividades de manutenção de software.

Acesse o padrão OMG aqui: ![Automated Enhancement Points](pdf/formal-17-04-03.pdf)

Os Pontos de Aprimoramento Automatizados Melhoram a medição do tamanho do software para uso na análise de produtividade, medindo o tamanho funcional e não funcional do software.

Este é um avanço significativo no dimensionamento automatizado de software que resolve problemas que as medidas de tamanho funcional experimentaram na análise da produtividade durante as atividades de manutenção e aprimoramento.

Com esses dois padrões de análise de pontos de função e dimensionamento de software, as organizações podem:

- [x] Realize a qualidade de software e análise de produtividade;
- [x] Permitir que os usuários determinem o ROI de um aplicativo, dimensionando a funcionalidade que corresponde especificamente aos requisitos de suas organizações;
- [x] Calibrar métodos de estimativa em relação aos resultados de estimativas anteriores;
- [x] Medir e gerir contratos e acordos com integradores e terceirizados de sistemas;
- [x] Normalizar os dados usados em benchmarks de software;
- [x] Determinar o tamanho de um pacote de aplicativo comprado (COTS ou sistema personalizado) dimensionando todo o código incluído no pacote;
