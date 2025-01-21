## Compreendendo a escala
Um monólito coloca todo o seu código em uma unidade implantável. 

Isso traz vantagens significativas: ciclos de desenvolvimento mais rápidos, depuração mais simples e implantações diretas. Mas, à medida que seu sistema cresce, você enfrentará desafios de escala.

### Escala vertical
Escala vertical significa dar ao seu aplicativo mais recursos em uma única máquina. É a estratégia de escala mais simples e, muitas vezes, o primeiro passo mais eficaz. Antes de mergulhar em sistemas distribuídos complexos, considere se atualizar sua infraestrutura existente pode resolver seus problemas de desempenho.

Saber quando ir além do escalonamento vertical é crucial. Fique atento a estes indicadores:

- [x] Os custos estão crescendo mais rápido do que sua base de usuários;
- [x] Você precisa de melhor redundância e tolerância a falhas;
- [x] O tempo de inatividade da sua implantação está afetando as operações comerciais;
- [x] O maior tamanho de instância disponível está se aproximando de 70% de utilização;

### Escala horizontal
O dimensionamento horizontal executa várias instâncias do seu aplicativo por trás de um balanceador de carga. É o próximo passo quando o dimensionamento vertical atinge seus limites. Ele oferece tolerância a falhas aprimorada e recursos de dimensionamento quase linear.

A escala horizontal oferece vários benefícios importantes:

- [x] Melhor tolerância a falhas por meio de redundância;
- [x] Capacidade de lidar com mais usuários simultâneos;
- [x] Implantações contínuas com tempo de inatividade zero;
- [x] Escalonamento econômico (reduza a escala quando o tráfego estiver baixo);

### Escala de banco de dados

#### Ler réplicas
Réplicas de leitura são frequentemente seu primeiro passo no dimensionamento do banco de dados, mas vêm com compensações significativas. Réplicas de leitura mantêm uma cópia do seu banco de dados primário que atende tráfego somente leitura. Quando você executa uma consulta em uma réplica, você não está competindo com gravações no seu banco de dados primário.

Ao implementar réplicas de leitura, considere:

O atraso na replicação afeta a atualização dos dados
O volume de gravação afeta a velocidade de replicação
A localização geográfica afeta a latência
Cada réplica aumenta seus custos

#### Visualizações materializadas
Uma visualização materializada é um conjunto de dados pré-computado armazenado como uma tabela. Diferentemente das visualizações regulares que computam seus resultados em cada consulta, as visualizações materializadas armazenam seus resultados. Isso as torna muito mais rápidas de consultar, mas introduz um novo desafio: mantê-las atualizadas.

As visualizações materializadas se destacam em:

Consultas analíticas complexas
Dados que são atualizados de acordo com uma programação
Agregações e resumos
Dados desnormalizados para visualizações específicas


### Armazenamento em cache
O cache é uma das maneiras mais eficazes de melhorar o desempenho do seu sistema. Uma estratégia de cache bem implementada pode reduzir drasticamente a carga do banco de dados e melhorar os tempos de resposta ao armazenar dados acessados ​​com frequência na memória.

O cache moderno acontece em vários níveis. O cache do navegador reduz solicitações de rede desnecessárias. O cache de CDN aproxima seu conteúdo dos usuários. O cache em nível de aplicativo com ferramentas como Redis armazena dados acessados ​​com frequência na memória. O cache de consulta de banco de dados reduz cálculos caros.

### Filas de mensagens
As filas de mensagens são uma ferramenta poderosa para dimensionar seu monólito. Elas permitem que você adie operações demoradas e distribua o trabalho entre vários processadores. Isso mantém sua API responsiva enquanto lida com tarefas pesadas em segundo plano.

As filas de mensagens transformam o comportamento do seu sistema sob carga. Em vez de processar tudo de forma síncrona, você pode enfileirar o trabalho para mais tarde. Esse padrão funciona especialmente bem para operações como:

Processando arquivos enviados
Envio de e-mails e notificações
Gerando relatórios
Atualizando índices de pesquisa
Executando operações em lote


