![](../img/git_000.png)
## Version Control System (SCCS, RCS, CVS, VCS e DVCS)
Segundo Bolinger e Bronson (1995), o primeiro sistema de controle de versões foi desenvolvido em 1972, no laboratório Bell Labs, por Marc. J Rochkind e se chamava Source Code Control System (SCCS). 

Apesar de ser considerado obsoleto, ele foi o principal sistema de controle de versão até o surgimento do RCS (Revision Control System) e uma de suas principais contribuições foi uma técnica de armazenamento chamada interleaved deltas, considerada por vários desenvolvedores de SCVs como a chave para o surgimento de técnicas de junção.

O RCS foi desenvolvido em 1982 por Walter F. Tichy, utilizando técnicas mais avançadas do que o SCCS e ainda é mantido pelo GNU Project. Segundo Spain (2001), o CVS (Concurrent Versions System) foi desenvolvido com base no RCS, mas com a possibilidade de gerenciar projetos inteiros e não só um arquivo individualmente, como no RCS. Seu projeto foi iniciado em 1986 por Dick Grune e tinha o nome de CMT. 

O atual CVS, que se tornou muito popular, teve início com Brian Berliner em 1989. O Subversion, desenvolvido, pela empresa CollabNet, foi desenvolvido com a proposta de melhorar as funcionalidades do CVS e também obteve uma grande aceitação no mercado (SUSSMAN, FITZPATRICK e PILATO, 2009).

Paralelamente ao desenvolvimento e surgimento de novas ferramentas de controle de versão, que trabalhavam de forma centralizada, a SUN começou a desenvolver o TeamWare, para controlar projetos internos da empresa. Ele trabalhava de forma distribuída e posteriormente passou a não ser mais utilizado, devido à comunidade de desenvolvedores da SUN ter optado por softwares que trabalhavam com o mesmo conceito de distribuição, mas com funcionalidades mais modernas, como o Mercurial. 

Dos sistemas de controle de versão que trabalham de forma distribuída, dois dos que mais ganharam adeptos e tiveram maior aceitação, foram o Mercurial, criado por Matt Mackall e o Git, criado por Linus Torvalds, o também criador do sistema operacional Linux.

Historicamente, o Git era fornecido como um conjunto de muitos aplicativos simples, distintos e autonomos comandos desenvolvidos de acordo com a filosofia Unix toolkitb: build ferramentas pequenas e interoperaveis. Cada comando ostentava um nome hifenizado, como como git-commit e git-log.

No entanto, as instalacoes modernas do Git nao suportam os comandos hifenizados e, em vez disso, usam um unico git com um subcomando.

### Que acrônimo é este?
Um Sistema de Controle de Versão (Version Control System - VCS) é uma metodologia ou ferramenta que ajuda a rastrear alterações dos arquivos. 

Um Sistema de Controle de Versão Distribuído (ou Distributed Version Control Systems - DVCSs) não é diferente do Sistema de Controle de Versão nesse sentido. 

No controle de origem centralizado, há um servidor e um cliente. O servidor é o repositório principal que contém todas as versões do código. Para trabalhar em qualquer projeto, primeiro o usuário ou cliente precisa obter o código do repositório mestre ou servidor.  Assim, depois de obter a versão mais recente do código, você começa a fazer suas próprias alterações no código e, depois disso, simplesmente precisa enviar essas alterações diretamente para o repositório principal.

Com isso, haverá apenas um repositório e que conterá todo o histórico ou versão do código e diferentes ramos do código. Portanto, o fluxo de trabalho básico envolve o controle centralizado de origem, obtendo a versão mais recente do código de um repositório central que conterá o código de outras pessoas também, fazendo suas próprias alterações no código e, em seguida, consolidando ou mesclando essas alterações no repositório central.

No controle de versão distribuída, a maior parte do mecanismo ou modelo se aplica da mesma forma que o centralizado.

### Qual é a diferença?
A grande diferença é que em vez de um único repositório que é o servidor, aqui cada desenvolvedor ou cliente terá seu próprio servidor e eles terão uma cópia de todo o histórico ou versão do código e todos os seus ramos em seu servidor ou máquina local.

Basicamente, cada cliente ou usuário pode trabalhar localmente e desconectado, o que é mais conveniente do que o controle de origem centralizado e é por isso que é chamado de distribuído.

Ah, tá então:

  Você não precisa depender do servidor central, você pode clonar todo o histórico ou copiar o código para o seu disco rígido. Então, você confirma todas as alterações em seu próprio servidor ou repositório e, em seguida, o "conjunto de alterações" irá mesclar para o repositório mestre.

![](../img/git_004.png)

| Controle de Versão | Vantagens | Desvantagens |
| ---- | ---- | ---- |
| CVS (Centralizado) | Considerado uma tecnologia madura | Mover ou renomear arquivos não inclui uma atualização de versão; |
| SVN (Centralizado) | Operações atômicas e de banchs | Ampla variedade de plug-ins para IDEs; | Ainda contém erros relacionados à renomeação de arquivos e diretórios; Velocidade mais lenta. |
| Git (Distribuído) | Velocidade de operação; Árvore de histórico completo disponível off-line; Modelo distribuído.| Não é ideal para desenvolvedores únicos e curva de aprendizado para aqueles usados no SVN. |
| Mercurial (hg) (Distribuído) | Velocidade de operação; Árvore de histórico completo disponível off-line; Modelo distribuído.| |
| Fóssil (Distribuído) | Rastreamento de bugs integrado, Wiki, Robusto e confiável | |

