## Gerenciar Times
Qualquer um pode usar, modificar e compartilhar livremente softwares desenvolvidos de forma institucional, para qualquer propósito com a ideia de que compartilhar código leva a um software melhor e mais confiável.

Para tal observa-se duas práticas atuais no mundo de desenvolvimento: Innersource e Boilerplate code.

- [x] InnerSource é uma prática que aplica princípios do desenvolvimento de código aberto dentro de uma organização.  Basicamente, envolve a colaboração e compartilhamento de código entre equipes e departamentos, promovendo uma cultura mais aberta e colaborativa.

| Prática    | Entenda |
| -------    | ------- |
| Colaboração|  Facilita a colaboração entre diferentes equipes, permitindo que todos contribuam para projetos de forma mais fluida, independentemente de sua função ou localização. |
| Transparência | O código e os processos são mais visíveis, o que ajuda a aumentar a transparência e a confiança dentro da organização. |
| Reutilização de Código |  Estimula a reutilização de código existente, economizando tempo e recursos ao evitar a duplicação de esforços. |
| Práticas de Desenvolvimento Ágil |  Muitas das práticas de desenvolvimento ágil, como revisões de código e testes contínuos, são frequentemente integradas ao InnerSource. |
| Cultura de Aprendizado |  Promove uma cultura de aprendizado contínuo, onde os desenvolvedores podem aprender uns com os outros e melhorar suas habilidades.|
| Ferramentas e Processos |  Utiliza ferramentas comuns de gerenciamento de código-fonte e colaboração, como GitHub ou GitLab, para facilitar o trabalho conjunto. |

- [x] Boilerplate code refere-se a trechos de código que se repetem e que frequentemente aparecem em muitos projetos ou partes do código. Esses trechos geralmente não contêm lógica específica, mas são necessários para a estrutura do programa, temdo como uma ideia a reutilização esse código para economizar tempo e evitar erros ao reescrever o mesmo código repetidamente.

