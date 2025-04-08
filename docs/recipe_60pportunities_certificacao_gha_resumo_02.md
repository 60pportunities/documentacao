## Git
Git é um "software de controle de versão descentralizado" e este termo bárbaro explica precisamente o que é e o que não é. Git é um software, o que significa que não é uma metodologia como seria "DevOps", não é uma sigla como "CI/CD" ou nem mesmo uma maneira de fazer como "gitflow".

É um aplicativo que é necessário instalar em um servidor cuja função principal é gerenciar as diferentes versões do nosso código-fonte. Essas versões, em vez de um simples backup, permitem, particularmente no mundo do software, manter uma cópia de cada modificação do código-fonte, com a capacidade de voltar e/ou selecionar uma versão precisa.

Este tipo de software existe há décadas com os famosos CVS (1990), ClearCase (1992), SVN (2000), Visual SourceSafe (1994), Team Foundation Server (2005) mas também muitos outros, menos conhecidos, como o BitKeeper (que foi usado para o código fonte do Linux), etc. Todos eles têm suas vantagens e desvantagens, mas acima de tudo, eles têm um ponto em comum: a necessidade de um único servidor onde o código fonte é armazenado e no qual tudo acontece.

É o famoso conceito de "centralizado".

É justamente para quebrar esse modelo que Linus Torvalds (também o inventor do Linux!) inventou o Git em 2005. Se o Git também funciona com um servidor "principal", cada software cliente também traz recursos de gerenciamento de código-fonte (ramificação, confirmação, etc.).

Isso significa que todo desenvolvedor que instala o Git em seu computador pode usar todos os recursos localmente, incluindo a criação/gerenciamento de ramificações e a mesclagem de código, registro de dados, etc.

Isso levou ao surgimento de novas formas de trabalho entre os desenvolvedores.

Um bom exemplo é uma nova forma de criar uma ramificação por recurso ou desenvolvedor.

No passado, geralmente era uma única ramificação correspondente a um software de versão, com os riscos de que essa ramificação, quando "quebrada", impedisse todos os desenvolvedores de trabalhar.

Hoje, o Git, graças à sua flexibilidade, se tornou o software de gerenciamento de versão de referência e dominou completamente todos os outros do cenário. Mas com grande poder, o GitHub Actions também vem com uma complexidade.

## GitHub
É justamente essa complexidade e capacidade de suporte (nenhuma empresa editou ou suportou o Git) que as empresas e equipes de desenvolvedores temiam migrar para essa nova ferramenta.

É quando as pessoas decidem criar plataformas de hospedagem de código-fonte baseadas em Git (SaaS, Software as a Service) e a Internet então vê aparecer GitHub, GitLab ou Bitbucket.

O objetivo dessas plataformas é esconder a complexidade do Git por meio de uma interface intuitiva e então adicionar recursos adicionais, como gerenciamento de projetos, rastreamento de bugs, varredura de código e muitos outros.

Assim nasceu o GitHub no final de 2007, que neste momento era apenas uma oferta comercial de Git hospedado (apenas armazenamento de código-fonte).

O GitHub, com mais de 50 milhões de usuários no início de 2021, é claramente o líder do mercado de plataformas de gerenciamento de código-fonte, mas há muito tempo é insuficiente para um projeto real.

De fato, era necessário para cada equipe que esperava usá-lo como parte de um projeto real, adicionar:

- [x] Software de terceiros para gerenciar o backlog (problemas do GitHub e "Projetos" estão longe de serem perfeitos);
- [x] Outro software para gerenciamento de testes;
- [x] Outro software para a parte de compilação/construção;
- [x] E, finalmente, software para a implantação.

Para competir com essas plataformas mais avançadas/completas, o GitHub começou a implementar recursos para preencher essas lacunas.

Assim, entre vários novos recursos, nasceu um GitHub Actions.

- [x] Nota: GitHub, Inc, o editor do GitHub.com, foi adquirido pela Microsoft em junho de 2018, mas continua sendo uma empresa totalmente independente.
- [x] Se sinergias e co-investimentos técnicos forem feitos entre as duas empresas, o GitHub mantém sua orientação e independência total.
- [x] Se você estiver interessado no futuro do GitHub, esteja ciente de que a lista de próximos recursos e cronograma de implementação são públicos e acessíveis neste endereço: `https://github.com/github/roadmap/`.

## GitHub Actions
Em agosto de 2019, o GitHub anunciou o beta público do GitHub Actions, embora eles tenham sido realmente acessíveis desde o verão de 2018 para alguns sortudos.

As GitHub Actions são então descritas como "Seu fluxo de trabalho, criado por você, executado pelo GitHub. As GitHub Actions permitem que você compile facilmente, empacote, versione, atualize e implante seu projeto em qualquer linguagem, no GitHub ou em qualquer sistema externo, sem precisar executar nenhum código sozinho".

As **GitHub Actions, um sistema de automação, são mais do que isso, pois também podem interagir com os diferentes elementos de um projeto, como criar bugs, enviar e-mails automaticamente, atualizar os elementos do roadmap**, etc.

Mas vão muito além, pois você pode automatizar quase tudo com ele, como acionar o aspirador de pó robô, acender as luzes de uma árvore de Natal, fazer jogo da velha, etc.

Os usos são infinitos, desde que sua criatividade esteja lá e que você esteja pronto para escrever algum código.

## Seu primeiro fluxo de trabalho
Acredito que será mais fácil entender esses conceitos quando você os tiver visto e aplicado pelo menos uma vez.

## Criando uma conta GitHub
Se isso ainda não tiver sido feito, você precisará criar uma conta GitHub para criar e usar fluxos de trabalho em seu ambiente. A criação de uma conta é totalmente gratuita e é realizada na seguinte URL: `https://github.com/join`.

Embora o GitHub ofereça várias assinaturas pagas que permitem acesso a recursos adicionais, você precisará de uma conta gratuita neste livro.

Os recursos do GitHub Actions são totalmente acessíveis gratuitamente, mas alguns recursos estão disponíveis para contas gratuitas apenas em repositórios públicos.

Assim, se você decidir criar um repositório privado (visível apenas para você), certos recursos como ambientes, varredura de código ou publicação de páginas não estarão acessíveis para você.

## Criação do repositório
Você pode começar com um novo repositório vazio, mas para mais simplicidade neste primeiro capítulo, criamos um repositório pronto para uso que você só precisa copiar para sua conta. Para fazer isso, visite a seguinte URL: `https://github.com/60pportunities/estudo-actions` e bifurque o repositório.

## Fork do repositório
Um fork é uma cópia de um repositório, mantendo uma conexão com o arquivamento do qual é copiado.

Isso permite que você edite a cópia como quiser (é sua cópia), mas também lhe dá a capacidade de "empurrar" suas alterações para reaplicar o repositório original para contribuir (se o autor aceitar, é claro).

É como operamos a maioria dos projetos de código aberto. Cada colaborador executa e trabalha na cópia e então propõe adicionar emendas ao rascunho original.

O proprietário do repositório de origem pode então ver as alterações que você deseja fazer e aceitar ou rejeitar as alterações, que são automaticamente incluídas em seu código.

Assim que o fork for alcançado, o que deve levar alguns segundos, você deve pousar em um novo repositório chamado NOME_DA_SUA_CONTA/estudo-actions.

## Criando um fluxo de trabalho
Observe as guias disponíveis em seu repositório e anote aquela que nos interessa: Actions.

Na aba do seu projeto em Actions é que você pode criar, editar e, principalmente, visualizar o status de seus vários fluxos de trabalho.

Entre na guia Ações para chegar ao Assistente de criação de fluxo de trabalho.

Observe a mensagem que informa que os fluxos de trabalho foram deliberadamente desabilitados pelo GitHub neste repositório devido aos riscos que eles podem causar.

A mensagem recomenda que você inspecione o código-fonte dos fluxos de trabalho e certifique-se de que não haja nada perigoso lá.

Se, após sua leitura cuidadosa, não houver nada suspeito, você pode clicar em **"Eu entendo meus fluxos de trabalho, vá em frente e habilite-os"** para reativar a funcionalidade do repositório GitHub para suas Ações.

Esta etapa só é necessária porque você **bifurcou** um repositório de outra pessoa; no caso de um novo repositório de código pessoal, esta etapa não existe.

- [x] Crie um fluxo de trabalho "vazio" que lhe dará a estrutura de um fluxo de trabalho genérico que apenas envia uma mensagem no console
- [x] Crie um fluxo de trabalho a partir de um modelo predefinido.

O GitHub oferece modelos que devem se alinhar com o que ele acha que detectou em seu repositório ou permitindo que você escolha entre dezenas de modelos predefinidos.

Esses fluxos de trabalho são um bom ponto de partida e uma excelente maneira de aprender quando você está começando com o GitHub Actions.

## Escolha um modelo de fluxo de trabalho
Crie, teste e implante seu código.

Faça revisões de código, gerenciamento de ramificação e triagem de problemas funcionarem da maneira que você deseja. Selecione um modelo de fluxo de trabalho para começar.

## Implantação
No nosso caso, criaremos nosso fluxo de trabalho completamente à mão.

Clique em Configurar um fluxo de trabalho você mesmo, o que abre uma nova página com um arquivo em modo de edição. Você pode observar vários elementos importantes:

O arquivo tem uma extensão `.yml` e uma sintaxe que pode parecer simplista, mas, no momento, totalmente absurda.

Esta é a `linguagem" YAML (YAML Ain't Markup Language)` que quer ser um formato minimalista (mais leve que JSON) para descrever as propriedades de um objeto.

Portanto, em um único arquivo e escrito usando YAML que descreveremos nosso fluxo de trabalho.

O arquivo é chamado de "main.yml", mas você pode renomeá-lo como achar melhor, desde que mantenha a extensão correta.

- [x] O arquivo é criado diretamente no seu repositório, junto com seu código-fonte, mas localizado na pasta `.github/workflows`.
- [ ] Esta pasta deve ser nomeada exatamente assim;
- [ ] É o caminho onde o GitHub espera encontrar os fluxos de trabalho para usar.

Isso significa que toda vez que você quiser adicionar seu próprio fluxo de trabalho, é nesta pasta específica que ele terá que registrá-lo e não em outro lugar `.github` corresponde a uma pasta oculta no Linux.

```
.github/
├── workflows/
│   ├── ci.yml
│   └── deploy.yml
├── actions/
│   └── custom-action/
├── ISSUE_TEMPLATE/
│   ├── bug-report.md
│   └── feature-request.md
├── environments/
│   └── production.yml
├── CODEOWNERS
├── dependabot.yml
└── SECURITY.md
```

Neste caso, você também pode encontrar fluxos de trabalho em uma subpasta chamada workflows, templates e outros arquivos usados para personalizar o uso do GitHub.

Reserve um tempo para olhar o conteúdo pré-preenchido do arquivo 01-60pportuinties-workflow.yml:

```
name: 01-60pportuinties-workflow
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  workflow_dispatch:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Use Node.js
      uses: actions/setup-node@v4
    - run: npm install
    - run: gulp build
    - uses: actions/upload-artifact@v4
      with:
        name: MyPackage
        path: dest
```

Aqui indicamos que nosso fluxo de trabalho terá que ser acionado no caso de um commit em um branch, no caso de uma solicitação de pull ou após um lançamento manual.

Esta máquina virtual é criada perfeitamente em servidores GitHub, você não precisa se preocupar com isso por enquanto.

- [x] Uma ação indica que queremos instalar o NodeJS na máquina virtual que executará o fluxo de trabalho.

```
- name: User Nodes
  uses: actions/setup-node@v4
```

- [x] Uma ação que inicia um comando npm install, que analisará os pacotes necessários do nosso código-fonte (eles estão listados no arquivo /src/packages.json) e os instalará localmente (=na máquina virtual).

- run: npm install

- [x] Uma ação executa o comando gulp build, que usa os pacotes baixados pelo NPM para transformar nosso código PUG em XHTML e, em seguida, copiará o resultado gerado em uma pasta /dest. Todas essas mecânicas ocultas estão escritas no arquivo gulpfile.js, mas você não precisa se preocupar com isso.

- run: gulp build

- [x]Uma ação que pegará todos os arquivos gerados na pasta /dest, nossa página HTML gerada e o arquivo CSS, compactará como MyPackage e, em seguida, fará o upload deste arquivo para o portal do GitHub.

```
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Use Node.js
      uses: actions/setup-node@v4
    - run: npm install
    - run: gulp build
    - uses: actions/upload-artifact@v4
      with:
        name: MyPackage
        path: dest
```
## Analisando os resultados
Se você clicar na execução do seu fluxo de trabalho (chamado `run`), você chegará na tela de resultados.
### Resultados
Esta tela é separada em várias subpartes:
- [x] No lado esquerdo está a lista de trabalhos no seu fluxo de trabalho;
- [x] O status geral do fluxo de trabalho, seu **tempo de execução**, **o tempo cobrado** (livre até um certo número) e o **número de elementos** (artefatos) que foram gerados;
- [x] Logo abaixo está a visualização do gráfico. Permite ver as relações entre os diferentes elementos e o status dos diferentes estágios.
- [x] A seção Anotações que lista todos os avisos e erros importantes do fluxo de trabalho.
- [x] Todos os fluxos de trabalho não geram artefatos, mas quando o fazem como aqui, eles são listados aqui.
- [x] No lado esquerdo, se você clicar no trabalho chamado build, verá os resultados detalhados de cada ação do fluxo de trabalho. Este é o lugar onde você **verifica os logs** para validar se seu fluxo de trabalho se comporta conforme o esperado.
- [X] Clique no artefato MyPackage e baixe o arquivo zip, e então configure-o:
    - [X] Ele deve conter dois arquivos: index.html e main.css.
    - [X] Se você abrir o arquivo com um navegador da web, você deve ver o resultado: nosso adorável panda animado.

## Algumas observações sobre YAML
O formato YAML já tem 20 anos, mas só recentemente é amplamente conhecido, a ponto de substituir os formatos XML e JSON para tudo o que está relacionado à configuração ou descrição.

Além disso, seu formato simples, em formato livre e sem nenhuma tag, o torna um formato leve, muito legível e utilizável para qualquer necessidade; portanto, o GitHub tornou o elemento central das Ações do GitHub.

Um arquivo YAML pode, no caso do GitHub Actions, ser resumido com três elementos:
- [X] Elementos de chave/valor
    - [X] Os elementos de chave/valor são compostos de um nome de chave, seguido pelo caractere de coluna ":" e finalmente por seu valor. Aqui estão alguns exemplos: **key: value** # observe o espaço após os dois pontos ":", mas não antes
    ```
    keyNumeric: 1235
    keyBoolean: false
    OtherKey: "Hello world" # entre aspas porque o valor contém espaços
    cmd: "echo"
    ```
- [X] Elementos aninhados
- [X] Matrizes de elementos

O valor deve estar em uma linha. No entanto, se você precisar de um valor multilinha, é necessário usar o caractere pipe "|":
```
key: | # caractere que indica que as linhas a seguir
      $var = "hello" # fazem parte de um único bloco
      echo $var # atribuído à chave
```
Então vêm os elementos aninhados. É uma chave que não tem nenhum valor, mas tem subelementos que precisam ser recuados. O recuo em YAML é feito com dois espaços (sem tabulações):

```
a_nested_key:
   key: value    # subelemento recuado por dois espaços
   other_key: other value # sub-element at the same level
   other_nested_key:     #sub-element too
            hello: hello # sub sub-element indented by two spaces
 jobs: # new first-level element so no indented
    build:
      runs-on: self-hosted
```
Por fim, vêm os elementos cujo valor é uma lista de objetos. Eles estão disponíveis em duas formas.
Primeiro vem a lista de valores escritos na mesma linha em um array, representados por colchetes.

```
   weekDay: ['Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday'] # string array
   oddNumbers: [1,3,5,7,9] # List of numeric values
   os: [self-hosted, windows-latest, macos-latest]
```

Depois vêm os objetos mais complexos, inclusive quando cada valor do array também é um objeto. Neste caso, o formato acima não funciona, e um novo formato é necessário. Nele, cada elemento é representado por um traço sem recuo.

```
students:
    - firstname: Jean    # element, no indentation
      name: Dupont       # property of the same element
    - firstname: Marine  # new element
      name: Leblanc      # property of the second element
addresses:
    - name: "personal address"
      street: 1 Wisteria Lane
city:
  name: Paris   # sub-property and therefore indentation
  postalCode: 75001
 - name: "second address"
 - street: 2 Geek street

  city:
    name: Courbevoie
     postalCode: 92400
```
**Observação**: Para conseguir ler estes arquivos utilize o utilitário Json(jq) e Yaml(yq).

- [x] `yq -r '.students[].firstname, .students[].name' students.yml`
- [x] `jq -r '.students[].firstname' students.json`

## Triggers
Os gatilhos são, como o nome indica, os meios para especificar o critério de início de um fluxo de trabalho, e todo fluxo de trabalho deve conter um ou mais gatilhos. Existem três categorias de gatilhos:

- [x] Gatilhos automáticos;
- [x] Gatilhos de schedulle;
- [x] Gatilhos manuais;

### Gatilhos automáticos
Ao criar um fluxo de trabalho, você deve primeiro definir sua finalidade e as condições para acioná-lo.

O caso mais comum é querer um gatilho sempre que uma nova versão do código-fonte estiver disponível, para verificar se tudo pode ser compilado corretamente.

No mundo do Git, significa agir assim que um dos desenvolvedores envia seu código para o servidor.

Portanto, estamos falando aqui sobre integração contínua ("CI").

Em termos de sintaxe, em nosso arquivo, usaremos a palavra-chave "on:" que significa "no caso de", e especificaremos o termo "push" para indicar cada vez que um commit é enviado para o servidor.

`on: push`

Da mesma forma, é possível disparar o fluxo de trabalho quando uma solicitação de pull é realizada quando o desenvolvedor solicita "push" seu código para uma ramificação de outra ramificação.

A pequena diferença com o caso anterior é que ele é disparado antes que seu código seja mesclado na ramificação de destino.

É possível agir e bloquear modificações se um problema for detectado.

No caso de "push", é tarde demais, o código já está na ramificação e, se o código tiver algum erro, a ramificação será quebrada, o que pode impactar outros desenvolvedores.

```
on:
  push:            # inicia em cada push
   pull_request:   # ou solicitação de pull
```

Eventos como push e pull_request são numerosos.

Aqui está uma lista não exaustiva dos mais comuns. Você verá alguns deles neste livro:

| Evento           | Disparo                                                    |
| ----             | ----                                                       |
| create           | Quando uma ramificação ou uma tag é criada                 |
| delete           | Quando uma ramificação ou uma tag é excluída               |
| gollum           |  Quando uma página wiki é criada ou modificada             |
| issue_comment    | Quando um problema do GitHub é criado, editado ou excluído |
| registry_package | Quando um pacote* é publicado                              |
| release          | Quando uma versão é criada, excluída, editada              |

- [x] Pacotes: São binários, bibliotecas ou imagens (como .npm, .jar, .docker, .nuget) publicados em um registro do GitHub.
- [x] Artefatos: São arquivos temporários gerados durante um workflow (ex: logs, binários, relatórios de teste).

## Filtros
Se um gatilho for executado a cada modificação de código, seria normal nos questionarmos como lidar com isso no caso de um projeto mais complexo, seja porque ele contém várias ramificações ou porque apenas um repositório tem vários aplicativos dentro dele e cada um requer um fluxo de trabalho dedicado que não queremos ver ser acionado quando não deveria.

Essa especialização do fluxo de trabalho é feita com os filtros que se aplicam em combinação com o critério de gatilho.
### Filtros por branch
Em alguns eventos como push e pull_request, é possível especificar o branch que deve disparar o fluxo de trabalho (main por exemplo). Então, se um novo código de versão for enviado para outro branch, o fluxo de trabalho não será acionado.

```
on:
  push: # quando o código for enviado
   branches: # quando o código for enviado
      - main
```

Também é possível especificar múltiplos branches nominalmente ou, ao contrário, um conjunto de branches

```
on: #fires
  push:
     branches:
        - main
        - features/**
        - "**bug**'
```

Mas também é possível excluir certos branches.

```
on:
  push:
     branches-ignore: # on all branches
       - main #except the main branch
```


#### Aviso
- [x] **Você não pode usar branches e branches-ignore no mesmo fluxo de trabalho**.
- [x] Você deve usar a listagem explícita (white-Listing) ou a exclusão explícita (black-listing). Se precisar de ambas, é necessário usar o caractere "!" para fazer um padrão negativo escolhendo apenas uma das duas palavras-chave.

```
on:
 push:
   branches:
      - '**'       # Executa em todas as branches...
      - '!develop' # ...exceto develop.
```
## Os filtros por caminho
Também é possível ser ainda mais granular com base na adição de código, mas apenas quando ele está localizado em um arquivo específico ou em uma pasta específica.

Isso é particularmente útil quando você tem **vários aplicativos no mesmo repositório**, mas cada um precisa de um fluxo de trabalho dedicado, como um aplicativo Android e iOS.

```
name: 52-patch_validation
on:
  workflow_dispatch:
  push:
    branches:
      - main                   # Só executa na branch main
    paths-ignore:
      - '**'                    # Ignora qualquer alteração **
      - '!resource/**'
jobs:
  validate-resources:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: List modified files (debug)
        run: |
          echo "Arquivos modificados (exceto java/):"
          git diff --name-only HEAD^ HEAD -- . ':!java/**'
      - name: Validate Resource Changes
        run: |
          if [ -n "$(git diff --name-only HEAD^ HEAD -- resource/)" ]; then
            echo "✅ Alterações válidas em resource/ detectadas"
            # Adicione comandos de validação aqui (ex: testes, scripts)
          else
            echo "❌ Nenhuma alteração em resource/ (workflow não deveria ter sido acionado)"
          fi
```
#### Aviso
- [x] Não é possível usar **paths e paths-ignore** no mesmo fluxo de trabalho.
- [x] Quanto aos branches, você pode excluir paths com o uso do caractere "!'
- [x] Ou, por outro lado, é possível ignorar alguns paths:

```
on:
  push:
    paths-ignore:
       - 'docs/**
```

### Scheduled trigger
Este gatilho serve em particular para as compilações que são comumente chamadas de **Nightly Builds**.

Essas compilações são (geralmente) iniciadas à noite, mas descorrelacionadas do processo de CI/CD, seja porque realizam tratamentos longos (ex.: varredura de código mais avançada) ou porque as ações do fluxo de trabalho não são necessárias para o escopo da Integração Contínua (ex.: geração de um relatório de qualidade de código)

Essa configuração é feita adicionando a propriedade schedule e um parâmetro cron, conforme mostrado no exemplo abaixo:

```
on:
  schedule:
    - cron: '0 0 * * *' #Every day at midnight
```

Esta formatação usa a terminologia crontab que permite que você defina qualquer agendamento.

No exemplo anterior, "0 0 * * *" 0 significa 0 minutos, às 0 horas (meia-noite), todos os dias, todos os meses, todos os dias da semana. Você pode especificar qualquer coisa, desde que respeite o intervalo mínimo de 5 minutos. Link útil:

- [x] [Crontab-Guru](https://crontab.guru/)
- [x] [Crontab-Maker](http://www.cronmaker.com)

Um exemplo de uso pode ser um fluxo de trabalho que começa toda segunda-feira às 9h antes da reunião standup e fecha os problemas abertos que não estão mais ativos.

```
name: 52-marca_e_fecha_issue_e_pull_request
on:
#  schedule:
#    - cron: '0 0 * * *'  # Executa diariamente à meia-noite (UTC)
  workflow_dispatch:      # Permite execução manual
permissions:
  contents: write # only for delete-branch option
  issues: write
  pull-requests: write
jobs:
  stale:
    runs-on: ubuntu-latest
    steps:
      - name: Mark and Close Stale Issues/PRs
        uses: actions/stale@v8
        with:
          days-before-issue-stale: 30
          days-before-issue-close: 7
          stale-issue-label: 'stale'
          stale-issue-message: |
            ⏳ Esta issue está inativa há 30 dias.
            **Ela será fechada em 7 dias** se não houver novas interações.
            Caso ainda seja relevante, comente aqui para mantê-la aberta!

          # Configurações para PRs
          days-before-pr-stale: 30      # Marca PRs após 30 dias inativos
          days-before-pr-close: 7       # Fecha 7 dias após ser marcado
          stale-pr-label: 'stale'       # Rótulo aplicado a PRs inativos
          stale-pr-message: |
            ⏳ Este PR está inativo há 30 dias.
            **Será fechado em 7 dias** se não houver atualizações.
            Reative-o com um comentário ou commit se ainda for importante!

          # Configurações gerais
          repo-token: ${{ secrets.GITHUB_TOKEN }}
          exempt-issue-labels: 'pinned,high-priority'  # Ignora issues com esses rótulos
          exempt-pr-labels: 'critical'                 # Ignora PRs com esses rótulos
          operations-per-run: 100       # Limite de operações por execução
```

- [x] **Atenção**: Por motivos de sustentabilidade, o **GitHub desabilita qualquer fluxo de trabalho agendado quando não há atividade no repositório nos últimos dois meses**.

Você recebe um e-mail para estender manualmente a atividade do seu fluxo de trabalho por 60 dias.

Uma alternativa é usar esta ação (https://github.com/gautamkrishnar/keepalive-workflow) que simula a atividade no repositório.

```
name: 52-atualiza-readme
on:
  workflow_dispatch:
permissions:
  contents: write # only for delete-branch option
  issues: write
  pull-requests: write
#  schedule:
#    # Runs at 12 am UTC
#    - cron: "0 0 * * *"
jobs:
  update-readme:
    environment: DESENVOLVIMENTO
    name: Update this repo's README
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Update README with WakaTime stats
        uses: athul/waka-readme@master
        with:
          GH_TOKEN: ${{ secrets.MKDOCS_TOKEN_PAT_ESTUDO }}
          WAKATIME_API_KEY: ${{ secrets.WAKATIME_API_KEY }}
          ### meta
          REPOSITORY: horaciovasconcellos/horaciovasconcellos # optional
          ### content
          SHOW_TITLE: true
          BLOCKS: -> # optional
          TIME_RANGE: all_time # optional
          LANG_COUNT: 10 # optional
          SHOW_TIME: true # optional
          SHOW_TOTAL: true # optional
          SHOW_MASKED_TIME: false # optional
          STOP_AT_OTHER: true # optional
          ### commit
          COMMIT_MESSAGE: Updated waka-readme graph with new metrics # optional
          TARGET_BRANCH: main # optional
          TARGET_PATH: README.md # optional
          COMMITTER_NAME: 'HVasconcellos'
          COMMITTER_EMAIL: 'horacio.vasconcellos@gmail.com'
          AUTHOR_NAME: 'HVasconcellos'
          AUTHOR_EMAIL: 'horacio.vasconcellos@gmail.com'
      - name: Keep workflow alive
        uses: gautamkrishnar/keepalive-workflow@v2
        with:
          commit_message: 'Mensagem de Execução'
          committer_username: 'HVasconcellos'
          committer_email: 'horacio.vasconcellos@gmail.com'
      - name: Log completion
        run: echo "Workflow concluído com sucesso."
```

### Manual triggering
O gatilho manual é particularmente útil quando você quer que a ação seja disparada por um humano, como implantar em um ambiente após uma fase de teste.

Este gatilho é especial porque você tem que usar o evento workflow_dispatch que indica que o fluxo de trabalho pode ser iniciado a partir de um item externo (por exemplo, **outro fluxo de trabalho, uma chamada de API ou... um humano**).

Uma vez configurado, o fluxo de trabalho pode ser acionado a partir de um fluxo de trabalho de terceiros e manualmente a partir do portal GitHub.

Os gatilhos manuais também podem fornecer parâmetros de entrada ao iniciar o fluxo de trabalho para dar a eles um pouco de dinamicidade.

Essas configurações são declaradas com as entradas de propriedade. É possível então definir um parâmetro que tenha propriedades diferentes:

É claro que é possível definir vários parâmetros, cada um com sua configuração.

O GitHub cuida apenas de gerar um formulário contendo os parâmetros de entrada e então transmitir os valores para seu fluxo de trabalho.
Você ainda precisa configurar seu fluxo de trabalho para usar esses parâmetros.
Aqui está um exemplo de um fluxo de trabalho que pede para fornecer dois parâmetros obrigatórios, um dos quais já tem um valor padrão.

```
name: 52_manual_opcoes
on:
  workflow_dispatch:
    inputs:
      logLevel:
        description: 'Log level'
        required: true
        default: 'warning'
        type: choice
        options:
          - info
          - warning
          - debug
      print_tags:
        description: 'True to print to STDOUT'
        required: true
        type: boolean
      tags:
        description: 'Test scenario tags'
        required: true
        type: string
      environment:
        description: 'Environment to run tests against'
        type: environment
        required: true

jobs:
  print-tag:
    runs-on: ubuntu-latest
    if: ${{ inputs.print_tags }}
    steps:
      - name: Print the input tag to STDOUT
        run: |
               echo  The tags are ${{ inputs.tags }}
               echo  The tags are ${{ inputs.print_tags }}
               echo  The tags are ${{ inputs.environment }}
               echo  The tags are ${{ inputs.logLevel }}
```

#### Disparar manualmente com parâmetros
O formato um tanto particular $ {{ github.event.inputs.environment }} que representa uma variável do GitHub é abordado no capítulo.
Lembre-se apenas por um momento que este formato informa o fluxo de trabalho:

- [x] Entre as variáveis do GitHub;
- [x] Procure nas propriedades do evento que disparou o workflow;
- [x] Procure entre seus parâmetros de entrada (inputs);
- [x] Então recupere o valor do parâmetro chamado "logLevel"

Desde novembro de 2021, agora é possível atribuir tipos para parâmetros. Se as configurações fossem todas string (agora o tipo padrão), agora é possível especificar tipos como **boolean, choice ou environment**:

Também é possível dar um nome dinâmico ao fluxo de trabalho usando essas entradas. Em vez de usar a propriedade name, você pode usar a propriedade run-name

run-name: O fluxo de trabalho cumprimentará ${{ inputs.name}} por @${{ github.actor}}

### Desabilitar/ignorar gatilhos temporariamente
Pode acontecer de você querer alterar um ou mais arquivos, mas não querer acionar o fluxo de trabalho associado a este evento (push ou pull-request).

Por exemplo, quando você edita um arquivo que não é relevante para a implantação, como um arquivo README.md.

Um truque não documentado consiste em inserir uma palavra-chave no comentário de um commit ou pull_request, e o GitHub ignorará o evento e não acionará o fluxo de trabalho.

A lista de possíveis palavras-chave para desabilitar temporariamente um fluxo de trabalho é a seguinte: **[skip ci], [ci skip], [no ci], [skip actions] ou [actions skip] (não se esqueça dos colchetes)**.

### Desativar um fluxo de trabalho
Se desabilitar temporariamente for útil, isso requer nunca omitir a inserção de uma das palavras-chave de desativação para cada commit.

Uma alternativa é desabilitar um fluxo de trabalho totalmente (until reactivated);

O arquivo YAML permanece presente e funcional, mas tecnicamente o GitHub não o acionará até novo aviso.

A desativação (ou reativação) é realizada por meio da aba Ações do repositório; ao clicar em um dos fluxos de trabalho no canto superior direito, clique no botão "..." e escolha "Desativar fluxo de trabalho".

### Exercícios
Agora, vamos aplicar o que você acabou de aprender fazendo alguns exercícios.

#### Exercício n°1
Aqui está um fluxo de trabalho que fecha os bugs que são muito antigos. Modifique-o para que ele seja executado todas as noites às 19h30, de segunda a sexta-feira.

```
name: 52-fecha-bugs
on:
  schedule:
    # Executa às 19:30 UTC (16:30 BRT) de segunda a sexta-feira
    - cron: '30 19 * * 1-5'
  workflow_dispatch:  # Permite execução manual

jobs:
  fechar-bugs-antigos:
    runs-on: ubuntu-latest
    steps:
      - name: Verificar bugs antigos
        uses: actions/github-script@v6
        with:
          script: |
            const { data: issues } = await github.rest.issues.listForRepo({
              owner: context.repo.owner,
              repo: context.repo.repo,
              state: 'open',
              labels: 'bug',
              sort: 'created',
              direction: 'asc',
              per_page: 100
            });

            const cutoffDate = new Date();
            cutoffDate.setDate(cutoffDate.getDate() - 30); // 30 dias atrás

            for (const issue of issues) {
              const createdAt = new Date(issue.created_at);
              if (createdAt < cutoffDate) {
                await github.rest.issues.update({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: issue.number,
                  state: 'closed'
                });

                await github.rest.issues.createComment({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: issue.number,
                  body: 'Este bug foi fechado automaticamente por estar aberto há mais de 30 dias sem atualização. Se ainda for relevante, por favor reabra.'
                });

                console.log(`Fechado bug #${issue.number}: ${issue.title}`);
              }
            }

```

#### Exercise n°2
Altere este fluxo de trabalho para ser acionado sempre que o código for enviado em qualquer branch. Adicione um segundo gatilho quando uma solicitação de pull for feita no branch principal

```
name: Fechar Bugs Antigos
on:
  push:
    branches:
      - '**'
  pull_request:
    branches:
      - 'main'
  schedule:
    - cron: '30 19 * * 1-5'

jobs:
  fechar-bugs-antigos:
    if: github.event_name == 'schedule'
    runs-on: ubuntu-latest
    steps:
      - name: Verificar bugs antigos
        uses: actions/github-script@v6
        with:
          script: |
            const { data: issues } = await github.rest.issues.listForRepo({
              owner: context.repo.owner,
              repo: context.repo.repo,
              state: 'open',
              labels: 'bug',
              sort: 'created',
              direction: 'asc',
              per_page: 100
            });

            const cutoffDate = new Date();
            cutoffDate.setDate(cutoffDate.getDate() - 30); // 30 dias atrás

            for (const issue of issues) {
              const createdAt = new Date(issue.created_at);
              if (createdAt < cutoffDate) {
                await github.rest.issues.update({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: issue.number,
                  state: 'closed'
                });

                await github.rest.issues.createComment({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: issue.number,
                  body: 'Este bug foi fechado automaticamente por estar aberto há mais de 30 dias sem atualização. Se ainda for relevante, por favor reabra.'
                });

                console.log(`Fechado bug #${issue.number}: ${issue.title}`);
              }
            }

  # Novo job para executar em push/pull_request (opcional)
  validacoes:
    if: github.event_name != 'schedule'
    runs-on: ubuntu-latest
    needs: fechar-bugs-antigos
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Echo Event
        run: |
          echo "Evento disparador: ${{ github.event_name }}"
          echo "Branch: ${{ github.ref }}"
          echo "SHA: ${{ github.sha }}"

```

#### Exercício n°3
Disparar o fluxo de trabalho quando os arquivos com extensão ".yml" forem modificados durante um pull request, exceto aqueles que têm uma pasta pai chamada "mkdocs".

```
name: 52-YAML
on:
  pull_request:
    paths:
      - '**.yml'           # Monitora todos arquivos .yml
      - '!mkdocs/**/*.yml'   # Ignora .yml dentro da pasta test

jobs:
  validate-yml:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0  # Necessário para verificar diferenças entre commits

      - name: Get changed YAML files
        id: changed-files
        uses: tj-actions/changed-files@v42
        with:
          files: |
            **.yml
            !mkdocs/**/*.yml

      - name: List modified YAML files
        run: |
          echo "Arquivos YAML modificados (exceto em /mkdocs):"
          echo "${{ steps.changed-files.outputs.all_changed_files }}"

      - name: Validate YAML syntax
        run: |
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
            echo "Validando $file"
            yamllint "$file" || exit 1
          done
```
### Jobs
Cada fluxo de trabalho é composto de um ou mais jobs, que são um grupo de tarefas que um único agente executará. Essas tarefas, chamadas steps.
#### A execução de um job
Um job representa um conjunto de tarefas que serão executadas sequencialmente pelo mesmo agente. Um fluxo de trabalho, portanto, contém pelo menos um job, mas pode ter dezenas deles, se necessário.

O importante a lembrar é que cada job é executado por um agente diferente. Cada job é composto de vários elementos:

- [x] Um nome simples e chave que será exibido se a propriedade name não for preenchida
- [x] Um nome de propriedade (opcional), que serve apenas para legibilidade em logs
- [x] Uma propriedade runs-on, a mais importante, define o tipo de máquina virtual na qual o job será executado.
- [x] Uma propriedade Steps, que contém um conjunto de tarefas a serem executadas

```
jobs:
  print-tag:                      # Um nome simples e chave que será exibido se a propriedade name não for preenchida
    name: Horacio                 # Um nome de propriedade (opcional),
    runs-on: ubuntu-latest        # Define o tipo de máquina virtual na qual o job será executado.
    if: ${{ inputs.print_tags }}
    steps:
      - name: Print the input tag to STDOUT
        run: |
        [...]
```
A seção runs-on é a mais crítica de todas porque você terá que selecionar um sistema operacional específico dependendo das tarefas que você tem que executar.

Por exemplo, escolher uma máquina Windows para compilar um aplicativo .Net  ou uma máquina macOS para construir um aplicativo iOS.

Se você escolher uma tarefa que precisa do Windows e cujas solicitações de fluxo de trabalho são executadas em uma máquina Linux, a tarefa travará no tempo de execução, porque o GitHub não realizou nenhum controle inicial.

Aqui estão as escolhas possíveis atuais de máquinas virtuais:

| Virtual machine     | Label                           |
| ----                | ----                            |
| Windows Server 2022 |  windows-latest or windows-2022 |
| Windows Server 2019 |  windows-2019                   |
| Ubuntu 24.04        | self-hosted ou ubuntu 22.04     |
| macOS Sequoia 15.0  | macos-latest or macos-15        |
| macOS Sonoma 14.0   | macos-latest or macos-14        |
| macOS Ventura 13.0  | macos-13                        |


- [x] Executores ARM: Os executores ARM estão disponíveis apenas para planos Teams/Enterprises.

A maioria dessas VMs vem com 2 CPUs, 7 Gb de RAM e 14 Gb de armazenamento (SSD), mas CPU/RAM são duplicados se seu repositório for público. Se você estiver procurando por executores com processadores Arm64 ou GPU, eles são reservados apenas para os planos de preços Teams/Enterprise.

- [x] Um fluxo de trabalho pode conter vários trabalhos.
- [x] É importante observar que cada um desses trabalhos será executado em uma máquina virtual diferente, mesmo se o mesmo sistema operacional for especificado.
- [x] Portanto, se você planeja transmitir dados de um trabalho para outro, será necessário usar mecanismos mais complexos ou serviços de terceiros.

#### Dependências entre seus trabalhos
Os trabalhos do mesmo fluxo de trabalho são executados **em paralelo e independentementes** um do outro (=iniciar simultaneamente).

Isso permite, por exemplo, compilar um aplicativo para Android em um agente Linux e um aplicativo para iOS em um agente macOS simultaneamente, em vez de um após o outro.

No entanto, há muitos casos em que precisaremos executar os jobs sequencialmente. Para isso, é necessário adicionar o atributo needs no job que queremos ver executando após o outro:

```
jobs:
  job1:
  job2:
     needs: job1
   job3:
     needs: [job1, job2]
```
No exemplo anterior, o job1 deve ser executado inteiramente e com sucesso para que o job2 comece.

Uma vez que o job2 for concluído com sucesso, o job3 será iniciado porque depende do job1 e do job2. Poderíamos ter apenas colocado uma dependência no job2 neste caso.

Também é possível configurar um job para que ele seja executado após outro job que foi concluído com sucesso ou não.

Útil para um job de limpeza final, por exemplo. Este comportamento é configurado usando a palavra-chave condicional if e o valor always().

```
  jobs:
    job1:
      job2:
        needs: job1
        if: always()  # diz que será executado aconteça o que acontecer# mas depois do job1
```

Por outro lado, é possível executar um job somente se o job do qual ele depende falhou. Portanto, é comum usar esse tipo de etapa de configuração para ações de cancelamento que não foram bem-sucedidas (rollback):

```
      job1:
        job2:
          needs: job1
        if: failure() # indica que ele só será executado se o Job1 falhar
```

Os status possíveis são:

| Condição    | Descrição                                  |
| -----       | ----                                       |
| success()   | Quando o trabalho anterior foi (implícito) |
| failure()   | Quando o trabalho anterior falhou          |
| cancelled() | Quando o trabalho anterior foi cancelado   |
| always()    | O tempo todo, se os trabalhos anteriores foram bem-sucedidos ou não |

## Limitações
Embora alguns limites sejam altos, há limitações no número de trabalhos executados em paralelo na mesma conta do GitHub.

| Plano       | Max Parallel Jobs | Max Parallel Jobs MacOS |
| ----        | ----:             | ----:                   |
| Free        |  20               |  5                      |
| Pro         |  40               |  5                      |
| Team        |  60               |  5                      |
| Enterprise  | 150               | 50                      |

Essas limitações devem ser consideradas ao dividir seus fluxos de trabalho, especialmente se você os usa em projetos profissionais com várias pessoas trabalhando em paralelo.

Também há limites no **tempo de execução**.

Por exemplo, cada tarefa não pode ser executada por mais de **6 horas** e o total de horas de um fluxo de trabalho que está executando várias tarefas (ou usa uma matriz) não pode exceder **72 horas**.

### Exercício

#### Exercício n°1
Analise o próximo fluxo de trabalho e tente adivinhar o que será exibido no console.

```
name: 52_nao_sei_a_ordem
on:
  workflow_dispatch:
jobs:
  job1:
    runs-on: ubuntu-latest
    steps:
      - run: |
              echo "Hello"
  job2:
    needs: job1
    runs-on: ubuntu-latest
    steps:
       - run: echo "how"
  job3:
    needs: [job1, job2]
    runs-on: ubuntu-latest
    steps:
       - run: |
               echo "are"
  job4:
   runs-on: ubuntu-latest
   steps:
         - run: echo "you?"
```
#### Exercício n°2
Neste segundo exercício, você é solicitado a concluir o fluxo de trabalho para que o job2 seja disparado somente se o job1 falhar e o job3 seja iniciado, aconteça o que acontecer. Por exemplo, o job1 falha se o fluxo de trabalho for executado durante o fim de semana. Novamente, não altere nenhuma propriedade ou linha de código existente; você só pode adicionar novas linhas.

```
name: 52_nao_sei_a_ordem
on:
  workflow_dispatch:
jobs:
  job1:
    runs-on: ubuntu-latest
    steps:
        - run: |
                dayOfWeek=$(date +%u) # calculates the day of the week
                if ($dayOfWeek > 5)
                    then
                   exit 1
                fi
  job2:
     runs-on: ubuntu-latest
     needs: job1
     steps:
        - run: echo "Something went wrong"
  job3:
    runs-on: ubuntu-latest
    needs: job2
    steps:
        - run: echo "I am running whatever happens"
```
#### Exercício n°3
É comum que um fluxo de trabalho tenha vários trabalhos. Aqui está um exemplo simples em que a primeira parte escreve alguma mensagem em um arquivo de texto, e a segunda etapa, que dispara após a primeira, lê e exibe o conteúdo do arquivo de texto.
Qual é a exibição do fluxo de trabalho a seguir?

```
name: 52_nao_sei_a_ordem
on: [workflow_dispatch]
jobs:
  # Job 1: Escreve no arquivo
  escrever-arquivo:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Criar arquivo
        run: |
          echo "Esta mensagem foi gerada em $(date)" > output.txt
          cat output.txt  # Exibe o conteúdo (opcional)

      - name: Upload do arquivo
        uses: actions/upload-artifact@v4
        with:
          name: arquivo-output
          path: output.txt

  # Job 2: Lê o arquivo (depende do Job 1)
  ler-arquivo:
    needs: escrever-arquivo  # Espera o Job 1 completar
    runs-on: ubuntu-latest
    steps:
      - name: Download do arquivo
        uses: actions/download-artifact@v4
        with:
          name: arquivo-output

      - name: Exibir conteúdo
        run: |
          echo "Conteúdo do arquivo:"
          cat output.txt
Update 52_nao_sei_a_ordem.yml · horaciovasconcellos/estudo-actions@cf700ef
```

## The steps
A parte mais rica de um fluxo de trabalho é representada pelo bloco steps que contém todas as ações que um fluxo de trabalho executa. Essas ações são precisamente essas famosas GitHub Actions, módulos que executam uma tarefa específica e que podem ser facilmente combinados dentro de um fluxo de trabalho.

Você pode escolher entre:

- [x] Executar um comando, uma linha de comando simples ou uma série de comandos
- [x] Executar uma Action, um módulo rico, personalizável e reutilizável criado anteriormente por outra pessoa

## Executar um comando
A execução de um comando é o equivalente a uma tarefa CMD no Windows ou um comando bash no Linux. Ele executa uma linha de comando simples e retorna o resultado para o console. Frequentemente usado para exibir uma mensagem, para executar uma operação em arquivos, às vezes é usado para iniciar comandos do sistema ou scripts de terceiros como vimos no capítulo anterior com "npm install" e "gulp build". Este tipo de tarefa é reconhecível pela presença da palavra-chave run.

Uma etapa de execução se parece com isso: `- run: echo 'Execução do meu comando'`

Caso você queira executar vários comandos, você terá a opção entre duplicar cada etapa com um único comando ou usar um caractere pipe (1) e combinar comandos com o seguinte formato:

```
steps:
 #way of doing no 1
  - run: echo 'Hello'
  - run: echo 'World'
#way of doing n°2-
run: | # Indicates that multiple commands have to be executed
      echo 'Hello'
      echo 'World'
```

A escolha de um ou outro tem forte incidência porque cada tarefa (passo) é executada em um contexto diferente. Assim, se um comando define uma variável local, o próximo passo não pode acessar essa variável. Veremos mais adiante como é possível fazer a mesma coisa usando variáveis de saída e/ou ambientes.

```
steps:
    - run: MY_VARIABLE="hello"
    - run: echo $MY_VARIABLE # does not work
```

Também é comum dar um alias para cada etapa por meio do nome da propriedade, o que, embora completamente opcional, traz mais clareza:

```
  steps:
    - name: My first command
      run: echo 'Execution of my command'
    - name: my second command
      run: echo 'Execution of my second command'

```
Esta propriedade facilita a diferenciação e análise de logs de execução de fluxo de trabalho exibidos no portal da Web GitHub.

Uma das propriedades mais interessantes para execuções de comando é a propriedade shell que permite especificar o interpretador do comando. Assim, é possível executar um comando do PowerShell ou do sistema sem configuração adicional ou instalação de um tempo de execução específico.

```
steps:
 - name: Start a PowerShell command
    run: Write-Host "Hello"
  shell: pwsh # specifies that we want a PowerShell shell
- name: Start a Python command
   run: print("Hello")
   shell: python # specifies that we want a python shell
```

Esta propriedade shell pode ter valores diferentes, cada um direcionando um ambiente de linha de comando específico que depende do ambiente que foi designado para a execução do trabalho (runs-on). Aqui está a lista exaustiva:

```
Platform | Setting | Descriptio | Commandnlaunched  |
All      | bash    | The default shell on non- | bash -noprofile |
```

Essa liberdade permite executar scripts personalizados e especificar o interpretador relevante. No caso a seguir, o código snippet permite que você execute um script bash:

```
 steps:
   - run: ./.github/scripts/build.sh
    shell: bash
```

Além das propriedades name e shell, cada passo de comando (e os "passos de ação" que veremos logo depois) tem propriedades adicionais opcionais que serão vistas em detalhes ao longo dos capítulos deste livro. Entre essas propriedades, você encontrará em particular:

- [x] id: identificador único do passo quando você deseja interagir com o passo, como recuperar suas variáveis de saída ⚫
- [x] with: para transmitir parâmetros para o comando/ação
- [x] env: para declarar variáveis locais no nível do passo
- [x] if: para tornar condicional a execução do passo
- [x] continue-on-error: para evitar que um passo seja considerado como falha mesmo quando um problema surge ou que um de seus comandos retorna um código de erro
- [x] timeout-minutes: para forçar a parada de um passo se ele exceder o limite de tempo

## Execução de uma Ação
Suponha que seja possível fazer quase tudo apenas com passos run. Nesse caso, o verdadeiro poder do GitHub Actions vem da possibilidade de chamar diretamente módulos de script complexos que outras pessoas criaram. Esses módulos (os famosos GitHub Actions) são, como veremos mais adiante no livro, scripts simples colocados em um pacote que facilita seu download, configuração e execução.

Você pode chamar uma Action com a palavra-chave uses, especificando o nome e a "versão" da ação a ser executada. Isso pode ser feito usando três variações:
1. usando a versão da ação: que permite direcionar uma versão específica (um lançamento correspondente a essa versão deve ter sido criado)
2. via branch da ação: que permite usar uma versão em desenvolvimento sem precisar de nenhum lançamento existente
3. via hash da ação: pode direcionar um commit específico. Cada um desses métodos fornece o mesmo resultado em termos de execução, mas corresponde a diferentes casos de uso. Por exemplo, quando criamos nossa ação, e ela está sendo desenvolvida, é mais fácil usar o branch de desenvolvimento dessa ação. Dessa forma, se a criação for feita de forma iterativa, o fluxo de trabalho sempre pegará a última versão, e a publicação do release oficial só precisará ser feita quando o código estiver pronto:

```
- uses: Igmorand/github-action-hello@main # take the main branch
```

Este método deve ser reservado para desenvolvimento e uso de suas ações. Não o use para ações de terceiros; o risco é muito grande para quebrar seu fluxo de trabalho ou de uma perspectiva de segurança. A prática atual é confiar em uma versão "fixa" de uma ação que garanta a estabilidade do código. O conceito de versionamento é visto em detalhes em um capítulo posterior neste livro; veja isso simplesmente como uma versão de software. Quando uma ação é estável e totalmente funcional, é costume que o código seja marcado para congelar sua versão. É então possível direcionar a tag, que serve como o número da versão.

```
- uses: 1gmorand/github-action-hello@v1 # V1 is the tag corresponding to a release
```
Na última maneira, a chamada via hash de uma ação tem como alvo um commit específico. Em alguns casos, essa maneira de fazer as coisas é considerada uma boa prática de segurança, mas vem com limitações. Este tópico é discutido no capítulo Conceitos avançados › Segurança.

```
uses:1gmorand/github-action- hello@4ad9596b7c626f5cef5b66419d00bafac1950066 # hash (SHA)of a commit
```

É o único método para garantir uma versão imutável da ação carregada em seu fluxo de trabalho. Se isso pode ser lógico à primeira vista, isso significa que se a ação, que está em um repositório próprio, altera ou corrige um bug nela, essa correção/melhoria nunca será cobrada pelo seu fluxo de trabalho. Por outro lado, se você referenciar uma ação "v1", seu fluxo de trabalho baixará quaisquer atualizações dela. Então, se o autor da ação publicar uma versão "v1.1",
ela será cobrada pelo seu fluxo de trabalho sem nenhuma intervenção de sua parte ou sem ser notificado porque v.1.1 é uma versão de lançamento menor de v.1.

Importante: Se você quiser saber mais sobre essas mecânicas, leia o capítulo dedicado: Criar uma Ação › Versionamento. Você encontrará todos os pontos de atenção e como usá-los seguindo as boas práticas.

Também há a opção de chamar uma Ação privada. Uma Ação privada é qualquer Ação que vem do mesmo repositório do qual é chamada. Esse mecanismo é útil quando você deseja usar uma Ação de sua criação sem expô-la ao público. Atualmente (embora esteja no roteiro do GitHub), uma ação deve estar em um repositório público para ser utilizável. Portanto, é impossível usar uma ação que viria de outro repositório pertencente a você sem ser exposto ao público.

Para usar uma Ação privada, basta especificar o caminho da pasta que contém os diferentes arquivos em sua ação:

`- uses: ./chemin/github-action-hello`

Por convenção, espera-se que ações privadas sejam armazenadas na pasta .github/actions, mas isso não é obrigatório. Por outro lado, fluxos de trabalho devem estar em .github/workflows.

`- uses: ./.github/actions/github-action-hello`

A combinação de ações e tarefas de execução oferece infinitas possibilidades. Portanto, é normal (até recomendado) usar as Ações o máximo possível e concluir o fluxo de trabalho com tarefas de execução quando nenhuma ação atende à sua necessidade ou se a necessidade é tão simples que o uso de uma ação de terceiros traria mais riscos do que benefícios.

## Execution within a container
A liberdade dada dentro do fluxo de trabalho permite que você instale todos os componentes/ferramentas/programas necessários para executar as tarefas definidas no seu fluxo de trabalho. No entanto, a instalação dessas ferramentas pode ser longa e tornar cada execução do fluxo de trabalho ineficiente.

O GitHub Actions permite que você execute tarefas dentro de um contêiner que será provisionado sob demanda. Além da vantagem de ser mais rápido, também permite ter o mesmo comportamento/ambiente, seja no computador do desenvolvedor ou por meio de um fluxo de trabalho em uma máquina virtual.

O exemplo a seguir, através da propriedade container, solicita ao fluxo de trabalho que baixe (docker pull) a imagem do contêiner "node", para iniciar uma instância deste contêiner e carregar dentro dele os diferentes comandos. Desta forma, não há necessidade de instalar o NodeJS no agente GitHub, pois a imagem do nó já possui todas as ferramentas necessárias.

```
jobs:
  build:
    runs-on: self-hosted
    container: 'node:current'
    steps:
      - uses: actions/checkout@v4
      - run: |
              npm install
              npm run build
```

Aviso: É necessário especificar o sistema operacional subjacente (propriedade runs-on) porque os contêineres serão necessariamente contêineres Linux ou Windows e precisam de sistemas operacionais correspondentes.

## Descubra novas Ações
A riqueza das Ações do GitHub é amplamente composta pelas ações criadas pela comunidade. No momento em que escrevo estas linhas, há mais de 9000 Ações publicadas no marketplace do GitHub: https://github.com/marketplace?type=actions.

Marketplace: Ações

De lá, você pode acessar a página detalhada de cada ação. Esta página é extremamente importante porque lhe dirá a maneira de integrar esta ação em seu fluxo de trabalho, seus parâmetros, mas também informações importantes, como o autor ou o link para o repositório da ação, o que lhe fornecerá ainda mais informações, como a possibilidade de analisar seu código-fonte:

Marketplace: página detalhada

Quando você tiver alguma necessidade especial em um fluxo de trabalho, incluindo uma tarefa simples como instalar uma ferramenta, comece verificando se uma ação produzida por terceiros já existe. Usar sua ação provavelmente permite que você economize tempo, adicione recursos e simplifique seu fluxo de trabalho. Se você não encontrar o que está procurando entre as ações existentes, não hesite em crie sua própria Ação. Este tópico é abordado em detalhes no capítulo "Criar uma Ação Personalizada".
### O editor de fluxo de trabalho
Com a prática, você ficará mais confiante para escrever fluxos de trabalho manualmente; no entanto, para facilitar sua escrita, o GitHub fornece um editor web dedicado à escrita de fluxos de trabalho que oferece recursos úteis, como um mecanismo de busca integrado para ações, linting de estrutura e preenchimento automático.

### Editor de fluxo de trabalho
Este editor é ativado automaticamente ao abrir um arquivo YAML (a extensão *.yml ou *.yaml é obrigatória) localizado na pasta ".github/workflows". Se o arquivo YAML estiver em outro lugar, o GitHub o ignorará como fluxo de trabalho (= não será acionado) e o editor proposto será o editor de arquivo padrão.
Pessoas que preferem trabalhar diretamente em seu computador com seu editor de código preferido também podem usar o mesmo facilidade, especialmente se o editor fornecer extensões de preenchimento automático. Por exemplo, o Visual Studio Code permite que você instale uma extensão que permite obter o mesmo preenchimento automático, a detecção de erros em seu YAML, mas também ver diretamente do Visual Studio Code os logs e os resultados de seus fluxos de trabalho, permitindo que você trabalhe totalmente localmente sem precisar abrir o portal da web.
Dicas: Esta extensão foi escrita por Christopher Schleiden e pode ser encontrada aqui: `https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions`
É muito mais avançado do que o editor nativo do portal da web.
### Exercícios - As etapas
As etapas são a parte mais importante de um fluxo de trabalho e, se nesta fase do livro, cobrimos apenas o básico, é importante ter bases sólidas adquiridas por meio de alguns exercícios.
### Exercício 1
Para este primeiro ano, escreva um fluxo de trabalho de gatilho manual que exiba qualquer mensagem no console. Para apimentar o exercício, vamos adicionar uma pequena restrição: não use o comando run, apenas ações do marketplace.
### Exercício 2
Uma pessoa publica uma ação chamada "fake-action" no marketplace com uma versão e uma tag igual a "v1.1.0". Esta ação não requer nenhum parâmetro em particular. Em vez disso, seu fluxo de trabalho faz referência à ação com o seguinte formato:

O fluxo de trabalho está funcionando?

E se o formato for o seguinte, o fluxo de trabalho funcionará corretamente?

`- uses: user/fake-action@1.1.0 # note que "v" está faltando`

Então você especifica o seguinte formato.

`- uses: user/fake-action@v1.1 # note que a versão do patch está faltando`

O autor da fake-action publica uma nova versão (versão "1.1.1") e, em seguida, uma segunda alguns dias depois (versão "1.2.1"). Se você executar seu fluxo de trabalho novamente (usando "fake-action@v1.1"), qual versão é carregada entre "1.1.0", "1.1.1" e "1.2.1"?
Não hesite em consultar o capítulo Criar uma ação > Controle de versão para entender a mecânica.
### Exercício 3
Você deseja usar uma ação que não está publicada no mercado e chamada SuperAction. Esta ação está no repositório do usuário "someone". Este usuário não publicou nenhuma versão de sua ação, apenas manteve o repositório público. Além disso, esta Ação recebe dois parâmetros: o "nome" de uma pessoa e sua "idade".
Qual formato seu fluxo de trabalho deve ter para chamar esta ação corretamente?
## As matrizes
Um fluxo de trabalho pode conter vários trabalhos. Essa flexibilidade permite, por exemplo, compilar com um único fluxo de trabalho tanto um aplicativo móvel Android no Linux quanto um iOS no macOS. Também pode ser útil compilar o mesmo código-fonte com diferentes configurações do compilador, como um recurso habilitado ou não (chamado sinalizador de recurso), ou simplesmente compilar o mesmo aplicativo em várias versões da estrutura subjacente (Java, NodeJS, etc.).

Suponha que esses vários trabalhos possam realizar várias ações em uma única execução. Nesse caso, isso tem a desvantagem de ter um arquivo de fluxo de trabalho muito longo e muitas linhas de código duplicadas, levando a uma manutenção mais complexa e possíveis erros. O GitHub Actions oferece uma solução para isso: as matrizes.
Uma matriz, que é declarada como um conjunto de valores-chave, pode gerar proativamente mais trabalhos a partir de uma única definição: cada versão "gerada" é chamada de expansão. Vantagem: um arquivo, uma definição de trabalho, mas n trabalhos gerados automaticamente e configurados em tempo de execução.
As matrizes são declaradas no nível do trabalho, como uma propriedade de uma estratégia e, em seguida, como uma subpropriedade chamada matriz, incluindo uma (ou mais) matriz(s) do tipo "chave: [valor1, valor2]". Os valores declarados serão acessíveis como variáveis por cada expansão.
Neste primeiro exemplo, que visa gerar jobs com base no sistema operacional, a definição do job tem uma matriz cuja chave é os e cujos valores são "self-hosted", "windows-latest" e "macos-latest". A matriz injeta em cada expansão (serão, portanto, três delas, uma para cada valor) a variável chamada os com o respectivo valor. Esta variável fica então disponível como ${{ matrix.os }} dentro de cada job, permitindo, neste exemplo, obter um sistema operacional dinâmico.

A declaração de uma matriz:
```
jobs:
myjob:
strategy:
Jobs
matrix:
os: [self-hosted, macos-latest, windows-latest]
runs-on: ${{ matrix.os }}
steps: # the actions #
```

Ao executar o fluxo de trabalho, você vê uma execução única do fluxo de trabalho, mas ela contém a execução de três tarefas paralelas, para as quais os valores das matrizes são injetados:

## Execution of the matrix
Observe que as matrizes também podem ser declaradas em um formato um pouco mais legível:
```
strategy:
matrix:
OS:
-self-hosted
-macos-latest
-windows-latest
```
Também é possível declarar várias matrizes, o que causará uma combinação de valores. Aqui, teremos 6 combinações possíveis e, portanto, 6 jobs: ubuntu+node10, ubuntu+node16, windows+node10, windows+node 16, macos+node10 e macos +node16:

```
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [node10, node16]
steps:
- name: Setup Node
uses: actions/setup-node@v4
with:
node-version: ${{ matrix.node}}
```

Importante: Um fluxo de trabalho não pode ter mais de 256 expansões de trabalho. Nesse caso, o fluxo de trabalho simplesmente não será iniciado.

## Exclusions
Matrizes combinatórias podem, portanto, gerar todas as combinações desejadas. Você pode querer excluir uma ou mais combinações porque sabe que essa combinação não é útil. Em vez de gerar expansão e adicionar uma condição nas etapas para fazer "nada" neste caso específico, é possível evitar essa expansão em particular usando a propriedade exclude.

No exemplo a seguir, temos duas matrizes (uma com 3 valores, a outra com 2 valores) e, portanto, 6 expansões no total. A adição de exclusão impedirá a combinação "macos-latest + 12":

```
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [10, 12]
exclude:
- os: macos-latest
node: 12 # Note that there is no "-" in front of the key "node" because it is part of the same object as "os"
```

Então, apenas 5 expansões serão executadas:

### Inclusions
Por outro lado, você pode achar mais fácil adicionar combinações específicas. Por exemplo, queremos que as 6 expansões base testem a combinação NodeJS 8 + macOS no caso a seguir.

```
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [10, 12]
include:
- os: macos-latest
  node: 8
```
Esse recurso de inclusão é muito mais útil do que pode parecer à primeira vista. De fato, ele permite, por exemplo, configurar compilações de sombra para verificar se o aplicativo pode operar em casos imprevistos, por exemplo, uma versão do framework normalmente não suportada pelo aplicativo.

Por exemplo, aqui está um fluxo de trabalho destinado a compilar o aplicativo com Java 8 e 11 e adicionar uma combinação para compilar com Java 14. Essa combinação também adiciona uma chave "testing" atribuída à propriedade padrão de um trabalho continues-on-error. Essa propriedade especifica que um trabalho deve continuar, não importa o estado de suas etapas.

```
jobs:
build:
strategy:.
matrix:
java: [8, 11]
testing: [false]
include:
-java: 14
testing: true
continue-on-error: ${{ matrix.testing }}
```

## The concept of fail-fast
Quando você executa uma matriz, cada expansão é executada em paralelo em seu agente para ir mais rápido. Quando uma das expansões falha, as outras expansões são canceladas e param no meio de suas tarefas.

Esse comportamento é o comportamento padrão de uma estratégia porque é padrão pensar que a partir do momento em que parte do fluxo de trabalho falha. Portanto, o fluxo de trabalho em sua totalidade não pode ser considerado um sucesso, e que é necessário parar qualquer trabalho inútil que seria caro em tempo (e financeiramente). Isso é chamado de fail fast para parar o mais rápido possível, para corrigir rapidamente e tentar novamente.
Na captura a seguir, você pode ver que as versões do Windows e do macOS mudaram para o status "cancelado" assim que o fluxo de trabalho do Ubuntu falhou.

No entanto, isso pode acontecer, seja porque você está depurando um fluxo de trabalho ou simplesmente porque deseja que cada expansão de uma matriz conclua suas tarefas. Portanto, você tem que desabilitar esse comportamento fail-fast. Para fazer isso, adicione a propriedade fail-fast (com o valor false) à sua estratégia.

```
strategy:
matrix:
os: [self-hosted, macos-latest, windows-latest]
fail-fast: false # expansions won't stop
```

Neste momento, cada expansão de matriz continuará até que seja concluída com sucesso ou falhe. No nosso caso, as versões macOS e Windows continuaram até o fim, mesmo que a expansão ubuntu tenha falhado:

Aviso: Como você verá no próximo capítulo sobre runners, workflows paralelos impactam a soma dos minutos de execução e, portanto, impactam o custo mensal, principalmente se você desabilitar o fail-fast e deixar os workflows continuarem.

### Exercícios
Vamos colocar em prática através de alguns exercícios.

### Exercício n°1
Neste primeiro exercício, você deve editar o próximo workflow para compilar a aplicação com duas versões do .NET Framework (4.2.x e 5.0.x), mas também precisa compilar duas versões usando um parâmetro respectivamente debug e release:

```
name: "matrix - exercise 1"
jobs:
build:
strategy:
matrix: # TO BE COMPLETED
steps:
- name: Retrieve source code
  uses: actions/checkout@v4
- name: Install .NET
  uses: actions/setup-dotnet@v4
   with:
dotnet-version: # TO BE COMPLETED
- name: Restore dependencies
  run: dotnet restore
- name: Build
   run: dotnet build --no-restore --configuration ${{ env.buildMode}}
env:
buildMode: # TO BE COMPLETED
```

### Exercise n°2
Quantos trabalhos são gerados com esse fluxo de trabalho?

```
name: "matrix - exercise 2"
on:
workflow_dispatch:
jobs:
build:
runs-on: ${{ matrix.os}}
strategy:
matrix:
os: [self-hosted, windows-latest, macos-latest]
node: [10, 12]
include:
- os: macos-latest
 node: 8
exclude:
- os: macos-latest
  node: 10
- os: macos-latest
node: 8
steps:
- run: echo "I run on ${{ matrix.os }} with the Node version $ {{ matrix.node }}"
```

### Exercise n°3
Nossa necessidade é criar um fluxo de trabalho que implante nosso aplicativo em oito servidores de produção. O número de servidores no futuro pode aumentar, e é inaceitável duplicar etapas. Portanto, queremos usar as matrizes para simplificar nosso fluxo de trabalho, conforme mostrado pelo seguinte YAML:
```
runs-on: self-hosted
strategy:
matrix:
server: [prod1, prod2, prod3, prod4, prod5, prod6, prod7, prod8]
steps:
 - name: Deploy application
    run: echo "Deploy on ${{ matrix.server}}"
```

Este fluxo de trabalho funciona perfeitamente, mas a implantação em paralelo em todos os servidores de produção pode causar interrupção do serviço para os usuários. Nossa equipe de DevOps propõe fazer a implantação progressiva (implantação canário) e implantar nos servidores, no máximo 2 por vez. Altere o YAML para obter o comportamento esperado.

Dica: leia a documentação oficial sobre matrizes para descobrir como fazer isso. Procure controlar o paralelismo.

## Runners
Os agentes, também conhecidos como runners ou "runners hospedados no GitHub", são pequenos programas com apenas uma coisa a fazer: executar as tarefas dadas a eles e transmitir seus resultados de volta.

|      | GitHub-Hosted Runners | Self-Hosted Runners |
| ---- | ----         | ---- |
| Configuração e manutenção | Nenhuma configuração necessária; totalmente gerenciado pelo GitHub | Requer configuração e manutenção manuais |
| Custo | Gratuito com limites de uso; cobranças por minutos extras | Sem custo para o executor; custos de infraestrutura aplicáveis |
| Escalabilidade | Escala automaticamente com base na demanda | Gerenciado manualmente com base na sua infraestrutura |
| Controle de ambiente | Ambientes predefinidos com controle limitado | Controle total sobre o ambiente |
| Sistemas operacionais | Windows, Linux e macOS | Qualquer sistema operacional que possa executar o aplicativo executor |
| Segurança | Seguro, mas executado em um ambiente compartilhado | Potencialmente mais seguro, isolado em sua infraestrutura. |
| Desempenho | Recursos de desempenho fixos | Pode ser adaptado às suas necessidades |
| Acesso a recursos internos | Limitado, a menos que use serviços auto-hospedados | Acesso direto a redes e recursos internos |
| Personalização | Limitado a ambientes GitHub disponíveis | Personalização completa da configuração |
| Limites de uso | Sujeito aos limites e cotas de uso do GitHub | Determinado por seus próprios recursos |


Self-hosted runners can be:

- [x] Physical
- [x] Virtual
- [x] In a container
- [x] On-premises
- [x] In a cloud

## How it works
Um agente é um orquestrador; sua única "inteligência" é executar as tarefas descritas em um arquivo de fluxo de trabalho. O comportamento interno é o seguinte:
1. Um evento é acionado no GitHub (push, pull_request, etc.)
2. O GitHub verifica os fluxos de trabalho do repositório para ver se um ou mais fluxos de trabalho têm um gatilho correspondente ao evento
3. O GitHub aciona a criação de um novo agente hospedado (é uma pequena máquina virtual, chamada de ambiente virtual)
4. O GitHub reserva o agente para um fluxo de trabalho específico (o agente só funcionará para este fluxo de trabalho)
5. O GitHub lê o arquivo YAML do fluxo de trabalho para detectar informações para injetar (segredos, variáveis de ambiente, variáveis do GitHub)
6. O GitHub envia tudo para o agente recém-criado
7. O agente executa as tarefas uma por uma, enviando o resultado para o GitHub
8. O GitHub integra os resultados, armazena-os em seu banco de dados e os exibe no portal, o que nos permite monitorar em "tempo real" o que acontece
9. Uma vez que o agente concluiu seu trabalho, o agente é destruído
No entanto, um agente é um programa com capacidades muito limitadas; ele só pode executar comandos sequencialmente e retornar seu resultado. Qualquer ação (compilar código, converter um arquivo, implantar, escanear, etc.) só é possível por meio da instalação de ferramentas de terceiros no sistema, ou por estarem presentes por padrão no sistema operacional escolhido, ou porque você solicita ao agente para instalá-las por meio de uma linha de comando durante o fluxo de trabalho.

## Pre-installed tooling
Se for possível instalar qualquer ferramenta em um agente usando uma tarefa que baixaria e iniciaria um instalador, os agentes fornecidos pelo GitHub têm vários softwares e frameworks pré-instalados. Isso permite que esses agentes já estejam prontos para uso e tornem os fluxos de trabalho mais rápidos.
Nos agentes do Windows, você encontrará .NET, Java, GO, PHP sendo pré-instalados e ferramentas CLI para implantar no Azure, AWS ou até mesmo AliCloud. No Linux, você terá, entre outras coisas, Mono, Ruby, GNU C++, Google Cloud SDK, etc.
Se quiser saber em detalhes a lista de ferramentas pré-instaladas em cada sistema, a lista atualizada é mantida no repositório oficial: https://github.com/actions/virtual- enviroments/tree/main/images

Se um programa necessário para seu fluxo de trabalho não estiver presente, basta instalá-lo você mesmo. Crie (ou use uma existente) uma tarefa que baixe a ferramenta necessária no início do seu fluxo de trabalho. Por exemplo, o livro que você está lendo atualmente foi escrito em Markdown, mas precisava de ferramentas para ser transformado em PDF/EPUB. Para fazer isso, o fluxo de trabalho precisa instalar duas ferramentas (Pandoc e LaTeX) antes que você possa usá-las.

```
runs-on: ubuntu-20.04
steps:
name: installing Pandoc
run: sudo apt-get install --assume-yes pandoc
- name: installing pdflatex + modules
run: |
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-xetex
- name: Generating the PDF version
run: pandoc -V documentclass-memoir --pdf-engine-xelatex from=markdown-blank_before_header -s $(cat _includes.txt) -o './ dist/GitHub Actions-par la pratique.pdf'
working-directory: ./book
```

As possibilidades de ferramentas são infinitas; desde que o fluxo de trabalho possa baixar uma ferramenta e iniciar uma linha de comando (sem nenhuma interface gráfica de usuário) para instalá-la ou executá-la, qualquer software de terceiros deve ser fácil.

## Network considerations
O fato de os agentes gerenciados pelo GitHub (GitHub hosted runners) serem hospedados na nuvem Microsoft Azure é uma vantagem clara: isso evita qualquer custo de manutenção específico (hardware, licença do sistema operacional, salário de pessoas, etc.). No entanto, isso também implica que esses agentes estão fora da rede da sua empresa.

Se isso não é um problema para a maioria dos fluxos de trabalho, incluindo fluxos de trabalho de compilação (CI) que geralmente não precisam de nenhuma conexão específica, isso pode ser muito diferente para fluxos de trabalho de implantação. De fato, é comum que redes corporativas sejam fechadas para qualquer acesso externo por motivos de segurança; portanto, um agente de implantação externo (por estar na nuvem) seria bloqueado, conforme mostrado no diagrama a seguir:

![](img/github-runners-network.png)

Devido a essa restrição de rede, alguns casos de uso em que os agentes do GitHub não atendem à necessidade ou em que a equipe de rede/segurança proíbe seu uso. A resposta para esse problema é o uso de agentes "auto-hospedados".

## The self-hosted runners
O GitHub fornece agentes (chamados de "hosted runners" ou "managed agents") que fornecem para cada execução um ambiente "descartável" para compilar e/ou implantar seus aplicativos. Se eles são adequados para a maioria dos usos, em muitos casos, infelizmente não são suficientes. Se tivéssemos, por exemplo:
- [x] A necessidade de compilar em um sistema operacional diferente dos propostos por padrão
- [x] A necessidade de compilar um aplicativo com acesso a hardware específico ou licença associada a este hardware (uso comum em IoT)
- [x] A necessidade de implantar em servidores que não são acessíveis pela Internet (onde os agentes hospedados do GitHub estão)
- [x] Só precisa de um servidor de compilação com mais poder de computação (memória, CPU)

Para muitos cenários possíveis em que os agentes padrão não são suficientes, existe uma solução: os "self-hosted runners", agentes que você mesmo gerencia.

![](img/github-runners-network-01.png)

## Adding a new agent
Os agentes auto-hospedados têm a vantagem de serem mais flexíveis e são livres do ponto de vista da licença. Ainda assim, eles têm um custo de manutenção, pois é sua responsabilidade garantir que eles estejam atualizados (a versão do agente do GitHub) e em servidores continuamente protegidos/corrigidos. Também devemos adicionar o custo implícito do servidor onde o agente está instalado (por exemplo, licença do sistema operacional, equipamento, eletricidade) e garantir a resiliência da plataforma, o que pode implicar ter vários servidores. Apesar desse custo, os agentes auto-hospedados geralmente fazem parte da solução em projetos corporativos.
Você pode adicionar um número infinito de agentes por projeto, e sua instalação leva apenas alguns minutos. A declaração de um runner auto-hospedado é feita na tela Configurações > Ações do seu repositório. Nesta tela, à direita, está localizado um bloco listando todos os runners registrados deste repositório:

Clique em "Adicionar agente" para abrir uma nova tela que permite selecionar o sistema operacional correspondente ao servidor que hospedará seu runner. Essa escolha é crítica porque, ao instalar um runner em um runner do Windows, apenas fluxos de trabalho do "windows" (propriedade runs-on) serão executados por esse runner. Portanto, se um dos seus fluxos de trabalho exigir a execução de um trabalho no Windows e outro no Linux, você precisará de dois servidores diferentes com dois sistemas operacionais e dois runners.

Aviso: se um agente estiver vinculado a apenas um repositório (exceto com o GitHub Enterprise), ainda será possível instalar vários agentes gerenciando vários projetos lado a lado no mesmo computador. Além dos problemas de segurança, os riscos de colisão (aplicativos instalados por cada projeto, incompatíveis entre si) são altos. Além disso, os diretórios de trabalho contêm uma cópia do código-fonte baixado e outros itens que potencialmente contêm dados confidenciais. No final do livro, no apêndice, um capítulo aborda em detalhes a criação de um agente em contêiner auto-hospedado, permitindo substituir essas limitações e reduzir esses riscos.

Declarar um novo runner requer duas etapas. Primeiro, a instalação do runner. Após escolher o sistema operacional, o portal da Web fornece um comando para executar no servidor de destino; esse comando baixa e instala o runner corretamente.

Ações / Adicionar runner auto-hospedado
Adicionar um runner auto-hospedado requer que você baixe, configure e execute o GitHub Actions Runner. Ao baixar e configurar o Github Actions Runner, você concorda com os Termos de Serviço do GitHub ou os Termos de Serviço Corporativos do GitHub, conforme aplicável.

## Download the latest runner package
Uma vez instalado, o segundo passo é configurar o runner para interagir com seu repositório de forma segura. O portal da Web gera um comando contendo a URL do repositório e um token de autenticação, que permite que o runner acesse o acesso de leitura/gravação ao seu repositório. O comando se parece com isso:

```
# Runner configuration
$ ./config.cmd --url https://github.com/60pportunities/book-github-actions --token C3C13STUNF4K3TOK3N
```

Quando executado, o comando pede várias informações para personalizar o agente, como seu nome, seus rótulos e o tipo de execução (como um serviço ou manual). Claro, você também pode deixar esses valores vazios e deixar que a configuração use os valores padrão:

## Runner configuration
Após a conclusão da configuração, o agente deve aparecer registrado no portal do GitHub com seu nome e rótulos. No entanto, seu status é inativo (offline). Esse status indica que o GitHub não se comunica com o agente porque um firewall está bloqueando as comunicações ou simplesmente porque o agente, embora instalado, não foi iniciado.

Aviso: Um agente auto-hospedado é vinculado a um e apenas um repositório. Se você quiser compartilhar um agente entre repositórios, deverá ter uma conta do GitHub Enterprise e o executor no nível da organização.

Para iniciar o executor, uma linha de comando é suficiente. Durante a execução deste comando, o agente se reporta ao GitHub como disponível e começa a escutar/aguardar.
Após iniciado, o executor aparece como "Ocioso", o que significa que está pronto e aguardando para receber um fluxo de trabalho.

Executor disponível e ativo

Informações: Como veremos mais adiante neste capítulo, os rótulos são usados ​​para reconhecer os executores e suas capacidades ou selecionar explicitamente um executor específico que executará o fluxo de trabalho.

### How to use our self-hosted runner?
Quando um agente está devidamente registrado (status Idle), precisamos apenas informar ao workflow para usá-lo. Essa atribuição é feita por meio da propriedade "runs-on: self-hosted".

`runs-on: self-hosted`

A propriedade, como escrito acima, informa ao GitHub que o fluxo de trabalho deve ser executado por um dos agentes auto-hospedados. O texto "auto-hospedado" é um dos rótulos adicionados automaticamente ao agente durante sua configuração. Vários rótulos padrão são adicionados de acordo com a máquina na qual o agente está instalado:

- [X] auto-hospedado: adicionado a todos os agentes auto-hospedados
- [X] linux, windows ou macOS: correspondente ao sistema operacional subjacente
- [X] x64, ARM ou ARM64: especifica a arquitetura do processador

Esses rótulos, chamados de "rotas", permitem que você direcione um agente ou um grupo de agentes específico. Assim, ao combiná-los, é possível direcionar especificamente um agente cujas características técnicas executarão tarefas de fluxo de trabalho; na realidade, essas tarefas decidem implicitamente o tipo de agente necessário para sua conclusão adequada. O exemplo a seguir informa ao GitHub que o fluxo de trabalho deve ser executado por um agente auto-hospedado com um processador de 64 bits e instalado em um sistema operacional Windows:

``runs-on: [self-hosted, windows, x64]``

Os rótulos são declarados ao registrar o agente, mas também podem ser adicionados posteriormente usando a interface do portal do GitHub:

Esta prática é especialmente útil quando seu agente está localizado em um servidor específico (por exemplo, um servidor de produção) ou um servidor fisicamente conectado a um dispositivo de hardware (IoT ou robótica). Ela permite que você dê um rótulo exclusivo a este agente e o direcione de forma muito específica. A escolha de um agente pelo GitHub é feita procurando os agentes candidatos que correspondem a todos os rótulos.

```runs-on: self-hosted, raspberry1 # target the runner which has both these labels```

## Network access
Suponha que o principal ativo dos executores auto-hospedados esteja sendo executado dentro da sua rede local e tenha apenas comunicações de saída. Nesse caso, é necessário permitir que o agente se comunique com o GitHub e abra os fluxos de comunicação relevantes. Aqui está a lista completa de URLs que devem ser abertas no seu firewall para permitir que o agente se comunique, coloque ou recupere itens no/do GitHub.

Necessário para operações essenciais:
```
github.com
api.github.com
*.actions.githubusercontent.com
````

Necessário para baixar ações:
```
codeload.github.com
Needed for uploading/downloading job summaries and logs
actions-results-receiver-production.githubapp.com
*.blob.core.windows.net
```

Necessário para atualizações da versão do runner:
```
objects.githubusercontent.com
objects-origin.githubusercontent.com
github-releases.githubusercontent.com
github-registry-files.githubusercontent.com
````

Necessário para carregar/baixar caches e artefatos de fluxo de trabalho:
```
*.blob.core.windows.net
Needed for retrieving OIDC tokens:
*.actions.githubusercontent.com
````

Necessário para baixar ou publicar pacotes ou contêineres no GitHub Pacotes:
```
*.pkg.github.com
ghcr.io
```

It will also be necessary to open access to the servers in your local network on which you want the agent to deploy your applications.

## Differences between the two types of runners
Os runners autogerenciados trazem mais liberdade e mais recursos, mas vêm com mais restrições. Toda a parte normalmente gerenciada pelo GitHub (gerenciamento de atualizações, atualização dos componentes do sistema) agora deve ser gerenciada manualmente com uma sobrecarga não desprezível.

### Runners managed by GitHub:

- [X] Atualização automática do sistema operacional, ferramentas/pacotes pré-instalados e o próprio agente.
- [X] Mantido e gerenciado inteiramente pelo GitHub
- [X] Fornece uma nova instância limpa para cada execução
- [X] Use o tempo de execução gratuito oferecido pelo GitHub e, em seguida, inclua um custo se o limite for excedido

### Self-managed runners (self-hosted):
- [X] O próprio agente atualiza automaticamente. Você é responsável por atualizar o sistema operacional e todos os outros componentes
- [X] Ele pode ser instalado em quase todos os lugares, no computador local, em um servidor físico, em uma máquina virtual na Nuvem
- [X] Permite ser associado a uma configuração completamente personalizada (hardware, capacidade de computação ou software)
- [X] Reutiliza a mesma instância para cada novo pipeline
- [X] São completamente gratuitos, independentemente da duração do uso

Se globalmente, os executores do GitHub responderão à maioria dos casos de uso e, portanto, devem ser sua primeira escolha. Nesse caso, os executores auto-hospedados serão relevantes para necessidades de implantação feitas com fortes restrições de segurança de rede. A combinação de ambos traz o melhor dos dois mundos para atender a todos os cenários possíveis.

### Exercises - Runners
Os Runners são a base do GitHub Actions; vamos tentar usá-los por meio de alguns exercícios práticos.

#### Exercise n°1
Neste primeiro exercício, no repositório de sua escolha, declare um runner auto-hospedado que você instalará em seu computador local. Nomeie-o como "my-agent" e garanta que ele esteja listado no portal da web do GitHub como um agente ativo (status "Idle").
Em uma segunda etapa, declare qualquer fluxo de trabalho e faça-o ser executado pelo seu runner. Quais são os meios à sua disposição para garantir que este agente execute seu fluxo de trabalho?

#### Exercise n°2
Altere seu fluxo de trabalho para navegar na raiz da unidade de disco onde ele está sendo executado atualmente (ou qualquer outra pasta), liste os arquivos e adicione um comando para criar um arquivo de texto vazio.
Como o fluxo de trabalho se comporta e o que você pode concluir?

#### Exercise n°3
O projeto terminou; é hora de limpar os recursos não utilizados. Para este último exercício, desinstale corretamente o runner. O procedimento de desinstalação é feito clicando nas opções do seu runner listadas no portal da web. Em seguida, siga as instruções e confirme se o agente não está mais listado.

#### Exercise n°4
Você não tem mais um runner, mas um fluxo de trabalho sempre faz referência a ele. O que acontece se nenhum runner auto-hospedado estiver disponível? O fluxo de trabalho inicia ou não inicia? O fluxo de trabalho inicia e então trava? O fluxo de trabalho retorna a um runner gerenciado pelo GitHub? Inicie o fluxo de trabalho e confirme se sua previsão estava correta.

## The variables
Como qualquer linguagem de programação ou script, as variáveis ​​permitem que você defina chaves com valores reutilizáveis ​​dentro dos fluxos de trabalho.

### Declaration of a variable
A declaração de uma variável é feita adicionando a propriedade env e declarando valores-chave, conforme mostrado no exemplo a seguir:
```
env:
MY_VARIABLE_FIRSTNAME: John
MY_VARIABLE_NAME: "Doe" # quotation marks are not mandatory even if the value contains spaces
MY_VARIABLE_MULTILINE:|
hello
to all
!
```

Os nomes de variáveis ​​diferenciam maiúsculas de minúsculas; para evitar confusão e melhorar a legibilidade, é um uso comum escrevê-los todos em letras maiúsculas, mas isso não é obrigatório. Além disso, a nomenclatura permite caracteres alfanuméricos e o caractere sublinhado (_).
Uma vez definida uma variável, estaticamente ou dinamicamente, ela pode ser chamada com a sintaxe ${{ env.MY_VARIABLE }} que diz para carregar a MY_VARIABLE do contexto env, que representa o contexto do nível em que estamos, seja o fluxo de trabalho, o trabalho ou a etapa atual.

```
env:
#definition at job level
MY_VARIABLE: hello
#variable definition
steps:
- run: echo ${{ env.MY_VARIABLE }} # display "hello" in the console
```
The variable can be used to replace any value (but not a key), to be used within a command (example above) or an action.

### Dynamic variables
Em alguns casos, a variável é desconhecida e será definida durante o fluxo de trabalho, potencialmente passando de uma etapa para outra. Com o GitHub Actions, você não pode atribuir uma variável como faria normalmente, como $MYVARIABLE=my value. Em vez disso, é necessário concatenar a chave e o valor e transferi-los para a variável global $GITHUB_ENV:

`echo "NAME_VARIABLE=value" >> $GITHUB_ENV`

Tecnicamente falando, você escreve o nome da variável e seu valor em um arquivo temporário. Este arquivo é lido no final da etapa, e seus dados são injetados nas variáveis de ambiente. Portanto, quando você define dinamicamente o valor de uma variável em uma etapa, o novo valor desta variável só estará acessível para as etapas seguintes, não para a etapa atual. O fluxo de trabalho a seguir exibe "amarelo - amarelo - verde".

```
job:
runs-on: self-hosted
env:
VARIABLE: yellow
steps:
 - run: echo $VARIABLE # displays "yellow", default value
 - run: |
echo "VARIABLE=green" >> $GITHUB_ENV
echo $VARIABLE # displays "yellow", because we're still in the same step
run: echo $VARIABLE # displays "green"
```

### Scope of variables
As variáveis podem ser definidas em diferentes níveis de um fluxo de trabalho e, portanto, operar com diferentes escopos. Vimos um exemplo com variáveis definidas em um nível de trabalho, mas é possível defini-las:

- [X] No nível do fluxo de trabalho
- [X] No nível do trabalho
- [X] No nível da etapa

Dependendo do nível, a variável será acessível por todos os níveis subjacentes. Assim, uma variável definida em um nível de fluxo de trabalho será acessível por todos os trabalhos e etapas, enquanto uma variável definida em um nível de etapa será acessível apenas por ela. Isso é importante se você precisar passar uma variável de uma etapa para outra.

Se diferentes variáveis com o mesmo nome forem declaradas em níveis diferentes, então será a variável de escopo mais específica (nível mais baixo) que será escolhida. Analise o seguinte fluxo de trabalho e o mecanismo de prioridade:

```
env:
MYVARIABLE: value1
MYVARIABLE2: value1
jobs:
test_variables:
runs-on: self-hosted
env:
MYVARIABLE: value2
steps:
 run: echo $MYVARIABLE #value2 appears because variable at the job level
 run: echo ${{env.MYVARIABLE}} # value2 appears because variable at the job level
- name: variable env we redefinition at step level
env:
MYVARIABLE: value3
run: echo ${{env.MYVARIABLE}} # value3 appears because variable at step level
- name: variable direct MYVARIABLE2
  run: echo $MYVARIABLE2 #value1 displays because variable at the workflow level
```

## Output variables
O uso de variáveis globais ($GITHUB_ENV) permite que você responda à maioria dos usos para transmitir uma variável entre duas etapas. Isso, no entanto, requer que você tenha controle total dos nomes das variáveis dentro do fluxo de trabalho completo. Isso não pode ser garantido se você usar ações de terceiros que definem variáveis internamente. Além disso, isso pode causar uma colisão de variáveis se você usar a mesma ação duas vezes com configurações diferentes. A resposta perfeita é usar uma variável de saída: uma variável de saída é uma variável associada a uma etapa específica, mas é visível de outras etapas.

A definição de uma variável de saída de uma etapa é feita usando o comando ">> $GITHUB_OUTPUT". Isso torna possível definir uma variável vinculada a esta etapa e cujo escopo de nomenclatura também será vinculado.

``run: echo "NAMEVARIABLE=hello" >> $GITHUB_OUTPUT``

É necessário então realizar um segundo passo, para acessar um passo: dar a ele um nome através do id da propriedade.

```
steps:
-id: myStep
echo "NAMEVARIABLE=hello" >> $GITHUB_OUTPUT
```

Depois que uma etapa obtém um id, é possível referenciar sua variável de saída com a fórmula $ {{ steps.STEPID.outputs.NAMEVARIABLE }}.

```
steps:
-id: myStep
run: echo "NAMEVARIABLE=hello" >> $GITHUB_OUTPUT
- run: echo ${{ steps.myStep.outputs.NAMEVARIABLE}}
```


Muitas vezes, você encontrará variáveis ​​de saída ao usar ações do marketplace porque é a maneira mais limpa de retornar informações ao fluxo de trabalho pai.

## The built-in environment variables
Além das variáveis ​​que você cria, há muitas variáveis ​​predefinidas disponíveis dentro do seu fluxo de trabalho. Aqui está uma lista (parcial) delas:

| Variable     | Description |
| ----         | ----        |
| CI           | It is always equal to true |
| GITHUB_WORKFLOW | The name of the workflow |
| GITHUB_RUN_ID   | A unique number for each run within a repository. This number does not change if you re-run the workflow run. |
| GITHUB RUN_NUMBER |  An incremental number representing the number of executions of the same workflow. This number begins  at 1 for the workflow's first  run and increments with each new run. This number does  not change if you re-run the workflow run. |
| GITHUB JOB        |  The job_id of the current job. |
| GITHUB_ACTION     | Unique identifier (id) of an action |
| GITHUB_ACTIONS    | true if executed by GitHub Actions. false if running locally  on your computer; useful for  testing |

```
GITHUB_ACTOR
Name of the person or application that started the workflow
runner/work/my-repo-name/
my-repo-name.
GITHUB_SHA
The Hash (SHA-1) of the
GITHUB REPOSITO Full name of the repository
RY
GITHUB_EVENT_N Name of the event that
commit that triggered the
workflow. For example,
dc57e9addd1bbba026c5c71f5
6ad9285139967ec
AME
triggered the workflow
GITHUB_REF
The branch or tag that
GITHUB_EVENT_PA The path of the file comprising
TH
all data from the webhook
event. For example, /github/
workflow/event.json.
GITHUB_WORKSPA The path of the current
CE
workspace. This workspace is a copy of the repository if the workflow uses the action actions/checkout. If you do not use it, the folder is simply empty. For example, /home/vtriggered the workflow. For example, refs/heads/my- branch. If no branch or tag is available for this event, then
the variable is not available.
GITHUB_HEAD_REF Only for pull requests. Contains the name of the branch head
GITHUB_BASE_REF Only for pull requests. Contains the name of the branch base
GITHUB_SERVER_URL Returns the GitHub server
GITHUB_API_URL
URL. For example, https:// github.com.
Returns the URL of the
API. For example, https:// api.github.com.
GITHUB GRAPHQL Returns the URL of the _URL GraphQL API. For example, https://api.github.com/graphql.
```

Uma das variáveis que você usará com mais frequência é a variável GITHUB_TOKEN que está no contexto dos segredos. Esta variável contém um token de autenticação que permite que você interaja como "você". O usuário acionou o fluxo de trabalho e permite que você execute tarefas no repositório onde o fluxo de trabalho está localizado. Se seu fluxo de trabalho quiser criar elementos (issues, pr, releases, etc.), ele precisará deste token de autenticação.

```
steps:
- run: ./script --token {{ secrets.GITHUB_TOKEN }}
```

Essas poucas variáveis predefinidas são apenas uma pequena parte das informações que é possível usar. Algumas não têm uma variável predefinida, mas ainda são recuperáveis dentro de um dos contextos existentes. O contexto do github é o principal e tem uma centena de propriedades detalhadas relativas ao fluxo de trabalho, como o evento que disparou o fluxo de trabalho, o repositório, seu proprietário e muitos outros.

Para exibi-lo, como outros contextos (env, strategy, matrix, steps, runner), uma solução simples consiste em converter o contexto em JSON e depois exibi-lo no console:

``run: echo "${{ toJson(github)}}" # Do not forget the quotation marks, or the JSON will crash your workflow``

Bom saber: A função toJson() é uma das várias funções disponíveis por padrão no GitHub Actions. O GitHub oferece os métodos toJson(), fromJson(), contains(), startsWith(), endsWith(), format() e hashFiles(). A documentação oficial é suficientemente detalhada sobre seu uso para não cobri-lo neste livro.

Isso permite ter o nome de todas as propriedades do contexto (seu número muda dependendo do evento de gatilho do fluxo de trabalho):

```
{
"token":
"job": "build",
"ref": "refs/heads/main",
"repository": "60pportunities/test",
"repository_owner": "60pportunities",
#"repositoryUrl": "git://github.com/60pportunities/test.git",
"run_id":"587245182",
"run_number": "8",
"retention_days": "90",
"actor": "60pportunities",
"workflow": "Test Wkf",
"head_ref": "",
"base_ref": "",
"event_name": "workflow_dispatch",
"event": {
"inputs": null,
"ref": "refs/heads/main",
"repository": {
|| ...
// many other properties
[] ...
}
}
}
```

### Protect the content of variables with masks
Pode haver casos em que a variável contenha um valor confidencial. Se o valor for definido manualmente, a boa prática deve ser definir um "secreto" (em vez de uma variável), um objeto do GitHub que é abordado no próximo capítulo. No entanto, se o valor for gerado durante a execução do fluxo de trabalho, o uso de secret é impossível, e apenas variáveis podem armazenar esse valor. O risco é então que o conteúdo dessa variável seja inadvertidamente exibido nos logs, expondo completamente o valor que gostaríamos de manter em segredo.

O GitHub oferece uma solução que não é perfeita, mas que permite evitar que um valor seja exibido nos logs. Essas mecânicas permitem adicionar uma máscara sobre o conteúdo do valor (e não a variável em si!). Isso requer o uso do comando add-mask, para quem o valor é transmitido para ser oculto. Então, se o valor for, de qualquer forma, exibido nos logs, seu conteúdo será substituído por asteriscos ("***").

```
- run: "::add-mask::hello"
- run: echo "hello" # displays *** in the logs
```

If the variable is not known in advance (e.g., a generated token or password), masking its value can be done like this:
```
- run: "::add-mask::$MYVARIABLE"
- run: echo "$MYVARIABLE" # displays
```

Um efeito perverso é que se o conteúdo de uma variável também for o valor (ou parte do valor) de outra variável, proteger o conteúdo da primeira variável fará com que o conteúdo da segunda variável também fique oculto. Fica bem claro com o exemplo a seguir, onde o conteúdo de VAR2, que não é estritamente idêntico a VAR1, fica parcialmente oculto quando exibido nos logs. Coisa boa ou ruim? Isso vai depender dos seus casos de uso, mas não ter controle preciso torna o comando add-mask um recurso propenso a bugs.

```
env:
VAR1: hello
VAR2: hello2
steps:
- run: echo "::add-mask::$VAR1" # we hide the value of VAR1
- run: echo $VAR1 # displays
- run: echo $VAR2 # displays ***2
```
## Exercises - variables
Aplique o que você acabou de aprender fazendo alguns exercícios.

### Exercício n°1
Este primeiro exercício visa validar a teoria sobre escopos de variáveis. Primeiro, crie um fluxo de trabalho simples com uma variável de ambiente VAR1. Em seguida, crie uma tarefa que coloque o conteúdo desta variável em uma segunda variável, VAR2. Por fim, exiba o conteúdo de VAR2 no console de outra etapa sem usar as variáveis de saída.

### Exercício n°2
Pesquise no marketplace a ação get-current-time, cujo autor é "josStorer". Use esta ação em um fluxo de trabalho e, em seguida, exiba no console a data atual usando o formato francês (25/01/1984).

### Exercício n°3
É comum usar informações contextuais para enriquecer seu fluxo de trabalho, suas ações ou para tomar uma decisão com base nessas informações. Crie um fluxo de trabalho que exibirá as seguintes informações no console:

- [X] O nome do fluxo de trabalho atual
- [X] O link para o perfil do proprietário (owner) do repositório do qual o fluxo de trabalho é iniciado
- [X] Gera um alerta como uma anotação se o repositório atual for público

Todas as informações podem ser encontradas no contexto github.

### Os segredos
Os segredos são o equivalente a variáveis de ambiente, mas criptografados e armazenados fora do arquivo YAML do fluxo de trabalho. Eles são usados para transmitir chaves de segurança ou strings de conexão para seu fluxo de trabalho sem que sejam expostas porque nunca são armazenadas no código-fonte. Os segredos são criptografados com um módulo libsodium (https://libsodium.gitbook.io), garantindo que eles sejam protegidos quando saem do seu navegador e sejam descriptografados apenas quando seu fluxo de trabalho os usa. O GitHub não tem como acessá-lo, nem um pirata.

#### Declaração de um segredo
Alguns padrões de nomenclatura devem ser observados para definir um segredo:
- [X] O nome pode conter apenas caracteres alfanuméricos ([a-z], [A-Z], [0-9]) e o caractere sublinhado (_)
- [X] Eles não podem começar com um número
- [X] Eles não podem começar com "GITHUB_", porque esse prefixo é reservado para os segredos internos do GitHub, como GITHUB_TOKEN
- [X] Os nomes não diferenciam maiúsculas de minúsculas, mas por questões de visibilidade, como para variáveis, é uma boa prática sempre escrevê-los usando letras maiúsculas
- [X] Os nomes dos segredos devem ser exclusivos dentro de um repositório. Essa limitação pode ter um impacto se seu repositório tiver muitos fluxos de trabalho, pois a interface gráfica lista todos os segredos no mesmo lugar. Vários fluxos de trabalho do mesmo repositório podem usar o mesmo segredo. Como resultado, há sérios riscos de colisão ou efeitos indesejados.

A criação de um segredo é feita no nível do repositório. O link para a tela de gerenciamento de segredo pode ser encontrado no menu esquerdo dentro da tela de Configurações. Você pode lá, clicar em "Novo segredo de repositório".

A partir desta nova tela, é possível criar um segredo cujo valor nunca mais poderá ser visto (por medidas de segurança) uma vez que o botão Adicionar segredo for clicado.
Ações segredos / Novo segredo

Ambientes: Os segredos dos ambientes são apenas segredos que são particionados juntos. O assunto dos ambientes é abordado no próximo capítulo.

Uma vez que um segredo é definido, o GitHub declara uma variável no contexto segredos acessíveis por fluxos de trabalho. É então possível recuperar o valor de um segredo usando o seguinte formato $ {{ secrets.MY_SECRET }}.
```
etapas:
- executar: echo "${{ secrets.MY_SECRET }}"
```

O GitHub adiciona automaticamente uma máscara (add-mask) em cada segredo. Dessa forma, o conteúdo do segredo não deve vazar nos logs de execução de fluxos de trabalho.

Importante: os segredos podem sugerir que eles estão perfeitamente lacrados e protegidos. No entanto, backdoors estão permitindo que o fluxo de trabalho exiba os valores dos segredos nos logs. O assunto dessa "falha de segurança" é abordado no capítulo Segurança > Gerenciamento de segredos.

### Os limites dos segredos
Cada repositório não pode ter mais de 100 segredos e 100 segredos de ambiente também. Além disso, cada segredo não pode ter mais de 64 KB, o que é suficiente para a maioria dos casos; no entanto, se você fosse armazenar um segredo maior, como um certificado ou proteger um arquivo de configuração completo. Nesse caso, é possível armazenar o segredo criptografado no repositório de código-fonte e declarar a chave de descriptografia dentro de um segredo.

A abordagem não é muito intuitiva, mas é possível:
1- No seu disco local, criptografe seu arquivo usando a criptografia AES256 (ou qualquer criptografia suportada pelo GPG).
`gpg --symmetric --cipher-algo AES256 my_secret.txt`
Executar o comando GPG pede que você defina uma senha (passphrase) e criptografa o conteúdo do arquivo para criar uma cópia criptografada com a extensão ".gpg".
2- Copie a senha que foi definida e, no seu repositório, crie um novo segredo cujo valor seja a senha, por exemplo, MY_LARGE_SECRET_PASSPHRASE
3- Copie o arquivo "my_secret.txt.gpg" no seu repositório e salve (commit) ele.
4- Crie um arquivo de script (no nosso caso chamado decrypt_secret.sh) que será responsável por decifrar o arquivo usando o segredo previamente configurado
```
#!/bin/sh
gpg --quiet --batch --yes --decrypt passphrase="$MY_LARGE_SECRET_PWD" --output my_secret.txt my_secret.txt.gpg
```

5- Certifique-se de que o arquivo é executável antes do commit:
`chmod +x decrypt_secret.sh`

6- No seu fluxo de trabalho, crie uma etapa que defina uma variável local com um valor contendo o segredo protegido e, em seguida, execute o script para regenerar o arquivo my_secret.txt cujo conteúdo será decifrado.

```
jobs:
my-job:
runs-on: self-hosted
steps:
 - uses: actions/checkout@v4
  - run: decrypt_secret.sh
env:
MY_LARGE_SECRET_PWD:
{{ secrets.MY_LARGE_SECRET_PASSPHRASE}}
```
### Exercícios - Segredos
#### Exercício n°1
O primeiro exercício, crie um segredo e passe-o diretamente para a ação Igmorand@github-action-hello (https://github.com/ 60pportunities/github-action-hello). Depois, verifique se seu valor não aparece nos logs.

#### Exercício n°2
O repositório que contém a ação 60pportunities@github-action-hello (https://github.com/60pportunities/github-action-hello) tem um segredo chamado MY_SECRET. Este repositório tem um fluxo de trabalho disparado no push e/ou pull request e tem como objetivo validar que a ação ainda esteja totalmente funcional em um teste unitário. Execute um pull request no repositório e altere o fluxo de trabalho para obter o valor de sigilo.

### Exercício n°3
De outra conta, tente bifurcar um dos seus repositórios que contém um segredo (ou bifurcar um repositório de terceiros que contém um segredo, por exemplo este: https://github.com/60pportunities/aks-checklist). Em seguida, abra a aba Configurações e altere o valor de um dos segredos.

## Variáveis de configuração
Desde janeiro de 2023, o GitHub também permite a declaração de variáveis de configuração. As variáveis de configuração são estritamente idênticas aos segredos, exceto que seu conteúdo não é protegido e pode ser visualizado dentro do fluxo de trabalho. É perfeito quando você quer adicionar dinamicidade ao seu fluxo de trabalho sem codificá-lo dentro do arquivo YAML ou colocá-lo em um segredo porque você não pode necessariamente ver/editar seu conteúdo facilmente.

As variáveis de configuração são declaradas em uma nova tela, no mesmo lugar que os segredos.

### Variáveis de configuração
As variáveis de configuração são acessíveis dentro dos fluxos de trabalho por meio de novas variáveis de contexto:

```
jobs:
display-variables:
runs-on: self-hosted
steps:
- name: Use variables
run: |
echo "Here is my first variable : ${{ vars.MY_VARIABLE1 }}"
echo "And my second one : ${{ vars.MY_CONFIG }}"
```

## The creation of multienvironment workflows
O GitHub Actions permite que você faça qualquer tipo de fluxo de trabalho, como enviar um e-mail, criar aplicativos ou até mesmo automatizar uma máquina de café. Mas se houver um domínio no qual as ações são esperadas, é para implantação de aplicativos. Seja qual for a complexidade do seu aplicativo, monolítico, n-tier, microsserviços, ele geralmente será implantado em vários ambientes, como um para desenvolvedores, um para testes e outro para Produção. Embora fazer uma implantação de vários ambientes com o GitHub Actions possa ser alcançado de diferentes maneiras, a primeira solução é fazer um fluxo de trabalho pelo ambiente, cada um com sua lógica e variáveis para se conectar a cada servidor de destino. Mas essa prática deve ser evitada por dois motivos principais:

- [x] O gerenciamento de segredos e variáveis pode se tornar muito complexo, com riscos de colisão entre fluxos de trabalho. Segundo, se seus fluxos de trabalho tiverem um grande número de segredos, seu gerenciamento dentro de uma tela única pode se tornar bastante complexo.
- [x] Um dos mantras do DevOps requer que um único aplicativo binário seja gerado e implantado em diferentes ambientes sequencialmente; a única maneira de garantir que a versão implantada na Produção seja a mesma que foi testada em ambientes anteriores. Embora tecnicamente viável por meio de vários fluxos de trabalho, é complexo e propenso a erros.

O GitHub Actions introduz ambientes, que são simplesmente configurações externas nomeadas para atender a esse requisito. Essas configurações podem ser aplicadas a um ou mais trabalhos dentro de um fluxo de trabalho. Além disso, cada uma dessas configurações pode definir várias regras que queremos ver aplicadas a uma parte específica do fluxo de trabalho. Essas configurações se enquadram em duas categorias:

1. As regras de proteção
2. Os segredos

Vamos analisar em detalhes como definir e usar esses ambientes.

## Creating an environment
Os ambientes são vinculados a um projeto e, portanto, (apenas) a um repositório. Dentro de um repositório GitHub, o gerenciamento de ambientes é feito por meio da tela Configurações > Ambientes. O nome do ambiente é livre para escolher, mas é a ele que você precisará se referir no fluxo de trabalho.

```
Environments
You can configure environments with protection rules and secrets. Learn more.
PRD
TST
DEV
1 protection rule
New environment
```
Importante: Recursos relacionados ao ambiente não são permitidos em repositórios privados.

Ao criar um ambiente, uma tela de configuração é exibida. Semelhante ao conceito de "gates" no DevOps, as regras de proteção são etapas de verificação pré-implantação. Elas tornam possível acionar apenas parte de um fluxo de trabalho somente quando todos os controles de validação estão verdes. No caso do GitHub Actions, os três controles possíveis são:

1. controle sobre os branches válidos para implantação
2. aprovação manual por uma pessoa (revisor)
3. timer: tempo mínimo de espera antes de desbloquear a continuação do fluxo de trabalho

### Protections rules screen
Os revisores são pessoas que aprovarão manualmente a continuação do fluxo de trabalho. É possível especificar até 6 pessoas ou grupos de pessoas. Veremos mais adiante o comportamento do fluxo de trabalho e a interação que deve ser alcançada.

A adição de um timer, como o nome sugere, permite atrasar a execução do fluxo de trabalho e especificar uma pausa. Seu valor é configurado usando minutos e pode assumir um valor entre 0 e 43200, correspondendo a um limite máximo de 30 dias. Uma pausa em um fluxo de trabalho faz sentido ao configurar a entrega contínua, especialmente ao usar a implantação progressiva (implantação canário). É possível fazer um fluxo de trabalho que implementa uma nova versão em um ambiente (por exemplo, Produção) em um segundo servidor e configura o tráfego para que 5% dos usuários sejam redirecionados para o segundo servidor, aguarde um dia para garantir que nenhum problema chegue, então acione uma alteração para enviar 40% do tráfego e aguarde mais 24 horas e, finalmente, se nenhum problema for detectado, redireciona todos os usuários no segundo servidor com a nova versão do aplicativo.

O filtro por branch garante controle de qualidade implícito no código a ser implantado. Três modos estão disponíveis:
1. Todos os branches são permitidos: nenhum controle é feito
2. Alguns branches específicos são permitidos: esses branches são listados explicitamente
3. Somente branches com regras de proteção são permitidos: esta é uma funcionalidade do GitHub que permite aplicar controles no código-fonte. Por exemplo, é possível enviar o código em um branch somente se ele vier de uma solicitação de pull ou quando houver uma revisão de código.

### Branch filter
Se um filtro de ramificação for implementado para um ambiente, ele será interrompido com um erro quando o fluxo de trabalho for iniciado a partir de uma ramificação não autorizada.

### Filtro de branch desrespeitado
Os segredos do ambiente operam na mesma mecânica que os segredos do fluxo de trabalho discutidos anteriormente, mas diferem pelo seu escopo de acesso. Eles são acessíveis apenas pelos trabalhos (e suas ações) que referenciam o ambiente ao qual pertencem. Mais do que uma questão de segurança, isso simplesmente torna possível separar os segredos uns dos outros, para poder manipulá-los mais facilmente, evitando qualquer erro humano. Também permite criar um segredo com um nome único, mas declará-lo em dois ambientes com dois valores diferentes, facilitando a chamada do fluxo de trabalho ao reutilizar o mesmo YAML.

### Referenciando um ambiente
Depois que o(s) ambiente(s) são criados e configurados, ainda temos que vincular nossos estágios de fluxos de trabalho a cada um deles. A conexão é extremamente simples adicionando no nível do trabalho a propriedade environment e o nome do ambiente ao qual você deseja ser vinculado. Cada trabalho só pode ser vinculado a um ambiente, mas todos os trabalhos de fluxo de trabalho não precisam ser vinculados a um ambiente.

```
Build:
runs-on: self-hosted # not linked to an environment
steps: #...
DeployDev:
runs-on: self-hosted
environment: #...
name: DEV # Indicates the name of the environment linked to this job
steps: #...
DeployPRD:
runs-on: self-hosted
environment:
name: PRD # Indicates the name of the environment linked to this job
steps:
```

Percebemos que a implantação de produção está pausada no exemplo anterior, aguardando uma aprovação manual definida no ambiente PRD. Então, um dos aprovadores tem que clicar na caixa do ambiente, para abrir um pop-up de aprovação.

### Manual approval
Assim que a aprovação for realizada e nenhuma outra regra estiver pendente (por exemplo, um cronômetro), o fluxo de trabalho continua sua execução.

### The use of custom URLS
Os ambientes oferecem uma funcionalidade discreta, mas podem ser muito úteis, a configuração da URL do ambiente. Esta URL é exibida diretamente abaixo do nome do ambiente (na verdade, o trabalho) dentro do visualizador de fluxo de trabalho. Ele permite com um simples clique ir para o ambiente de destino e verificar se ele está funcionando corretamente.

```
environment:
name: DEV
url: https://dev.my-application.com
```

No entanto, codificar essas informações não tem muito mais valor do que um favorito em um navegador da Web. Esse recurso faz sentido quando a URL não é conhecida com antecedência, mas será descoberta (ou gerada) durante a implantação do aplicativo. Esse é frequentemente o caso quando o fluxo de trabalho gera a infraestrutura que hospeda o aplicativo (infraestrutura como código) e, em seguida, implanta o aplicativo; caso de uso muito comum ao trabalhar com um provedor de nuvem pública, como o Microsoft Azure.
Vamos pegar o exemplo de uma implantação de um aplicativo em contêiner em um cluster Kubernetes. A implantação é feita por meio de um arquivo manifesto (escrito em YAML) que indica ao Kubernetes qual contêiner implantar, mas também se esse contêiner deve ser exposto na Internet. Se for esse o caso, o Kubernetes fornece um endereço IP automaticamente, o que permite o acesso ao aplicativo implantado.

```
deploy:
name: Deployment on Dev
runs-on: self-hosted
environment:
name: DEV
url: ${{ steps.retrieve_ip.outputs.IP }} # retrieves the output variable of the step retrieve_ip
steps:
- name: Deploying the Kubernetes manifest
run: kubectl apply -f myapp.yaml
- name: Recovery of the IP of the service
id: retrieve_ip
run: |
IP=$(kubectl get SVC my-app jsonpath="{.status.loadBalancer.ingress[0].ip}') # Ask Kubernetes which IP it was created for the application
echo 'IP=https://$IP' >> $GITHUB_OUTPUT # puts the IP in a variable
```
O resultado fornece a URL diretamente do aplicativo exposto pelo Kubernetes; então, essa URL é prefixada com "https://" (obrigatório porque o GitHub espera uma cadeia no formato de URL) antes de ser inserida em uma variável de saída e então recuperada automaticamente na propriedade "url".

### Exercícios
### Exercício n°1
Crie um fluxo de trabalho multiambiente que permita que você obtenha exatamente (incluindo cada rótulo) o seguinte resultado:

Informações adicionais:
. Os quatro trabalhos são chamados de job1, job2, job3 e job4
. O estágio Teste de carga requer esperar 5 minutos antes do início
. O estágio Teste requer aprovação manual de uma pessoa

### Exercício n°2
Você lidera uma equipe de desenvolvimento com vários desenvolvedores que trabalham no mesmo código-fonte no mesmo repositório. Cada desenvolvedor trabalha em uma parte do aplicativo e, sempre que um desenvolvedor envia seu código para o branch principal, a implantação no ambiente DEV é acionada. Quando dois desenvolvedores enviam seu código em um curto espaço de tempo, duas implantações são acionadas em paralelo no ambiente e ocorrem erros. Você deve alterar o fluxo de trabalho para garantir que apenas um ambiente possa ocorrer ao mesmo tempo no ambiente DEV.
A implementação dessa restrição não é explicada neste livro, mas está presente na documentação do GitHub. Dica: simultaneidade.

## Controle de fluxo
Um fluxo de trabalho executa sequencialmente as tarefas descritas em seu arquivo YAML da mesma maneira para cada execução para fornecer a confiabilidade que esperamos de um processo automatizado, ao contrário de um processo humano sujeito a erros. O arquivo YAML, no entanto, representa a versão otimista do fluxo de trabalho: a execução das tarefas sendo bem-sucedida sem que nada venha a prender as rodas. Mas, infelizmente, a experiência da vida real nos ensina, especialmente em TI, que nada é previsível em 100% e surpresas (ruins) são comuns.
O GitHub Actions, no entanto, nos oferece vários elementos para controlar nosso fluxo de trabalho mais finamente, especialmente em erros ou comportamentos imprevistos.

### Defina uma condicionalidade de execução
Como você faria com uma linguagem de programação, o GitHub Actions permite considerar as etapas como blocos de execução e acioná-las dinamicamente de acordo com um teste condicional retornando verdadeiro/falso. Além disso, cada etapa tem uma propriedade opcional if que permite indicar uma fórmula que será avaliada no início da etapa para definir se a uma deve ser ignorada ou não. Então é possível, por exemplo, testar se uma variável específica tem um valor específico:

```
steps:
- if: ${{MY_VAR}} = 'value'
run: blahblah
```

Ou para fazer condições mais complexas usando valores contextuais:

```
steps:
- if: github.repository == 'Igmorand/book' && github.event_name == 'pull_request'
  run: blahblah
```

Também é possível controlar a execução de uma etapa quando uma etapa anterior falhou, por exemplo, usando o método failure().

```
steps:
- run: mycommand
- if: failure() # If previous step fails
run: blahblah
```

Se você quiser verificar o status de uma etapa específica, que não foi colocada imediatamente antes, é necessário usar o contexto de execução das etapas e observar o status registrado pelo agente por meio do resultado da propriedade.

```
steps:
- name: Step 1
  id: step1
  run: mycommand
continue-on-error: true
- name: Step 2
run: echo 'still processing'
- if: steps.step1.outcome != 'success' # check
run: blahblah
```
## Ignore execution errors
A mecânica dos fluxos de trabalho e agentes é simples: um fluxo de trabalho para assim que um erro é encontrado. Para que esse erro venha de uma linha de comando ou de uma ação de terceiros que retornaria um código de erro (código de saída diferente de O), a etapa é marcada como falha nos logs de erro, o fluxo de trabalho para instantaneamente e as outras etapas são ignoradas.
A sintaxe do GitHub Actions permite o atributo continue-on-error que permite indicar ao agente em execução para ignorar os códigos de erro retornados pelas etapas.

```
- uses: 1gmorand/action-which-can-fail@v1
continue-on-error: true
```

Esta palavra-chave é usada principalmente quando você tem etapas que podem falhar, mas deseja que as etapas seguintes ainda sejam executadas, aconteça o que acontecer, como etapas de limpeza.

```
- uses: 1gmorand/action-which-can-fail@v1
continue-on-error: true
- name: Cleaning
run: ./cleanup.sh
```

Uma alternativa é usar a função always(), idêntica à usada com jobs. Ela controla a execução do passo. Assim, no caso a seguir, o segundo passo executará o que quer que aconteça.


```
- name: main command
run: failing command
name: cleaning
run: ./cleanup.sh
if: always()
```

## Control of execution time
Normalmente, um fluxo de trabalho é executado por um "robô", seu tempo de execução não é um problema, pois não consome o tempo de um humano. Às vezes, no entanto, algumas etapas do fluxo de trabalho falham em executar sua tarefa atribuída e caem em um modo de loop infinito. Esses casos que podem ser acionados por vários motivos apresentam muitos problemas:
• A tarefa esperada nunca é concluída.
• O fluxo de trabalho pode durar horas antes de ser encerrado pelo GitHub (tempo máximo de execução de um trabalho de 6 horas), e os usuários só serão notificados quando o limite de tempo for atingido.

O tempo de execução tem um custo porque consome parte do tempo de execução alocado a você. Isso pode ter um custo financeiro. Portanto, é importante limitar esse desvio potencial.

Para responder a isso, o GitHub Actions permite que você aplique um atributo timeout-minutes em uma etapa para limitar a execução.

Assim, se você acha que uma etapa pode entrar em um loop infinito, você pode aplicar um limite após o qual o GitHub irá pará-la e considerá-la como falha se a etapa não tiver terminado a tempo.

```
- run: ./my-script.sh
timeout-minutes: 5 # max limit of 5 minutes
```
## Os emblemas
A vantagem de automatizar processos usando fluxos de trabalho automáticos é simplificar o gerenciamento desses processos, pois eles não exigem interações/tratamentos humanos. No entanto, a desvantagem é que é fácil perder de vista o estado do processo e esquecer de verificar a boa execução de cada fluxo de trabalho. O GitHub oferece um sistema de alertas, mas quando você deseja dar visibilidade dos fluxos de trabalho a pessoas externas, isso pode ser mais complexo ou precisar implementar mecanismos dentro dos fluxos de trabalho, como enviar um e-mail ou enviar uma mensagem de bate-papo em um grupo do Teams/Slack.

Existe outra alternativa: os emblemas. Os emblemas são botões "inativos" que permitem uma olhada para indicar se um fluxo de trabalho foi bem-sucedido ou não. É possível criar um (ou mais) emblema(s) por fluxo de trabalho. A criação de um emblema é realizada por meio da tela de execução do fluxo de trabalho e por meio do menu de contexto oculto no canto superior direito desta tela:

O portal da Web exibe então um formulário que permite definir o emblema, incluindo a ramificação ou o evento que acionou o fluxo de trabalho. Por exemplo, isso permite que você tenha um emblema de combinação no caso de um fluxo de trabalho ter vários gatilhos ou poder ser executado por várias ramificações.

## Configurando um emblema
Os emblemas são então gerados dinamicamente, e um portal fornece a você um bloco de texto de empréstimo que pode ser integrado aos arquivos Markdown do GitHub. Em particular, é comum incluir emblemas no arquivo README do Repositório para dar uma visão clara e direta sobre o status dos fluxos de trabalho, seja implantação, teste de segurança ou simplesmente compilação. Aqui está um exemplo do uso de emblemas:

README.md
A lista de verificação do serviço Azure Kubernetes
Crie e implante na licença MPL-2.0 de aprovação prévia do último commit de ontem

Emblemas em um arquivo README

Também é possível incluir o emblema em um site externo ao GitHub. Isso requer o uso do seguinte formato:

`https://github.com/<OWNER>/<REPOSITORY>/actions/workflows/<WORKFLOW_FILENAME>/badge.svg`

Aqui está um exemplo de um emblema injetado em uma página HTML:

`<img src="https://github.com/60pportunities/aks-checklist/actions/ workflows/generate-offline.yml/badge.svg" />`

Esses emblemas são mais do que um elemento estético; eles podem dar visibilidade centralizada, sem precisar ir para a parte de ações restaurativas e analisar cada fluxo de trabalho.

## Fluxos de trabalho reutilizáveis
Em vez de duplicar e transferir conteúdo entre diferentes fluxos de trabalho, é possível estabelecer fluxos de trabalho reutilizáveis. Esses fluxos de trabalho reutilizáveis podem ser invocados por você ou qualquer pessoa autorizada a acessá-los, permitindo a integração em outros fluxos de trabalho.

A prática de reutilizar fluxos de trabalho elimina a redundância, simplificando o gerenciamento do fluxo de trabalho. Isso acelera a criação de novos fluxos de trabalho, aproveitando a base estabelecida por outros, semelhante a como você constrói sobre ações existentes. Além disso, a reutilização de fluxos de trabalho promove a adoção de melhores práticas, facilitando a utilização de fluxos de trabalho bem elaborados, pré-testados e comprovadamente eficazes. Essa abordagem capacita sua organização a cultivar um repositório de fluxos de trabalho reutilizáveis que podem ser controlados centralmente, contribuindo para uma manutenção eficiente.

### Como funciona?
De um lado, você simplesmente cria um fluxo de trabalho reutilizável que é um fluxo de trabalho padrão com uma exceção, se você quiser passar parâmetros, você precisa declará-los como workflow_call:

```
name: Reusable workflow example
on:
workflow_call:
inputs:
message:
required: true
type: string
jobs:
myjob:
runs-on: self-hosted
steps:
- run: echo ${{inputs.message }}
```

E então, do outro lado, a partir de um fluxo de trabalho de chamada, você apenas referencia o YAML que deseja carregar:

```
name: Reusing workflow example
on:
workflow_dispatch:
jobs:
call-workflow-in-other-repo:
uses: ./.github/workflows/reusable.yaml
with:
 message: 'hello my friend'
```

Neste exemplo anterior, nós o carregamos usando um arquivo YAML local, o que significa que o fluxo de trabalho reutilizável é armazenado no mesmo repositório. Você pode imaginar um cenário onde você tem um repositório externo com todo o seu fluxo de trabalho reutilizável. Nesse caso, você deve especificar a organização (ou conta do GitHub) e o branch do seu arquivo.

```
call-workflow-in-local-repo:
uses: 60pportunities/REPO-REUSABLE/.github/workflows/reusable.yaml@main

```

Note que você pode criar fluxos de trabalho mais ricos carregando diferentes fluxos de trabalho reutilizáveis, onde cada fluxo de trabalho reutilizável pode conter várias etapas, mas você não pode misturar fluxos de trabalho reutilizáveis e etapas "normais" em um único trabalho. No entanto, você pode ter algo assim:
```
name: Reusing workflow example
on:
workflow_dispatch:
jobs:
call-workflow-1-in-local-repo:
uses: 60pportunities/test/.github/workflows/reusable.yaml@main
with:
message: 'hello my friend'
job2:
runs-on: self-hosted
steps:
- run: echo 'a normal step'
call-workflow-1-in-remote-repo:
uses: 60pportunities/test/.github/workflows/another-reusable.yaml@main
```
Você já deve estar se perguntando: qual é a diferença com Composite Actions que permite injetar vários passos de uma vez? Essa é uma boa pergunta porque a diferença é muito (muito) sutil e, como ambos os recursos continuam a remover limitações, eles se tornam cada vez mais idênticos. Use o que você acha que se encaixa em suas necessidades ou sua preferência.
acessado.

## Access to reusable workflows
Fluxos de trabalho reutilizáveis significam que um fluxo de trabalho deve ser capaz de acessar o YAML que contém o fluxo de trabalho chamado. Isso significa que pelo menos um dos seguintes requisitos deve ser verdadeiro:

- [x] Ambos os fluxos de trabalho (chamador e chamado) estão no mesmo repositório.
- [x] O fluxo de trabalho chamado é armazenado em um repositório público, e sua organização permite que você use fluxos de trabalho públicos reutilizáveis.
- [x] O fluxo de trabalho chamado é armazenado em um repositório privado e as configurações para esse repositório permitem que ele seja acessado.

### Be aware of some limtations
A reutilização é superimportante para a governança e também para a eficiência e legibilidade dos seus fluxos de trabalho, mas vem com algumas limitações:
- [x] Um fluxo de trabalho pode carregar um fluxo de trabalho que carrega outro modelo e assim por diante, até 4 níveis no máximo (para evitar loop infinito)
- [x] Você pode chamar até 20 fluxos de trabalho reutilizáveis ​​de um arquivo de fluxo de trabalho raiz. A contagem inclui todos os fluxos de trabalho reutilizáveis aninhados também.
- [x] Variáveis de ambiente não são propagadas para fluxos de trabalho chamados. Você tem que passá-las como parâmetros de entrada
- [x] Da mesma forma, variáveis de ambiente definidas no contexto env, definidas no fluxo de trabalho chamado, não são acessíveis no contexto env do fluxo de trabalho do chamador. Você deve usar saídas do fluxo de trabalho reutilizável

Não se esqueça desse recurso quando sentir que está se repetindo em seus fluxos de trabalho.

### Create your own custom GitHub Actions
O poder do GitHub Actions não é seu modelo ou tecnologia (pipeline como código) que já existe. É sua extensibilidade, permitindo que qualquer um crie uma Action e a disponibilize para todos. As possibilidades de coisas alcançáveis com o GitHub Actions se tornam quase infinitas.
Ao criar seus fluxos de trabalho, você provavelmente encontrará a maioria de suas necessidades com Actions criadas e disponíveis no mercado (mais de 8.000 no momento em que escrevo
estas linhas). Mas a tecnologia e as necessidades mudam rapidamente e inevitavelmente chegará um dia em que você estará enfrentando uma necessidade para a qual nenhuma ação já existe, ou se você deseja oferecer mais do que o que torna uma ação existente. Nesse dia, você terá a possibilidade de criar sua própria GitHub Action.
A segunda seção deste livro é dedicada à criação de GitHub Actions em diferentes formas. Primeiro, abordaremos os diferentes conceitos e, em seguida, criaremos diferentes Actions, cada uma delas, usando recursos mais avançados.

### Create your first Action
Ao criar sua própria Ação do GitHub?
Uma ação é um módulo que contém código personalizado que será executado por um dos agentes para executar uma tarefa específica. É reconhecido que uma ação deve operar no modelo de componente Linux, o que significa um componente que executa apenas algumas coisas, mas as executa perfeitamente. Você pode se deparar com ações ricas e complexas, mas esse não é o objetivo principal delas. Portanto, é preferível ter duas Ações simples enfileiradas do que apenas uma Ação complexa.
O mercado está cheio de Ações escritas por indivíduos, mas, infelizmente, a Ação que atende às suas necessidades pode não estar lá. Também é possível que seu fluxo de trabalho tenha que executar várias ações que consistem em vários comandos sequenciais que você deseja replicar em diferentes fluxos de trabalho sem ter que copiar e colar cada reutilização. Fatoração e experiência do usuário são os dois primeiros motivos para criar uma ação personalizada.

Este capítulo discutirá a criação de uma Ação, seja para compartilhá-la com a comunidade do GitHub ou mantê-la para uso pessoal.

## The different types of Actions
O primeiro conceito para desenvolver uma ação adequada é considerar um programa: um software com seus parâmetros de entrada e saída, que realiza uma tarefa dada e precisa. Esta ação tem uma versão, uma nomenclatura para chamá-la e lógica de erro (código de saída) como uma ferramenta de linha de comando. A principal diferença é que ela é empacotada para que sua integração em um fluxo de trabalho seja simplificada o máximo possível.

Como qualquer programa, uma Ação tem um código de negócio que é escrito em uma linguagem de programação. Dependendo da escolha desta linguagem ou do sistema operacional de destino (do agente), você terá a oportunidade de compor uma ação de três maneiras:

1. Ação escrita inteiramente em JavaScript (ou TypeScript)
2. Uma Ação escrita em qualquer linguagem, mas empacotada como um contêiner de imagem Docker
3. Ação escrita usando YAML, ações compostas


Dependendo do formulário escolhido, as Ações estarão disponíveis para alguns sistemas operacionais, conforme resumido na tabela a seguir:

| Туре | Sistema operacional |
| ---- | ---- |
| Contêiner Docker | Linux |
| JavaScript | Linux, macOS, Windows |
| Etapas de execução de Composites | Linux, macOS, Windows |

## Pros and cons, what to choose?
A escolha do formato da sua ação também terá impactos no seu uso diário, seja em termos de desenvolvimento/manutenção ou desempenho. Cada tipo de ação tem suas vantagens e desvantagens. Além do seu conforto para qualquer tecnologia, reserve um tempo para pesar os prós e contras de cada escolha, dependendo da sua necessidade e uso feito da sua ação.

VER TABEL:A 163

## Creation of your Action
Nos próximos capítulos, você aprenderá como construir suas ações usando conceitos avançados. No entanto, para ser mais didático, começaremos criando uma ação simples e personalizada para aprender todos os conceitos básicos, ou seja, a estrutura da ação, seus vários componentes e sua publicação. Começaremos com o famoso "Hello World", uma ação que recebe um primeiro nome e exibe uma mensagem no console.

Comece criando um repositório dedicado chamado github-action-hello (o nome não importa, mas ele terá que ser chamado da mesma forma dentro dos fluxos de trabalho). Este repositório deve ser público; é de fato um pré-requisito para poder hospedar uma Ação.

Nota: Desde 2023, é possível usar uma ação de um repositório privado se ela pertencer ao mesmo proprietário (ou organização) e tiver sido explicitamente compartilhada por meio do
menuConfigurações > Ação >Geral>Acesso.

Depois que o repositório for criado, clone-o localmente no seu computador, pois algumas ações não podem ser realizadas no portal online.

## Creating the manifest
Uma ação é um conjunto de arquivos enviados em um repositório. Para que o mecanismo GitHub carregue e use dentro dos fluxos de trabalho, essa ação deve seguir um formato predefinido. Assim, as Ações geralmente observam a seguinte estrutura:

- [x] Um arquivo README.md (opcional, mas fortemente recomendado) que descreve sua ação, mas também como usá-la, como seus parâmetros de entrada-saída
- [x] Um arquivo LICENSE (opcional) para esclarecer se alguém pode ou não reutilizar o código para sua ação
- [x] Um arquivo manifesto action.yaml (obrigatório!).
- [x] Scripts que compõem a lógica de sua ação e o que ela executa

Comece criando o manifesto de sua futura Ação: action.yml (ou action.yaml). Este arquivo permite que o GitHub "descubra" sua ação, suas propriedades, mas também seu comportamento. Ele contém várias propriedades que você definirá para criar sua primeira ação. O primeiro bloco descreve sua ação; ele contém o nome, uma pequena descrição e, potencialmente, o autor da Ação.

```
name: 'Hello World' # The name of your action (mandatory)
description: 'Says hello to someone' # a simple description (mandatory)
author: 'Louis-Guillaume MORAND' # The name of the creator (optional)
```

Um segundo bloco descreve a parte técnica: o formato da ação (JavaScript ou Docker). No nosso caso, ele também contém o ponto de entrada e a versão do JavaScript usada. No nosso caso, começaremos criando uma ação JavaScript baseada no NodeJS 12 e cujo arquivo principal será index.js.

```
runs:
using: 'node20' #JavaScript action using NodeJS 20
main: 'index.js' # The entry point (main script)
```
Uma seção é dedicada aos parâmetros de entrada e saída. Não há necessidade de parâmetros de saída em nosso caso, mas um parâmetro chamado who contém o nome da pessoa para passar como parâmetro. Vamos dar a ele um valor padrão.

```
inputs: # List of input parameters
firstname: # (mandatory) the name of the parameter
description: 'Name of the person' # (mandatory) a sentence that describes the parameter
required: true # (mandatory) indicates whether the parameter is required or not
default: 'World' # (optional) gives a default value to the parameter
default: 'World' # (optional) gives a default value to the parameter
```

Por fim, um bloco opcional está relacionado à marca da sua ação. Este é o ícone que aparecerá no marketplace se você publicá-lo.
```
branding:
icon: 'message-circle' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

A lista de ícones disponíveis está bem acima de cem se a lista de cores for limitada (branco, amarelo, azul, verde, laranja, vermelho, roxo ou cinza-escuro). Os nomes desses ícones e a exibição esperada podem ser encontrados no site FeathersIcon: https://feathericons.com/.

O conteúdo final do seu arquivo manifesto deve ser semelhante a este: (a ordem dos blocos não importa)

```
name: 'Hello World' # The name of your action (mandatory)
description: 'Say hello to someone' # a simple description (mandatory)
author: 'Louis-Guillaume MORAND' # The name of the creator (optional)
runs:
using: 'node20' #JavaScript action using NodeJS 20
main: 'index.js' # The entry point (main script)
inputs: # List of input parameters
firstname: # (mandatory) the name of the parameter
description: 'Name of the person' # (mandatory) a sentence that describes the parameter
required: true # (mandatory) indicates whether the parameter is required or not
default: 'World' # (optional) gives a default value to the parameter
branding:
icon: 'message-circle' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

## The business logic file
É hora de criar o script que executará as ações desejadas. Se o nome dele estiver livre, ele deve corresponder ao que você colocou no manifesto; no nosso caso, index.js.
Nosso arquivo deve conter a seguinte lógica:
1. Recuperar o primeiro nome da entrada
2. Colocar o valor em uma variável local
3. Exibir uma mensagem no console

Vamos começar recuperando o parâmetro da ação. Nada complicado, especialmente porque o GitHub fornece um kit de ferramentas que facilita o desenvolvimento de ações. Este kit de ferramentas tem muitos módulos, mas precisamos apenas de um aqui: @action/core. Este tem métodos diferentes, incluindo getInput(), que pode recuperar o valor de um parâmetro de entrada:

```
const core = require('@actions/core'); // loading the Toolkit's core module
const firstname = core.getInput('firstname'); // recovery of the parameter's value
```

Para a exibição, nada complicado, uma linha pura de JavaScript:

`console.log(Hello ${firstname}!`);`

Se essas três linhas forem suficientes para fazer uma ação que funcione perfeitamente, adicionaremos um bloco try-catch que permite que o módulo não trave se ocorrer uma exceção ou problema.

Finalmente, adicionamos no bloco de tratamento de erros uma chamada para o método setfailed() que informa ao agente que a ação deve ser considerada falha. Claro, as chances de o código não funcionar são muito baixas neste caso, mas sem essa mecânica, o fluxo de trabalho pai não consegue adivinhar se o script se comportou como esperado ou se ocorreu um problema grave.

```
const core = require('@actions/core'); // loading the Toolkit's core module
try
{
const firstname = core.getInput('firstname'); // recovery of the parameter's value
console.log(`Hello ${firstname}!`);          // writes a message in the console
}
catch (error)
{
core.setFailed(error.message); // tells the agent that the process has failed and transmits the details of the problem
}
```
Seu arquivo de script está completo; no entanto, se você conhece um pouco de JavaScript, a primeira linha deve questioná-lo. Com a função require(), esta indica que carrega um módulo, mas em nenhum momento disponibilizamos este módulo. Devemos instalá-lo usando o NPM (Node Package Manager), que pode ser baixado no seguinte endereço: https://nodejs.org.

Abra um prompt de comando cuja pasta atual deve ser uma das cópias locais do seu repositório.

Primeiro, execute o comando "npm init" para preparar o NPM para usar um package.json para configurar os módulos. Este comando fará várias perguntas. Você pode deixar os valores como padrão ou personalizá-los; eles são de pouca importância.

`npm init`

Then run "npm install" to install the module @actions/core.

`npm install @actions/core`

Este comando cria uma pasta node_modules na qual o módulo @actions/core é baixado, e um novo arquivo package-lock.json registra a lista de todos os submódulos dependentes. Esses são dois arquivos técnicos importantes, mas nunca devem ser modificados manualmente.

Nossa ação está pronta; só precisamos testá-la em um fluxo de trabalho. Para fazer isso, basta usar a palavra-chave uses e fornecer o nome completo da nossa ação: Igmorand/github-action-hello@main

`- uses: 60pportunities/github-action-hello@main`

Você pode então fazer commit e enviar seu código para o repositório que está no GitHub.

Observe que "60pportunities" deve ser substituído pelo nome da sua conta no GitHub, depois vem o nome do repositório da sua ação e, finalmente, "@main", que indica usar o branch principal. Usar um nome de branch é incomum; veremos em um capítulo vindouro versionamento como sua ação e chamar esse número de versão explicitamente.

O YAML final deve ser parecido com isto:

```
steps:
- uses: Igmorand/github-action-hello@main # loading our action
with:
  firstname: 'Louis-Guillaume' # parameter to provide, indicate the name of your choice
```

## Versioning
Cada Action GitHub tem um número de versão exclusivo. Esta versão é importante porque permite que você implemente alterações em suas GitHub Actions sem impactar negativamente os usuários que consomem sua ação. Você deve estar ciente de que assim que seu primeiro rascunho do seu trabalho for publicado, os usuários poderão usá-lo. É sua responsabilidade nunca interromper seus fluxos de trabalho, seja removendo a ação ou fazendo qualquer alteração importante sem alterar o número da versão. Portanto, é fundamental estar atento à definição da versão.

O GitHub recomenda seguir a especificação SemVer ("Semantic Versioning) para construir e manter o número da versão da sua Ação. Uma versão compatível com SemVer contém pelo menos três blocos de números no formato MAJOR.MINOR.PATCH. Para cada produto, o trabalho de script sempre começa com a versão 1.0.0.

Mas é especialmente a mudança de versão que chamamos de incremento, que depende do que é feito dentro do aplicativo. Assim, incrementamos a parte:

- [x] MAJOR: sempre que grandes mudanças ou que causam mudanças de quebra são implementadas
- [x] MINOR: sempre que recursos compatíveis com versões anteriores são adicionados
- [x] PATCH: sempre que você corrige um bug ou um problema de segurança

`MAJOR Breaking changes 2.1.7 PATCH Bug fixes`
Semantic versioning

Às vezes, você verá um quarto bloco especificando um número de compilação (por exemplo, a data e um incremento) ou um modo de lançamento, por exemplo, um rótulo "pré-lançamento" ou "beta".

Certifique-se de entender completamente esse versionamento porque você inevitavelmente precisará dele para usar sua ação, pois ajudará os usuários a entender qual versão de sua ação usar.

## Exercícios
Vamos praticar com alguns exercícios sobre versionamento de ações.

### Exercício n°1
Vamos verificar se você entendeu bem as regras de versionamento. Para todas as versões a seguir, indique quais estão corretas ou não:

1. v1
2. v2.3
3.3.2024.5
4. 1.10.3.23230
5. plop1.3
6.2.0.0.pre-alpha
7. 3.56.42.win-x64
Easy, isn't it?

### Exercício n°2
Vamos trabalhar um pouco no ciclo de vida de uma ação. Vamos pegar o exemplo da nossa Ação HelloWorld publicada como versão 2.0.0 e rapidamente usada por muitas pessoas. Como parte de sua evolução, faremos várias atualizações e novas publicações no Marketplace.

Com a primeira evolução, nossa ação 2.0.0 agora recebe dois primeiros nomes em parâmetro e permite exibi-los dentro da mensagem no console. Aqui está a assinatura para chamar a ação:

```
steps:
-uses: YOUR-REPO/github-action-hello@v2
with:
firstname: 'XXX'
firstname2: 'YYY'
```
Você percebe que a ação trava se o primeiro nome contiver um caractere especial como um apóstrofo ou um traço. Você corrige sua ação e a republica. Qual novo número de versão você deve dar a ela?
Então, você decide adicionar um recurso à sua ação que permite personalizar o idioma da mensagem exibida. Definindo o idioma com um novo parâmetro obrigatório, mas um valor padrão é igual a "fr". Qual novo número de versão você deve colocar?

Finalmente, você decide alterar como os nomes são fornecidos com um novo parâmetro, "firstnames", que pega uma matriz contendo todos os primeiros nomes como valores. O valor padrão é uma tabela incluindo apenas o primeiro nome "Louis-Guillaume".

A nova assinatura para chamar a ação tem o seguinte formato:

```
steps:
- uses: YOUR-REPO/github-action-hello@v???
with:
firstnames: ['John', 'Jane', 'Bob']
```
Qual novo número de versão você deve colocar?

### Exercício n°3
Você criou uma ação para integrar com um produto de terceiros. Depois de alguns meses, o publicador deste produto de terceiros decide criar uma ação oficial do GitHub, tornando sua ação obsoleta. Você decide interromper o suporte da sua ação, mas em vez de abandoná-la brutalmente; você planeja alertar todas as pessoas que usam sua ação que uma ação oficial agora está disponível.
Você decide adicionar um aviso dentro da sua ação, que mostrará uma mensagem ao executar seu fluxo de trabalho. Você quer que a mensagem seja visível e integrada diretamente na interface do GitHub, não apenas por meio dos logs do fluxo de trabalho. Sua ação deve continuar a funcionar corretamente.

Dica: Se você não sabe como exibir um aviso adequado (=anotação), leia o capítulo "Melhorar ações".

## Publicar no Marketplace
Sua ação é perfeitamente funcional e agora pode ser usada por outras pessoas porque seu repositório é público. Uma pergunta ainda surge: qual o interesse em publicá-la no GitHub Marketplace? A resposta é simples: para melhorar sua capacidade de descoberta. É improvável que uma pessoa encontre o repositório da sua ação por acaso, e sua ação pode nunca ser referenciada automaticamente pelos mecanismos de busca. A maneira mais eficaz de permitir o uso mais amplo da sua ação e, assim, participar do esforço coletivo em torno do GitHub
Actions é publicá-la no mecanismo de busca dedicado a essas ações: o Marketplace.

A publicação é extremamente simples e leva apenas alguns cliques. Requer quatro etapas:

- [x] Documentando sua ação: como os usuários esperam aproveitar sua ação sem instruções para usá-la?
- [x] Versionamento: como acabamos de ver no capítulo anterior
- [x] Branding: dê uma identidade à sua ação por meio de seu logotipo e título
- [x] Release: a criação de um release oficial e sua tag

A seção de documentação é a mais simples, mas também a mais importante. Ela permitirá que você use sua ação e faça com que os usuários queiram usá-la. A documentação pode ser completa e rica em seu repositório e conter várias páginas, mas o Marketplace exibirá apenas uma página: o arquivo readme.me na raiz do repositório de sua Action.

Este arquivo deve conter informações diferentes sobre sua Ação, como:

- [x] Uma descrição de sua Ação
- [x] Os parâmetros de entrada e saída e uma descrição de cada um deles e seus valores padrão
- [x] Segredos e variáveis de ambiente usados por sua Ação
- [x] Um exemplo de uso (trecho YAML para chamar a Ação)

Para a parte de versionamento, você precisa seguir rigorosamente as regras semânticas explicadas no capítulo anterior ou correr o risco de perder usuários de sua ação ou potencialmente quebrar seus fluxos de trabalho e atrair seus miseráveis.

Quanto à marca, esta é rápida, pois você só pode escolher um ícone de uma lista e uma cor de fundo. Você pode encontrar ações que tenham um ícone personalizado, como um logotipo da empresa. Saiba que é impossível personalizar o logotipo, a menos que seja um "parceiro" do GitHub, um longo processo administrativo reservado para empresas que oferecem integração com o GitHub ou serviços de nuvem. Se sua empresa estiver interessada, o processo para se tornar um parceiro é descrito no site dedicado: https://partner.github.com/.

Como lembrete, a marca é feita por meio de duas propriedades do manifesto de ação:
```
branding:
icon: 'message-circle' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

Então vem a parte final: a criação de um release. O propósito deste ato é congelar uma versão, ou seja, uma versão única do seu código-fonte que não pode mais mudar no futuro para este release específico, uma versão estável. Comece abrindo o repositório do seu custom

Ação. Se estiver bem configurado com seu manifesto, o GitHub exibirá automaticamente um pop-up para facilitar sua implantação:

Clique em Draft a release para chegar à tela que pede para você preencher um nome de release e uma tag (o famoso número da versão). Este identificador git exclusivo permite que você direcione uma versão muito específica do código-fonte do seu repositório.

Marque a caixa para publicar no Marketplace
Se esta caixa estiver desmarcada, sua ação ainda poderá ser usada pelos usuários, mas eles não terão como saber/descobri-la a menos que alguém lhes dê a URL do seu repositório.

Quando a caixa de seleção estiver marcada, o GitHub realiza várias verificações, como a exclusividade do nome da sua ação. Você não pode publicar no Marketplace se todos os LEDs não estiverem verdes:

Pag.183

Se tudo estiver bem, clique no botão "Criar Release" na parte inferior da tela. Você pode então ir para o Marketplace (https://github.com/marketplace?type=actions) e encontrar
lá sua Ação:

Você encontrará o conteúdo da descrição, mas também o ícone (laranja neste exemplo) definido na seção de branding do manifesto.

## Exercícios
Vamos praticar um pouco.

### Exercício n°1
Se você ainda não fez isso, publique uma Ação Hello World de acordo com o capítulo que você acabou de ler. Certifique-se de encontrar sua Ação entre as ações do Marketplace: https://github.com/marketplace/actions/

### Exercício n°2
Para este segundo exercício, modifique sua ação para ser chamada pelo seguinte YAML (adicionando um parâmetro e alterando o número da versão). A ação deve exibir a seguinte mensagem no console: "Hello XXX & YYY." Você deve alterar o script, mas também seu manifesto.

```
steps:
- uses: YOUR-REPO/github-action-hello@v2
with:
firstname: 'XXX'
firstname: 'YYY'
```

### Exercício n°3
Para o último exercício, você deve cancelar a publicação de sua ação do Marketplace. Novamente, não queremos "poluir" o Marketplace com nossos testes. Portanto, certifique-se de que sua ação não esteja mais visível nos resultados de pesquisa do Marketplace.

O processo de cancelamento de publicação não foi abordado neste capítulo, mas é explicado na documentação oficial, e as etapas também serão detalhadas nas soluções dos exercícios no final deste livro.

Dica: basta reverter as etapas de publicação, mas isso deve ser feito para cada lançamento da Ação. Ou procure pelo pequeno botão mágico ;-)

Crie sua segunda ação
A primeira Ação está concluída, agora construiremos uma segunda ação que aborda novos conceitos. Esta segunda ação visa simplificar a criação de uma versão do GitHub automatizando a criação da tag e gerando automaticamente um histórico de alterações (changelog). Esta nova Ação, mais relevante para casos de uso reais, cobrirá as noções de execução de código de terceiros, pré/pós script, geração de variável de saída, mas também interações com o GitHub.

Um ponto de atenção em particular, a Action, contém dezenas de arquivos e conceitos que não estão relacionados ao GitHub Actions (ex: como configurar a estrutura do projeto Typescript). Esses conceitos não serão abordados neste livro, mas você pode baixar uma cópia totalmente funcional da action do repositório que contém algumas indicações adicionais: https://github.com/60pportunities/github-action-generate-relnotes.

Aviso: O código-fonte da action é minimalista e está longe de ser perfeito, mas visa ser o mais conciso possível para evitar explicar centenas de linhas de código. Você pode se concentrar nas partes que têm um valor técnico real.

## Estabelecimento dos pré-requisitos
Esta segunda Ação será escrita em TypeScript, uma linguagem de programação que visa escrever um código JavaScript melhor por meio de uma sintaxe mais rigorosa. Os arquivos Typescript (*.ts) são então transpirados (transformados) em JavaScript puro e, em seguida, executados pelo NodeJS dentro do fluxo de trabalho. Você frequentemente encontrará no mercado Ações escritas com Typescript, que se tornou a linguagem de programação mais favorecida para projetos da Web nos últimos anos.

Nosso código Typescript chamará vários módulos do GitHub Actions Toolkit para simplificar algumas de suas operações. A Ação usa:

- [x] @actions/core: módulo que fornece funções para gerenciar variáveis de entrada/saída, gerenciamento de log, acesso ao segredo/variáveis, etc.
- [x] @actions/exec: módulo para executar programas de terceiros e executar linhas de comando. @actions/github: fornece um objeto para interagir com o GitHub, pré-configurado com o contexto atual (usuário + repositório do qual o fluxo de trabalho é executado)

Esses módulos devem ser declarados no arquivo package.json, que será usado pelo NPM (npm install) para baixar o código-fonte desses módulos que nossa ação exigirá.

```
"dependencies": {
"@actions/core": "^1.10.0",
"@actions/exec": "^1.1.1",
"@actions/github": "^5.1.1",
"actions-toolkit": "^6.0.1"
},
"devDependencies": {
  "typescript": "^3.7.4"
},
```

Recurso: Como um lembrete, o GitHub Actions Toolkit é o SDK que simplifica muito o desenvolvimento de ações JavaScript usando módulos ricos, mas ainda simplificados. Sua documentação está localizada no repositório dedicado: https://github.com/actions/toolkit.

## The manifest and its variables
Naturalmente, nossa Ação precisa de um manifesto action.yml, e seu conteúdo se parece com o criado para a primeira ação. Mas é diferente para a declaração de variáveis de entrada que são definidas:

- [x] githubToken: Token de autenticação que permite que você interaja com o repositório no GitHub. Será uma questão de transmitir a variável GITHUB_TOKEN que o GitHub cria automaticamente para cada fluxo de trabalho
- [x] newTag: Número da tag Git que também servirá como nome da versão
- [x] generateArtifact: parâmetro opcional que indica se a ação deve ou não gerar um arquivo changelog.txt

Aqui está um trecho do manifesto contendo a declaração de parâmetros de entrada:

```
inputs:
github Token:
description: 'Token to access GitHub'
required: true
newTag:
description: 'New tag'
required: true
generateArtifact:
description: 'Generation of changelog?'
required: true
default: true
```

A ação também declara uma variável de saída relnotes que contém o conteúdo do changelog gerado. Embora a ação seja autônoma para reutilizar diretamente o changelog que gerou, retornar seu conteúdo ao fluxo de trabalho pai é uma boa prática se o usuário fizer outro uso do fluxo de trabalho, como enviar uma publicação por e-mail de tal lançamento.

```
outputs:
relnotes:
description: 'Content of the release note"
```
O arquivo de manifesto global é o seguinte. Observe que a ação carregará o arquivo index.js enquanto escreve nosso código em um arquivo index.ts. O arquivo JavaScript será gerado durante a compilação do TypeScript, que deve ser realizada antes de carregar seu código. Não é o GitHub Actions que fará isso automaticamente.

```
name: 'Generate release'
description: 'Generates a release and release notes based on commits'
author: 'Louis-Guillaume MORAND'
branding:
icon: 'award'
color: 'orange'
inputs:
githubToken:
description: 'Token to access GitHub'
required: true
description: 'New tag'
required: true
generateArtifact:
description: 'Generate changelog?'
required: true
default: false
outputs:
relnotes:
description: 'Content of the release note'
runs:
using: 'node20'
main: 'dist/index.js'
```

## The generation of the changelog
Claro, se os desenvolvedores trabalham com metodologia, eles comentam ao enviar seu código para o repositório, o que corresponde à funcionalidade que eles adicionam ao aplicativo. Então, por exemplo, neste comentário no commit, nossa ação simplesmente listará todos os commits desde a última tag (que era logicamente o release anterior) e então usará
suas mensagens associadas para gerar um novo arquivo, o famoso changelog.

Convenção: Não será muito fácil gerar um arquivo de release limpo e legível se os desenvolvedores não respeitarem uma certa homogeneidade para suas mensagens de commit. Existe uma convenção para escrever essas mensagens; essa convenção é uma referência hoje em desenvolvimento. Ela pode ser encontrada no seguinte site: https://www.conventionalcommits.org

Temos dois métodos para recuperar esses commits, seja usando a API do GitHub para listar esses commits ou simplesmente usando a linha de comando do Git. Esta segunda solução é a mais simples e pode ser testada facilmente em seu computador.

O comando para listar todos os comentários de commits (com uma exibição simplificada sem metadados) de uma tag até agora é o seguinte:

`git log MONTAG..HEAD --oneline --pretty-format:"%s"`
Falta-nos um comando para encontrar automaticamente a última tag para o usuário, não fornecendo-a explicitamente para nossa ação. O comando para listar as tags é "git describe -tags" e o comando para exibir apenas a última tag:

`git describe --tags --abbrev=0`

Agora que temos nossos comandos CLI, como fazê-los serem executados por nossa Ação JavaScript? O GitHub Actions Toolkit tem um módulo exec; este módulo torna possível chamar uma ferramenta externa (aqui git.exe instalado por padrão no agente) para passar parâmetros e controlar sua execução (modo silencioso, códigos de erro e até mesmo recuperar logs de saída).

Graças a este módulo, podemos criar um método getLastTag() que retorna o nome da última tag.

```
import * as exec from '@actions/exec'
await exec.exec('git',
['describe',
'--abbrev=0',
'--tags'],
options);
```

Código-fonte: O código é simplificado aqui para facilitar a leitura. Encontre o código completo no repositório da Action, incluindo como recuperar o valor de retorno da linha de comando: https://github.com/actions/toolkit

Então, no mesmo princípio, podemos criar um método getCommits() que retornará a lista de mensagens de commits da nossa tag:

```
let tagFilter= tag+'..HEAD';
await exec.exec('git',
['log',
tagFilter,
'--oneline',
'--pretty-format:"%s"],
options);
```
Finalmente, para formatar a exibição de nossas notas de lançamento, um pequeno método toList(). O método formata cada mensagem em uma nova linha com um traço para fazer uma lista legal:
```
export function toList(text: string): string {
return text
.split('\n')
`-
.map(line => (line? - ${line} :"))
.join('\n')
}
```

## The creation of a release
O objetivo principal da nossa Ação é criar uma versão do GitHub. O GitHub, sendo uma plataforma moderna, expõe a maioria dos seus serviços como API REST. No nosso caso, queremos usar a API dedicada à criação de uma versão documentada aqui: https://docs.github.com/en/rest/ reference/repos#create-a-release. No entanto, antes de escrever nosso código chamando essa API, vamos ver o que o GitHub oferece em seu kit de ferramentas. Ao ler a documentação do módulo @actions/ do github, você encontrará um objeto octokit. Este objeto contém muitas propriedades e métodos, incluindo um chamado createRelease(). Parece promissor, não é?

O método pronto para uso se encaixa exatamente na nossa necessidade, mas requer vários argumentos (alguns deles são opcionais):

- [x] owner: o nome do proprietário que criará o release deve ser um dos usuários do repositório
- [x] repo: o link para o repositório que conterá o release
- [x] tag_name: o nome da tag
- [x] name: o título do nosso release
- [x] body: um texto que descreve o conteúdo do nosso release (onde queremos colocar nosso changelog)

Já temos todas as informações, exceto o nome do repositório e o proprietário. Eles estão localizados no contexto de um fluxo de trabalho, e seria possível usar as variáveis de ambiente no fluxo de trabalho. Aqui, novamente, o GitHub nos ajuda fornecendo um objeto pré-preenchido dentro do módulo @actions/ github, o famoso octokit.

```
// Creating a context object with our GITHUB_TOKEN
const octokit = github.getOctokit(repoToken);
// Creation of the release
const response = await octokit.repos.createRelease({
owner: github.context.repo.owner, // owner's name
repo: github.context.repo.repo, // repository's name
tag_name: newTag, // The tag we found
name: newTag, // The tag we found
body: releaseNotes, // release notes
})
```
Aviso: Dependendo da versão do pacote NPM @actions/github, a assinatura para chamar o método é octokit.rest.repos.createRelease() ou octokit.repos.createRelease(). Uma nova versão foi publicada após a escrita deste livro.

## The core of our Action
Agora que todos os métodos estão prontos, ainda temos que conectá-los e viver nossas ações. Primeiro, criaremos um arquivo index.ts, que corresponderá ao ponto de entrada da nossa ação.
O primeiro passo do método é ler os parâmetros conforme declarado no manifesto acima:

```
const token = core.getInput("githubToken");
const newTag = core.getInput("newTag");
const isChangeLogEnabled = core.getInput("generateArtifact");
```

Então obtemos a última tag:

```
const tag = await git.getLastTag();
```

Essa tag é então passada para o método getCommits() para recuperar a lista de mensagens. Essas mensagens são então formatadas por toList().
```
const messages = await git.getCommits(tag)
const releaseNotes = text.toList(messages);
```
Em seguida, são transmitidos para o método que cria a liberação.

`release.createRelease(newTag, token, releaseNotes);`

Por fim, um pedaço de código funcional correspondente ao parâmetro generateArtifact para decidir se um arquivo (changelog.txt) deve ou não ser gerado.

```
if (isChangeLogEnabled)
{
  io.writeOutput("changelog.txt", releaseNotes);
}
```
O código completo deste arquivo (index.ts) é:

```
import * as core from '@actions/core'
import * as git from './git'
import * as release from './release'
import * as text from './text'
import * as io from './io'

export async function start(): Promise<void>
{
try {
// retrieving parameters
const token = core.getInput("githubToken");
const newTag = core.getInput("newTag");
const isChangeLogEnabled = core.getInput("generateArtifact");
core.debug("Token: ${token}");
core.debug("Tag: ${newTag}");
core.debug("Generate changelog: ${isChangeLogEnabled}");
// retrieving tag
const tag = await git.getLastTag();
// retrieving history message
if (tag != ")
{
const messages = await git.getCommits(tag)
const releaseNotes = text.toList(messages);
core.debug("Releases notes: ${releaseNotes}");
// create release
release.createRelease(newTag, token, releaseNotes);
if (isChangeLogEnabled)
{
  io.writeOutput("changelog.txt", releaseNotes);
}

// set output variable
core.setOutput("relnotes", releaseNotes);
}
}
catch (error)
{
core.setFailed(error.message)
}
}
start();
```

## TypeScript compilation
A geração do código final da nossa ação é extremamente simples, pois requer apenas dois comandos:

- [x] npm install
- [x] npm run build

O comando "npm install", baixa na pasta node_modules todos os pacotes declarados em package.json, ou seja, todos os pacotes necessários para a nossa Ação e o módulo typescript que adicionamos manualmente. Além disso, dentro deste mesmo package.json são declaradas as configurações de script, uma das quais, chamada build, irá lançar o "TSC", o compilador Typescript.

```
"scripts" :{
  "build": "tsc",
"test": "echo \"Error: no test specified\" && exit 1"
},
"build": "tsc",
"test": "echo \"Error: no test specified\" && exit 1"
```

Por fim, um arquivo tsconfig.json é criado manualmente para definir a compilação do typescript. É declarado onde encontrar os arquivos de origem (**.ts*), mas o diretório de destino onde os arquivos JavaScript gerados serão colocados.

```
{
"compilerOptions": {
"target":"es6",
"module": "commonjs",
"outDir": "./js",
"rootDir": "./src",
"strict": true,
"noImplicitAny": true,
"esModuleInterop": true
},
```

É como a mecânica funciona dentro de um projeto TypeScript, um pouco complexo de configurar para neófitos, mas muito flexível. Sinta-se à vontade para verificar o repositório de amostra para analisar os diferentes arquivos: https://github.com/60pportunities/github-action-generate-relnotes

Nossa ação está tecnicamente pronta, mas ainda temos que enviar todos os arquivos de origem (incluindo arquivos baixados/gerados) para o repositório GitHub.

## Integration with a workflow
Outros usuários agora podem referenciar e usar nossa ação usando sua ramificação, já que nenhuma versão foi publicada ainda. Nossa responsabilidade é garantir que nossa Ação seja funcional, e a melhor maneira é criar um fluxo de trabalho de teste dentro do mesmo repositório.

```
- uses: ./ # called the action from the current repository
with:
githubToken: ${{ secrets.GITHUB_TOKEN }}
newTag: ${{ github.event.inputs.tag}}"
generateArtifact: true
```

Pequena sutileza, por padrão, quando um fluxo de trabalho baixa o código-fonte usando a ação checkout, ele realiza um "shallow checkout", um download apenas da versão mais recente do código-fonte, sem o histórico dos commits para ter o download mais rápido possível. No entanto, esse histórico é necessário porque contém as informações necessárias para encontrar tags e comentários. Portanto, é importante definir a ação checkout e indicar para retornar mais informações para nossa necessidade. Isso pode ser feito modificando o valor fetch-depth e dando a ele "O" para dizer à ação para baixar o histórico completo do Git.

```
- uses: actions/checkout@v4
with:
fetch-depth: 0
```

Um exemplo de um fluxo de trabalho que permite especificar a tag no momento do acionamento manual:

```
on:
workflow_dispatch:
inputs:
tag:
description: 'Tag'
required: true
jobs:
build:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
  with:
  fetch-depth: 0
- name: Generate release + changelog
- id: genRelease # an ID is required to recover relnotes
uses: ./ # called the action from the current repository
with:
githubToken: ${{ secrets.GITHUB_TOKEN }}
newTag: ${{ github.event.inputs.tag}}"
generateArtifact: true
- name: Test the generated release notes
- run: echo "${{ steps.genRelease.outputs.relnotes }}"

- uses: actions/upload-artifact@v4
  with:
name: changelog
path: changelog.txt
```
Quando o fluxo de trabalho é executado, um artefato contendo o arquivo changelog.txt contendo o histórico das mensagens dos commits é criado.
Artefato contendo o changelog
E um release com uma descrição profissional também é gerado.

## Our release and its changelog
E aqui para nossa segunda ação que mostra a interação com o GitHub. Também é possível fazer ações que interagem com outros itens, como criar issues quando um problema é detectado, interagir com repositórios, gerenciar usuários, além, é claro, de poder interagir com qualquer serviço de terceiros. Conto com sua imaginação para criar todos os tipos de fluxo de trabalho que atendam às suas necessidades.

## Create a docker Action
Além das Ações JavaScript, as Ações GitHub suportam ações no formato Docker (somente Linux). Se precisamos lembrar do interesse das ações Docker em comparação com as Ações JavaScript, nesse caso, é a capacidade de pré-empacotar vários elementos juntos: ferramentas, bibliotecas, intérpretes, etc., e garantir a consistência de um ambiente que nunca mudará ao longo do tempo. Reuni-los em um único pacote torna possível simplificar o fluxo de trabalho e evitar surpresas ruins criando uma imagem de contêiner imutável (que nunca mudará novamente). Assim, a ação sempre se comportará da mesma maneira. Infelizmente, as Ações JavaScript baixam e instalam essas mesmas ferramentas a cada execução. Portanto, pode haver conflitos de versão, pacotes que não estão mais disponíveis, etc.

## How does it work?
Integrar uma ação do tipo Docker em um fluxo de trabalho é feito da mesma forma que uma Ação JavaScript (autor/ repositório@versão), mas a mecânica por trás disso é diferente. Um fluxo de trabalho, quando executado, realiza tarefas muito específicas:
1. Ao iniciar o fluxo de trabalho, o GitHub cria uma nova máquina virtual cujo sistema operacional é baseado na propriedade runs-on que você definiu no fluxo de trabalho
2. Nesta máquina virtual é iniciado um runner que baixa o manifesto do fluxo de trabalho para saber as tarefas a serem executadas
3. A primeira ação (primeiro passo) deste runner é geralmente a ação checkout que baixa o código-fonte do repositório localmente
4. Então, quando se trata da nossa ação Docker, ele baixa todo o código-fonte do repositório que hospeda a ação
5. O runner busca um arquivo Dockerfile dentro do código-fonte e o usa para criar uma imagem Docker usando o comando "docker build"
6. Uma vez que a imagem é criada, o runner inicia uma instância de contêiner local e lhe dá acesso à pasta atual (mount). Dessa forma, seu container pode interagir com seus arquivos de código-fonte
7. O container executa sua ação e devolve o controle ao runner, que pode continuar a executar as próximas tarefas
8. Os logs são enviados ao GitHub para serem exibidos no portal

A mecânica usada para Docker Actions foi projetada para facilitar seu uso sem nenhuma adaptação do seu container (sua ação) ou mesmo da estrutura do seu repositório.

## Creating a Pandoc Action
Neste capítulo, para misturar teoria e prática, criaremos uma Docker Action contendo a ferramenta "Pandoc". O Pandoc é uma ferramenta de conversão de documentos. Ele pode pegar um formato de entrada e convertê-lo para outro, por exemplo, converter do HTML markdown ou texto bruto para arquivo do Microsoft Word, de um formato científico latex para PDF ou uma combinação de todos esses, porque o Pandoc sabe como gerenciar cerca de trinta formatos; ele é frequentemente chamado de canivete suíço da geração de documentos.
O livro que você está lendo atualmente foi escrito no formato Markdown em um repositório do GitHub e transformado com o Pandoc em diferentes formatos (Microsoft Word, PDF, epub) para ser compartilhado com meus leitores. Aqui está parte do fluxo de trabalho que gera o arquivo PDF; ele contém várias etapas. O tempo de instalação das diferentes ferramentas não é insignificante (2 minutos e 30 segundos no total para gerar o livro).

```
steps:
- uses: actions/checkout@v4 # downloading source code
  name: Apt-get update # update the package database
run: sudo apt-get update
- name: install pandoc #installing pandoc
run: sudo apt-get install --assume-yes pandoc
- name: install pdflatex # installing latex and several additional modules
run: |
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-xetex
- name: Build PDF version # Generating a PDF from markdown
run: pandoc -V documentclass-memoir --pdf-engine-xelatex -- from=markdown-blank_before_header -o './dist/GitHub Actions-a
practical guide.pdf'
working-directory: ./book
```

O fluxo de trabalho não é tão complicado (mesmo que você veja apenas uma pequena parte), mas gostaríamos de reduzi-lo a uma única etapa para facilitar a leitura. Além disso, explicamos anteriormente que as ações baseadas em um arquivo docker eram mais lentas, especialmente porque leva o GitHub para gerar uma imagem docker e, em seguida, implantar (girar) um contêiner. No entanto, esse tempo de processamento do Docker pode ser menor do que o tempo cumulativo de diferentes ações sequenciais de um fluxo de trabalho padrão, especialmente como veremos, a instalação do Pandoc e suas extensões leva 2 minutos atualmente, onde uma ação do docker realizando a mesma coisa levaria apenas 30 segundos. Portanto, para responder a esse tipo de cenário, é interessante que você aprenda como criar ações do Docker.
Para hospedar sua ação, é necessário criar um novo repositório, nomeie-o "github-action-pandoc". Se você escolher outro nome, terá que adaptar os exemplos de código de acordo.

## The structure of a Docker Action
Uma Docker Action é geralmente mais sintética do que uma JavaScript Action; ela geralmente contém quatro arquivos:
- [x] Um arquivo action.yaml, o manifesto do aplicativo para sua publicação no Marketplace (o mesmo formato das JavaScript Actions)
- [x] Um Dockerfile contendo as instruções para criar a imagem Docker
- [x] Um arquivo de script que será executado dentro do nosso contêiner
- [x] Um arquivo README.md para descrever sua ação

O arquivo README.md contém a descrição da sua ação e um exemplo de YAML para usar nossa Action:
```
- uses: 60pportunities/github-action-pandoc@v1
with:
args: "--standalone --output-readme.pdf README.md"
```

A seção manifest difere muito ligeiramente daquela das ações JavaScript. A seção runs será específica, pois especificamos o tempo de execução do Docker, mas também um nome de arquivo que serve para gerar a imagem do contêiner. É um uso comum chamá-lo de Dockerfile.

```
runs:
using: "docker"
image: "Dockerfile"
```
O manifesto também contém as seções descritivas e de marca:

```
name: 'Pandoc Converter'
description: 'GitHub Action to Convert Documents via Pandoc'
author: 'Louis-Guillaume MORAND'
runs:
using: "docker"
image: "Dockerfile"
branding:
icon: 'book-open'
color: 'green'
```

Depois vêm os dois arquivos mais importantes: o arquivo docker de receitas e o script principal (que pode, é claro, ser composto de vários scripts dependendo de sua complexidade). O arquivo Dockerfile é uma lista de comandos que o Docker usará para criar sua imagem de contêiner; esta "receita" especifica todos os ingredientes a serem integrados, começando pelo sistema operacional, depois os módulos a serem instalados nele e, finalmente, os comandos a serem executados na inicialização.

Nota: Este livro não aborda em detalhes a escrita do Dockerfile e suas boas práticas. Se este tópico lhe interessa, a melhor fonte de informação continua sendo a documentação oficial: https://docs.docker.com/engine/reference/builder/. Em particular, existem boas práticas para iluminar imagens de contêiner, mas não as aplicaremos para manter o máximo de simplicidade e legibilidade.

O primeiro reflexo para atender à nossa necessidade de criar um contêiner Pandoc é escrever uma receita como esta, perfeitamente funcional:

```
# We choose a base OS Image: alpine is very lightweight
FROM alpine: 3.12
# Installing pandoc
RUN apk update && apk --no-cache add pandoc
# Installing additional modules and various tools
RUN apk add texlive-full\
texlive-xetex\
biber\
make\
rsync\
tar\
libarchive-tools\
gmp\
curl
ADD entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x","/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
```

No entanto, a geração desta imagem é relativamente lenta devido ao grande número de ferramentas para instalar (vários minutos), e o interesse de uma ação do Docker seria muito limitado em comparação ao nosso fluxo de trabalho original. Felizmente, os editores do Pandoc fizeram uma imagem de contêiner do Pandoc, permitindo-nos usá-la como base de trabalho e adicionar os módulos ausentes de que precisamos.

O novo arquivo Dockerfile é bastante simplificado e muito mais rápido de gerar:

```
# Base OS image: Alpine with already integrated Pandoc
FROM pandoc/latex:2.6
# Reduced installation of modules because many tools are already in the base image
RUN apk update\
&& apk add texlive-full\
texlive-xetex\
biber
# Integration of our script
ADD entrypoint.sh /entrypoint.sh
#Allowing script execution
RUN ["chmod", "+x", "/entrypoint.sh"]
#Defining the script to run at startup of the container
ENTRYPOINT ["/entrypoint.sh"]
```

Você certamente notou esse arquivo estranho chamado entrypoint.sh. Este é um arquivo de script simples para colocar ao lado do Dockerfile. Este é o ponto de entrada do nosso contêiner, o que significa que ele será chamado quando o contêiner iniciar e que os parâmetros foram enviados para o contêiner. Intrinsecamente, quando o runner executa sua ação, ele percebe algo como isto:

`docker run image-of-my-action --parameter-of-my-choice`

Assim, os parâmetros de uma ação são transmitidos para o container e então para o arquivo Entrypoint.sh que pode então usá-los. A estrutura de um script é geralmente da seguinte forma:

```
#!/bin/sh # the "shebang", header that tells the system by which interpreter
set -e

[...] # commands to run
```
No nosso caso, nada complicado, pois queremos apenas chamar a ferramenta Pandoc, pré-instalada em nosso contêiner, e então passar parâmetros que podem ser recuperados com "$ *":
```
#!/bin/sh
set-e
sh -c "pandoc $*" # opens a shell, and runs Pandoc by giving him the arguments
```

De quais argumentos estamos falando? Argumentos que estão no arquivo YAML. O runner os lê e então os passa para um contêiner que pode, por sua vez, transmiti-los para o script:

```
- uses: 1gmorand/github-action-pandoc@main # replace with your action
   with:
   args: "--standalone --output-readme.pdf README.md"
```
Portanto, o comando final é "pandoc standalone -output=readme.pdf README.md", que diz ao Pandoc para pegar o arquivo README.md e transformá-lo em readme.pdf. Finalmente, se você ainda não fez isso, crie um arquivo README.md com conteúdo markdown.

Nota: Você pode encontrar minha ação pronta para o usuário e bifurcá-la se desejar. Ela está localizada neste repositório: https://github.com/60pportunities/github-action-pandoc. Eu recomendo que você pegue o arquivo sample.md e coloque seu conteúdo em seu arquivo README.md. O resultado deste arquivo transformado em PDF pode surpreendê-lo.

Seu repositório deve ser parecido com isto:

Resta testar sua Ação. Para fazer isso, vamos criar um fluxo de trabalho dentro do repositório de sua Ação. Temos que testar várias coisas:

- [x] Que o arquivo dockerfile seja válido e gere com sucesso uma imagem de contêiner (isso será feito automaticamente ao chamar nossa função)
- [x] Que a chamada para nosso contêiner passando parâmetros seja executada sem erros
- [x] Que o arquivo gerado esteja no formato correto e não contenha nenhum erro

Isso pode ser feito com um fluxo de trabalho muito simples que contém três ações:

1. A primeira ação baixa o código-fonte (checkout)
2. A segunda, a ação Pandoc, transforma o README.md em um arquivo PDF
3. A terceira ação carrega o arquivo PDF como um artefato

```
name: Generate PDF
on:
workflow_dispatch: # manual trigger
push:
# and each commit on the main branch
jobs:
generate:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- uses: 60pportunities/github-action-pandoc@main # replace with your action and your branch
with:
args: "--standalone --output-readme.pdf README.md"
- uses: actions/upload-artifact@v4
with:
name: "PDF"
path: readme.pdf

```
A execução deste fluxo de trabalho permite que você gere uma imagem de contêiner na inicialização antes de executar as ações. De fato, o GitHub começa validando todos os pré-requisitos de execução cuja validade das ações antes de executá-las.

Finalmente, você notará que entre os artefatos associados ao seu fluxo de trabalho está um arquivo pdf.zip que contém o arquivo readme.pdf que acabamos de gerar. Se você usou o conteúdo do arquivo sample.md, você deve ter um PDF com uma página de rosto, um índice e um layout bonito. Novamente, é o poder do Pandoc.

## How to optimize Docker Actions
A principal lentidão de uma Docker Action é a "compilação" da própria imagem. Em nosso fluxo de trabalho de exemplo, em quase 4 minutos para executar todo o fluxo de trabalho, 3 minutos e 33 segundos são consumidos apenas pela criação desta imagem.

Mais problemático, uma imagem de contêiner é recriada com cada execução do fluxo de trabalho, o que significa que tempo é perdido a cada vez (o que também não é favorável ao meio ambiente!). Como a ação em si não muda entre duas execuções, a solução elegante seria gerar a imagem uma vez e reutilizá-la depois.

Esta solução é viável com GitHub Actions ao atingir três etapas:
1. Geração da imagem de contêiner da sua ação
2. Publicação da ação no Docker Hub (ou qualquer registro de contêiner)
3. Edite seu fluxo de trabalho para carregar a ação do Registro do Docker Hub

Se você ainda não tiver uma, precisará criar uma conta no Docker Hub (https://hub.docker.com/). Isso permitirá que você tenha um registro de contêiner pessoal, ou seja, uma biblioteca onde armazenar suas imagens de contêiner que podem ser baixadas de qualquer lugar. Anote seu login e sua senha porque você precisará deles.

No repositório da sua ação, crie um novo fluxo de trabalho de publicação de imagem do Docker. Para o exemplo, escolheremos um gatilho manual para publicar somente quando uma versão estável estiver pronta. Adicionamos dois parâmetros para fornecer no momento do gatilho: o nome da imagem e sua tag (número da versão). A primeira parte do nome da imagem deve incluir seu login do Docker e corresponde ao seu "namespace".

```
name: Publish Docker Image
on:
workflow_dispatch:
inputs:
version:
description: 'name of the container image'
required: true
image:
description: 'version of the container image'
required: true
default: "60pportunities/github-action-pandoc"
```
Isso tem a consequência de exibir um formulário durante a inicialização do fluxo de trabalho:

Então vem a parte dos passos. O primeiro passo baixa o código-fonte e os arquivos que precisaremos (Dockerfile e entrypoint.sh).
```
jobs:
publish:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
```

O próximo passo é conectar-se ao Docker Hub. Ao fazer isso, uma chave de conexão (token) é baixada localmente pelo runner e será reutilizada pelos seguintes comandos:

```
- name: Docker Hub login
run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "$ {{ secrets.DOCKER_USERNAME }}" --password-stdin
```

Depois vem o último passo, responsável por recuperar as variáveis que você insere no workflow iniciado, para construir a imagem docker da nossa ação, marcá-la com um número de versão e, finalmente, publicar a imagem no seu Docker Hub. A imagem então estará disponível e reutilizável:

```
- name: Push image to Docker Hub
run:|
VERSION="${{ github.event.inputs.version}}"
IMAGE_NAME="${{ github.event.inputs.image }}"
TAG="$IMAGE_NAME: $VERSION"

docker build --file Dockerfile --tag $IMAGE_NAME --label "org.opencontainers.image.version= $VERSION"
docker tag $IMAGE_NAME $TAG
docker push $TAG
```

O resultado final do fluxo de trabalho é:

Recurso: em caso de problemas ou se você não quiser reescrever o fluxo de trabalho completamente, você pode encontrar uma versão pronta para uso no repositório https://github.com/ 60pportunities/github-action-pandoc

```
name: Publish Docker Image
on:
workflow_dispatch:
inputs:
version:
description: 'version of the container image'
required: true
image:
description: 'name of the container image'
required: true
default: "60pportunities/github-action-pandoc"
jobs:
publish:
runs-on: self-hosted
steps:
uses: actions/checkout@v4
- name: Docker Hub login
run: echo "${{ secrets.DOCKER_PASSWORD}}" | docker login -u "${{ secrets.DOCKER_USERNAME}}" --password-stdin
name: Push image to Docker Hub
run: |
VERSION="${{ github.event.inputs.version}}"
IMAGE_NAME="${{ github.event.inputs.image}}"
TAG="$IMAGE_NAME:$VERSION"
docker build. --file Dockerfile --tag $IMAGE_NAME --label "org.opencontainers.image.version= $VERSION"
docker tag $IMAGE_NAME $TAG
docker push $TAG
```

Quando o fluxo de trabalho é executado com sucesso, o contêiner da sua ação pode ser encontrado no seu namespace no Docker Hub.

Agora que a imagem foi gerada, é necessário indicar ao fluxo de trabalho para usá-la em vez de gerar uma do Dockerfile. Isso é feito com uma nova maneira de chamar uma
Ação do Docker e o prefixo "docker://":

```
- uses: docker://NAMESPACE/NAME_DOCKER_IMAGE:VERSION
with:
args: "--blahblah" # parameters
```

Isso nos permite escrever um fluxo de trabalho substancialmente idêntico ao que havíamos escrito anteriormente:

```
name: Generate PDF - optimized version
on:
workflow_dispatch:
jobs:
generate:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- uses: docker://60pportunities/github-action-pandoc:1.0.1
with:
args: "--standalone --output-readme.html README.md"
- uses: actions/upload-artifact@v4
with:
name: "Artifact"
path: readme.html
```

Mas cujo tempo de execução será significativamente menor:

Tempo de execução reduzido

Concluindo, criar uma Docker Action nos permitiu ir de um fluxo de trabalho "JavaScript" que levava 2 min 30 para um fluxo de trabalho usando Docker, que levava 3 min 30 antes de otimizá-lo para atingir um tempo de execução de 20 segundos. Em larga escala ou simplesmente dentro de uma equipe de desenvolvimento, ganhar velocidade em cada execução do fluxo de trabalho é uma prioridade para a eficiência geral e faz parte da mentalidade DevOps.

No entanto, lembre-se de que uma parte do tempo de execução do fluxo de trabalho vem do download da imagem do Docker. Portanto, deve-se manter seu tamanho o menor possível, o que pode ser feito usando imagens minimalistas básicas (Alpine e outras versões chamadas distroless) e por meio do procedimento "multiestágio" dentro dos arquivos Dockerfile. Esta parte, embora não seja complexa, não é abordada neste livro; no entanto, você encontrará facilmente informações sobre ela na Internet.

## Create composite Actions
Depois de abordar ações JavaScript e sua alternativa Docker, vamos abordar ações compostas (etapas de execução compostas na documentação). Ação composta é uma ação composta de outras ações. Ela simplifica fluxos de trabalho (legibilidade) e facilita a reutilização quando uma ação de grupo é repetida várias vezes em vários fluxos de trabalho. Essas ações compostas são "partes" de fluxo de trabalho que serão injetadas em seus fluxos de trabalho de chamada.

Ação composta não é muito diferente de ação JavaScript ou Docker. Ela tem o manifesto action.yaml contendo os mesmos campos com uma exceção para o campo runs. Este contém o valor "using: composite" bem como uma propriedade "steps", que conterá as diferentes etapas no mesmo formato de um fluxo de trabalho "padrão":

```
runs:
using: "composite" # Specific mode that means that this module is a composite action
steps:
- run: echo "I'm the first step"
name: step1
- run: echo "I'm the second step"
name: step2
```

Nada realmente complexo. Especialmente porque no fluxo de trabalho pai, chamar uma ação composta é feito da mesma forma que para qualquer ação padrão:

```
jobs:
test:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- uses: 1gmorand/mon-action-composite@v1
```

Vamos colocar isso em prática criando juntos uma ação composta verdadeira. Nosso exemplo é uma ação que escaneia o código-fonte para verificar se as senhas foram codificadas no código-fonte, o que seria uma prática ruim e mereceria bloquear uma compilação/lançamento.

Crie um novo repositório chamado "github-action-composite- credscanning" e crie lá um arquivo manifesto action.yaml. Comece adicionando os metadados padrão:

```
name: 'Credentials scanning'
description: 'Scan source code to find if credentials have been hardcoded'
branding:
icon: 'lock' # The name of one of the available icons
color: 'orange' # The background color of your icon
```

Nota: O código-fonte completo desta ação de exemplo está no repositório público: https://github.com/60pportunities/github-action-composite-credscanning

Em seguida, adicione um parâmetro de entrada folderToScan que especifica a pasta (e subpastas) que você deseja que o scanner. Útil quando não queremos escanear o repositório completo.

```
inputs:
folderToScan: #path
description: 'The folder where to scan files'
required: true
default: '/src'
```

Então adicione o primeiro passo. Graças ao seu comando Bash particular, ele faz uma busca recursiva que permite que você encontre todos os arquivos contendo a palavra "password" e salva a lista de arquivos "em risco" em um arquivo chamado result.txt. Note que seu diretório de trabalho é especificado por meio da propriedade working- directory, que recupera o valor do parâmetro de entrada. Assim, seremos capazes de ter uma ação composta cujo caminho será dinâmico de um fluxo de trabalho para outro:

```
runs:
using: "composite"
steps:
- run: grep "password" . -R > ../result.txt
shell: bash
working-directory: ${{ inputs.folderToScan }} # Retrieves the input parameter
```
Adicione uma segunda etapa que conta o número de arquivos encontrados contando o número de linhas que foram escritas no arquivo result.txt. Para isso, você pode usar o comando "wc" (significa "contagem de palavras") e passar o parâmetro "-1" para pedir que ele conte as linhas.

```
- shell: bash
run: COUNT=$(wc -1 < result.txt) # counts and puts the result in the variable COUNT
```

Exporte essa variável como saída em seu passo para então ser transmitida ao pai do fluxo de trabalho. Para isso, é necessário dar um ID exclusivo ao seu passo.

```
-id: count-files # unique ID of your step
shell: bash
run: |
      COUNT=$(wc-1 < result.txt)
      echo "filesCount=$(echo $COUNT)" >> $GITHUB_OUTPUT # export of our variable
```

Por fim, resta apenas recuperar a saída desta etapa e transformá-la em uma saída de ação. Assim, o valor da variável é acessível pelo fluxo de trabalho pai. Isso acontece declarando um bloco de saída compreendendo uma variável de saída "scanned-files", que será mapeada para o valor de saída da etapa de contagem "count-files".

```
outputs:
scanned-files: # name of the output variable
description: "Number of files scanned"
value: ${{ steps.count-files.outputs.filesCount}}
```

O resultado completo do arquivo YAML deve ficar assim:

```
name: 'Credentials scanning'
description: 'Scan source code to find if credentials have been hardcoded'
inputs:
folderToScan:
description: 'The folder where to scan files'
required: true
default: '/src'
outputs:
scanned-files:
description: "Number of files scanned"
value: ${{ steps.count-files.outputs.filesCount}}
runs:
using: "composite"
steps:
· run: grep "password" . -R > ../result.txt
shell: bash
working-directory: ${{inputs.folderToScan }}
-id: count-files
 run: |
      COUNT=$(wc -l < result.txt)
      echo "File count: $COUNT ">> $GITHUB_OUTPUT
      shell: bash
```

Qualquer ação deve sempre ter seu próprio fluxo de trabalho de teste para garantir que esteja totalmente funcional, integrando-a de alguma forma. Por exemplo, crie um fluxo de trabalho de gatilho manual no repositório da sua ação e proponha um parâmetro de entrada "pasta" para personalizar a pasta escaneada.
```
name: Test composite action
on:
workflow_dispatch:
inputs:
folder:
required: true
jobs:
test:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
 [...] our steps
```

Em seguida, basta chamar sua ação composta transmitindo o parâmetro de entrada do fluxo de trabalho (pasta) por meio do parâmetro de entrada da ação (folderToScan):

```
-id: myCompositeAction
uses: 1gmorand/github-action-composite-credscanning@main
default: "src"
with:
folderToScan: "${{ github.event.inputs.folder }}" # Using the input parameter
```

Em seguida, adicione uma etapa que recupere a variável de saída da ação e gere uma mensagem de erro do GitHub se senhas codificadas forem encontradas.


```
- run: |
if [ ${{ env.COUNT }}> 0]
then
echo "::error::Some files contain hardcoded passwords"
exit 1
fi
env:
COUNT: ${{ steps.myCompositeAction.outputs.scanned-files }}
```

Idealmente, deveríamos colocar o gerenciamento da exceção e sua configuração dentro da ação composta para esconder a lógica de negócios e simplificar seu uso. Primeiro, no entanto, é interessante entender como retornar variáveis internas ao fluxo de trabalho pai para pedagogia.

Limitações
Ações compostas, infelizmente, ainda têm muitas limitações. Se algumas podem desaparecer em breve, elas ainda estão presentes (verão de 2021) e podem ser suficientemente impactantes em muitos casos para tornar essas ações inutilizáveis.
A primeira limitação importante foi a impossibilidade de usar a palavra-chave "uses" nessas ações e chamar uma ação de terceiros. Felizmente, esse recurso está disponível desde agosto de 2021 e fornece uma unidade maior de reutilização, como:

```
runs:
using: "composite"
steps:
- uses: docker/setup-buildx-action@v3
- uses: docker/login-action@v3
with:
username: ${{inputs.registry_username}}
password: ${{inputs.registry_password}}
- uses: docker/build-push-action@v5
with:
context: .
push: true
tags: user/app:latest
```

Outros recursos estão, no momento, indisponíveis ao usar Ações compostas:
- [x] Não é possível usar dependências (palavra-chave "needs")
- [x] Recursos de tempo limite não funcionam (timeout-minutes)
- [x] Falha silenciosa de uma etapa (continue-on-error)
- [x] Acesso a segredos. Eles devem ser recuperados pelo fluxo de trabalho pai e passados para a Ação como parâmetros

Esses recursos estão atualmente em desenvolvimento pelas equipes do GitHub, e esses limites podem desaparecer em um futuro próximo. Minhas fontes internas no GitHub me dizem que o uso da palavra-chave uses deve estar disponível por volta de agosto de 2021.

## GitHub Script
Vimos que é possível criar vários tipos de ações do github, algumas das quais são desenvolvidas usando JavaScript e que podem tirar proveito do framework octokit.js (https://octokit.github.io/rest.js). Este framework permite que você faça quase tudo no GitHub usando um cliente REST que pode chamar as diferentes APIs. Qualquer ação na sua conta do Github (repositórios, branches, segurança, etc.) que você queira fazer pode ser feita facilmente por meio deste framework.

GitHub Script https://github.com/actions/github-script é uma Action que permite que você acesse a API do GitHub a partir de qualquer fluxo de trabalho e permite, entre outras coisas, chamar todos os métodos disponíveis no octokit sem precisar criar uma ação personalizada do github. O exemplo a seguir mostra como criar facilmente um Issue :

```
- uses: actions/github-script@v7
with:
github-token: ${{secrets.GITHUB_TOKEN}}
script:
github.rest.issues.create({
owner: context.repo.owner,
repo: context.repo.repo,
title: "You've created this issue using GitHub Script!!!"
})
```


Isso também permite que você crie cenários avançados, como enviar uma mensagem para qualquer colaborador iniciante:

```
on: pull_request_target
jobs:
welcome:
runs-on: self-hosted
steps:
- uses: actions/github-script@v7
with:
script: |
// We get all issues created by the user
// because issues and PR are mixed up together in events
const creator = context.payload.sender.login
const opts = github.rest.issues.listForRepo.endpoint.merge({
...context.issue,
creator,
state: 'all'
})
const issues = await github.paginate(opts)
for (const issue of issues) {
if (issue.number === context.issue.number) {
continue
}
if (issue.pull_request) {
return // person already contributed, we stop here
}
}

await github.rest.issues.createComment({
issue_number: context.issue.number,
owner: context.repo.owner,
repo: context.repo.repo,
body: ***Welcome**, new contributor!

Certifique-se de ler nosso [guia de contribuição](CONTRIBUTING.md) e estamos ansiosos para analisar sua solicitação de Pull em breve.})
```
## Interact on other repositories
O GitHub Script é uma ação que fornece um cliente octokit autenticado. Ele recupera automaticamente o contexto do fluxo de trabalho atual e o usa para executar suas ações. Por padrão, quando um fluxo de trabalho é acionado, ele preenche uma variável (GITHUB_TOKEN) com direitos de acesso no repositório atual, e a ação do GitHub Script carrega essa variável implicitamente. No entanto, pode acontecer de você querer interagir em um repositório de terceiros ou alterar algo na configuração da sua conta/organização. Para isso, é necessário fornecer um token de autenticação com direitos de acesso suficientes.

Informações: A criação de um token PAT é feita no portal GitHub, clicando no seu perfil, depois em Configurações, Configurações do desenvolvedor e, finalmente, Tokens de acesso pessoal.

No exemplo a seguir, criamos um token que colocamos em um segredo e o passamos para a ação por meio da propriedade github-token. Este token tem um escopo maior do que o repositório atual e, portanto, torna possível interagir nos elementos de uma conta de usuário ou de uma organização. No caso a seguir, simplesmente listamos os repositórios existentes, mas também podemos completar o código para configurar esses repositórios com proteções de ramificação ou gerenciar usuários.


```
- uses: actions/github-script@v7
id: get-repos
with:
github-token: ${{secrets.MY_GITHUB_TOKEN}}
script:|
return github.rest.repos.listForUser({
username: "60pportunities"
});
```

Então, mesmo que não seja uma Ação que você mesmo cria, pareceu essencial apresentá-la para que você possa usá-la para enriquecer seus fluxos de trabalho.

Agora, vamos dar uma olhada em como melhorar suas Ações.

## Improve the user experience of your actions
Ao criar uma ação para seu uso pessoal ou compartilhá-la com o maior público, é importante tornar a experiência do usuário a mais simples e agradável possível. Portanto, o uso de sua Ação pode ter uma boa experiência do usuário se você seguir regras básicas. Aqui estão algumas:

- [x] Qualquer ação deve ter um README claro e completo, idealmente escrito em inglês
- [x] Forneça exemplos de como usar sua ação (trechos YAML)
- [x] Considere também fornecer fluxos de trabalho de amostra abrangentes. Um trecho de código às vezes omite mostrar o que acontece antes e depois
- [x] Simplifique seu uso com parâmetros explícitos e de nome curto, mas também com valores padrão
- [x] Se você criar uma ação docker, mesmo que ofereça uma imagem de contêiner pronta para o usuário, forneça o arquivo Dockerfile para permitir que as pessoas vejam o que ele contém e para permitir que reconstruam a imagem do seu lado
- [x] Considere, dependendo da complexidade da sua ação, fornecer um modo DEBUG/VERBOSE para exibir mais detalhes se ocorrerem problemas de configuração
- [x] Se sua ação gerar arquivos, exponha um parâmetro para permitir que o usuário especifique o nome e o caminho do arquivo gerado

Existem outras boas práticas, que exigem algum esforço, mas cujo valor agregado, por menor que seja, melhora muito o uso da sua ação.

## Improving logs
Os logs da sua ação são a principal maneira de um usuário verificar se o comportamento esperado ocorreu bem e o melhor lugar para obter informações sobre as várias atividades realizadas. Os logs da sua ação aparecem nos logs de execução do fluxo de trabalho no portal do GitHub e são mais ou menos legíveis.

No entanto, há muitas maneiras de melhorar a legibilidade. A primeira maneira é usar os métodos dedicados para mensagens de aviso e erro, respectivamente: error() e warning().

```
core.warning('my warning message');
core.error('my error message');
```

Também pode ser usado sem o kit de ferramentas:

```
echo '::error::my error message'
echo '::warning::my warning message'
```

Além de serem enfatizadas dentro dos logs, as mensagens digitadas como "aviso" ou "erro" também são exibidas na tela de resumo do fluxo de trabalho.

Isso permite que você destaque mensagens importantes no meio de centenas de linhas de logs que um fluxo de trabalho pode produzir.

## Annotations
Essa coloração também pode ser realizada manualmente, seja para a cor do texto, cor de fundo ou estilo do texto (negrito, itálico, sublinhado). Então, prefixe o texto a ser exibido com um código de escape, com base nos códigos ANSI (https://en.wikipedia.org/wiki/ANSI_escape_code), que torna possível controlar totalmente o layout do texto que o segue:


```
core.info("\u001b[38;5;6mText in blue')
core.info("\u001b[48;2;255;0;0mOr a blue background')
core.info("\u001b[1mOr just bold text')
```
Posso brincar com cores

Também é possível injetar ícones nos logs para tornar uma mensagem mais visual.

Também posso incorporar ícones se quiser 13 qualquer tipo de ícone

Inclusão de ícones

A lista de ícones possíveis é baseada na lista de emojis suportados pelo portal GitHub. A lista inclui várias centenas deles, o suficiente para atender a cada uso. A lista completa de códigos de ícones e a imagem associada a cada um deles está na seguinte página: https://github.com/ikatyang/emoji-cheat-sheet.

Por fim, saiba que também é possível agrupar logs em blocos dobráveis usando os métodos startGroup() e endGroup(), conforme mostrado no exemplo a seguir:

```
core.startGroup('A group of logs')
core.info('my first log')
core.info('my second log')
core.info('my third log')
core.endGroup()
```

## Customizando Sumário Job
Assim como as anotações que já discutimos, que permitem enfatizar alguns avisos ou mensagens de erro, é possível adicionar informações na página de resumo da execução de um fluxo de trabalho. Pode ser um link, detalhes, um status da implantação ou qualquer coisa que você queira fornecer ao usuário final.

Para gerar um resumo do Job, você só precisa anexar conteúdo markdown na variável $GITHUB_STEP_SUMMARY e esse conteúdo será formatado e adicionado ao portal GitHub automaticamente.

echo "{markdown content}" >> $GITHUB_STEP_SUMMARY

Os recursos são tão infinitos quanto o markdown permite, como layout, lista, tabelas, ícones, mas também esquemas (usando o formato Mermaid https://mermaid-js.github.io/mermaid).

```
- run: |
echo "# This is a title"                               >> $GITHUB_STEP_SUMMARY
echo ""                                                >> $GITHUB_STEP_SUMMARY # this is a blank line build summary
echo "- My first element"                              >> $GITHUB_STEP_SUMMARY
echo "- My second one"                                 >> $GITHUB_STEP_SUMMARY
echo " How about a third one with an icon :thumbsup:?" >> $GITHUB_STEP_SUMMARY
```

## Job Summary
Observe que, dentro das Ações personalizadas do GitHub, você pode carregar o SDK (pacote NPM @action/core) para formatar facilmente o Resumo do Trabalho, como:

```
import * as core from '@actions/core'
await core.summary
.addHeading('Test Results')
.addTable([
[{data: 'Test', header: true}, {data: 'Result', header: true}],
['Test n°1', 'Pass'],
['Test n°2', 'Fail'],
['Test n°3', 'Pass']
.addLink('View deployed application!', 'https://my-link.com')
.write()
```
## Set up a DEBUG mode
Como você verá mais adiante neste livro durante o capítulo sobre depuração, o GitHub oferece a possibilidade de ativar o "Debug Mode", um tipo de variável global que diz a um fluxo de trabalho para ser mais verboso. Este capítulo explicará diferentes técnicas de depuração, mas para a que nos interessa agora, é suficiente que você crie um segredo chamado ACTIONS_STEP_DEBUG com o valor "true" no repositório onde o fluxo de trabalho é executado (e não o da sua Action!). Naturalmente, isso tem o efeito de tornar o agente mais verboso sobre as tarefas que ele realiza.

### Activation du mode DEBUG
Estando ciente desse modo, sua ação pode então tirar vantagem dele para exibir informações adicionais ao usuário. A maneira mais fácil é usar o GitHub Actions Toolkit (https://github.com/actions/toolkit) e, em particular, seu módulo core que fornece métodos para exibir uma mensagem no console somente se o usuário tiver ativado o modo DEBUG.


```
#Loading the module
const core = require('@actions/core');
#Displaying a message
core.debug('This is my DEBUG message');
```
Caso você não consiga usar o kit de ferramentas de ação JavaScript, há um método alternativo com a seguinte formatação para escrever uma mensagem no console que funciona com todas as tecnologias:

`echo "::debug::This is my DEBUG message"`

O Toolkit também fornece uma função (isDebug()) que permite que você execute o processamento somente se o modo Debug estiver habilitado. Útil para iniciar diferentes comandos ou executar ações em arquivos, por exemplo. Conforme mostrado no exemplo a seguir:

```
if (!core.isDebug()) // Normal mode > Note the "!" meaning NOT
{
//curl https://github.com
// Deletes temporary files
}
else // Mode Debug
{
  //curl -v https://github.com
// does not delete temporary files for analysis
}
```
Cada uma dessas boas práticas é importante porque, com esses pequenos detalhes, sua ação será adotada por um número maior de pessoas.

## Using Pre and Post Scripts
A ação torna possível executar um conjunto de comandos quando o agente a inicia, mas infelizmente é impossível para ela controlar sua posição dentro do fluxo de trabalho; pode estar no início, no meio ou no final, de acordo com o autor do fluxo de trabalho. Às vezes, no entanto, podemos precisar que nosso processamento de trabalho seja feito em várias etapas, potencialmente no início do fluxo de trabalho para executar tarefas de inicialização ou às vezes no final do fluxo de trabalho para executar um script de limpeza. Criar uma ação padrão não dá liberdade para fazer isso fora da própria ação: a limpeza será feita após o código principal terminar, mas antes que a próxima ação seja chamada. Não é o que queremos. Depois de todas as outras ações que desconhecemos, como executar um script no final do fluxo de trabalho?

O GitHub Actions fornece um recurso específico para essa necessidade usando palavras-chave pre e post, que devem ser definidas no manifesto action.yaml da nossa ação. Como a palavra-chave main que especifica o script principal, essas palavras-chave especificam um script para executar no início do fluxo de trabalho e outro no final dele. O exemplo a seguir declara um script (pre.js) acionado antes de qualquer outra ação e outro script (post.js) acionado no final do fluxo de trabalho.

```
runs:
using: 'node20'
main: 'index.js'
pre: 'pre.js'
post: 'post.js'
```

A ação é então carregada três vezes no fluxo de trabalho e executada a cada vez apenas o script correspondente à etapa do fluxo de trabalho:

## Conditionality
Durante suas experiências, você descobrirá que é costume compactar os diferentes arquivos JavaScript de um único arquivo para facilitar o gerenciamento e reduzir o tamanho do código-fonte (as pessoas geralmente usam o módulo CNN do npmJS para fazer isso). Você encontrará ações que chamam o mesmo arquivo que o script principal, pre ou post. Por exemplo, se você olhar o código-fonte da ação CHECKOUT (muito informativo: https://github.com/actions/checkout/), você descobrirá que é um uso duplo do mesmo arquivo index.js:

```
runs:
using: node20
main: dist/index.js
post: dist/index.js
```

Como explicar que o script não executa a mesma coisa que é chamada como script principal ou pós-script? O script simplesmente tem uma lógica interna que o faz executar um código diferente dependendo do momento no fluxo de trabalho. Isso é feito com a variável de ambiente STATE_isPost. Por exemplo, o código JavaScript poderia ser assim:

```
const isPost = Boolean(process.env['STATE_isPost'])
if (isPost)
{
  myPostCode();
}
else
{
  myStandardCode();
}
```

Existe uma alternativa se você tiver scripts separados e não quiser colocar uma lógica de negócios dentro do script. Por exemplo, você quer ter um script de inicialização que seja acionado somente no Windows. Em vez de colocar esse controle da versão do Windows dentro do script que será iniciado e potencialmente não fará nada depois, é possível pedir ao agente para fazer esse teste para você usando a propriedade pre-if.

```
pre: 'pre-script.js'
pre-if: runner.os == 'windows'
```

Existe a propriedade post-if que funciona da mesma forma. Ela também pode ser baseada no resultado da execução do script principal. Assim, no caso a seguir, o script post.js só será executado se o script principal tiver sucesso sem error:

```
post: 'post.js'
post-if: 'failure()'
```
Docker: Existe uma mecânica idêntica para ações do Docker, mas ela usa propriedades como pre-entrypoint e post-entrypoint.
Com essas poucas opções adicionais, agora você pode criar uma ação que controla perfeitamente seu fluxo de trabalho. Quando este capítulo for assimilado, vire a página para começar a próxima seção que aborda conceitos ainda mais avançados do GitHub Actions.

## Conceitos avançados
Esta terceira seção do livro lida com conceitos avançados. Esses conceitos não são necessariamente complexos, mas vêm como um segundo passo na jornada de aprendizado e uso da plataforma.

### Artifact management
Os fluxos de trabalho podem executar qualquer tipo de tarefa e, para muitos deles, durante sua execução, gerarão elementos: binários, ativos de aplicativos da Web, arquivos compactados, resultados de testes ou logs. Esses elementos gerados, comumente chamados de artefatos, são criados nas máquinas virtuais usadas para executar o fluxo de trabalho e são perdidos permanentemente no final do fluxo de trabalho quando o GitHub reinicializa automaticamente a máquina virtual.

Às vezes, é necessário manter esses artefatos, seja para necessidades de arquivamento ou simplesmente porque o objetivo principal do fluxo de trabalho é gerar um elemento que deve ser recuperado e preservado. Além disso, é claro, é possível pedir ao fluxo de trabalho para copiá-los por meio de ações em serviços de terceiros (hosts da web, servidor FTP, etc.). Ainda assim, o GitHub oferece um serviço de arquivamento diretamente integrado ao seu portal da web.

### Artifacts vs. Packages
Os elementos gerados podem ser armazenados em duas categorias, dependendo do uso que será feito deles.

A primeira categoria está relacionada aos elementos técnicos. É aceito que todos os elementos gerados por um fluxo de trabalho se enquadrem nessa categoria (arquivo zip, binários, logs, imagem de contêiner, etc.). Combinar esses elementos para executar um fluxo de trabalho e disponibilizar seu download sob demanda é possível. É nessa categoria que o GitHub nomeia os Artefatos.

A segunda categoria contém os elementos técnicos reutilizáveis por outros fluxos de trabalho/projetos: pacotes ou bibliotecas que são baixados automaticamente por alguns projetos que os referenciam. Esses elementos específicos, que devem ser baixáveis por outros fluxos de trabalho, serão salvos em outro serviço do GitHub: Pacotes do GitHub. Isso é o equivalente a outros produtos com os quais você pode estar familiarizado, como Nexus, Artifactory ou Azure DevOps Artifacts. Os seguintes formatos são suportados:

- [x] Pacotes NuGet, usados por projetos .NET
- [x] Maven para projetos Java
- [x] NPM para projetos JavaScript
- [x] Gradle para projetos Java
- [x] RubyGems para projetos Ruby

E mais do que isso, o GitHub Packages oferece um registro de contêiner docker.

Assim, dependendo do tipo de item gerado e seu uso, você pode usar o GitHub Artifacts ou o GitHub Packages.

### Publication of an artifact
A publicação de um artefato é extremamente simples e consiste em usar a ação actions/upload-artifact. Esta requer apenas dois parâmetros:
- [x] path: o(s) arquivo(s) ou pasta(s) a serem incluídos no arquivo zip gerado
- [x] name: o nome do arquivo Zip gerado

```
- name: Archiving the binaries of the application
uses: actions/upload-artifact@v4
with:
path: myapplication.exe # Take and zip a particular file
name: Release           # And upload it as Release.zip
- name: Archiving the technical logs
uses: actions/upload-artifact@v4
with:
path: logs # Take all files in the logs folder
name: logs # Upload them as logs.zip
```

Após executar o fluxo de trabalho na tela de resultados, são listados todos os artefatos gerados. Eles podem ser facilmente baixados.

### Retention
No entanto, esses artefatos não podem ser considerados um arquivo confiável. Primeiro, os arquivos associados são destruídos porque o histórico do fluxo de trabalho pode ser excluído manualmente (ou por engano). Mas, acima de tudo, esses elementos têm um tempo máximo de retenção, após o qual o GitHub os remove automaticamente. Essa duração é configurável nas configurações do repositório do GitHub:

- [x] 90 dias máximos de retenção para repositórios públicos.
- [x] 400 dias máximos de retenção para repositórios privados.

Essa é a duração máxima padrão aplicada a cada artefato. Também é possível personalizar essa duração de retenção (menor que o limite padrão) para um determinado elemento, especialmente onde os artefatos são significativamente maiores. Como lembrete, a cota de armazenamento gratuito no GitHub é de apenas 500 MB para uma conta gratuita do GitHub. Portanto, para liberar algum espaço limitando o tempo de retenção de um artefato específico, é necessário usar a propriedade retention-delay:

```
- uses: actions/upload-artifact@v4
with:
name: my-artifact
path: /output
retention-days: 5 # days of retention
```
Dica: Se você atingir o tamanho máximo de armazenamento da sua conta, o upload de um novo artefato falhará. É possível abrir os resultados de fluxos de trabalho antigos e remover os artefatos manualmente e um por um. Há também uma Ação para excluí-los todos de uma vez: kolpav/purge-artifacts-action. Por fim, observe que, uma vez que a remoção é feita, o GitHub pode levar uma ou duas horas antes de considerar o espaço e permitir que você faça o upload novamente.

Se sua necessidade é manter esses itens indefinidamente, várias possibilidades estão disponíveis para você:
- [x] Para baixá-los manualmente e armazená-los no seu disco rígido
- [x] Adicione ao seu fluxo de trabalho a capacidade de salvá-los em um serviço de hospedagem de terceiros (servidor FTP, armazenamento de blobs, etc.)
- [x] Adicione-os a uma versão do seu projeto

Essa noção de arquivo de versão (ativo) é abordada um pouco mais adiante neste capítulo.

### Downloading an artifact
O download de um artefato também é possível (com a ação actions/ download-artifact), mas apenas para os artefatos que a execução do fluxo de trabalho em andamento publicou. Eles respondem a um caso de uso único: transferir dados de um trabalho para outro dentro do mesmo fluxo de trabalho, conforme explicado nos primeiros capítulos deste livro, os trabalhos são executados em máquinas diferentes. Vamos supor que você queira compilar um aplicativo no primeiro trabalho; o segundo trabalho não pode acessar os binários gerados porque eles não estão no mesmo disco. A única alternativa, editar o primeiro trabalho para carregar um artefato chamado e pedir ao segundo para baixar esse artefato.

```
job1:
steps:
- name: Archiving the binaries of the application
uses: actions/upload-artifact@v4
with:
path: /bin # takes the bin folder and zip it
name: Release # uploads it as that release.zip
job2:
runs-on: self-hosted
needs: job1 # in order for job2 to only start after job1
steps:
- name: Downloading the artifact
uses: actions/download-artifact@v4
with:
name: Release
#performs actions using the artifact
```
Às vezes, você cria um fluxo de trabalho usando as matrizes para construir várias versões do mesmo aplicativo, gerando assim vários artefatos. Você pode baixar todos os artefatos simplesmente omitindo a propriedade "name":


```
- name: Download all artifacts
  uses: actions/download-artifact@v4
```

### Publication of a release element
Se as execuções de fluxos de trabalho não forem retidas para sempre, não será o caso para lançamentos (versões estáveis do projeto). Em vez disso, você deve usar o mesmo procedimento de lançamento que discutimos para publicar uma Ação no Marketplace. Um lançamento de uma Ação requer apenas uma tag para congelar uma versão do código-fonte, mas no nosso caso, aproveitaremos a capacidade de adicionar arquivos ao lançamento para que eles sejam retidos indefinidamente (desde que o lançamento não seja excluído manualmente).

Há duas maneiras de anexar arquivos a um lançamento:
- [x] Adicionar manualmente arquivos (chamados de ativos) a um lançamento existente usando o Portal da Web do GitHub
- [x] Criar um lançamento por meio do fluxo de trabalho e adicionar a ele os arquivos desejados

Para adicionar arquivos a um lançamento existente, potencialmente arquivos que você carregou anteriormente como artefatos e baixou, clique em qualquer lançamento do seu repositório e clique no botão editar. Uma tela permite que você altere as propriedades do lançamento e arraste e solte arquivos na parte inferior desta tela.

Adição manual de arquivos de release

O segundo método, mais simples porque totalmente automatizado, simplesmente substitui a ação de upload de um artefato por uma ação de upload dos arquivos em um novo release. Novamente, a comunidade recomenda usar a ação softprops/action-gh-release que é fácil de usar e completa.

Aviso: Há uma ação oficial do GitHub para gerenciar releases e seus ativos (actions/upload-release-asset), mas o GitHub interrompeu seu suporte e manutenção. Prefira; portanto, é uma alternativa.

Quando essa ação é colocada em um fluxo de trabalho, ela criará automaticamente um release com base na tag do fluxo de trabalho. Além disso, permite usar a propriedade with.files para listar os arquivos que serão adicionados ao release.

```
- name: Create a release
uses: softprops/action-gh-release@v2
env:
GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
with:
files: | # List of files to attach to the release
CHANGELOG.txt
MyApplication.windows.x86.msi
MyApplication.windows.x64.msi
MyApplication.linux.tar.gz
```

Quando o fluxo de trabalho é executado com sucesso, uma nova versão aparece no seu repositório, incluindo seus arquivos anexados e o código-fonte que o GitHub anexa automaticamente.

Adição automática de arquivos de versão
O uso de versões tem muitas vantagens. Além do armazenamento de longo prazo, ele serve principalmente para fornecer aos usuários de seus projetos acesso rápido a binários ou informações de que precisam. Não há necessidade de bifurcar um repositório e gerenciar a compilação você mesmo; você fornece binários prontos para uso para as pessoas.

### Publish a package
Infelizmente, os lançamentos não respondem a todos os usos do compartilhamento de binários; alguns exigem o uso de pacotes. Pacotes, também chamados de dependências, são hoje em dia a maneira moderna de compartilhar bibliotecas entre projetos. Se referenciadas por um projeto, as Dependências são baixadas automaticamente de galerias públicas, como www.nuget.org ou www.npmjs.com. Pacotes do GitHub é uma galeria adicional onde você pode armazenar pública ou privadamente suas próprias dependências.

Publicaremos um pacote Nuget para projetos escritos na linguagem .NET para cobrir a geração de pacotes via GitHub Actions. Os pacotes de projetos .Net, chamados pacotes NuGet (com uma *.nupkg_extension) e sua publicação requerem duas etapas:

1. Criar projeto de aplicativo .Net autônomo
2. (Opcional) Criar um arquivo .nuspec, arquivo de metadados contendo informações como o autor do pacote, o editor, licença, versão, etc.
3. Construir o projeto para gerar uma biblioteca (.dll)
4. Transformar em um arquivo nuget (*.nupkg)
5. Carregar o arquivo em uma galeria listando os pacotes nuget

O primeiro passo é criar um projeto .NET. O comando "dotnet new" gera um projeto .Net vazio, mas perfeitamente válido.

`dotnet new console --name DemoNuGet`

A compilação de um projeto .Net normalmente é feita com o comando "dotnet build", mas o comando que permite criar o arquivo Nuget ("dotnet pack") também cuida da compilação, então podemos omitir o primeiro:

`dotnet pack --configuration Release # Creating the package`

O upload do pacote é feito no repositório do seu projeto. No entanto, a ferramenta de gerenciamento de pacotes (nuget.exe no nosso caso) conhece apenas a galeria oficial. Portanto, é necessário declarar outra galeria (chamada source) e fornecer as credenciais para conectar e fazer upload do nosso pacote.

`nuget sources add -name "github" -Source https://nuget.pkg.github.com/OWNER/ index.json -Username USERNAME -Password PASSWORD`

OWNER representa o nome da sua conta ou organização aqui, enquanto USERNAME é o nome do usuário que carrega o pacote. A senha é um PAT (Personal Access Token). É possível criar uma nova ou simplesmente reutilizar a que é injetada automaticamente em cada fluxo de trabalho: GITHUB_TOKEN.

``nuget sources add -name "github" -Source https://nuget.pkg.github.com/60pportunities/ index.json -Username 60pportunities -Password ${{ secrets.GITHUB_TOKEN}}``

Isso tem o efeito de produzir um arquivo de configuração que contém todas as galerias do NuGet, que ele pode acessar para carregar ou baixar pacotes. Por exemplo, aqui está o arquivo após o comando anterior:

```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
<packageSources>
<add key="github" value="https://nuget.pkg.github.com/60pportunities/index.json" protocolVersion="3" />
<add  key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
</packageSources>
</configuration>

```

Por fim, o comando mais importante, "nuget push", permite que você carregue o pacote na galeria Nuget. O comando recebe dois parâmetros: o caminho do arquivo para carregar e onde publicá-lo. Aqui, estamos usando a galeria GitHub declarada anteriormente.

```dotnet nuget push "bin/Release/DemoNuget.1.0.0.nupkg" --source "github"```

O arquivo de fluxo de trabalho completo se parece com isto:

```
jobs:
build:
runs-on: windows-latest
steps:
- uses: actions/checkout@v4
- name: Creating the NuGet package
   run: dotnet pack --configuration Release
- name: Adding the source
   run: nuget sources add
-name "github" -Source https://nuget.pkg.github.com/ 60pportunities/index.json -Username 60pportunities -Password ${{ secrets.GITHUB_TOKEN }}
- name: Upload package
   run: dotnet nuget push "bin/Release/DemoNuget.1.0.0.nupkg" --source "github"
```
Uma vez que o pacote é publicado, ele fica visível por dois meios. Ou indo para a página inicial da conta e clicando na aba Pacotes que aparece no topo ou na página inicial do repositório de onde ele foi gerado. No lado direito há um link para a página de pacotes

Nota: Embora não seja exigido pelo Nuget Standard, os Pacotes do GitHub podem gerar um erro durante o upload do pacote se ele não contiver a propriedade Meta RepositoryURL. Isso pode ser adicionado manualmente ao arquivo .csproj ou .nuspec do seu projeto.

```
<PropertyGroup>
<OutputType>Exe</OutputType>
<TargetFramework>net5.0</TargetFramework>
<RepositoryUrl>https://github.com/compte-github/name-repo</RepositoryUrl>
</PropertyGroup>
```

O procedimento para publicar pacotes JavaScript, Java e Ruby segue o mesmo princípio, usando cada vez a especificidade e a configuração de cada ferramenta de gerenciamento de pacotes (NPM, Maven, Gradle, Ruby, etc.). Seria muito longo cobrir todos eles neste livro. Em vez disso, sua configuração é explicada em detalhes na documentação oficial GitHub Actions.

### Debugging a workflow
Apesar da experiência adquirida por meio da escrita de fluxos de trabalho, pode ocorrer o dia em que um dos seus fluxos de trabalho não se comportará como esperado, e pode exigir que você execute muitas tentativas e falhas para atingir o resultado desejado.

Um dos truques para economizar tempo analisando o problema é ativar o modo de depuração (verbose). Assim, informações de fundo, parâmetros, testes condicionais e muito mais são adicionados aos logs do fluxo de trabalho. A análise do problema é então bastante simplificada.

Existem duas configurações para habilitar a depuração:

1. ACTIONS_RUNNER_DEBUG: que permite mais informações sobre o executor que executa o fluxo de trabalho
2. ACTIONS_STEP_DEBUG: que fornece mais detalhes sobre as diferentes ações executadas por um fluxo de trabalho

Para ativá-los, basta criar um segredo nas Configurações do repositório e ter um valor de true:
Ao executar o fluxo de trabalho, os logs devem ser enriquecidos com detalhes adicionais:

Logs enriquecidos
Uma solução fácil para habilitar a depuração apenas durante uma execução é esperar que um fluxo de trabalho falhe e usar o botão Re-run que habilitará a depuração apenas durante a próxima execução. Para fazer isso, marque Habilitar registro de depuração

Conexão direta com o executor
Se habilitar a verbosidade permitir algumas informações adicionais, há casos em que o que acontece no agente e especialmente na árvore de arquivos é uma caixa preta; mas é precisamente fácil ter problemas de caminho de arquivo e outros erros de um shell de configuração simples.

A depuração passo a passo por meio de várias execuções de fluxo de trabalho pode se tornar longa e dolorosa antes de encontrar a origem do problema.

A solução mais simples seria conectar-se diretamente na máquina virtual que executa o fluxo de trabalho para ver o que acontece, mas como os agentes do host são gerenciados pelo GitHub e em uma rede particionada, é mais complicado do que parece. No entanto, existe uma solução simples e elegante, o Tmate (www.tmate.io). O Tmate é um produto gratuito que permite que você se conecte a uma máquina remota sem acessar um site que serve como proxy. É ainda melhor conectar-se a uma máquina e executar comandos diretamente por meio de uma página da Web sem instalar ferramentas.

Tudo passa pelo uso da ação mxschmitt/action-tmate. Basta adicionar a etapa ao fluxo de trabalho onde você deseja que o fluxo de trabalho pause e permita que você se conecte.

`- uses: mxschmitt/action-tmate@v3`

Ao executar o fluxo de trabalho, dentro dos logs, o TMATE adicionará regularmente duas maneiras de se conectar. Uma para se conectar diretamente com SSH (funciona de qualquer console de terminal capaz de usar SSH) e outra de um site.

Se você abrir a URL exibida, uma página da Web contendo um terminal será aberta. Este terminal está sendo executado em seu agente e agora você pode interagir diretamente com ele.

Observe que quando você está conectado em SSH, o Tmate bloqueia o fluxo de trabalho e o impede de continuar. Então, pare a sessão e peça para o fluxo de trabalho continuar, volte para o diretório de trabalho do runner e crie um arquivo vazio chamado "continue".

`touch continue`

Depois que o arquivo é criado, o Tmate para e retorna o controle ao fluxo de trabalho para permitir que ele continue sua execução.

Também é possível dizer ao Tmate para parar automaticamente após X minutos com a propriedade timeout-minutes. Se nenhum atraso for especificado, será o tempo máximo de execução de um fluxo de trabalho do GitHub. Ainda assim, seu fluxo de trabalho será "morto" pelo GitHub antes de terminar sua execução se outras etapas forem declaradas após o TMATE.

```
- uses: mxschmitt/action-tmate@v3
   timeout-minutes: 5 # maximum delay before TMATE turns off itself
```

Gosto especialmente de adicioná-lo como a última etapa, mas somente acionado quando ocorre um problema:

```
- name: Setup tmate session
if: ${{failure() }}
uses: mxschmitt/action-tmate@v3
```

Esta dica deve ajudar você a depurar seus fluxos de trabalho mais facilmente.

Há também uma solução alternativa que permite que você execute os fluxos de trabalho do GitHub diretamente no seu computador e sem instalar um agente. Isso requer a ferramenta "Act", que pode ser encontrada no GitHub (https://github.com/nektos/act).

Apesar de algumas limitações, o Act analisa os arquivos YAML e tenta reproduzir o comportamento de um runner. Seu uso não é abordado neste livro, mas adiciona uma corda ao seu arco.


No GitHub Actions, o tempo que os logs e artefatos ficam armazenados por padrão depende do tipo de item e do plano de conta que você está utilizando.

1. Logs:
Armazenamento: Os logs de execução dos jobs (logs de cada execução de um fluxo de trabalho) são armazenados pelo GitHub por 90 dias.

Acessibilidade: Você pode acessar os logs de execução de qualquer job ou execução do fluxo de trabalho enquanto os logs estiverem dentro desse período de retenção. Após esse período, os logs são excluídos automaticamente.

2. Artefatos:
Armazenamento: Os artefatos (arquivos gerados durante o fluxo de trabalho, como binários, logs ou pacotes de build) têm uma retenção padrão de 90 dias.

Acessibilidade: Assim como os logs, os artefatos podem ser acessados e baixados enquanto estiverem dentro do período de retenção de 90 dias. Após esse período, eles são automaticamente excluídos.

Limitação de Tamanho: Além disso, há uma limitação de tamanho para artefatos individuais (50 GB por artefato), e um máximo de 100 GB no total por conta para artefatos armazenados.

3. Exceções e Personalizações:
Alterar o Tempo de Retenção de Artefatos: Você pode personalizar a retenção dos artefatos usando a opção retention-days no arquivo de workflow. Isso permite definir um tempo de retenção menor ou maior, mas não pode exceder 90 dias.


## Improve the performance of your workflows
Se você leu este livro, entendeu que a automação de tarefas e evitar erros humanos durante projetos de computador permite uma economia de tempo significativa porque uma máquina sempre será rápida como um humano e permitirá que ele se concentre em outras tarefas durante esse tempo. No entanto, também é importante que as tarefas automatizadas sejam executadas o mais rápido possível. Tomemos o exemplo de um fluxo de trabalho de compilação e implantação. Este desenvolvedor cria um aplicativo deve esperar que o fluxo de trabalho seja concluído para validar se seu desenvolvimento é confiável ou não. Um desenvolvedor pode fazer isso cerca de cinquenta vezes por dia nesta operação e representa tanto tempo perdido à toa. Multiplicando esse tempo pelo número de desenvolvedores da equipe, podemos facilmente imaginar as horas perdidas todos os dias.

Outro ponto importante, dependendo da sua conta do GitHub, o custo do final do mês depende do tempo de execução dos agentes. Embora o limite seja alto por padrão (2000 minutos por mês para uma conta gratuita), é fácil alcançá-lo. Portanto, é importante acelerar os fluxos de trabalho o máximo possível, e existem vários pontos de melhoria. Abordaremos esses pontos neste capítulo.

### Improving Actions
Ações são as bases dos fluxos de trabalho. Existem tantas possibilidades de Ações que não podemos cobrir tudo sobre otimização, mas existem regras gerais para manter seus fluxos de trabalho saudáveis.

- [x] Desabilite (se: ${{ false }}) ou comente ações que não agregam valor ao seu fluxo de trabalho
- [x] Prefira fluxos de trabalho em execução no Linux, a geração da máquina virtual subjacente sendo um pouco mais rápida
- [x] Paralelize etapas por meio de trabalhos ou matrizes quando não tiverem dependências entre si

O último ponto, quando seu fluxo de trabalho requer o download e a instalação de várias ferramentas e/ou utilitários, usar uma ação do Docker pode melhorar muito o tempo de execução do fluxo de trabalho, ainda mais, se a imagem do Docker da Ação foi gerada upstream. Este ponto de desempenho, embelezado com um exemplo factual, é abordado em detalhes no capítulo "Criar uma ação do Docker".

### Improve the source code checkout
Se for possível fazer coisas infinitas com ações do GitHub. Nesse caso, a maioria dos projetos do GitHub, em algum momento, um fluxo de trabalho usando uma porção de elementos (código-fonte, script, binários) armazenados no repositório. Todos eles usarão a ação checkout que você encontrou várias vezes neste livro:

`
- uses: actions/checkout@v4
`

Este usado no estado não representa um problema porque ele tem, em sua versão 2.x, otimizado com uma configuração padrão que indica para baixar apenas a versão mais recente do código-fonte do branch padrão (geralmente o branch "main" ou "master") e somente este.

No entanto, algumas operações podem exigir o download do histórico de commits para executar algumas operações neles. Isso pode ser feito com o parâmetro fetch-depth:

```
- uses: actions/checkout@v4
with:
fetch-depth: 5 # Number of historic versions to download
```

O valor padrão quando o parâmetro está faltando é 1 (fetch-depth: 1). Também é possível (ou você pode encontrar exemplos na Net) definir o valor fetch-depth como 0. Esse valor indica para baixar o histórico inteiro de todos os branches e todas as tags.

```
uses: actions/checkout@v4
fetch-depth: 0 # WARNING! Do you really want to do that?
```

O tempo de download pode então ser multiplicado por dez e só aumentará com o tempo. Então, certifique-se de verificar cada um dos seus fluxos de trabalho para usar o parâmetro fetch-depth somente quando realmente necessário.

### Caching dependencies
A grande maioria dos projetos de TI, independentemente da linguagem de programação, usa bibliotecas de terceiros (pacotes nuget, npm, maven, ruby, etc.), representando centenas ou até milhares de arquivos para seu código-fonte no momento da compilação de seu aplicativo. Mesmo para um aplicativo pequeno, baixar essas dependências pode levar vários minutos. A ferramenta que baixa essas dependências (nuget.exe, npm.exe, etc.) é inteligente o suficiente para baixar apenas os arquivos ausentes no computador do desenvolvedor. Assim, se a primeira compilação for longa, a segunda é quase instantânea porque todos os arquivos já estão presentes localmente. Infelizmente, essa solução não funciona para fluxos de trabalho do GitHub porque cada nova execução de fluxo de trabalho é acionada em uma nova máquina virtual.

No entanto, o GitHub Actions oferece uma solução elegante para responder a esse problema: um recurso de cache persistente. Essa solução inclui a adição da ação actions/cache dentro do seu fluxo de trabalho que salva e recupera elementos automaticamente de/para um cache persistente localizado nos servidores do GitHub. Essa ação deve ser inserida no início do fluxo de trabalho antes da resolução da dependência. Ele opera da seguinte forma:

1. Durante a primeira execução do fluxo de trabalho, a ação Cache não encontra um cache que atenda ao critério
2. O fluxo de trabalho então baixa as dependências normalmente por meio da ferramenta de resolução de dependência
3. A ação Cache injeta uma etapa no final de um fluxo de trabalho (pós-etapas) que salva os arquivos no cache
4. O fluxo de trabalho para

Na próxima execução do fluxo de trabalho:
1. A ação Cache encontra um cache que corresponde ao critério. Ele baixa o cache localmente e o coloca na pasta de destino
2. A ação cache define uma variável "cache-hit" como true para indicar que um cache foi encontrado
3. A ferramenta de resolução de dependência não precisa baixar arquivos porque eles já estão presentes localmente
4. A ação Cache injeta uma etapa no final do fluxo de trabalho, mas não salva os arquivos no cache porque a variável cache-hit é true. O cache é considerado já atualizado

A implementação é extremamente simples, pois basta colocar a ação no início do fluxo de trabalho, especificar a(s) pasta(s) para fazer backup e dar um nome ao cache.


```
uses: actions/cache@v4
with:
path: # folder to back up (e.g., nodes_modules)
key: # cache's name
restore-keys: # (optional) Alternative cache keys
```

Cada propriedade tem uma mecânica própria. Vamos pegar aqui o exemplo de um projeto JavaScript usando NPM (NodeJS Package Manager) Para baixar as dependências necessárias para o projeto colocadas em uma pasta padrão chamada node_modules. A árvore de dependências, representando todos os arquivos para baixar, é gerada pelo NPM em um arquivo chamado package-lock.json.

A propriedade path é usada para indicar as pastas (e seu conteúdo) que serão salvas no cache. Ela também é a pasta de destino onde o cache é restaurado. Então, para o nosso exemplo, o valor a ser especificado é a pasta node_modules:

```
uses: actions/cache@v4
with:
path: '**/node_modules'
```

A propriedade key indica o nome do cache. A chave com a qual os arquivos serão salvos e a chave com a qual encontraremos nosso cache entre os outros caches do repositório. Este ponto é importante; você pode ter vários caches por projeto, correspondendo para cada um deles, a um fluxo de trabalho específico. Então, para nosso exemplo, podemos chamar o cache de "node-modules", mas como você sabe se o cache corresponde à lista de arquivos listados no arquivo package-lock.json. Se compararmos os arquivos um por um, pode levar anos. A solução é calcular um hash de arquivo e usar esse hash no nome do cache; dessa forma, cada vez que uma dependência é adicionada, removida ou modificada de/para package-lock.json, seu hash muda, e podemos concluir diretamente que o cache contendo outro hash está obsoleto. O resultado então se torna:

```
uses: actions/cache@v4
with:
path: **/node_modules'
key: node-modules-${{ hashFiles("**/package-lock.json')}}
#ex:mode-modules-5805ee260f7996bab5bb7c1e4be38d9653dd02417df04f712d68c7364a6daed2
```

Por fim, a propriedade restore-keys, opcional, permite definir chaves alternativas no cache onde um cache não é encontrado. Por exemplo, tome o caso onde um conjunto de cem dependências são armazenadas em cache, se apenas uma dependência for adicionada ao arquivo package-lock.json, o hash será alterado, e o cache será ignorado, causando o download de 101 dependências. É possível indicar a ação para baixar o cache correspondente ao hash. Se o cache não corresponder, diga para ele procurar se existe outro cache quase equivalente (aqui, aquele com as 100 dependências). Dessa forma, a ação baixará o conteúdo do cache secundário (a variável cache-hit permanece falsa porque não é o cache exato desejado), o NPM então baixa a dependência ausente. Por fim, a ação (cache) injetada no final do fluxo de trabalho recria um novo cache contendo 101 dependências, tornando-se o novo cache primário.

```
uses: actions/cache@v4
with:
path: **/node_modules'
key: node-modules-${{ hashFiles("**/package-lock.json')}}
restore-keys: nodes-modules-
```

O resultado é claro. Em um projeto pequeno, o ganho já é de 30% do tempo total do fluxo de trabalho. Se o download do cache adicionar um pouco de tempo, é muito mais rápido do que baixar os mesmos arquivos por meio do mecanismo de resolução de dependência:

Limitação: O cache é gratuito, mas é limitado a 10 GB por conta para todos os caches salvos. Ao exceder 10 GB, o novo cache (fluxo de trabalho atual) é salvo, mas o cache de dados antigo será excluído para voltar a ficar abaixo de 10 GB. Em paralelo, se um cache não for acessado por 7 dias, o cache será excluído automaticamente.

Usamos aqui o exemplo muito comum das dependências, mas esse cache pode servir a muitos outros casos quando a necessidade é reutilizar o mesmo grupo de dados estáticos durante várias execuções de fluxo de trabalho.

### The usage of matrices
No capítulo dedicado às matrizes, abordamos casos de uso para compilar uma versão iOS e uma versão Android em paralelo, mas também exemplos da necessidade de compilar o código-fonte em duas versões (ou mais) de um framework como o NodeJS. Existem muitos outros casos de usos ainda mais comuns para alavancar matrizes, como a realização de testes.

Vamos pegar o exemplo de um fluxo de trabalho realizando testes de integração contidos no código-fonte. Em um fluxo de trabalho sendo simplificado aqui, por exemplo, um compila o aplicativo, o implementa, realiza alguns testes de integração e, em seguida, empacota tudo se todos os testes estiverem verdes.

```
jobs:
my-project:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- name: build
run: # build project
- name: deploy
run: # deploy the app
- name: Run integration tests
run: # run/tests
- name: Create package
run: # generate a zipped release
```

A realização de testes unitários leva dois minutos e parece incompressível, pois é uma tarefa única. No entanto, as matrizes podem ajudar a acelerar a execução dos testes cortando-os por lote. Além disso, adaptando o fluxo de trabalho e distribuindo as tarefas por jobs, é possível "dividir" a parte dos testes unitários. Assim, o próximo novo fluxo de trabalho realizará as mesmas ações, mas com um tempo de execução muito diferente:

```
jobs:
build:
runs-on: self-hosted
steps:
run: # build project
- name: deploy
run: # deploy the app
testing:
runs-on: self-hosted
needs: build
strategy:
matrix:
test-path:
- tests/integration/login/
steps:
- tests/integration/orders/
- uses: actions/checkout@v4
- tests/integration/basket/
- name: build
- tests/integration/other/
steps:
- name: Run integration tests
run: # run ${{ matrix.test-path}}''
packing:
runs-on: self-hosted
needs: testing
steps:
- name: Create package
run: #generate a zipped release
```

Essa abordagem, como os processadores multithread, pode cortar uma tarefa em tarefas menores e economizar tempo. O resultado do fluxo de trabalho é o mesmo, mas sua árvore de execução (diagrama) e seu tempo de execução são divididos por quatro com uma etapa de teste paralelizada levando mais de vinte segundos:

## The security within GitHub Actions
Hoje em dia, a segurança é muitas vezes deixada de lado quando considerada uma prioridade, especialmente no mundo da computação. No entanto, as últimas notícias têm mostrado que operações de hacking em larga escala podem ser realizadas comprometendo a cadeia de CI/CD. Ao ter acesso à fábrica de software, os invasores podem acessar o código-fonte do aplicativo e, então, procurar mais facilmente por falhas no software, extrair os segredos/strings de conexão/certificados para obter acesso aos ambientes de produção, mas também injetar malware dentro dos aplicativos e, assim, ter um malware quase indetectável que será então distribuído para outras empresas (por exemplo, o caso da pirataria da SolarWinds descoberta em 2021, mas que teria começado em 2015!).

Longe de ser exaustivo, este capítulo tem como objetivo compartilhar as principais boas práticas e os principais erros das pessoas quando usam o GitHub Actions.

## The secrets management
Os "segredos" discutidos aqui se referem a duas coisas que geralmente andam de mãos dadas:
- [x] Informações confidenciais (senha, certificado, string de conexão, chave)
- [x] Segredos GitHub: a funcionalidade que permite que você armazene essas informações críticas em uma variável segura

A primeira boa prática referente a informações confidenciais é estritamente nunca, de forma alguma, escrever esses dados sensíveis no código-fonte, pela simples razão de que qualquer pessoa com acesso ao seu repositório (seja porque o repositório é público ou acessível por um colaborador) pode recuperar esses dados. Uma vez que o segredo é armazenado no histórico de commits, torna-se difícil apagá-lo. Isso permanece tecnicamente viável com comandos como "git rebase -i", mas pode ter consequências infelizes se outra pessoa já usa a versão atual do código-fonte. No próximo push/merge de um ou outro, podem ocorrer erros. Portanto, prefira a vigilância ou crie o hábito de nunca escrever um segredo no código-fonte.

Como um anjo da guarda, o GitHub protege você escaneando automaticamente o código-fonte de seus repositórios públicos (ou privados com a Enterprise Edition). Ele alerta você por e-mail e pelo portal se encontrar segredos, como chaves para Azure, AWS, Dropbox, MailChimp e muitos outros.

Info: A lista completa dos tipos de segredos gerenciados nativamente pelo GitHub pode ser encontrada na página https://docs.github.com/en/github/administering-a-repository/about-secret-scanning

Como o repositório é necessariamente público, o dano está feito, e potencialmente piratas podem ter escaneado seu código-fonte; o segredo deve então ser considerado vulnerável e deve ser revogado instantaneamente por você. O tempo de detecção por um serviço de terceiros é em segundos, com os meios que os piratas possuem hoje; uma vez recebido o alerta, a desativação do segredo deve ser uma prioridade absoluta.

Seu reflexo deve sempre armazenar dados sensíveis dentro dos segredos do GitHub abordados no capítulo "Segredos do GitHub". Mas eles são 100% confiáveis?

### The secrets' flaws
Conforme explicado no capítulo dedicado aos segredos, quando o valor do seu segredo pode ser exibido nos logs, o GitHub substitui o valor do "*' e impede de ver seu conteúdo. O comportamento é o seguinte: o GitHub analisa os valores dos segredos no início do fluxo de trabalho e, sempre que o valor corre o risco de aparecer em um log, ele substitui seu valor usando o recurso add-mask:

```
- run: echo "${{ secrets.MY_SECRET }}" # affiche
```

Isso também pode causar comportamentos inesperados. Vamos pegar o exemplo de um nome secreto MY_SECRET com um valor de "p@ssword". Se outro comando usar o mesmo valor coincidentemente, ele será ofuscado ao mesmo tempo. Se testarmos o seguinte comando:

```
- run: echo "my p@ssword is visible"
```

Será exibida a seguinte mensagem: `my *** is visible`

Não é bem o que queremos, mas é inevitável.

Em contraste, essa proteção não deve ser considerada suficientemente segura. De fato, uma pessoa com direitos suficientes para modificar o arquivo de fluxo de trabalho usa uma falha para obter o valor. Para isso, basta que ele "corte/edite" o valor para que ele não seja mais estritamente idêntico ao valor do segredo. Um exemplo pode ser injetar um espaço entre cada caractere como no comando a seguir:


```
- run: echo "${{ secrets.MY_SECRET }}" | sed 's/./ & /g' # adds a space between each character's secret
```

Isso exibirá a seguinte mensagem no console: `p@ssword`

Nosso segredo não é mais tão secreto quanto o esperado. Lembre-se de que seus segredos são transmitidos para seus fluxos de trabalho e utilizáveis por eles, mas, portanto, expostos dentro deles. Este é um ponto de atenção a ter em mente quando você adiciona colaboradores ao seu repositório.

A situação é complicada durante solicitações de pull em seu repositório. Qualquer um pode bifurcar seu repositório (claro, os segredos não são copiados), editar um fluxo de trabalho ou criar (ou criar um novo) e fazer uma solicitação de pull em seu repositório. Isso resultará no acionamento do fluxo de trabalho modificado dentro do contexto do seu repositório e dará a ele a possibilidade de roubar seus segredos. Desta vez, a proteção padrão do GitHub é mais consistente porque quando uma solicitação de pull vem de um repositório de terceiros (bifurcação), nenhum dos segredos (exceto GITHUB_TOKEN) é transmitido ao executor. Portanto, se o fluxo de trabalho tentar exibir o valor de um segredo, ele receberá uma mensagem de erro "O segredo XXX não existe". Essa proteção é ideal para a maioria dos casos, mas às vezes pode interferir no que queremos fazer. Então, se você criar um fluxo de trabalho de verificação de qualidade de código que dispara quando uma solicitação de pull é feita, mas precisa de um segredo para se conectar a um serviço de terceiros e executar a varredura, isso não é viável porque o segredo estará vazio, a varredura falhará.

Se você realmente precisar disponibilizar um segredo em uma solicitação de pull externa, é possível, mas por sua conta e risco, desabilitando a proteção padrão do GitHub. Para isso, vá para as configurações (Settings) do seu repositório, depois na parte de ações e marque a caixa "Enviar segredos para fluxos de trabalho de solicitações de pull de fork".

Compartilhando segredos com solicitações de pull externas

## Securing self-hosted agents
Agentes auto-hospedados estão sendo executados em seu ambiente (computador, servidor); este é o primeiro ponto de entrada e ataque para comprometê-lo. Portanto, é essencial nunca definir estritamente um agente auto-hospedado em um repositório público, incluindo se nenhum de seus fluxos de trabalho o usar. Qualquer um pode bifurcar o repositório, criar um fluxo de trabalho que tenha como alvo seu agente auto-hospedado (runs-on: self-hosted) e que contenha um script malicioso ou um vírus e, em seguida, executar uma solicitação de pull em seu repositório. Isso potencialmente executaria o fluxo de trabalho perigoso em seu agente e o usaria como um backdoor.

O GitHub desabilita os fluxos de trabalho de bifurcações por padrão para evitar erros humanos, mas você pode ter ativado esse recurso para transmitir segredos, como visto antes.

### Limiting the access
O agente pode ser comprometido de fora e por pessoas com acesso ao repositório, deliberadamente ou porque suas credenciais foram roubadas.

Portanto, é essencial considerar seu agente e a máquina em que está instalado como potencialmente vulneráveis. Algumas boas práticas permitem reduzir o risco em tais casos:
1. Instale o agente com os menores privilégios. Não instale com direitos de administrador; você evitará que ele possa assumir o controle total do servidor em que está localizado
2. Limite o acesso à rede desta máquina. Se o agente não tiver motivo para acessar a rede, não permita que ele o faça, e se o acesso a certos recursos precisar ser feito (por exemplo, um servidor de produção, um banco de dados), abra essas rotas de rede exclusivamente.
3. Não use um agente para vários repositórios (possível com contas do GitHub Enterprise) e não instale vários agentes de vários repositórios na mesma máquina. Existe o risco de "ataque à cadeia de suprimentos" em que, por meio de um repositório corrompido, um fluxo de trabalho pode sair de sua pasta de trabalho e potencialmente acessar/modificar o código-fonte de outro fluxo de trabalho executado por um segundo agente na mesma máquina.

A solução ideal seria implantar agentes em contêineres, mas infelizmente, o GitHub não fornece esses agentes em contêineres. Cabe a você fazer essa tarefa, mas tutoriais podem ser facilmente encontrados online. Fique atento novamente; é melhor ter controle total sobre a imagem de contêiner gerada.

## Using third-party Actions
Ações de terceiros são certamente o primeiro ponto de vigilância a ser levado em conta. Uma regra de ouro a ser lembrada é que usar uma ação de terceiros é potencialmente arriscado, incluindo aquelas publicadas no GitHub Marketplace. De fato, o GitHub não inspeciona nem valida o conteúdo das ações publicadas em seu Marketplace, e cada ação é segura apenas pela boa vontade de seu autor. Como no ecossistema Open Source, todos podem contribuir e ver o que os outros fazem, mas infelizmente é impossível assistir a tudo.

Além disso, encontrar os aplicativos ou ações do GitHub do Marketplace com um selo "validado" pode ser reconfortante. No entanto, não caia na armadilha. Isso significa apenas que o autor da ação faz parte de uma conta do GitHub (organização) que pertence a uma empresa que validou certos critérios, como suas informações (nome real, endereço real, nome de domínio real). Isso simplesmente garante que é o publicador oficial (ex: Microsoft, Terraform, etc.), mas isso não implica que o conteúdo publicado seja seguro ou à prova de bugs.

Sempre inspecione o código-fonte de uma ação que você pretende integrar ao seu fluxo de trabalho. Quanto mais complexo o código-fonte, mais difícil será detectar um comportamento malicioso em potencial que seu autor terá bem escondido. Essa regra é especialmente verdadeira se você usar agentes auto-hospedados, pois você abre a porta para acessar seu servidor ou sua rede.

Se um agente executado pelo GitHub executar seu fluxo de trabalho, os riscos serão reduzidos, mas ainda presentes. De fato, vamos pegar o exemplo de uma ação que permite que você publique um aplicativo no servidor de terceiros de um provedor de nuvem (por exemplo, Azure). Essa ação provavelmente solicitará credenciais para se conectar ao servidor remoto. Que garantia você tem de que essa ação não enviará suas credenciais para um servidor desonesto em paralelo? Nenhuma. Pior, a solução para analisar o código-fonte antes de usar uma Ação não é 100% confiável devido à mecânica de atualizações automáticas abordadas no capítulo Crie sua Ação > Controle de versão.

Lembre-se, se você quiser declarar em seu fluxo de trabalho para carregar uma Ação "v1", não há garantia de que depois disso o código-fonte da ação que será carregada em seu fluxo de trabalho seja sempre o mesmo, porque o autor pode excluir sua versão "v1", modificar o código-fonte para inserir código malicioso e, em seguida, recriar uma versão "v1". A modificação seria então invisível e indetectável do seu lado.

Devemos usar terceiros? A resposta é "sim", mas isso deve ser feito com a maior vigilância possível.

Existem vários níveis de confiança em relação a ações de terceiros. Se todas forem permitidas por padrão, é bem possível limitar o acesso apenas a certas ações. Por exemplo, você pode permitir apenas aquelas de repositórios pertencentes a você, aquelas publicadas pelo GitHub (que podem ser consideradas realmente seguras) e aquelas publicadas por editores confiáveis (lembrete para editores aprovados: isso não prova que a ação em si seja confiável).

Em relação a outras ações que não se encaixam em nenhuma dessas categorias, seu uso dependerá do seu contexto (particularmente da criticidade do seu projeto). Também é possível limitar os riscos de modificações descontroladas, como explicado acima, usando o hash do commit. Este método é explicado no capítulo "steps" e faz referência a uma versão específica do código. Embora o commit seja imutável, ele garante a recuperação da versão do código-fonte quando o commit foi feito.

Somente ações que correspondem a critérios especificados, mais ações definidas em um repositório dentro do Igmorand, podem ser usadas.
Para recuperar o commit, uma pequena manipulação é realizada. Primeiro, vá para o repositório Action que você gostaria de usar, depois vá para sua página listando seus lançamentos. Uma vez nesta página, observe um identificador estranho de 7 caracteres na versão em que você está interessado.

Esta é uma versão curta do hash do commit vinculado a esta versão.
Clique neste número para abrir uma segunda página onde você pode obter a versão completa do hash.

Hash completo

Então use esse hash para referenciar uma versão bem específica da ação.

```
- uses: 60pportunities/github-action-hello@7f2e08be313d58f0d0133b76514dda947b4c1f79
  with:
    firstname: 'Louis-Guillaume'
```
Importante: Se antes era possível usar esse hash curto de identificador para referenciar uma Ação, não é mais possível por motivos de segurança, e o GitHub agora autoriza apenas a versão completa do hash. Se você encontrar exemplos usando versões curtas, saiba que elas estão obsoletas.

Um pequeno resumo de pontos de vigilância a serem lembrados sobre o uso de Ações de terceiros:

- [x] Não confie em nenhuma ação
- [x] Sempre dê uma olhada em seu código-fonte
- [x] Limite o uso de ações de terceiros nos fluxos de trabalho implantados por meio de agentes auto-hospedados
- [x] Se tal uso for necessário, seja ainda mais vigilante
- [x] Prefira o uso do hash para referenciar uma ação, mesmo que isso signifique não obter os patches/evoluções automaticamente
- [x] O ideal é bifurcar a ação e usar apenas a versão clonada. Certamente, você não terá atualizações, mas terá total controle sobre o código-fonte da ação e, acima de tudo, dificilmente verá a ação desaparecer porque o autor decidiu fazer isso (não subestime).

### Keep up with the good security practices
O GitHub Actions evolui dia a dia, e devido à sua complexidade, os possíveis maus usos da solução são numerosos, por isso é impossível listar todos e/ou todos os conhecidos.

Quando uma vulnerabilidade é séria o suficiente ou amplamente utilizada (principalmente por ignorância), o GitHub pode desabilitar drasticamente um recurso e substituí-lo por outro. Por exemplo, este foi o caso do uso de hashes de "versões curtas" (risco de colisão) e da desabilitação do set-env para o gerenciamento de variáveis. No entanto, é impossível desativar tudo, e às vezes, o mau uso da funcionalidade causa uma vulnerabilidade.

O GitHub atualiza regularmente sua documentação, especialmente quando um ponto de recurso merece atenção, mas não são cobertos todos os riscos associados ao mau uso do produto. Além disso, um bom hábito é a vigilância tecnológica e o aprendizado das boas e más práticas lendo os "Relatórios de Pesquisa de Vulnerabilidade" publicados pelo GitHub no portal dedicado: https://securitylab.github.com/advisories.

Nada como ver os erros dos outros para aprender a não fazer o mesmo.

## Controlling the GITHUB_TOKEN's authorizations
Por padrão, esse token é gerado automaticamente para cada execução de fluxo de trabalho, o que simplifica a autenticação com o GitHub tem os direitos somente leitura' no repositório, o que é bom, mas até 2023, ele tem gravações de 'contribuidor', o que era fácil, mas poderia ser perigoso. É recomendável reduzir os direitos atribuídos ao token (privilégio mínimo) por motivos de segurança. Esse controle pode ser obtido de duas maneiras:

- [x] No nível do repositório, definindo uma configuração padrão
- [x] No nível de cada fluxo de trabalho

No repositório, por meio do menu Configurações > Ações, você pode especificar que o token tenha apenas direitos de leitura:

Dentro de um fluxo de trabalho, isso pode ser definido usando as permissões de atributo no nível do fluxo de trabalho ou para um trabalho específico:

```
myjob:
  runs-on: self-hosted
     permissions:
       actions: read
       issues: write # checks: read/write/none
                     # contents: read/write/none
                     # deployments: read/write/none
                     # issues: read/write/none
                     #packages: read/write/none
                     #pull-requests: read/write/none
                     #repository-projects: read/write/none
                     #security-events: read/write/none
                     #statuses: read/write/none
```

## Stay protected against command injection
Injeção de comando, é uma reminiscência do princípio de injeção de SQL: envolve enviar a você um texto que será interpretado e executado quando não deveria.

Aqui está um exemplo simples de um fluxo de trabalho que é acionado quando alguém cria um Issue no seu repositório e, portanto, pode ser feito por qualquer pessoa sem direitos específicos.

```
- name: print title
   run: echo "${{ github.event.issue.title}}"
```

A pessoa cria um Issue com um título específico:
Issue with injected command

Devido à maneira como a sintaxe ${{}} é expandida antes da execução por um agente (isso significa que as variáveis são substituídas no YAML), isso faz com que o fluxo de trabalho execute o seguinte comando:

```
- name: print title
run: echo "$(touch pwned.txt)"
```

Dessa forma, um novo comando é executado pelo seu fluxo de trabalho sem o seu consentimento. Assim, o invasor poderia, como mostrado na captura de tela a seguir, criar um arquivo pwnded.txt, mas potencialmente fazer coisas mais perigosas, como baixar um vírus (se você usar um self-agent) ou exportar segredos acessíveis pelo fluxo de trabalho e enviá-los para um servidor remoto.

A solução é usar variáveis intermediárias ao usar uma entrada de fora (parâmetro do fluxo de trabalho, variável de um nome externo (nome do problema, nome da mensagem de confirmação, etc.) dentro do seu fluxo de trabalho.

```
- name: print title
env:
TITLE: ${{ github.event.issue.title}}
run: echo "$TITLE"
```

Dessa forma, o comando é "expandido"  em uma variável, mas como é uma variável, o comando não será executado na seção de execução.

# My Real-World Workflows
Nesta última parte, um pouco abrangente, decidi dissecar alguns fluxos de trabalho que uso em meus projetos. Úteis ou não para você, você verá diferentes fluxos de trabalho, diferentes tópicos abordados e a riqueza de possíveis casos de uso.

Cada fluxo de trabalho é explicado neste livro, mas você encontrará todos os fluxos de trabalho neste repositório: https://github.com/60pportunities/book-github-actions-advanced-workflows.

## PowerPoint
É comum no meu trabalho fazer apresentações técnicas. Embora eu aprecie o software Microsoft PowerPoint, também gosto da flexibilidade do Markdown, que me permite transformar ou traduzir meu texto rapidamente para vários idiomas antes de gerar uma apresentação.

## Prepare the markdown
O fluxo de trabalho

O fluxo de trabalho é bem simples. Em um runner Linux, basta instalar o Pandoc (https://github.com/jgm/pandoc) e pedir para ele gerar uma versão do PowerPoint, bem como uma versão HTML dinâmica (que usa o plugin RevealJS (https://revealjs.com/) e então armazenar os arquivos gerados como anexos do fluxo de trabalho.

```
jobs:
GenerateFile:
runs-on: self-hosted
steps: # retrieve the markdown content from the repo
- uses: actions/checkout@v4
- run: sudo apt-get update # update the agent's packages
- name: Apt-get update # pandoc will transform the markdown into PowerPoint
- name: install pandoc
   run: sudo apt-get install --assume-yes pandoc # create the PowerPoint
- name: Build PPTX version
   run: pandoc content.md --output=demo.pptx
     working-directory: ./powerpoint # create a dynamic HTML version
- name: Build HTML version
 run: pandoc --to-revealjs --standalone content.md --output-demo.html -V revealjs- url="https://cdn.jsdelivr.net/npm/reveal.js@3.9.2"
 working-directory: ./powerpoint # Upload a zip to easily retrieve it
- name: Upload a Build Artifact
  uses: actions/upload-artifact@v4
  with:
    name: Generated documents
    retention-days: 1
    path: |
           ./powerpoint/*

working-directory: ./powerpoint
```

Upon execution, a zip containing your two presentations is published:

## Points of Attention
Observe o parâmetro -assume-yes que diz à linha de comando apt-get para sempre aceitar se uma pergunta for feita ao usuário que está executando o comando. O agente não é "interativo" e, portanto, você deve sempre pensar em passar parâmetros que evitem qualquer interação com o usuário (por exemplo, pedir uma senha, confirmar uma ação, etc.).

O segundo ponto é "retention-days" definido como 1. No GitHub, o armazenamento não é ilimitado nem gratuito. Não há sentido em manter artefatos por muito tempo. Neste caso específico, quero meu PowerPoint hoje, não em dez dias.

## Book Generation
Como vimos anteriormente no livro, embora seja publicado em formato de papel e e-book, ele é, na verdade, inteiramente escrito e gerado via GitHub Actions. Aqui está o fluxo de trabalho quase completo e um exemplo de um livro gerado, caso você sinta vontade de escrever um livro ou publicar um e-book.

```
name: Generate a book
on:
workflow_dispatch:
jobs:
generating-the-book:
name: Generate the books
runs-on: self-hosted
steps:
- name: Apt-get update
run: sudo apt-get update
- name: install pandoc
- run: |
         wget https://github.com/jgm/pandoc/releases/download/3.3/pandoc-3.3-1-amd64.deb
         sudo dpkg -i pandoc-3.3-1-amd64.deb # to make a PDF I need additional plugins
- name: install pdflatex
run: |
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-xetex

- uses: actions/checkout@v4

- name: Create dist folder
   run: mkdir ./book/dist
- #I modify some markdown on the fly
- name: inject date
run: |
today=$(date + "%d-%m-%Y")
echo '' >> 00-01-edition.md
echo '## Edition {.unlisted .unnumbered}' >> 00-01-edition.md
echo '' >> 00-01-edition.md
echo 'Last modification of content' >> 00-01-edition.md
echo $today >> 00-01-edition.md
working-directory: ./book/en
working-directory: ./book/en # I generate an intermediate text version # I prepare a listing that will allow me to give all the files to merge with a single parameter
- name: prepare files to include
- name: Build TXT result EN
run: |
run:
ls *.md >>_includes.txt
cat_includes.txt
working-directory: ./book/en # a PDF version that I send to my printer
- name: Build PDF version EN
toc.txt
pandoc -V documentclass=memoir -s $(cat_includes.txt) -o ../dist/result-en.txt
pandoc -V documentclass-memoir -s $(cat_includes.txt) --toc -o ../dist/result-en-
working-directory: ./book/en # I transform this TXT into Epub
- name: Build EPUB version EN
run: pandoc -V documentclass=memoir -V lang=en --listings --pdf-engine-xelatex --from-markdown-blank_before_header -s $(cat _includes.txt) -o'../dist/Implementing DevSecOps with GitHub Actions.pdf'
run: pandoc -s ../dist/result-en-toc.txt --epub-cover-image-./assets/cover.png epub-metadata=./assets/metadata.xml -o '../dist/Implementing DevSecOps with GitHub
Actions.epub'
working-directory: ./book/en # I can also generate a Word version if I want
- name: Build Word version EN
run: pandoc -s ../dist/result-en.txt -o '../dist/Implementing DevSecOps with GitHub Actions.docx' --reference-doc=../latex/custom-reference.docx --toc
working-directory: ./book/en # I make a zip
- uses: actions/upload-artifact@v4
 with:
name: "Implementing DevSecOps with GitHub Actions - books"
path: book/dist
retention-days: 1
```

Nada muito complicado, são apenas comandos encontrados na documentação do Pandoc. Mas esse fluxo de trabalho é muito útil para mim porque posso rastrear minhas alterações, o que não seria capaz de fazer se tivesse escrito meu livro em um documento do Word. A outra alternativa (LaTex) não me agradou, o Markdown é muito mais simples.

## Documentary Website
É comum precisar gerar documentação para vários projetos, e nada supera um site que fornece uma interface gráfica agradável, um mecanismo de busca e/ou vários links. É mais fácil do que um arquivo PDF que todos precisam baixar. Existem diferentes ferramentas para gerar essas documentações, como Docusaurus (https://docusaurus.io), MKDocs (https://www.mkdocs.org/) ou Hugo (https://gohugo.io/). Este último é muito leve e contém vários temas muito bons, daí minha escolha preferida.

Como bônus, usaremos o GitHub, mais especificamente o GitHub Pages, para hospedar nosso site. Não há necessidade de comprar um servidor de hospedagem, temos um site e uma URL pública.

## Preparing the content
Para isso, nada de mágica, basta seguir a documentação do Hugo (https://gohugo.io/content-management/organization/) e organizar as páginas do site seguindo uma estrutura:

```
content/
blog/
- hugo-is-cool/
- images/
- funnier-cat.jpg
-funny-cat.jpg
cats-info.md
index.md
posts/
post1.md
- post2.md
1-landscape.jpg
- 2-sunset.jpg
_index.md
content-1.md
content-2.md
1-logo.png _index.md
name: Build Hugo site
runs-on: ubuntu-22.04
steps: # installation of the CLI tool
- name: Setup Hugo CLI
run:
wget -O ${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/ download/v0.125.6/hugo_0.125.6_linux-amd64.deb
sudo dpkg -i ${{ runner.temp }}/hugo.deb
Le workflow
jobs:
build-hugo: # installation of prerequisites. Sass allows generating CSS files
- name: Setup Dart Sass
run: sudo snap install dart-sass # we take the content of our site
- name: Checkout
uses: actions/checkout@v4.1.1
with:
submodules: recursive
fetch-depth: 0 # we activate GitHub Pages to host our website
- name: Setup Pages
id: pages
uses: actions/configure-pages@v5.0.0
env: # For maximum backward compatibility with Hugo modules, we put the two possible
variables
HUGO_ENVIRONMENT: production
HUGO_ENV: production
run:
hugo\
--gc\
--minify\
--baseURL"${{ steps.pages.outputs.base_url}}/" # we build the website from our markdown
- name: Build with Hugo
working-directory: website
deploy:
environment:
name: github-pages
>
```

url: ${{ steps.deployment.outputs.page_url}}
runs-on: self-hosted
needs: build-hugo
steps:
- name: Deploy to GitHub Pages
id: deployment
uses: actions/deploy-pages@v4

## Points of Attention
Não foi necessário criar dois jobs, pois eles são sequenciais, no entanto, isso torna a renderização gráfica no portal e a legibilidade do código mais fáceis. Além disso, força o isolamento de etapas principais em um fluxo de trabalho e permite mais flexibilidade em caso de evolução futura (ou divisão).

## DevSecOps
A segurança do projeto começa na estação de trabalho do desenvolvedor, e há uma infinidade de ferramentas de segurança disponíveis. Quando você é um DevOps experiente, você quer ser capaz de implantar na produção com confiança executando uma série de testes que permitirão ou impedirão a implantação na produção.

Como os aplicativos vêm em diferentes formatos (por exemplo, móvel, web, desktop, conteinerizado), você pode precisar implementar diferentes tipos de controles - e até mesmo diferentes tipos de ferramentas para proteger cada componente do seu aplicativo. Vamos dar uma olhada nos principais tipos de testes que você deve usar. Aqui estão os principais tipos:

### STATIC APPLICATION SECURITY TESTING
Ferramentas de Static Application Security Testing (SAST) analisam o código-fonte de um aplicativo (o código escrito por seus desenvolvedores) para detectar vulnerabilidades potenciais sem executar o programa. Ao analisar a base de código durante a fase de desenvolvimento, o SAST fornece aos desenvolvedores informações sobre falhas de segurança e erros de codificação. Uma boa ferramenta SAST pode detectar odores de código, bem como quaisquer práticas ruins que possam levar a vulnerabilidades, como SQL ou injeção de caminho, estouro de buffer, XSS e validação de entrada.

### SOFTWARE COMPOSITION ANALYSIS
A Análise de Composição de Software (SCA) é essencial para identificar e gerenciar riscos de segurança associados a componentes de código aberto usados no desenvolvimento de software, normalmente de pacotes adicionais (por exemplo, pacotes NPM para JavaScript, NuGet para .NET, Maven, gems). A maioria dos desenvolvedores carrega um pacote quando precisa, mas nunca verifica se o pacote tem uma vulnerabilidade conhecida. Uma ferramenta SCA alertará você quando seu aplicativo usar um pacote vulnerável e quando uma correção já existir, mas você não estiver usando a versão corrigida da dependência.

### DYNAMIC APPLICATION SECURITY TESTING
As ferramentas Dynamic Application Security Testing (DAST) avaliam os aplicativos em seu estado de execução, simulando ataques reais para identificar vulnerabilidades. Ao integrar o DAST ao processo de teste, as equipes de DevSecOps podem descobrir fraquezas de segurança que podem não ser aparentes durante a análise estática. Uma ferramenta DAST atua como uma ferramenta de teste de penetração totalmente automatizada que testará as principais vulnerabilidades conhecidas (OWASP) e muitas outras práticas ruins, como vazamento/exposição de informações.

### INTERACTIVE APPLICATION SECURITY TESTING
As ferramentas Interactive Application Security Testing (IAST) são uma combinação de uma ferramenta DAST e uma ferramenta SAST porque, ao permitir acesso ao código-fonte ("caixa cinza"), elas ajudam o DAST a ter um melhor desempenho, mas também limitam o número de falsos positivos. O IAST é superefetivo, mas mais difícil de configurar, pois tende a testar cada aplicativo profundamente.

### CONTAINER SCANNER
Os contêineres oferecem agilidade e escalabilidade, mas também apresentam desafios de segurança exclusivos. Por exemplo, se seu aplicativo for conteinerizado, você precisa implementar controles adicionais. Primeiramente, os scanners examinarão seu Dockerfile para verificar se a imagem base contém vulnerabilidades conhecidas e também procurarão por práticas ruins, como executar como root, usar a tag "latest" ou expor portas perigosas. O exemplo de Dockerfile a seguir contém pelo menos três práticas ruins e pode haver uma vulnerabilidade na imagem base do Node.js:

```
FROM node:latest
WORKDIR /usr/src/app
COPY package*.json
RUN npm install
COPY..
EXPOSE 3000 22
HEALTHCHECK CMD Curl --fail https://localhost:3000 | exit 1
CMD ["node","app.js"]
```

### INFRASTRUCTURE-AS-CODE SCANNER
A infraestrutura como código (IaC) permite que as organizações gerenciem e provisionem infraestrutura por meio de código, trazendo os benefícios do controle de versão e automação para a camada de infraestrutura. A varredura de IaC garante que o código de infraestrutura passe por rigorosas verificações de segurança, como validação de configuração, adesão às melhores práticas, detecção de configurações incorretas de segurança e aplicação de políticas de segurança durante todo o processo de implantação da infraestrutura.

### SECRETS SCANNER
Um segredo (por exemplo, uma chave de API, uma senha, uma string de conexão para um banco de dados) não deve ser armazenado no código-fonte (hardcoded) ou em um arquivo de configuração armazenado no repositório de código, porque se um hacker obtiver acesso ao código, ele poderá acessar ambientes de produção e/ou outros ambientes críticos. Os scanners de segredos podem detectar mais de 150 tipos de segredos que os desenvolvedores podem deixar no código e, uma vez que um segredo tenha sido armazenado no código (commit), ele deve ser considerado "comprometido" e revogado imediatamente.

Depois de ver todas essas ferramentas, vamos configurar um fluxo de trabalho para melhorar a qualidade do que produzimos.

## The Workflow
O fluxo de trabalho consiste em várias etapas:
1. Análise estática, ou seja, todas as verificações que podem ser feitas antes mesmo da compilação (idealmente para serem executadas no momento de uma solicitação de pull): SCA + SAST + linter + credscan
2. Compilação e empacotamento
3. Implantação no ambiente de teste
4. Análise dinâmica (teste de desempenho e teste de penetração): DAST
5. Implantação na produção

Observe que o fluxo de trabalho paraleliza as etapas quando possível e, em seguida, adiciona dependências para que todos os testes sejam aprovados antes de passar para a próxima etapa.

```
workflow DevSecOps
name: DevSecOps
on:
workflow_dispatch:
jobs:
secrets:
  runs-on: self-hosted
    env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN}}
steps:
- uses: actions/checkout@v4
- name: scan secrets with Spectral
uses: spectralops/spectral-github-action@v5
with:
spectral-dsn: ${{ env.SPECTRAL_DSN }}
spectral-args: scan --ok --engines iac --include-tags base,azure
IaC:
runs-on: self-hosted
env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN}}
steps:
- uses: actions/checkout@v4
- name: scan IaC with Spectral
uses: spectralops/spectral-github-action@v5
with:
spectral-dsn: ${{ env.SPECTRAL_DSN}}
spectral-args: scan --ok --engines secrets --include-tags base,audit
SAST:
runs-on: self-hosted
env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN }}
steps:
- uses: actions/checkout@v4
- uses: bearer/bearer-action@v2
with:
path: "./devsecops/src/frontend"
skip-rule: javascript_lang_dynamic_regex,javascript_lang_logger_leak

SCA:
runs-on: self-hosted
env:
SPECTRAL_DSN: ${{ secrets.SPECTRAL_DSN }}
steps:
- uses: actions/checkout@v4
- name: Setup .NET
uses: actions/setup-dotnet@v4
- name: Restore dependencies
run: dotnet restore ./devsecops/src/frontend/CafeReadConf.sln
- name: dotnet publish
run: dotnet publish -c Release -o ./myapp --property WarningLevel=0
working-directory: ./devsecops/src/frontend

- name: scan SCA with Spectral
uses: spectralops/spectral-github-action@v5
with:
spectral-dsn: ${{ env.SPECTRAL_DSN }}
spectral-args: scan --ok --engines oss --include-tags base,audit
- name: Run Snyk to check for vulnerabilities
uses: snyk/actions/dotnet@master
env:
SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
with:
args:
--sarif-file-output=snyk.sarif --file=./devsecops/src/frontend/CafeReadConf.sln --severity-threshold=medium

- name: Upload result to GitHub Code Scanning
uses: github/codeql-action/upload-sarif@v3
with:
sarif_file: snyk.sarif
Docker:
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
name: hadolint
run: |
echo 'Downloading Hadolint to lint Dockerfile...'
wget https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint- Linux-x86_64
chmod +x hadolint-Linux-x86_64
mv hadolint-Linux-x86_64 hadolint
echo 'Start Dockerfile lint...'
./hadolint Dockerfile -f tty > results.txt

echo 'Results:'
cat results.txt
working-directory: ./devsecops/src/frontend

build:
needs: [secrets, SCA, Docker, IaC, SAST]
runs-on: self-hosted
steps:
- uses: actions/checkout@v4
- name: Setup .NET
uses: actions/setup-dotnet@v4
with:
dotnet-version: "8.0.x"
- name: Restore dependencies
run: dotnet restore ./devsecops/src/frontend/CafeReadConf.sln
- name: Build
run: dotnet build --no-restore --configuration Release --property WarningLevel=0
working-directory: ./devsecops/src/frontend
- name: dotnet publish
run: dotnet publish -c Release --property WarningLevel=0
working-directory: ./devsecops/src/frontend
- name: Upload artifact for deployment job
uses: actions/upload-artifact@v4
  with:
    name: .net-app
    path: ./devsecops/src/frontend/bin/Release/net8.0/publish
deployToDev:
 needs: [build]
  runs-on: windows-latest
    environment:
      name: "dev"
      url: ${{ steps.deploy-to-webapp-dev.outputs.webapp-url}}
  steps:
   - name: Download artifact from build job
     uses: actions/download-artifact@v4
     with:
       name: .net-app
   - name: Deploy to Azure Web App
       id: deploy-to-webapp-dev
      uses: azure/webapps-deploy@v2
      with:app-name: "ghactions-dev"
       publish-profile: ${{ secrets. AZUREAPPSERVICE_PUBLISHPROFILE_DEV }}
       package:.
DAST:
  needs: [deployToDev]
  runs-on: self-hosted
steps:
  - uses: actions/checkout@v4
  - name: ZAP Scan
    uses: zaproxy/action-full-scan@v0.8.0
     with:
       token: ${{ secrets.GITHUB_TOKEN }}
       docker_name: "ghcr.io/zaproxy/zaproxy:stable"
       target:https://ghactions-dev-gjbyf4c5hhhzgecw.westeurope-01.azurewebsites.net
        rules_file_name: ".zap/rules.tsv"
        cmd_options: "-a"
LoadTest:
needs: [deployToDev]
runs-on: self-hosted
  steps:
  - uses: actions/checkout@v4
  - name: Login to Azure
  uses: azure/login@v1
  continue-on-error: false
   with:
     creds: ${{ secrets. AZURE_CREDENTIALS }}
  - name: "Azure Load Testing"
    uses: azure/load-testing@v1
    with:
    resourceGroup: "rg-book-gha"
    loadTestConfigFile: "devsecops/.load/loadtest.yaml"
    loadTestResource: "loadtestbookgha"
  deployToProd:
    needs: [LoadTest, DAST]
     runs-on: self-hosted
     environment:name: "production"
     url: ${{ steps.deploy-to-webapp.outputs.webapp-url}}
     steps:
     - name: Download artifact from build job
       uses: actions/download-artifact@v4
         with:
           name: .net-app
    - name: Deploy to Azure Web App
       id: deploy-to-webapp
       uses: azure/webapps-deploy@v2
       with:
       app-name: "ghactions-prd"
       publish-profile: ${{ secrets. AZUREAPPSERVICE_PRD}}
       package:.
```

## Create a Public Container
Às vezes, você precisa distribuir software dentro da sua empresa ou para terceiros. O fluxo de trabalho a seguir usa o exemplo de um Azure Agente de produto DevOps (uma alternativa ao GitHub/Gitlab) e o empacota como um contêiner, publicado na Internet.
O fluxo de trabalho a seguir faz várias coisas:

- [x] Executa análise DevSecOps para verificar vulnerabilidades de segurança
- [x] Compila e empacota vários contêineres em várias plataformas (Windows e Linux)
- [x] Produz manifestos de implantação (HELM Chart dedicado à implantação em um cluster Kubernetes)
- [x] Gera um site de documentação
- [x] Executa testes de integração

## The Workflow
Este fluxo de trabalho tem quase 900 linhas, então cobriremos apenas certos detalhes e a apresentação das etapas. O código-fonte inteiro pode ser encontrado aqui: https://github.com/clemlesne/blue-agent/blob/main/.github/workflows/pipeline.yaml

Dica: para vê-lo em execução completa, recomendo que você o analise diretamente no repositório dedicado: https://github.com/clemlesne/blue-agent/actions/.

A primeira etapa (Inicializar) consiste em criar variáveis de ambiente (notavelmente versão e ramificação) que serão usadas posteriormente para marcar os contêineres.

Em seguida, três etapas de análise estática são executadas: SAST - Credenciais que verifica se uma senha foi esquecida no código, Semgrep estático que analisará a qualidade do código e, finalmente, Teste estático que executará uma análise do arquivo Docker, uma análise de conformidade do código (legibilidade) e também simulará uma implantação de infraestrutura no Azure. Três ações ocultas em um Makefile:

```
test:
Build Helm chart
40s.
@echo' Running Prettier" npx --yes prettier@2.8.8 --editorconfig --check.'
@echo "Running Hadolint"
find. -name "Dockerfile*" -exec bash -c "echo 'File {}:' && hadolint {}" \;


@echo " Running Azure Bicep Validate"
az deployment sub validate\
--location francecentral \
--parameters container/test/bicep/example.json \
--template-file container/src/bicep/main.bicep \
--verbose \
--name lgmorandgha
```

Em seguida vem a parte técnica onde para cada distribuição (sistema operacional), um Dockerfile dedicado é executado, etiquetado, assinado e verificado novamente com uma ferramenta DevSecOps (Snyk). Assim, usando matrizes, o fluxo de trabalho publica 7 versões diferentes em paralelo com um único fluxo de trabalho:

```
build-release-linux:
name: Build & release image (Linux ${{ matrix.os }})
needs:
 - init
 - sast-creds
 - sast-semgrep
runs-on: ubuntu-24.04
strategy:
fail-fast: false
matrix:
include:
- os: bookworm
arch: linux/amd64,linux/arm64
- os: bullseye
#steps to build the container image
arch: linux/amd64,linux/arm64
- os: focal
arch: linux/amd64,linux/arm64
os: jammy
arch: linux/amd64,linux/arm64
- os: noble
arch: linux/amd64
- os: ubi8
arch: linux/amd64,linux/arm64
- os: ubi9
arch: linux/amd64,linux/arm64
steps:
````

Então vêm os passos finais:

- [x] publicar e atualizar o Docker Hub
- [x] publicar um Helm chart que facilitará a implantação de artefatos em clusters Kubernetes
- [x] atualizar e publicar um site de documentação

Este fluxo de trabalho é interessante porque representa excelência quando você quer publicar um componente open-source, garantindo a segurança dos componentes, documentação atualizada e também considerando a experiência do usuário com facilidades de implantação (aqui uma imagem de contêiner e um manifesto Helm opcional).

## Conclusão
É com estas palavras que este livro termina. Espero que através dos capítulos e principalmente dos exercícios, você tenha conseguido descobrir e até mesmo apreciar a facilidade com que é possível construir coisas usando GitHub Actions. Este livro é apenas uma grande introdução às possibilidades que eles trazem, e certamente virão para enriquecer e se tornar um jogador-chave no cenário DevOps.

Ao ler o livro, sinta-se à vontade para olhar os apêndices, que contêm diferentes recursos que considerei apropriado reunir. Além disso, se você encontrar algum erro no livro ou quiser trocar comigo, me fazer uma pergunta ou qualquer coisa, escreva um e-mail para book@morand.me.
Desejo que você se divirta brincando com essas Ações e espero que você automatize com sucesso todos os tipos de tarefas ou coisas.
Louis-Guillaume MORAND


https://github.com/60pportunities/book-github-actions-content?tab=readme-ov-file

## Apêndices
Recursos do livro
Um máximo de códigos, exemplos, exercícios e Ações construídos dentro deste livro estão disponíveis em acesso aberto para seus repositórios dedicados.
Exemplos de código e respostas aos exercícios estão no repositório principal: https://github.com/60pportunities/book-github-actions-content

As Ações podem ser encontradas em:

- [x] Hello World: https://github.com/60pportunities/github-action-hello
- [x] Generate Release: https://github.com/60pportunities/github-action-generate-relnotes
- [x] Pandoc: https://github.com/60pportunities/github-action-pandoc
- [x] CredScanning:https://github.com/60pportunities/github-action-composite-credscanning

## Recursos recomendados

Aqui estão alguns recursos que recomendo para aprofundar o uso do GitHub Actions:

A documentação oficial: https://docs.github.com/en/actions • O blog oficial do GitHub: https://github.blog/
- [x] O GitHub Actions Toolkit: https://github.com/actions/toolkit
- [x] O action github-script que permite interagir facilmente com o GitHub em qualquer fluxo de trabalho: https://github.com/actions/github- script
- [x] O Changelog do GitHub https://github.blog/changelog/
- [x] Os fóruns do GitHub: https://github.community, Você encontrará ajuda, mas principalmente muitas informações ou recursos que o GitHub não julgou relevantes para indicar na documentação.
- [x] The Awesome List: uma lista de Actions consideradas as mais relevantes ou de melhor qualidade https://github.com/sdras/awesome-actions. Ler o código-fonte deles permitirá que você aprenda muito sobre boas práticas
- [x] O blog da equipe de segurança do GitHub: https:// securitylab.github.com/advisories

Alguns exemplos muito úteis de fluxos de trabalho para implantar na Nuvem:

- [x] Azure: https://github.com/Azure/actions-workflow-samples
- [x] AWS: https://github.com/actions/starter-workflows/blob/master/ci/aws.yml
- [x] GCP: https://github.com/google-github-actions/setup-gcloud

Com o passar dos meses, outros recursos certamente surgirão, e você completará sua própria lista de recursos favoritos.
Como criar um runner auto-hospedado dockerizado
No capítulo dedicado aos agentes, é abordada a noção de runners auto-hospedados, a capacidade de instalar um agente que roda em um servidor privado em vez do GitHub com o objetivo principal de fornecer funcionalidade adicional ou acessar uma rede privada. Os agentes auto-hospedados são instalados em um servidor no qual os agentes baixam e instalam conforme necessário em ferramentas de terceiros (SDK, tempo de execução, outros). Se um agente estiver vinculado a um único repositório por padrão (exceto com o GitHub Enterprise). Nesse caso, é possível instalar vários agentes gerenciando vários projetos lado a lado no mesmo computador. Além de problemas de segurança, o risco de colisão (aplicativos instalados por cada projeto, incompatíveis entre si) é real. Além disso, os diretórios de trabalho contêm uma cópia do código-fonte baixado e outros elementos que potencialmente contêm dados confidenciais.
A resposta para esse problema é executar runners dentro de um contêiner para isolá-los uns dos outros e redefini-los sempre que necessário para fornecer um ambiente de trabalho limpo.
A criação de um agente em contêiner é relativamente simples. Sua implementação requer a criação de um contêiner de imagem que baixa automaticamente a versão mais recente do runner, uma ação que você normalmente faz por meio da página Configurações > Ações do seu repositório. Este contêiner então inicia na inicialização, o comando para registrar.
O primeiro passo consiste em criar um Dockerfile que cuida da instalação do agente e inicia um script entrypoint.sh:

```
FROM ubuntu:20.04                                            # we need a default version
ENV RUNNER_VERSION=2.277.1
RUN useradd -m actions
RUN apt-get -yqq update && apt-get install -yqq curl ją wget # calls the GitHub api to retrieve the last version
RUN\
COPY entrypoint.sh.
RUN chmod +x entrypoint.sh
LABEL="$(curl -s -X GET 'https://api.github.com/repos/actions/runner/releases/latest' | jq -r '.tag_name')" \
USER actions
ENTRYPOINT ["./entrypoint.sh"]
RUNNER_VERSION=":
="$(echo ${latest_version_label:1})" \
cd /home/actions && mkdir actions-runner && cd actions-runner\
&& wget
https://github.com/actions/runner/releases/download/v$
{RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
&& tar xzf./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
WORKDIR /home/actions/actions-runner
RUN chown -R actions ~actions && /home/actions/actions-runner/bin/ installdependencies.sh
```

Em seguida, vem o arquivo entrypoint.sh, que é responsável por realizar várias ações
- [x] Autentique-se no GitHub e solicite um novo token de registro. Cada executor requer um token dedicado, e solicitar esse token dinamicamente permite a criação de vários contêineres lado a lado, cada um usando seu próprio token
- [x] Use o arquivo config.sh para registrar-se no repositório GitHub, as variáveis sendo passadas como parâmetros
- [x] Uma vez que o executor é registrado no GitHub, inicia o executor (será visto como "idle" no GitHub)
- [x] No final, quando o contêiner estiver fechando, cancela o registro do executor
A vida do contêiner é efêmera e não deixaria rastros. É possível criar um novo agente original girando um novo contêiner.

```
# set up the starting script
#!/usr/bin/env bash
x
set -eEuo pipefail
GITHUB ACTIONS: A PRACTICAL GUIDE
# retrive a registration token
TOKEN=$(curl -s -X POST -H "authorization: token ${TOKEN}" "https://api.github.com/ repos/${OWNER}/${REPO}/actions/runners/registration-token" | jq -r .token)
cleanup() {
}
./config.sh remove --token "${TOKEN}"
--unattended \
--work_work
#starting
./run.sh
#cleaning
cleanup
# registrering the runner
./config.sh \
--url "https://github.com/${OWNER}/${REPO}" \
--token "${TOKEN}" \
--name "${NAME}" \
```

Agora que todos os elementos estão prontos, você precisa gerar uma imagem de contêiner e publicá-la em qualquer registro docker (ou localmente usando o Docker build). O procedimento é exatamente o mesmo que criar uma Action dockerizada explicada anteriormente neste livro.
Código-fonte: Se você estiver procurando por um exemplo pronto para uso e seu fluxo de trabalho para gerar a imagem docker, você pode encontrar um exemplo deste repositório público: https://github.com/60pportunities/self-hosted-runner-dockerized.


Depois que sua imagem de contêiner for gerada e disponibilizada em um registro, você precisa criar uma instância do contêiner transmitindo os parâmetros necessários:
NAME: nome do runner, deve ser exclusivo
OWNER: o nome da sua conta do GitHub
REPO: o nome do repositório ao qual o runner será vinculado
IMAGE: o nome da sua imagem Docker que você acabou de criar
TOKEN: um Personal Access Token que fornece acesso aos seus repositórios. A criação de um PAT é feita no portal do GitHub clicando em seu perfil e depois em Settings > Developer Settings

O uso dele pode ir além, implantando, por exemplo, instâncias do seu contêiner dentro de um cluster Kubernetes ou uma oferta serverless para contêineres (por exemplo, Azure Container Instance, Cloud Run no GCP, Fargate na AWS). Depende de você, agora você tem mais agilidade do que com um runner instalado diretamente em um servidor.

Personal access tokens
Tokens de acesso pessoal funcionam como tokens de acesso OAuth comuns. Eles podem ser usados em vez de uma senha para o Git sobre HTTPS, ou podem ser usados para autenticar na API sobre Basic Authentication.

Creating a PAT

```
docker run --env OWNER={OWNER} --
--env TOKEN={TOKEN} --env NAME={NAME} --
--env
REPO={REPO} {IMAGE}
Here is an example:
docker run --env OWNER=1gmorand --env TOKEN=ghp_mXkDnajJQjM921W1UqfkO --
env NAME=redtower-runner --env REPO-my-repo 60pportunities/self-hosted-runnner
```



https://spacelift.io/blog/ci-cd-pipeline
https://spacelift.io/blog/ci-cd-pipeline
https://github.com/sottlmarek/DevSecOps?tab=readme-ov-file
https://app.exampro.co/student/material/gha/6770?autoplay=true
https://docs.edgeimpulse.com/docs/tutorials/lifecycle-management/gitactions-docker
https://davecross.substack.com/p/github-actions-essentials-is-published?utm_campaign=post&utm_medium=web
https://docs.openedx.org/en/latest/developers/references/developer_guide/testing/github-actions.html
https://medium.com/@ravipatel.it/key-concepts-of-github-actions-a-guide-from-beginner-to-advanced-abb95c59e0f4
https://davecross.substack.com/p/github-actions-essentials-is-published?utm_campaign=post&utm_medium=web

https://docs.openedx.org/en/latest/developers/references/developer_guide/testing/github-actions.html


https://docs.github.com/pt/actions/about-github-actions/understanding-github-actions
https://docs.github.com/pt/actions/writing-workflows/quickstart

https://docs.github.com/en/actions/guides

https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions

https://github.com/marketplace/actions/setup-node-js-environment
https://docs.github.com/pt/actions/learn-github-actions/using-starter-workflows
https://docs.github.com/pt/actions/automating-builds-and-tests
https://docs.github.com/pt/actions/publishing-packages
https://docs.github.com/pt/actions/deployment
https://docs.github.com/pt/actions/managing-issues-and-pull-requests
https://docs.github.com/pt/actions/examples