O Subversion, Git e o Mercurial possuem dezenas de comandos, porem nem todos são usado:s com a mesma frequência. Os que normalmente são utilizados, são: Os comandos selecionados são: add, backout, blame, branch, cat, checkout, clone, commit, copy, diff, log, merge, mv, pull, push, rebase, reset, revert, rm, show, status, update e tag.

### Como auxilia o desenvolvedor?
Os sistemas de controle de versões são responsáveis pela identificação de itens de configuração e devem permitir que eles evoluam de forma distribuída, concorrente e disciplinada.

O Controle de versão apoia o desenvolvimento de diversas maneiras:

- [x] **Registro do Histórico**: Registra toda a evolução do projeto, cada alteração sobre cada arquivo. (Features, Bugs, Hotfix ou Support);
- [x] **Colaboração**: Possibilita que vários desenvolvedores trabalhem em paralelo sobre os mesmos arquivos sem que um sobrescreva o código de outro.
- [x] **Ramificação de projeto**: a maioria das implementações possibilita a divisão do projeto em várias linhas de desenvolvimento, que podem ser trabalhadas paralelamente, sem que uma interfira na outra.
- [x] **Marcação e resgate de versões estáveis**: a maioria dos sistemas permite marcar onde é que o documento estava com uma versão estável, podendo ser facilmente resgatado no futuro.

| Espaço de Trabalho | Ambiente de Desenvolvimento de Software | | | | |
| ---- | ---- | ---- | ---- | ---- | ---- |
| Processos | Identificação | Controle | Contabilização | Avaliação |Liberação |
| Sistemas  | Controle de Modificações | | | | |
|           | Controle de Versões | | | | | |
|           | Gerenciamento de Contrução | | | | |

A perspectiva de desenvolvimento é dividida em três diferentes sistemas:

- [x] Sistema de controle de versões, que deve permitir a identificação dos Itens de Configuração e a evolução dos mesmos, de forma distribuída, concorrente e disciplinada. Ele é o responsável por cuidar que as diversas solicitações de modificação possam ser tratadas em paralelo, sem corromper o sistema de GCS;
- [x] Sistema de controle de modificações, que é responsável pelo controle da configuração, armazenando as informações das solicitações de modificação e relatando essas informações aos outros participantes;
- [x] Sistema de gerenciamento de construção, que é responsável por automatizar o processo de transformação dos artefatos de software em um arquivo executável e estruturar as linhas bases selecionadas para a liberação.

