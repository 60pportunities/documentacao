
[BitKeeper, Linux e disputas de licenciamento: como Linus escreveu o Git em 14 dias](https://graphite.dev/blog/bitkeeper-linux-story-of-git-creation)
Este material é cópia traduzida do material acima.
Em 3 de abril de 2005, Linus cortou um release candidate do kernel Linux, 2.6.12-rc2. O release candidate em si não era muito interessante — nas palavras de Linus "A saída do diffstat conta a história: são muitas mudanças muito pequenas, ou seja, toneladas de pequenas limpezas e correções de bugs." — mas se tornaria significativo pelo que marcou: o último release não-Git do kernel Linux.
## BitKeeper
Durante os primeiros dez anos de desenvolvimento, antes do uso do BitKeeper, a ferramenta de controle de versão do Linux Kernel escolhida era o próprio Linus. O sistema funcionava assim: os desenvolvedores enviavam tarballs e patches para um punhado de tenentes de confiança de Linus. Após a verificação, os patches que passavam na revisão eram enviados para Linus. Finalmente, o próprio Linus os incorporava manualmente em sua própria árvore de código-fonte e, então, cortava o lançamento. 

Claro, o Linus-como-um-serviço-de-controle-de-versão estava longe de ser um produto perfeito. Em 1998, quando Larry McVoy [esboçou pela primeira vez a ideia por trás do BitKeeper](https://lkml.org/lkml/1998/9/30/122) na Linux Kernel Mailing List, ele escreveu "Está claro que nosso líder destemido [Linus] está, no momento, um pouco sobrecarregado, então os patches podem estar se perdendo "

Embora esse fluxo de trabalho manual pareça bárbaro para nós hoje, na época, Linus via esse fluxo de trabalho como superior às alternativas — ou seja, CVS. Muito mais tarde, [quando Linus deu uma palestra no Google em 2007 sobre o Git](https://www.youtube.com/watch?v=4XpnKHJAok8) , ele mencionou um de seus princípios básicos de design: "WWCVSND" ou "O que o CVS não faria?" Claro que esse ódio naturalmente se estendeu ao SVN também; na mesma palestra, ele continuou dizendo com um sorriso: "Se houver usuários do Subversion na plateia, você pode querer sair. Meu ódio pelo CVS significa que vejo o Subversion como o projeto mais inútil já iniciado. O slogan inteiro do Subversion por um tempo foi CVS feito corretamente ou algo assim. E se você começar com esse slogan, não há para onde ir. É como se não houvesse maneira de fazer o CVS corretamente."

O cerne da crítica de Linus contra o CVS era sua natureza centralizada. Dadas as centenas de desenvolvedores Linux por aí, Linus sentiu que era essencial que cada um deles tivesse sua própria cópia discreta do repositório em que pudessem desenvolver suas próprias ramificações. Isso facilitou o trabalho offline e ajudou com a política interna; cada desenvolvedor era livre para fazer commit do que quisesse em seu próprio repositório e, então, teria a oportunidade de convencer a comunidade de que suas alterações eram valiosas. Isso impediu que um único conjunto de colaboradores com acesso de commit controlasse o único repositório.

O BitKeeper contrastava fortemente com o CVS. No pitch de 1998 mencionado anteriormente para o BitKeeper, Larry McVoy esboçou um sistema que, embora lembrasse como pensamos sobre controle de origem hoje, era radicalmente diferente para a época. McVoy escreveu:

```
O mecanismo que permite que tudo isso aconteça é uma fonte distribuída sistema de gestão.

As principais características do sistema são:
- todos recebem um repositório (contraste com o repositório único modelo de CVS)
- as alterações podem ser enviadas por correio como "super-patches", também conhecidos como conjuntos de alterações. Um conjunto de alterações é apenas um arquivo de patch que contém
* Todas as alterações divididas em uma revisão de cada vez
* Um identificador que mostra onde o patch deve ser aplicado na árvore (os patches falharão se você não estiver atualizado como o remetente do patch)
* Todo o histórico de revisão das alterações
* Metadados como alterações de nome de caminho, tags simbólicas (como alpha2 ou linux-2.1.133), etc.
- um novo conceito chamado linha de desenvolvimento (LOD).
É logicamente um branch, mas não precisa estar em um branch.
Os patches podem (e irão) ser seu próprio LOD. Você pode executar operações em um LOD como "aplicar isto ao tronco".
```
Mais tarde, Linus daria grande crédito ao BitKeeper por mudar sua visão e inspirar o Git: “O BitKeeper não foi apenas o primeiro sistema de controle de origem que eu senti que valia a pena usar, mas também foi o sistema de controle de origem que me ensinou por que há um ponto neles e como você realmente pode fazer as coisas. Então o Git, de muitas maneiras, embora de um ângulo técnico seja muito, muito diferente do BitKeeper, que era outro objetivo de design porque eu queria deixar claro que não era um clone do BitKeeper, muitos dos fluxos que usamos com o Git vêm diretamente dos fluxos que aprendemos com o BitKeeper.” (A frase aqui é um pouco estranha porque vem da palestra ao vivo do Google mencionada anteriormente.)


Licenciamento
Embora o próprio Linus tivesse o BitKeeper em alta conta, sua decisão de usar a ferramenta internamente para Linux em 2002 levou a grandes discussões na Lista de Discussão do Kernel Linux.

Por que as chamas? Quando Larry McVoy construiu o BitKeeper, ele o fez como parte de um empreendimento comercial de código fechado (BitMover). Embora as pessoas pudessem usar a versão comunitária gratuita do BitKeeper, isso veio com uma licença restritiva.

Da entrada da Wikipédia do BitKeeper : “A licença para a versão 'comunitária' do BitKeeper permitiu que desenvolvedores usassem a ferramenta sem custo para projetos de software livre ou de código aberto, desde que esses desenvolvedores não participassem do desenvolvimento de uma ferramenta concorrente (como Concurrent Versions System, GNU arch, Subversion ou ClearCase) durante o uso do BitKeeper mais um ano. Essa restrição se aplicava independentemente de a ferramenta concorrente ser gratuita ou proprietária.”

Até mesmo Richard Stallman, o último dos verdadeiros hackers e evangelista do software livre, entrou na conversa : "O espírito da licença Bitkeeper é o espírito da mão do chicote. É o espírito que diz: 'Você não tem o direito de usar o Bitkeeper, apenas privilégios temporários que podemos revogar. Seja grato por permitirmos que você use o Bitkeeper. Seja grato e não faça nada que não gostemos, ou podemos revogar esses privilégios.' ... A indignação com esse espírito é a razão do movimento do software livre."

Mas Linus tinha uma visão muito mais pragmática; da perspectiva dele, ele só queria a melhor ferramenta para o trabalho, independentemente de onde viesse. Em 2007, ele diria : "E eu estava feliz com [o acordo do BitKeeper, apesar da licença] porque, francamente, no que me diz respeito, eu faço código aberto porque acho que é a única maneira certa de fazer software. Mas, ao mesmo tempo, usarei a melhor ferramenta para o trabalho e, francamente, o BitKeeper era isso."

Mas o casamento difícil não durou.

Em 2005, um dos desenvolvedores do kernel Linux, Andrew Tridgell, forçou a questão quando violou a licença e fez engenharia reversa no BitKeeper para que ele "pudesse retirar coisas das árvores BK sem concordar com a licença BK". Da perspectiva de Tridgell, isso era completamente ético; "Eu não usei o BitKeeper para escrever esta ferramenta e, portanto, nunca estive sujeito à licença BitKeeper".

Larry McVoy discordou. E inicialmente, Linus estava do seu lado :

“Larry está perfeitamente bem com alguém escrevendo uma substituição gratuita. ... O que Larry não está bem é com alguém escrevendo uma substituição gratuita apenas fazendo engenharia reversa do que ele fez. Larry tem um ponto de vista moral muito claro: 'Você pode competir comigo, mas não pode fazer isso pegando carona na minha bolsa. Resolva os problemas sozinho e compita honestamente . Não compita olhando para a minha solução.' E é nisso que a licença BK se resume. Ela diz: 'saia da minha bolsa, seu aproveitador.' E eu [Linus] não posso realmente argumentar contra isso.”

De sua parte, Linus tentou por três meses bancar o pacificador. (E, se alguma coisa, seus comentários futuros de fato pareciam sugerir mais frustração com Andrew do que com Larry.) Mas, no final das contas, não havia como reconciliar essas diferenças.

Em 6 de abril de 2005, Linus enviou um e-mail para a Linux Kernel Mailing List, com o assunto “Kernel SCM saga…” , dando início à cadeia de eventos que mudaria uma indústria:

“Ok, como várias pessoas já sabem, estamos tentando resolver um conflito sobre o uso do BK nos últimos dois meses (e parece mais tempo ;). Isso não está funcionando e, como resultado, a equipe do kernel está procurando alternativas.”

Ele brincou sobre a história — “Não é como se minha escolha de BK tivesse sido totalmente livre de conflitos ('Não, sério? Conte! Ah, você quer dizer os gigabytes e mais gigabytes de flames que tínhamos?')” — e enfatizou sua contínua gratidão à equipe do BitKeeper.

Apesar do resultado, Linus olhou para trás com claro carinho:

```
Na verdade, um impacto que o BK teve foi nos fazer (e a mim em particular) mudar fundamentalmente a maneira como fazemos as coisas. Isso varia do rastreamento de conjunto de alterações de granulação fina até como acabei confiando a submantenedores coisas muito maiores, e não tendo mais que trabalhar em uma base de patch por patch. Então os três anos com o BK definitivamente não foram desperdiçados: estou convencido de que ele nos fez fazer as coisas de maneiras melhores, e uma das coisas que estou analisando é garantir que essas coisas continuem funcionando.

Então, eu só queria dizer que estou pessoalmente muito feliz com o BK [BitKeeper], e com o Larry. Não deu certo, mas com certeza fez uma grande diferença no desenvolvimento do kernel. E resolveremos o problema temporário de ter que descobrir um conjunto de ferramentas que nos permita continuar a fazer as coisas que o BK nos permitiu fazer.
```

## Linus sai de férias
Na realidade, enquanto ele postava a notícia pública do rompimento na lista de discussão em 6 de abril, Linus já estava trabalhando duro. Três dias antes, logo após o lançamento do 2.6.12-rc2, ele havia interrompido seu trabalho no kernel do Linux e mudado seu foco total para encontrar uma alternativa ao BitKeeper.

O objetivo de Linus era ter "algo utilizável em duas semanas". Como parte do e-mail de 6 de abril, ele anunciou "Vou ficar efetivamente off-line por uma semana (pense nisso como um evento normal "Linus saiu de férias") e estou apenas pedindo que as pessoas que continuam a manter as árvores BK pelo menos tentem também se certificar de que podem me enviar o resultado como patches (individuais), já que eventualmente terei que mesclar de outra forma".

Os e-mails de Linus transmitiam uma clara sensação de urgência; afinal, o próximo lançamento do kernel Linux estava bloqueado até que ele pudesse descobrir isso.

Em um e-mail em 7 de abril, ele até observou que, no pior cenário, o kernel do Linux pode até mesmo migrar para um sistema de controle de versão centralizado : "NOTA! Eu detesto o modelo SCM centralizado, mas se a situação ficar crítica e não conseguirmos fazer uma mesclagem paralela razoável em um curto espaço de tempo (por exemplo, um ou dois meses), usarei algo como o SVN em um site confiável com apenas alguns colaboradores e, pelo menos, tentarei distribuir a mesclagem entre algumas pessoas, em vez de me fazer ser o acelerador."

Embora o resultado seja claro para nós em retrospecto, na época, os e-mails mostram que escrever um sistema de controle de versão personalizado estava longe de ser algo garantido. Dos 205 e-mails na cadeia que abrangeu do primeiro e-mail em 6 de abril ao último em 12 de abril, houve muita discussão sobre outras alternativas de código aberto — Monotone, GNU arch, Bazaar-ng, Darcs — com alguns dos criadores dessas ferramentas entrando para defender seu projeto .

(Até os desenvolvedores do Subversion concordaram com sua postagem "Por favor, pare de incomodar Linus Torvalds sobre o Subversion". )

A principal consideração, especialmente de Linus, parecia ser o desempenho geral de cada uma dessas ferramentas. No geral, de todos os 205 e-mails, houve muita conversa sobre desempenho e eficiência das várias ferramentas .

A maior questão na mente de todos parecia ser: alguma das ferramentas existentes funcionaria para um projeto do tamanho do kernel do Linux?

Em 8 de abril, dois dias após seu e-mail inicial e cinco dias após começar a trabalhar seriamente, Linus compartilhou uma atualização: “Enquanto isso (e porque o monotone realmente é muito lento), aqui vai um desafio rápido para você e qualquer hacker maluco por aí: se você quiser brincar com algo realmente desagradável (mas também muito, muito rápido), dê uma olhada em kernel.org :/pub/linux/kernel/people/torvalds/.”

O Git nasceu.


## As primeiras linhas do Git
Quando ouvimos falar que Linus escreveu o Git original em duas semanas, vale a pena acrescentar uma grande ressalva: quando pensamos no Git hoje, pensamos nos comandos voltados para o usuário e no fluxo de trabalho geral, mas, na época, os objetivos — e a missão — eram muito diferentes e muito mais limitados em escopo.

Enquanto diferentes pessoas debatiam os méritos de várias ferramentas e abordagens na lista de e-mail, uma pessoa escreveu , descrevendo aproximadamente o que era necessário: “Está tudo bem ser um pouco lento, desde que não seja pateticamente lento. O propósito da solução provisória é apenas colocar o processo de fluxo de patch de volta online.”

O Git original de Linus era muito mais um sistema de arquivos endereçável por conteúdo do que um sistema de gerenciamento de controle de fonte completo. Aqui está sua explicação de outro e-mail:

```
(*) Eu chamo isso de "commit", mas é algo muito mais simples. É realmente apenas um "Agora tenho <estado deste diretório>, cheguei aqui de <coleção de estados de diretório anteriores> e o motivo foi <motivo>".

Aliás, esse é o tipo de design. "git" realmente não se importa com coisas como mesclagens. Você pode usar qualquer SCM para fazer uma mesclagem. O que "git" faz é rastrear o estado do diretório (e como você chegou a esse estado), e nada mais. Ele não mescla, ele realmente não faz muita coisa .
```

Então, quando você "puxa" ou "empurra" um arquivo Git, você obtém a "união" de todos os estados de diretório no destino. A coisa HEAD é um ponteiro para o "mar de estados de diretório", mas você realmente tem que usar outra coisa para mesclar dois estados de diretório.

Quando houve discussão sobre um fluxo de trabalho de seleção seletiva e movimentação de confirmações no tópico de e-mail, Linus extrapolou isso do cliente que ele estava construindo .

No geral, Linus comentaria "'Git' é realmente trivial, escrito em quatro dias. A maior parte disso não foi realmente gasto codificando, mas pensando sobre as estruturas de dados."

É um sentimento que ele mais tarde ecoaria repetidas vezes e às vezes é tirado do contexto, mas soa verdadeiro — a escolha da estrutura de dados na época era a parte nova do código que Linus havia escrito. Depois que Linus compartilhou seus primeiros commits, não houve discussão sobre fluxo de trabalho (o que a maioria vem à mente quando se pensa no Git hoje). Em vez disso, a maioria das discussões se concentrou na arquitetura que agora tomamos como certa: a interface direta do Git com o sistema de arquivos e sua abordagem baseada em hash para dizer quais arquivos foram alterados (e garantir a integridade dos dados).

Um contingente minoritário defendeu o uso de SQL para armazenar as mudanças. No estilo clássico de Linus, aqui vai uma troca sobre o último :

```
> Por que não usar o SQL como backend em vez da árvore de diretórios?

Porque é uma droga?

Eu posso inventar milhões de maneiras de desacelerar as coisas sozinho. Por favor, invente maneiras de acelerar as coisas em vez disso.

Lino
```

Mas também houve alguns que viram a visão e estavam ansiosos para começar a trabalhar em Git. No mesmo dia em que Linus pediu às pessoas para verificar as mudanças em seu diretório, algumas pessoas enviaram scripts que construíram funcionalidades adicionais sobre sua fundação.

Duas semanas depois de ter começado, em 17 de abril de 2005, Linus enviou um e-mail para a lista de e-mails: “Primeira fusão real do kernel Git!”

## Vislumbres do futuro
A parte mais satisfatória de ler a cadeia de e-mails inicial, quase vinte anos depois de todos esses eventos terem ocorrido, é ver as dicas do futuro, desconhecidas pelos autores na época.

Ao avaliar uma das alternativas de controle de origem propostas, “monótono”, um usuário escreveu:

```
Uma coisa um pouco irritante é que o monotone não parece ter uma interface web. Eu costumava usar o bk muito para rastrear bugs, porque era muito rápido ter uma janela do navegador web aberta e clicar nas revisões de um arquivo, ler comentários de check-in, etc. Alguém sabe se um está sendo trabalhado?
```

Na época, as UIs da web para controle de origem e revisão de código estavam apenas se tornando populares; no Google, Guido van Rossum estava construindo sua primeira peça dedicada de ferramenta de revisão de código na web no Mondrian . E, dois anos depois desse tópico de e-mail, o GitHub seria fundado.

Há também uma ironia em toda essa discussão sobre desempenho na cadeia de e-mails.

Uma breve discussão paralela expressando preocupação sobre como o Git poderia funcionar se apoiado por um sistema de arquivos baseado em rede foi invertida nos dias atuais; para gigantes como Google (FUSE) e Meta (EdenFS), esses sistemas de arquivos baseados em rede e com controle de origem são uma parte crítica de como eles continuam a dimensionar o controle de origem e as compilações em seus enormes monorepos.

E a principal preocupação na época que inspirou Linus a escrever o Git em primeiro lugar — que nenhuma das alternativas de controle de revisão existentes teria desempenho suficiente para suportar o grande histórico e a taxa de transferência de confirmações do repositório do kernel Linux?

Isso se repetiria alguns anos depois , quando o Meta migrou seu repositório principal do Git, exatamente pelo mesmo motivo .

É claro que, na época, tudo isso era desconhecido para as várias pessoas que participaram da cadeia de e-mails original “Kernel SCM saga…”.

O Git foi criado como uma ferramenta para desbloquear futuros lançamentos do kernel Linux — não foi concebido como uma reinvenção global de todo o gerenciamento de código-fonte; os comentários de Linus destacam que ele viu explicitamente o gerenciamento de código-fonte como o domínio de outras ferramentas que então interagiriam com o Git.

Quando pensamos em história, frequentemente a romantizamos como tendo nascido de um golpe repentino de inspiração. Mas a criação do Git mostra a realidade muito mais dura da invenção: um desacordo lentamente crescente sobre uma licença; a necessidade de uma solução de backup fragmentada para desbloquear o trabalho; e então polimento e iteração contínuos ao longo de anos e anos, liderados não pelo inventor, mas sim por uma comunidade.

## Epílogo
Por fim, a BitMover tornou o BitKeeper de código aberto. Amarrando um laço em toda a situação, um comentarista do HN (Bryan Cantrill, agora CTO da Oxide) deixou um comentário fantástico quando a BitMover fez o anúncio em 2016:

“A grande ironia é que Larry foi um dos primeiros defensores do código aberto do sistema operacional na Sun[1] — e acreditava que, quando a Sun finalmente descobriu coletivamente e fez acontecer (em 2005), já era uma década ou mais tarde.[2] Então, por um lado, você pode ver a história do BitKeeper com relação ao código aberto como quase grega em seu escopo trágico: cada razão que Larry descreveu para "sourceware"[3] para a Sun se aplicava tanto ao BK quanto ao SunOS — com até mesmo o mesmo tecnólogo (Torvalds) liderando a alternativa de código aberto! E você pode dizer ao BK e a Larry agora que é "tarde demais", assim como Larry disse à Sun em 2005, mas também acho que isso representa uma dicotomia forçada de "vencedores" e "perdedores". Ao contrário, eu gostaria de acreditar que a inovação contínua nas comunidades illumos (SmartOS, OmniOS, etc.) prova que nunca é tarde demais para software de código aberto -- que comunidades de código aberto (como cidades) podem ser pequenas, mas vibrantes, desempenhando um papel crítico para seus constituintes. Em um universo alternativo, poderíamos estar executando o BK no SunOS em vez do Git no Linux? Claro -- mas ser capaz de executar um BK de código aberto em um illumos de código aberto também é muito bom; o futuro de dois sistemas inovadores foi garantido, mesmo que tenha demorado um pouco mais do que todos gostariam.”

Uma resposta foi postada por outro usuário do HN, "luckydude" — o próprio Larry McVoy.

"Sim, essa ironia não passou despercebida para mim. Mas em ambos os casos, as empresas agiram em interesse próprio. Nenhuma delas teve coragem de abandonar seu fluxo de receita existente. É difícil dizer o que teria acontecido.

Foi uma jornada interessante e, no mínimo, BK foi a inspiração para Git e Hg, o que é uma contribuição para o campo."