O código padronizado é um texto em linguagem computacional que você pode reutilizar com pouca ou nenhuma alteração em diversos contextos diferentes.
<div class="mdx-columns2" markdown>
- [x] Códigos aparentemente repetitivos e transformá-los em padrões.
- [x] Barateamento do código, pois já foi testado e ele funciona.
- [x] Aprimoram continuamente seus códigos pois realizam testes de software e verificações de qualidade - CONTÍNUA;
- [x] Reduzem o risco de erros de codificação e melhoram a qualidade do software.
- [x] Declaração de classe, Views, APIs e etc.
- [x] Criação de um contexto para um conjunto de pares nome-valor que o Oracle Database armazena na memória.
- [x] Estude o poder da linguagem [PL/SQL](https://github.com/antlr/grammars-v3/blob/master/PLSQL) ou de [Qualquer Outra](https://github.com/antlr/grammars-v4/).
- [x] O tempo de latência do ORDS não poderá exceder a 10 ms;
</div>


## Consumerização
Os softwares ERPs, acumulam, tecnologias e funcionalidades para atender uma grandiosidade empresarial (indo contra os cenários atuais com os processos ágeis – Lean IT, SCRUM e etc.), que por muitas vezes não aplicáveis a instituição e/ou adotam tecnologias, que foram abandonadas pelo mercado ou não amigáveis ou com raros profissionais, por exemplo o FORMS, OAF, PEOPLECODE e etc.

 Esta claro com esta pesquisa, que a diferença entre software "corporativo" e "consumidor" necessita  diminuir e que os “consumidores”, usam softwares mais envolventes e intuitivos: iFOOD, UBER, LinkedIn, WhatsApp e etc., sendo óbvio, as perguntas:
 
- [x] Como diminuir este hiato entre estas camadas ou diminuir esta sensação?
- [x] Como aumentar a satisfação do cliente, sem tornar o Aplicativo corporativo apenas um repositório?
- [x] Como medir o processo se por um lado, o fornecedor do software, nos monetiza, por Aplicativo em alguns casos e em outros pelo conjunto da obra?
- [x] Como diminuir a sensação, sem aumentar o número de sistemas - FRONT END?


# Coisas que um não programador pode fazer
Comece a ouvir : Tudo em código aberto envolve outras pessoas. Você está procurando se juntar a uma equipe, e isso significa entender a comunidade e como ela funciona.
Participe de uma lista de discussão : Para muitos projetos, a lista de discussão é o principal canal de comunicação sobre o desenvolvimento do projeto. 
Siga um blog : blogs mantidos por desenvolvedores principais geralmente dão informações sobre o que está por vir em lançamentos futuros e o que é preciso para chegar lá.

Trabalhe com Tickets/Issues : O código é o coração de qualquer projeto de código aberto, mas não pense que escrever código é a única maneira de contribuir. A manutenção do código e dos sistemas que o cercam geralmente são negligenciados na pressa de criar novos recursos e corrigir bugs. A maioria dos projetos tem um sistema de tickets de problemas publicamente visível, vinculado à página inicial do site do projeto e incluído na documentação. É o principal canal de comunicação entre os usuários e os desenvolvedores. Mantê-lo atualizado é uma ótima maneira de ajudar o projeto. Você pode precisar obter permissões especiais no sistema de tickets, que a maioria dos líderes de projeto ficará feliz em lhe dar quando você disser que quer ajudar a limpar os tickets.

Diagnosticar um bug : Bugs são frequentemente mal reportados. Diagnosticar e triar um bug pode ajudar a economizar tempo dos desenvolvedores com o trabalho braçal de descobrir as especificidades do problema. 
    * Se um usuário relatou, "O software não funciona quando eu faço X", gaste algum tempo para descobrir as especificidades do que acontece nesse problema. 
    * É repetível? Você pode criar um conjunto de etapas para causar o problema repetidamente? 
    * Você pode restringir o problema, como acontecer apenas em um navegador, mas não em outro, ou em uma distribuição, mas não em outra? Mesmo que você não saiba o que causa o problema, o esforço que você coloca em restringir as circunstâncias torna mais fácil para outra pessoa consertá-lo. 
    * O que quer que você descubra, adicione ao ticket no sistema de bugs para que todos vejam.

Fechar bugs corrigidos : Frequentemente, os bugs são corrigidos na base de código, mas os tickets relatados sobre eles não são atualizados no sistema de tickets. Limpar esse lixo pode ser demorado, mas é valioso para todo o projeto.
Comece consultando o sistema de tickets para tickets mais antigos que um ano e veja se o bug ainda existe. Verifique o log de alterações de lançamento do projeto para ver se o bug foi corrigido e pode ser fechado. Se for conhecido que foi corrigido, anote o número da versão no ticket e feche-o.

Sempre que você modificar o código, certifique-se de agir como um membro responsável da comunidade e manter seu estilo de código para combinar com o resto da base de código. 
O código que você adicionar ou modificar deve se parecer com o resto. Você pode não gostar do estilo de colchetes ou do tratamento de espaços para recuo, mas é escroto enviar uma alteração de código que não corresponda aos padrões existentes. 
É o mesmo que dizer "Não gosto do seu estilo, e acho que o meu é melhor, então você deve fazer do meu jeito".

Teste um beta ou candidato a lançamento : Qualquer projeto que seja projetado para rodar em múltiplas plataformas pode ter todos os tipos de problemas de portabilidade. Quando um lançamento se aproxima e um beta ou candidato a lançamento é publicado, o líder do projeto espera que ele seja testado por muitas pessoas diferentes em muitas plataformas diferentes. Você pode ser uma dessas pessoas e ajudar a garantir que o pacote funcione na sua plataforma.

Corrigir um bug : geralmente é aqui que os colaboradores que querem começar a trabalhar no código começam. É simples: encontre um bug que pareça interessante no sistema de tickets e tente corrigi-lo no código. Documente a correção no código, se for apropriado. É uma boa ideia adicionar um teste ao conjunto de testes para testar o ponto do código que você corrigiu; alguns projetos exigem que as correções de bugs incluam testes. Mantenha notas enquanto você vasculha essa base de código desconhecida. Mesmo que você não consiga corrigir o bug, documente no ticket o que você descobriu como parte da tentativa de correção. O que você encontrar ajuda aqueles que vêm depois de você.

Escreva um teste : A maioria dos projetos tem um conjunto de testes que testa o código, mas é difícil imaginar um conjunto de testes que não pudesse ter mais testes adicionados a ele. Se você encontrar um bug, tente escrever um teste que o reproduza. Se você não puder reproduzir o bug, escreva um teste que falhe. Se você não puder escrever um teste que falhe, escreva um teste que passe. Se você não puder escrever um teste que passe, escreva um teste que falhe. Se você não puder escrever um teste que falhe, escreva um teste que passe. Se você não puder escrever um teste que passe, escreva um teste que falhe. Se você não puder escrever um teste que falhe, escreva um teste que passe. 

Adicione um comentário : Ao vasculhar o código, você pode encontrar alguns pontos que são confusos. Provavelmente, se você ficou confuso, outros também ficarão. Documente-os no código e envie um patch. Trabalhe com documentação A documentação é normalmente a parte de um projeto que recebe pouca atenção. Ela também pode sofrer por ter sido escrita do ponto de vista daqueles que estão familiarizados com o projeto, em vez dos olhos de alguém que está começando a entender. 

Trabalhe com a Comunidade: O código aberto é apenas parcialmente sobre código. A comunidade faz o código aberto funcionar. Aqui estão algumas maneiras de ajudar a construí-lo.

Responda a uma pergunta : A melhor maneira de ajudar a construir a comunidade é ajudando os outros. Responder a uma pergunta, especialmente de alguém que está apenas começando, é crucial para ajudar o projeto a crescer e prosperar. O tempo que você leva para ajudar um iniciante, mesmo que ele esteja fazendo uma pergunta em que você poderia facilmente dar um rápido "RTFM", compensa no futuro, pois consegue outro membro ativo da comunidade. Todo mundo começa em algum lugar, e os projetos precisam de um fluxo constante de pessoas para que continuem vitais.

Escreva uma postagem de blog : Se você tem um blog, escreva sobre suas experiências com o projeto que está usando. Conte sobre um problema que você enfrentou usando o software e o que você fez para resolvê-lo. Você estará ajudando de duas maneiras, tanto ajudando a manter o projeto na mente de outras pessoas ao seu redor, quanto criando um registro para qualquer outra pessoa que tenha seu problema no futuro e pesquise na web pela resposta. (Um blog de suas aventuras técnicas também é uma excelente maneira de mostrar experiência no mundo real com o software em questão na próxima vez que você for procurar um emprego usando-o.)

Melhore um site : Se você tem habilidades em web design e pode ajudar a melhorar o site, e assim a imagem pública do projeto, esse é um tempo bem gasto. Talvez o projeto pudesse usar uma reformulação gráfica, ou um logotipo para identificar o projeto. Essas podem ser habilidades que faltam na comunidade. Eu sei que adoraria se pudesse obter alguma ajuda de design gráfico nos sites dos meus projetos.

Escreva documentação técnica: Se você consegue escrever sobre como um aplicativo ou software funciona, você pode escrever documentação técnica sobre ele. Especialmente projetos de código aberto que buscam atualizar, renovar, expandir ou criar documentos técnicos para o público em geral ler. Quanto mais você escrever em inglês simples, melhor. A melhor parte é que você não precisa ser um programador para escrever documentos técnicos.

Acima de tudo, ouça o que as pessoas ao seu redor discutem. Veja se você consegue reconhecer uma necessidade urgente. Por exemplo, recentemente na lista de discussão dos desenvolvedores do Parrot, foi decidido usar o GitHub como o sistema de tickets de problemas, abandonando a antiga instalação do Trac que eles tinham. Algumas pessoas foram contra a mudança porque não havia como converter os tickets para o sistema do GitHub. Depois de um dia de discussão, eu me manifestei e disse "Que tal se eu escrevesse um conversor?" As pessoas ficaram entusiasmadas com a ideia. Eu gastei tempo escrevendo um programa de conversão para os mais de 450 tickets, então não perdemos nada do nosso histórico de tickets. Foi um grande sucesso. Eu pude contribuir, e os desenvolvedores principais permaneceram focados no negócio de trabalhar no Parrot.

Ensine e ajude os outros : A melhor maneira de aprender mais sobre um tópico é tentar ensiná-lo. O melhor professor é aquele que consegue explicar coisas complexas com exemplos simples. Então você precisa tentar ser o melhor professor para ser o melhor aprendiz e o melhor no seu mundo de programação. Ensinar os outros fará você se sentir melhor consigo mesmo e ajudará você a obter melhores habilidades e conhecimento em sua profissão. Quando você receber ajuda de alguém, não guarde para si mesmo, compartilhe com os outros. Faça do mundo um lugar melhor para se viver.

# Modelo de Desenvolvimento - Ideia

- [x] Década de 90 – Paul R. Timm - 50 Poderosas Ideias Para Voce Manter Seus Cilentes - Será que a frase não foi distorcida? Satisfazer x Submissão?
- [x] Século 21    – Roger Fisher/William Ury/Bruce Patton - Como chegar ao Sim - A negociação de acordos sem CONCESSÃO
      - [x] É preciso respeitar os direitos do cliente, mas também os princípios que regem a organização;
      - [x] Atender os anseios do cliente a qualquer custo nunca será um bom negócio;
      - [x] Política do Ganha a Ganha;
  
Para que não haja confusão:

     | Conceito | Entenda |
     | ------   | ------  |
     | Métricas | São valores numéricos que representam e descrevem o comportamento geral de um serviço ou componente medido ao longo do tempo.  |
     | Rastreamento | Usado para entender como os diferentes serviços de um aplicativo se conectam e como os recursos fluem através deles, ajudando a analisar o fluxo de      solicitações e a compreender todo o ciclo de vida de uma solicitação em um aplicativo. (Jaeger e Zipkin) |
     | Logging  | Registros imutáveis ​​de eventos discretos que aconteceram durante algum tempo em um aplicativo.  (Elasticsearch , Fluentd e Kibana)|

## Necessidade Básica
Temos que enviar produtos com mais rapidez para acompanhar as crescentes necessidades dos clientes, sobreviver à concorrência e impulsionar a redução de custo, para tal, espera-se que o time seja dividido em duas partes: 
<div class="mdx-columns2" markdown>
- [x] Uma parte deve se concentrar na configuração do processo adequado de desenvolvimento de software;
- [x] Uma parte deve se aproveitar das ferramentas e tecnologias corretas para impulsionar a produtividade.
</div>

## Pilares da Codificação/Tenha em Mente
<div class="mdx-columns2" markdown>
- [x] O melhor código é aquele que não precisa ser escrito;
- [x] Qualidade não é negociável;
- [ ] O que nasce perfeito, nasce tarde;
- [x] Só fazemos **código do zero** se for estritamente necessário, usaremos tudo que conhecemos que está pronto;
- [x] A complicação do nosso é código é proporcional a complicação da nossa feature;
- [x] Prioridade máxima é funcionar de acordo com o caso de uso;
- [x] [Eric Evans e os padrões sugeridos no DDD](https://domainlanguage.com/ddd/reference/)?
- [x] [O que Martin Fowler escreveu em  Refactoring](https://martinfowler.com/books/refactoring.html)
- [x] [Ironico a origem do termo cascata é frequentemente citado como sendo um artigo publicado em 1970 por W. W. Royce](https://agile.pub/assuntos-diversos/a-grande-mentira-do-waterfall/)
</div>

## Métricas
<div class="mdx-columns2" markdown>
- [x] [Dora Métrics](https://dora.dev/)
- [x] [Se for falar de Métricas, como Chidamber & Kemerer chegaram no seu conjunto de métricas](https://www.aivosto.com/project/help/pm-oo-ck.html)? 
- [x] [Como que a métrica de coesão foi questionada](https://www.aivosto.com/project/help/pm-oo-cohesion.html#LCOM1)?
- [x] Taxa de rotatividade (churn rate);
- [x] Duração da sessão;
- [x] DAU (Daily Active Users) e MAU (Monthly Active Users);
</div>

## Automatização
A automação também realiza a documentação de cada processo, auxiliando na padronização dos passos, sendo extremamente vantajosa para a empresa não só pela redução dos erros humanos, mas também porque o trabalho manual custa tempo e dinheiro.

![](img/DevSecOpsToolsPeriodicTable.png){width="850" height="950" style="display: block; margin: 0 auto"}

## Lean
- [x] GEMBA é "lugar real", ou seja, onde a ação da empresa acontece.
- [x] OBEYA é "lugar físico" ou virtual onde a geração de conhecimento acontece.
- [x] HEIJUNKA é um método Lean para a redução de desigualdade no processo de produção e minimização da chance de sobrecarga, ou seja, NIVELAMENTO.

      - [x] Reduzir continuamente o lead time;
      - [x] Produzir em lote cada vez menor;
      - [x] Questionar sempre e não concordar com estoque;
      - [x] Ajustar e controlar a capacidade com produção mix;
      - [x] Atribuir aos processos anteriores uma carga balanceada

- [x] ANDON Ele cria alertas visuais por meio de luzes que destacam onde é necessário agir. Corda de Andon.
- [ ] 
# Anti-padrões da Cultura Devops
## Cultura da Culpa
<div class="mdx-columns2" markdown>
- [x] Punicção pelos Erros
- [x] Omissão das Informações
- [x] Disputa entre as áreas e equipes
- [x] Medo de arriscar gera pouca inovação
</div>
## Silos
<div class="mdx-columns2" markdown>
- [x] Equipes Isoladas
- [x] Informação Centralizadas
- [x] Ferramentas e Processos Diferentes
- [x] Gestores precisam ser escalados sempre
</div>
## Implantação Manual
<div class="mdx-columns2" markdown>
- [x] Execução fora da ordem
- [x] Esquecimento
- [x] Falhas Humanas
- [x] Demora
- [x] Gargalo
</div>
## Cultura DeVOPS
<div class="mdx-columns2" markdown>
- [x] Comunica;cão Eficaz
- [x] GesTão de Pessoas
- [x] Empatia
</div>
# Termos e Exemplos
## Cultura
Construir uma cultura de responsabilidade compartilhada, com transparência e feedback mais rápido é a base de toda equipe de DevOps que deseja ter um alto desempenho.

## Foco
* Usar a exibição de atividade para ver as alterações em um repositório. Repositório de código DEVE SER a rede social do Developer;
* Um bom programador Sênior,  entende a intensão.
* Um bom programador Pleno, entende de design;
* Um bom programador 
* Dizem: Que apenas 5% 5% dos artefatos de um repositório de um software, recebem 90% das alterações.
* Reconheça apenas 5% devemos nos preocupar de forma MASSIVA.

## Mudança de Percepção

- [x] Qual a intenção? 
- [x] Qual o design?
- [x] Qual o código?

## Desorganização <> Bagunça
- [x] Qual é a diferença entre desorganização e bagunça?
      - [x] A desorganização é quando você não tem um lugar define para as coisas. 
      - [x] A bagunça é quando você tem o lugar mas não coloca. 

As coisas lá o nível de bagunça estão  associados com a distância entre o lugar onde a coisa deveria estar e o lugar onde ele está de fato.

O arquiteto de muitas formas ajuda o time a definir uma organização ou seja qual é o lugar certo de cada coisa e e depois de definir o lugar certo de cada coisa tentar ajudar o time a colocar as coisas.