### Andam dizendo `por aí`
[BitKeeper, Linux e disputas de licenciamento: como Linus escreveu o Git em 14 dias](https://graphite.dev/blog/bitkeeper-linux-story-of-git-creation)
<p align="justify">Durante os primeiros dez anos de desenvolvimento, antes do uso do BitKeeper, a ferramenta de controle de versão do Linux Kernel escolhida era o próprio Linus.</p>

<p align="justify">O sistema funcionava assim: os desenvolvedores enviavam tarballs e patches para um punhado de tenentes de confiança de Linus. Após a verificação, os patches que passavam na revisão eram enviados para Linus. Finalmente, o próprio Linus os incorporava manualmente em sua própria árvore de código-fonte e, então, cortava o lançamento.</p>

Claro, o Linus-como-um-serviço-de-controle-de-versão estava longe de ser um produto perfeito. Em 1998, quando Larry McVoy [esboçou pela primeira vez a ideia por trás do BitKeeper](https://lkml.org/lkml/1998/9/30/122) na Linux Kernel Mailing List, ele escreveu "Está claro que nosso líder destemido [Linus] está, no momento, um pouco sobrecarregado, então os patches podem estar se perdendo".

Embora esse fluxo de trabalho manual pareça estúpido, para nós hoje, na época, Linus via esse fluxo de trabalho como superior às alternativas — ou seja, CVS. Muito mais tarde, [quando Linus deu uma palestra no Google em 2007 sobre o Git](https://www.youtube.com/watch?v=4XpnKHJAok8) , ele mencionou um de seus princípios básicos de design: "WWCVSND" ou "O que o CVS não faria?" Claro que esse ódio naturalmente se estendeu ao SVN também; na mesma palestra, ele continuou dizendo com um sorriso: 

- [x] Se houver usuários do Subversion na plateia, você pode querer sair. Meu ódio pelo CVS significa que vejo o Subversion como o projeto mais inútil já iniciado. O slogan inteiro do Subversion por um tempo foi CVS feito corretamente ou algo assim. E se você começar com esse slogan, não há para onde ir. É como se não houvesse maneira de fazer o CVS corretamente.

<p align="justify">O cerne da crítica de Linus contra o CVS era sua natureza centralizada. Dadas as centenas de desenvolvedores Linux por aí, Linus sentiu que era essencial que cada um deles tivesse sua própria cópia discreta do repositório em que pudessem desenvolver suas próprias ramificações.</p>

<p align="justify">Isso facilitou o trabalho offline e ajudou com a política interna; cada desenvolvedor era livre para fazer commit do que quisesse em seu próprio repositório e, então, teria a oportunidade de convencer a comunidade de que suas alterações eram valiosas. Isso impediu que um único conjunto de colaboradores com acesso de commit controlasse o único repositório.</p>

<p align="justify">O BitKeeper contrastava fortemente com o CVS. No pitch de 1998 mencionado anteriormente para o BitKeeper, Larry McVoy esboçou um sistema que, embora lembrasse como pensamos sobre controle de versão hoje, era radicalmente diferente para a época. McVoy escreveu:</p>


O mecanismo que permite que tudo isso aconteça é uma fonte distribuída sistema de gestão.

As principais características do sistema são:
- Todos recebem um repositório (contraste com o repositório único modelo de CVS);
- As alterações podem ser enviadas por correio como "super-patches", também conhecidos como conjuntos de alterações. Um conjunto de alterações é apenas um arquivo de patch que contém:
- [x] Todas as alterações divididas em uma revisão de cada vez
- [x] Um identificador que mostra onde o patch deve ser aplicado na árvore (os patches falharão se você não estiver atualizado como o remetente do patch)
- [x] Todo o histórico de revisão das alterações
- [x] Metadados como alterações de nome de caminho, tags simbólicas (como alpha2 ou linux-2.1.133), etc.
- [x] Um novo conceito chamado linha de desenvolvimento (LOD).

É logicamente um branch, mas não precisa estar em um branch.

Os patches podem (e irão) ser seu próprio LOD. Você pode executar operações em um LOD como "aplicar isto ao tronco".


<p align="justify">Mais tarde, Linus daria grande crédito ao BitKeeper por mudar sua visão e inspirar o Git: </p>

<p align="justify">“O BitKeeper não foi apenas o primeiro sistema de controle de versão que eu senti que valia a pena usar, mas também foi o sistema de controle de versão que me ensinou por que há um ponto neles e como você realmente pode fazer as coisas. Então o Git, de muitas maneiras, embora de um ângulo técnico seja muito, muito diferente do BitKeeper, que era outro objetivo de design porque eu queria deixar claro que não era um clone do BitKeeper, muitos dos fluxos que usamos com o Git vêm diretamente dos fluxos que aprendemos com o BitKeeper.”</p>

<p align="justify">Embora o próprio Linus tivesse o BitKeeper em alta conta, sua decisão de usar a ferramenta internamente para Linux em 2002 levou a grandes discussões na Lista de Discussão do Kernel Linux.</p>

<p align="justify">Por que os problemas? Quando Larry McVoy construiu o BitKeeper, ele o fez como parte de um empreendimento comercial de código fechado (BitMover). Embora as pessoas pudessem usar a versão comunitária gratuita do BitKeeper, isso veio com uma licença restritiva.</p>

<p align="justify">Da entrada da Wikipédia do BitKeeper : “A licença para a versão 'comunitária' do BitKeeper permitiu que desenvolvedores usassem a ferramenta sem custo para projetos de software livre ou de código aberto, desde que esses desenvolvedores não participassem do desenvolvimento de uma ferramenta concorrente (como Concurrent Versions System, GNU arch, Subversion ou ClearCase) durante o uso do BitKeeper mais um ano. Essa restrição se aplicava independentemente de a ferramenta concorrente ser gratuita ou proprietária.”</p>

<p align="justify">Até mesmo Richard Stallman, o último dos verdadeiros hackers e evangelista do software livre, entrou na conversa : </p>

<p align="justify">"O espírito da licença Bitkeeper é o espírito da mão do chicote. É o espírito que diz: 'Você não tem o direito de usar o Bitkeeper, apenas privilégios temporários que podemos revogar. Seja grato por permitirmos que você use o Bitkeeper. Seja grato e não faça nada que não gostemos, ou podemos revogar esses privilégios.' ... A indignação com esse espírito é a razão do movimento do software livre."</p>

<p align="justify">Mas Linus tinha uma visão muito mais pragmática; da perspectiva dele, ele só queria a melhor ferramenta para o trabalho, independentemente de onde viesse. Em 2007, ele diria : "E eu estava feliz com o acordo do BitKeeper, apesar da licença, porque, francamente, no que me diz respeito, eu faço código aberto porque acho que é a única maneira certa de fazer software. Mas, ao mesmo tempo, usarei a melhor ferramenta para o trabalho e, francamente, o BitKeeper era isso."</p>

<p align="justify">Em 2005, um dos desenvolvedores do kernel Linux, Andrew Tridgell, forçou a questão quando violou a licença e fez engenharia reversa no BitKeeper para que ele "pudesse retirar coisas das árvores BK sem concordar com a licença BK".</p>

<p align="justify">Da perspectiva de Tridgell, isso era completamente ético; "Eu não usei o BitKeeper para escrever esta ferramenta e, portanto, nunca estive sujeito à licença BitKeeper".</p>

<p align="justify">De sua parte, Linus tentou por três meses bancar o pacificador. (E, se alguma coisa, seus comentários futuros de fato pareciam sugerir mais frustração com Andrew do que com Larry.) Mas, no final das contas, não havia como reconciliar essas diferenças.</p>

<p align="justify">Em 6 de abril de 2005, Linus enviou um e-mail para a Linux Kernel Mailing List, com o assunto “Kernel SCM saga…” , dando início à cadeia de eventos que mudaria uma indústria:</p>

<p align="justify">“Ok, como várias pessoas já sabem, estamos tentando resolver um conflito sobre o uso do BK nos últimos dois meses (e parece mais tempo). Isso não está funcionando e, como resultado, a equipe do kernel está procurando alternativas.”</p>

<p align="justify">Ele brincou sobre a história — “Não é como se minha escolha de BK tivesse sido totalmente livre de conflitos ('Não, sério? Conte! Ah, você quer dizer os gigabytes e mais gigabytes de flames que tínhamos?')” — e enfatizou sua contínua gratidão à equipe do BitKeeper.</p>

<p align="justify">
Na verdade, um impacto que o BK teve foi nos fazer (e a mim em particular) mudar fundamentalmente a maneira como fazemos as coisas. Isso varia do rastreamento de conjunto de alterações de granulação fina até como acabei confiando a submantenedores coisas muito maiores, e não tendo mais que trabalhar em uma base de patch por patch. Então os três anos com o BK definitivamente não foram desperdiçados: estou convencido de que ele nos fez fazer as coisas de maneiras melhores, e uma das coisas que estou analisando é garantir que essas coisas continuem funcionando.
</p>

<p align="justify">Então, eu só queria dizer que estou pessoalmente muito feliz com o BK [BitKeeper], e com o Larry. Não deu certo, mas com certeza fez uma grande diferença no desenvolvimento do kernel. E resolveremos o problema temporário de ter que descobrir um conjunto de ferramentas que nos permita continuar a fazer as coisas que o BK nos permitiu fazer.
</p>

#### Linus sai de férias
<p align="justify">Na realidade, enquanto ele postava a notícia pública do rompimento na lista de discussão em 6 de abril, Linus já estava trabalhando duro. Três dias antes, logo após o lançamento do 2.6.12-rc2, ele havia interrompido seu trabalho no kernel do Linux e mudado seu foco total para encontrar uma alternativa ao BitKeeper.</p>

<p align="justify">O objetivo de Linus era ter "algo utilizável em duas semanas". Como parte do e-mail de 6 de abril, ele anunciou "Vou ficar efetivamente off-line por uma semana (pense nisso como um evento normal "Linus saiu de férias") e estou apenas pedindo que as pessoas que continuam a manter as árvores BK pelo menos tentem também se certificar de que podem me enviar o resultado como patches (individuais), já que eventualmente terei que mesclar de outra forma".</p>

<p align="justify">Os e-mails de Linus transmitiam uma clara sensação de urgência; afinal, o próximo lançamento do kernel Linux estava bloqueado até que ele pudesse descobrir isso.</p>

<p align="justify">Em um e-mail em 7 de abril, ele até observou que, no pior cenário, o kernel do Linux pode até mesmo migrar para um sistema de controle de versão centralizado : "NOTA! Eu detesto o modelo SCM centralizado, mas se a situação ficar crítica e não conseguirmos fazer uma mesclagem paralela razoável em um curto espaço de tempo (por exemplo, um ou dois meses), usarei algo como o SVN em um site confiável com apenas alguns colaboradores e, pelo menos, tentarei distribuir a mesclagem entre algumas pessoas, em vez de me fazer ser o acelerador."</p>

<p align="justify">Embora o resultado seja claro para nós em retrospecto, na época, os e-mails mostram que escrever um sistema de controle de versão personalizado estava longe de ser algo garantido. Dos 205 e-mails na cadeia que abrangeu do primeiro e-mail em 6 de abril ao último em 12 de abril, houve muita discussão sobre outras alternativas de código aberto — Monotone, GNU arch, Bazaar-ng, Darcs — com alguns dos criadores dessas ferramentas entrando para defender seu projeto.</p>

<p align="justify">A principal consideração, especialmente de Linus, parecia ser o desempenho geral de cada uma dessas ferramentas. No geral, de todos os 205 e-mails, houve muita conversa sobre desempenho e eficiência das várias ferramentas.</p>

A maior questão na mente de todos parecia ser: alguma das ferramentas existentes funcionaria para um projeto do tamanho do kernel do Linux?

<p align="justify">Em 8 de abril, dois dias após seu e-mail inicial e cinco dias após começar a trabalhar seriamente, Linus compartilhou uma atualização: “Enquanto isso (e porque o monotone realmente é muito lento), aqui vai um desafio rápido para você e qualquer hacker maluco por aí: se você quiser brincar com algo realmente desagradável (mas também muito, muito rápido), dê uma olhada em kernel.org :/pub/linux/kernel/people/torvalds/.”</p>

#### As primeiras linhas do Git
<p align="justify">Quando ouvimos falar que Linus escreveu o Git original em duas semanas, vale a pena acrescentar uma grande ressalva: quando pensamos no Git hoje, pensamos nos comandos voltados para o usuário e no fluxo de trabalho geral, mas, na época, os objetivos — e a missão — eram muito diferentes e muito mais limitados em escopo.</p>

<p align="justify">Enquanto diferentes pessoas debatiam os méritos de várias ferramentas e abordagens na lista de e-mail, uma pessoa escreveu , descrevendo aproximadamente o que era necessário: “Está tudo bem ser um pouco lento, desde que não seja pateticamente lento. O propósito da solução provisória é apenas colocar o processo de fluxo de patch de volta online.”</p>

<p align="justify">O Git original de Linus era muito mais um sistema de arquivos endereçável por conteúdo do que um sistema de gerenciamento de controle de fonte completo. Aqui está sua explicação de outro e-mail:</p>

<p align="justify">
(*) Eu chamo isso de "commit", mas é algo muito mais simples. É realmente apenas um "Agora tenho <estado deste diretório>, cheguei aqui de <coleção de estados de diretório anteriores> e o motivo foi <motivo>".</P>

<p align="justify">Aliás, esse é o tipo de design. "git" realmente não se importa com coisas como mesclagens. Você pode usar qualquer SCM para fazer uma mesclagem. O que "git" faz é rastrear o estado do diretório (e como você chegou a esse estado), e nada mais. Ele não mescla, ele realmente não faz muita coisa.</p>

<p align="justify">Então, quando você "puxa" ou "empurra" um arquivo Git, você obtém a "união" de todos os estados de diretório no destino. A coisa HEAD é um ponteiro para o "mar de estados de diretório", mas você realmente tem que usar outra coisa para mesclar dois estados de diretório.</p>

<p align="justify">Quando houve discussão sobre um fluxo de trabalho de seleção seletiva e movimentação de confirmações no tópico de e-mail, Linus extrapolou isso do cliente que ele estava construindo.</p>

<p align="justify">No geral, Linus comentaria "'Git' é realmente trivial, escrito em quatro dias. A maior parte disso não foi realmente gasto codificando, mas pensando sobre as estruturas de dados."</p>

<p align="justify">É um sentimento que ele mais tarde ecoaria repetidas vezes e às vezes é tirado do contexto, mas soa verdadeiro — a escolha da estrutura de dados na época era a parte nova do código que Linus havia escrito. Depois que Linus compartilhou seus primeiros commits, não houve discussão sobre fluxo de trabalho (o que a maioria vem à mente quando se pensa no Git hoje). Em vez disso, a maioria das discussões se concentrou na arquitetura que agora tomamos como certa: a interface direta do Git com o sistema de arquivos e sua abordagem baseada em hash para dizer quais arquivos foram alterados (e garantir a integridade dos dados).</p>

<p align="justify">Mas também houve alguns que viram a visão e estavam ansiosos para começar a trabalhar em Git. No mesmo dia em que Linus pediu às pessoas para verificar as mudanças em seu diretório, algumas pessoas enviaram scripts que construíram funcionalidades adicionais sobre sua fundação.</p>

<p align="justify">Duas semanas depois de ter começado, em 17 de abril de 2005, Linus enviou um e-mail para a lista de e-mails: “Primeira fusão real do kernel Git!”</p>

#### Vislumbres do futuro
<p align="justify">A parte mais satisfatória de ler a cadeia de e-mails inicial, quase vinte anos depois de todos esses eventos terem ocorrido, é ver as dicas do futuro, desconhecidas pelos autores na época.</p>

Ao avaliar uma das alternativas de controle de origem propostas, “monótono”, um usuário escreveu:

<p align="justify">Uma coisa um pouco irritante é que o monotone não parece ter uma interface web. Eu costumava usar o bk muito para rastrear bugs, porque era muito rápido ter uma janela do navegador web aberta e clicar nas revisões de um arquivo, ler comentários de check-in, etc. Alguém sabe se um está sendo trabalhado?</p>

<p align="justify">Na época, as UIs da web para controle de origem e revisão de código estavam apenas se tornando populares; no Google, Guido van Rossum estava construindo sua primeira peça dedicada de ferramenta de revisão de código na web no Mondrian . E, dois anos depois desse tópico de e-mail, o GitHub seria fundado.</p>

Há também uma ironia em toda essa discussão sobre desempenho na cadeia de e-mails.

<p align="justify">Uma breve discussão paralela expressando preocupação sobre como o Git poderia funcionar se apoiado por um sistema de arquivos baseado em rede foi invertida nos dias atuais; para gigantes como Google (FUSE) e Meta (EdenFS), esses sistemas de arquivos baseados em rede e com controle de origem são uma parte crítica de como eles continuam a dimensionar o controle de origem e as compilações em seus enormes monorepos.</p>

<p align="justify">E a principal preocupação na época que inspirou Linus a escrever o Git em primeiro lugar — que nenhuma das alternativas de controle de revisão existentes teria desempenho suficiente para suportar o grande histórico e a taxa de transferência de confirmações do repositório do kernel Linux?</p>

Isso se repetiria alguns anos depois , quando o Meta migrou seu repositório principal do Git, exatamente pelo mesmo motivo.

É claro que, na época, tudo isso era desconhecido para as várias pessoas que participaram da cadeia de e-mails original “Kernel SCM saga…”.

<p align="justify">O Git foi criado como uma ferramenta para desbloquear futuros lançamentos do kernel Linux — não foi concebido como uma reinvenção global de todo o gerenciamento de código-fonte; os comentários de Linus destacam que ele viu explicitamente o gerenciamento de código-fonte como o domínio de outras ferramentas que então interagiriam com o Git.</p>

<p align="justify">Quando pensamos em história, frequentemente a romantizamos como tendo nascido de um golpe repentino de inspiração. Mas a criação do Git mostra a realidade muito mais dura da invenção: um desacordo lentamente crescente sobre uma licença; a necessidade de uma solução de backup fragmentada para desbloquear o trabalho; e então polimento e iteração contínuos ao longo de anos e anos, liderados não pelo inventor, mas sim por uma comunidade.</p>
#### Epílogo
Por fim, a BitMover tornou o BitKeeper de código aberto. Amarrando um laço em toda a situação, um comentarista do HN (Bryan Cantrill, agora CTO da Oxide) deixou um comentário fantástico quando a BitMover fez o anúncio em 2016:

<p align="justify">A grande ironia é que Larry foi um dos primeiros defensores do código aberto do sistema operacional na Sun — e acreditava que, quando a Sun finalmente descobriu coletivamente e fez acontecer (em 2005), já era uma década ou mais tarde.

Então, por um lado, você pode ver a história do BitKeeper com relação ao código aberto como quase grega em seu escopo trágico: cada razão que Larry descreveu para "sourceware" para a Sun se aplicava tanto ao BK quanto ao SunOS — com até mesmo o mesmo tecnólogo (Torvalds) liderando a alternativa de código aberto! 

E você pode dizer ao BK e a Larry agora que é "tarde demais", assim como Larry disse à Sun em 2005, mas também acho que isso representa uma dicotomia forçada de "vencedores" e "perdedores". 

Ao contrário, eu gostaria de acreditar que a inovação contínua nas comunidades illumos (SmartOS, OmniOS, etc.) prova que nunca é tarde demais para software de código aberto -- que comunidades de código aberto (como cidades) podem ser pequenas, mas vibrantes, desempenhando um papel crítico para seus constituintes. 

Em um universo alternativo, poderíamos estar executando o BK no SunOS em vez do Git no Linux? Claro -- mas ser capaz de executar um BK de código aberto em um illumos de código aberto também é muito bom; 

o futuro de dois sistemas inovadores foi garantido, mesmo que tenha demorado um pouco mais do que todos gostariam.</p>

Uma resposta foi postada por outro usuário do HN, "luckydude" — o próprio Larry McVoy.

<p align="justify">Sim, essa ironia não passou despercebida para mim. Mas em ambos os casos, as empresas agiram em interesse próprio. Nenhuma delas teve coragem de abandonar seu fluxo de receita existente. É difícil dizer o que teria acontecido.</p>

<p align="justify">Foi uma jornada interessante e, no mínimo, BK foi a inspiração para Git e Hg, o que é uma contribuição para o campo.</p>


### Origem do Nome
Git é uma variação do Inglês britânico para a palavra de origem escocesa “get“, significa “um filho ilegítimo”.

E dependendo do humor do Linus, o nome também pode significar: 

- [x] Apenas uma combinação randômica de letras;
- [x] Estúpido, abjeto, desprezível;
- [x] “Global Information Tracker”;

E finalmente, quando dá algum problema (ei, nada é perfeito): “Goddamn idiotic truckload of sh*t”

Sinônimo: bastard

Exemplo de uso: “Shut up you git!”

Um coloquialismo para descrever alguém com muita sorte.

You won the lottery? You lucky git!

![](../img/git_005.png)

Em resumo: 
- [x] Git foi criado por um programador para ser usado por programadores. 
- [x] Linus Torvalds, o criador do kernel Linux, começou a escrever Git em 2005 com o objetivo de ter um sistema de controle de versão distribuído, de código aberto, de alto desempenho e difícil de corromper para o projeto do kernel Linux usar. 
- [x] Em uma semana, o código-fonte do Git foi hospedado dentro do sistema de controle de versão Git; e em dois meses e meio, a versão 2.6.12 do kernel Linux foi lançada usando Git.

### Comandos PLUMBING X PORCELAIN
É claro, pela rapidez desenvolvida, não seria simples. Por isso conta a lenda, que todos os comandos ou fontes do git, eram "PLUMBING", que era a forma de implementar este controle de forma objetiva por programadores. Posteriormente os comandos PORCELAIN, foram aparecendo no mundo GIT.

A aplicação dos termos estranhamente vem de vasos sanitários (sim, esses), tradicionalmente feitos de porcelana, e da infraestrutura de encanamento (canos e ralos). Podemos dizer que a camada de porcelana fornece uma interface amigável para o encanamento. A maioria das pessoas só lida com porcelana.

A utilização dessa terminologia em analogia, para separar os comandos de baixo nível que os usuários geralmente não precisam usar diretamente (comandos de “encanamento”) dos comandos de alto nível mais amigáveis (comandos de “porcelana”).

- [x] O que é Git e sua importância.
<p align="justify">O controle de versão envolve o gerenciamento de múltiplas versões de um projeto, rastreando as alterações realizadas nos arquivos de projetos, onde cada alteração é registrada permitindo desfazer ou reverter facilmente.</p>

- [x] Conceitos de repositório, commit, branch e merge.
- [ ] Repositório: 
- [ ] Commit: 
- [x] Branch: Uma branch é uma maneira de separar diferentes linhas de pensamento sobre a evolução do código.
- [ ] Merge: 
### Comandos Essenciais do Git

### Trabalhando com Branches
- [x] Fluxo básico de branches e resolução de conflitos.
- [x] Criar, alternar e excluir branches (git branch, git checkout).
## Git Avançado
Aprender práticas avançadas de Git para um trabalho eficiente em equipe.
### Fluxos de Trabalho com Git
- [x] Fluxos Git: Centralizado, Feature Branch, Gitflow e Trunk-Based.
- [x] Escolha do fluxo de trabalho ideal para equipes.
### Merge e Rebase
- [x] Diferenças entre git merge e git rebase.
- [x] Boas práticas de uso e resolução de conflitos.
### Stashing e Cherry-Picking
- [x] Utilização do git stash para salvar alterações temporárias.
- [x] Aplicação do git cherry-pick para copiar commits específicos.
### Tags e Versionamento Semântico
- [x] Criar e gerenciar tags (git tag).
- [x] Integração de tags com versionamento semântico.
### Git Hooks
- [x] Configurar e utilizar hooks para automações no ciclo de desenvolvimento.

## Trabalhando com GitHub
Aprender a utilizar GitHub para colaboração e automação de projetos.
### Introdução ao GitHub
- [x] Criando repositórios no GitHub.
- [x] Trabalhando com GitHub Desktop.
### Colaboração em Equipe
- [x] Forks, Pull Requests e Revisão de Código.
- [x] Proteção de branches e regras de merge.
### Automatizações no GitHub
- [x] Introdução ao GitHub Actions.
- [x] Configuração de Workflows (CI/CD).
### Gestão de Projetos no GitHub
- [x] Utilização do GitHub Projects para gerenciar tarefas.
- [x] Issues e Milestones como ferramentas de acompanhamento.
## Introdução ao Azure DevOps
Utilizar Azure DevOps para integração contínua, entrega contínua (CI/CD) e gestão de projetos.
### Visão Geral do Azure DevOps
- [x] Serviços disponíveis: Boards, Repos, Pipelines, Test Plans e Artifacts.
- [x] Configuração de projetos no Azure DevOps.
### Repos (Repositórios Git no Azure DevOps)
- [x] Integração de repositórios locais com Azure DevOps.
- [x] Pull Requests e políticas de branches.
### Pipelines (CI/CD)
- [x] Configuração de Pipelines para Build e Deploy automáticos.
- [x] Testes automatizados e deploy em múltiplos ambientes.
### Boards (Gestão Ágil)
- [x] Criando Backlogs, Sprints e Kanban.
- [x] Rastreamento de trabalho e relatórios.

## Estratégias de Git em Equipes
Implementar boas práticas para equipes colaborativas em GitHub e Azure DevOps.
### Estratégias de Branching
- [x] Fluxos de trabalho para equipes pequenas e grandes.
- [x] Boas práticas para criação de branches (nomeação e organização).
### Gerenciamento de Conflitos
- [x] Práticas para minimizar conflitos.
- [x] Resolução colaborativa usando GitHub ou Azure DevOps.
### Integração entre GitHub e Azure DevOps
- [x] Automatizando fluxos de trabalho entre ambas as plataformas.
- [x] Sincronização de repositórios.
### Segurança e Governança
- [x] Gerenciamento de permissões e autenticação.
- [x] Práticas de segurança para repositórios Git.

## Projeto Prático
Aplicar os conhecimentos adquiridos em um projeto integrado.
### Definição do Projeto
- [x] Criar um repositório central no GitHub ou Azure DevOps.
- [x] Escolher um fluxo de trabalho de equipe (Gitflow ou Trunk-Based).
### Colaboração em Equipe
- [x] Planejamento de tarefas com GitHub Projects ou Azure Boards.
- [x] Desenvolvimento de funcionalidades em branches separados.
### Integração Contínua
- [x] Configuração de Pipelines para testes e deploy.
- [x] Monitoramento e ajustes de workflows.



Temas Principais e Ideias-Chave:

Trabalho em Equipe e Mentalidades:
Importância da Confiança: O livro enfatiza a necessidade de confiança e empatia em equipes que utilizam o Git. Um ambiente de confiança facilita a colaboração e a comunicação honesta sobre dificuldades com comandos.
Foco no Usuário: O trabalho deve ser sempre motivado por um desejo de melhorar a experiência do usuário final, evitando regressões e mantendo a segurança.
Estratégias de Pensamento: O livro descreve diferentes tipos de pensamento relevantes para equipes:
Criativo: Focado em experimentar novas abordagens e questionar o status quo. Frases-chave: "Podemos tentar...", "E se...".
Analítico: Focado em esclarecer, entender e organizar. Frases-chave: "O que você está dizendo é...", "Para esclarecer...".
Decisório: Focado em concluir e passar para a ação. Frases-chave: "Estou pronto para passar para...", "Já decidimos...".
Reuniões Eficazes: A importância de estruturar reuniões para que elas tenham resultados úteis.
Governança de Projetos e Controlo:
Autoria e Responsabilidade: O Git permite rastrear quem adicionou cada parte de código a um repositório, tornando clara a autoria e responsabilidade.
Licenças de Distribuição: A escolha de uma licença para o seu projeto é fundamental, pois ela define como outros podem usar ou não seu trabalho. O livro menciona licenças populares como a MIT License.
"A MIT License permite que as pessoas façam o que quiserem com seu código, desde que atribuam crédito aos autores originais e não o responsabilizem pelo software."
Controlo de Acesso: O Git em si não possui controlo de acesso, mas este pode ser implementado via sistemas de hospedagem como Bitbucket ou GitLab.
Modelo de acesso: O Git permite que todos em uma equipe tenham acesso de escrita, e depende de outras ferramentas para controlar isso.
"O Git não acomoda permissões e, em vez disso, depende de outros sistemas para conceder ou negar acesso de escrita a um repositório."
"As regras que restringem a distribuição e obras derivadas de uma base de código são definidas pela sua licença de software."
Estratégias de Branching:
Definição de Branch: Uma branch é uma maneira de separar diferentes linhas de pensamento sobre a evolução do código.
Tipos de Branching: O livro discute diferentes estratégias, incluindo:
Mainline Branch Development: Desenvolvimento direto na branch principal (master).
Branch-per-Feature: Criação de branches separadas para cada funcionalidade.
State Branching: Uso de branches para refletir estados do projeto (por exemplo, "maint", "master", "next", "pu" usado no Git).
"Em controlo de versão, uma branch é uma forma de separar pensamentos paralelos sobre como uma parte do código pode evoluir."
Fluxos de Trabalho:
Documentação: A importância de documentar o processo de trabalho, incluindo decisões codificadas e progressão de tickets.
Fluxo de Trabalho Básico: O livro apresenta um exemplo de fluxo de trabalho que visa colaboração eficaz.
Evolução: Os fluxos de trabalho devem evoluir com a equipe e o projeto.
Trabalhando Sozinho:
Controlo de Versão Baseado em Issues: O uso de issues como base para o trabalho individual.
Criação de Repositórios Locais: O livro descreve como criar repositórios Git a partir de repositórios existentes, pastas de arquivos não rastreados ou diretórios vazios.
git clone [URL] - para clonar repositório remoto.
git init - para iniciar um novo repositório em um diretório.
Adição e Commits: O livro detalha o processo de adicionar arquivos ao repositório, incluindo staging, commits e uso de mensagens de commit.
Ignorar Arquivos: Como configurar arquivos e padrões a serem ignorados pelo Git através de .gitignore.
Tags: Como utilizar tags para marcar commits específicos.
Comandos Git: Uma lista de comandos básicos do Git, tais como clone, init, status, add, commit, log, branch, checkout, tag, etc.
Rollbacks, Reverts, Resets e Rebasing:
Comandos: O livro descreve como utilizar comandos como reset, revert e rebase para desfazer, corrigir e remodelar o histórico de commits.
Atenção ao Detalhe: É importante usar diagramas para visualizar os efeitos dos comandos antes de os executar.
Reflog: O reflog é uma história privada que rastreia tudo o que foi feito, incluindo coisas que não impactaram o código, como o checkout de uma branch.
"Esta é uma história privada. Só você pode vê-la, graças a Deus! Ela conterá tudo o que você fez, incluindo coisas que não têm impacto no código, como verificar uma branch."
Reset: O comando reset é utilizado para apontar para o HEAD de um branch, e pode ser utilizado para simular um squash em commits.
Equipes com Mais de Uma Pessoa:
Configuração do Projeto: Como configurar um projeto para múltiplos colaboradores, incluindo permissões, uploads e documentação.
README: A importância de documentar o projeto num ficheiro README.
Licença: A necessidade de usar uma licença para que seja claro como o seu projeto pode ser utilizado.
Consumidores e Contribuidores: Diferentes maneiras pelas quais os developers podem interagir com um projeto no Git.
"Um consumidor de um projeto não tem intenção consciente de contribuir para um projeto. Eles não esperam ter acesso de escrita à base de código e não conseguem imaginar um futuro possível onde gostariam de fazer upload de suas mudanças para um projeto."
Revisão de Código:
Tipos de Revisão: O livro aborda diferentes formas de revisão e como prepará-las.
Formatos de Patch: Utilização de git diff para visualizar alterações propostas num ficheiro de "patch".
"Um patch permite que você compare uma versão de um código com outra para ver o que foi alterado. Os patches podem então ser aplicados ao código."
Revisores: O livro discute diferentes tipos de revisores e seus impactos.
Encontrando e Corrigindo Bugs:
Stash: O uso do stash para colocar trabalho em andamento de lado temporariamente.
Blame: Como usar o blame para ver a história das mudanças linha a linha.
Bisect: Como usar o bisect para encontrar o commit que introduziu um bug.
“Depois que encontrar o ponto onde as coisas deram errado, poderá corrigir o histórico nesse exato momento. É como ‘De Volta para o Futuro’— e o Git é o seu DeLorean.”
"O comando blame permite analisar um arquivo linha a linha, mostrando a última vez que cada linha foi alterada, por quem e em qual commit ela foi alterada"
Projetos de Código Aberto no GitHub:
GitHub: Uma breve descrição da plataforma.
Repositórios: Como criar repositórios pessoais e adicionar arquivos.
Snapshots: Como baixar snapshots de repositórios.
Colaboração: Como colaborar com outros em um projeto, incluindo forks e pull requests.
git remote add [nome-de-usuario] git://github.com/[nome-de-usuario]/[nome-do-repositorio] - adicionar o repositório remoto.
git fetch [nome-de-usuario] - baixar as branches de um repositório remoto.
Colaboração Auto-Hospedada com GitLab:
GitLab: Uma breve descrição da plataforma, com configurações e painel administrativo.
Milestones: Como gerir marcos em um projeto.
Apêndices:

Receitas: Uma comparação entre duas receitas de butter tarts para ilustrar a ideia de branch, diferentes variantes da mesma receita.
Instalação do Git: Detalhes sobre como instalar e atualizar o Git em diferentes sistemas operacionais.
Configuração do Git: Detalhes sobre como configurar o Git, incluindo nome, email, configurações do .gitignore e line endings.
git config --global user.name 'Seu Nome' - Definir o nome global.
git config --global user.email 'seu-email@example.com' - Definir o email global.
Chaves SSH: Como gerar e configurar chaves SSH para conexões seguras.
Conclusão:

Este livro oferece uma visão completa sobre o uso do Git em equipes, cobrindo desde conceitos básicos até funcionalidades mais avançadas. O foco na experiência do usuário e nas melhores práticas torna-o um guia valioso para qualquer equipe que deseje trabalhar de forma eficiente e colaborativa com Git.
