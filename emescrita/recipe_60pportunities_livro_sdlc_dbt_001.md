## Dívida Ténica
Identificar a dívida técnica envolve observar as áreas de estratégia, arquitetura, talento e processos, buscando sinais de que há algo impactando a eficiência do desenvolvimento e a qualidade dos sistemas.

Uma boa maneira de entender a dívida técnica é pensar que ela tem os mesmos dois componentes da dívida financeira:

- [x] O principal é todo o trabalho que deve ser feito para modernizar toda a pilha de tecnologia.
    - [x] Manutenção ou atualizações da camada de aplicativo, modificações para cumprir com os padrões de dados e software.
- [x] O interesse é o imposto de complexidade que todo projeto.
    - [x] Integrações de dados, harmonizar dados não padronizados e criar soluções alternativas para enfrentar riscos e atender às necessidades de negócios.

### Estratégia
<p align="justify">Quando a estratégia corporativa não está bem conectada com a TI, ou quando há incompatibilidade de recursos entre o time e a estratégia da empresa, isso indica uma dívida técnica crescente. Se os recursos não estão sendo distribuídos de forma adequada ao portfólio de projetos, você pode ter projetos prioritários com baixa qualidade técnica, aumentando a dívida.</p>

- [x] Definir os recursos necessários a nível corporativo e capacitar o time;
- [x] Ausência de alinhamento de TI e a estratégia corporativa;
- [x] Incompatibilidade entre recurso e estratégia, com alocação de recursos fora de sincronia com a gestão do portfólio;
- [x] Integração de tecnologia insuficiente durante fusões e aquisições, levando a complexidade indevida, sistemas perdidos, conjuntos de dados fragmentados;
- [x] Complexidade excessiva em produtos, processos (com pouca ou nenhuma padronização) ou aplicativos (com vários aplicativos atendendo ao mesmo propósito);

### Arquitetura
- [x] Sistemas legados que exigem manutenção constante e não se adaptam facilmente às novas demandas representam uma dívida técnica significativa;
- [x] A desatualização de ambientes de aplicação e infraestruturas mal dimensionadas são sinais de que a arquitetura precisa de ajustes;
- [x] Software altamente personalizados;
- [x] Blocos monolíticos de código com interfaces ruins que limitam a reutilização e regras de negócios incorporadas que são difíceis de modificar;
- [x] Sistemas grandes e difíceis de modificar devido à falta de modularidade podem aumentar os custos a longo prazo;
- [x] Infraestrutura insuficiente para lidar com picos;
- [x] Abordagens insuficientes de integração de sistemas, resultando em uma proliferação de integração ponto a ponto entre aplicativos;

### Talento
- [x] Quando as equipes não têm as habilidades necessárias para lidar com as tecnologias atuais, isso cria gargalos no desenvolvimento e também aumenta a dívida;
- [x] Se as equipes estão sempre focadas em entregar soluções imediatas sem olhar para a redução da dívida técnica, isso pode resultar em mais dívidas;

### Processo
- [x] Má priorização de pendências de projetos;
- [x] A falta de uma boa gestão de prioridades pode resultar em recursos mal alocados, piorando a dívida técnica;
- [x] Gestão baixa dos processos de desenvolvimento e manutenção, com medição pouco frequente da qualidade do código;
- [x] Implantação excessivamente dependente da contribuição do desenvolvedor e testes manuais demorados;
- [x] Operações de TI instáveis,
- [x] Instrumentalização mínima,
- [x] Pontos cegos significativos,
- [x] Recuperação de desastres baixa e vários complementos que se desviam da intenção original de um sistema,
- [x] Documentação inadequada

## Possíveis Resoluções da Dívida Técnica
### Gestão Estratégica
- [x] A dívida não deve ser vista como um problema técnico isolado, mas sim como uma questão de negócios que afeta a agilidade, inovação e escalabilidade da empresa;
- [x] Avaliar a "saúde" dos aplicativos existentes e categorizá-los em comprar, manter ou vender é uma maneira prática de reduzir a complexidade técnica.
- [x] Aplicativos que não são mais rentáveis ou não têm futuro podem ser descontinuados, liberando recursos para focar nos que têm maior potencial.
- [x] Revise periodicamente os progressos, os custos envolvidos e os impactos no negócio;
### Alocação de Recursos
- [x] Reduzir a dívida técnica exige investimentos contínuos. Isso pode ser feito dedicando parte dos recursos de desenvolvimento para tratar questões de legado, melhorar a arquitetura ou capacitar o time;
- [x] Em vez de tentar resolver tudo de uma vez (big-bang), o ideal é aplicar melhorias contínuas.
- [x] Uma abordagem de incrementos pequenos e consistentes ajuda a evitar que o processo se torne ingovernável.
### Ajustes na Arquitetura
- [x] Investir em arquitetura de microserviços ou modularizar sistemas legados pode facilitar as atualizações e manutenções futuras;
- [x] Mudar de uma abordagem ponto a ponto para algo mais robusto, como APIs e serviços bem definidos, pode reduzir a complexidade e os riscos de falhas;
- [x] Investa em escalabilidade, garantindo que a infraestrutura tenha a capacidade de escalar de acordo com a demanda.

### Capacitação de Talentos
- [x] Oferecer treinamentos contínuos e contratar pessoas com habilidades específicas nas tecnologias que a empresa utiliza.
- [x] Equipes específicas para trabalhar na redução da dívida, com a tarefa de garantir que o código esteja bem estruturado e que as melhorias sejam feitas ao longo do tempo;

### Melhorias nos Processos
- [x] Manutenção Evolutiva e Corretiva devem ser tratadas com a mesma urgência que o desenvolvimento de novos recursos.
- [x] Investa em integração contínua, deploy contínuo e testes automatizados reduz a dependência de processos manuais e diminui a probabilidade de erro humano;
- [x] Um código bem documentado tem menos chances de criar dívida;
### Recuperação de Desastres
- [x] Implantar uma estratégia de backup e recuperação robusta que cubra toda a infraestrutura, garantindo que a empresa tenha planos de contingência rápidos e eficazes para quando houver falhas;
