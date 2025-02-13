## SSH
Ssh-keygené uma ferramenta para criar novos pares de chaves de autenticação para SSH. Esses pares de chaves são usados ​​para automatizar logins, single sign-on e para autenticar hosts.
### Algoritmo e Tamanho de Chave
O SSH suporta vários algoritmos de chave pública para chaves de autenticação.

| Algoritmos de Chave | Descrição |
| ----                | -----     |
| rsa                 | Um algoritmo antigo baseado na dificuldade de fatorar números grandes. Um tamanho de chave de pelo menos 2048 bits é recomendado para RSA; 4096 bits é melhor.  |
| dsa                 | O DSA em sua forma original não é mais recomendado. Um tamanho de chave de 1024 normalmente seria usado com ele. |
| ecdsa               | Algoritmo de Assinatura Digital padronizado pelo governo dos EUA. Apenas três tamanhos de chave são suportados: 256, 384 e 521 (sic!) bits. |
| ed25519             | Algoritmo adicionado no OpenSSH.  |

- [x] `ssh-keygen -t ed25519 -C "your_email@example.com"`

```
Generating public/private ed25519 key pair.
Enter file in which to save the key (/Users/xxxxx/.ssh/id_ed25519): /Users/horaciovasconcellos/.ssh/id_ed25519
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/xxxxx/.ssh/id_ed25519
Your public key has been saved in /Users/horaciovasconcellos/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:xIzQ7yHaWVZ4fm6yYH8EH2Zk2CBv2HeIPFKCIbW3X3I your_email@example.com
The key's randomart image is:
+--[ED25519 256]--+
|    ooooo.o+     |
|     oo=.O+.+.   |
|      o.B+Boo .  |
|      .o=+oo=.   |
|     o *S..BE.   |
|    . o +..+=    |
|       . o.=     |
|          o .    |
|           .     |
+----[SHA256]-----+
```
- [x] `pbcopy < ~/.ssh/id_ed25519.pub`

## Generating a GPG key
<p align="justify">A assinatura de um commit no Git é uma prática que garante autenticidade e integridade. Ela permite identificar de forma confiável quem fez a modificação no código, usando uma assinatura criptográfica vinculada a uma identidade digital. Aqui estão os principais motivos para assinar commits:</p>
- [x] Garante que o commit foi realmente feito pela pessoa que afirma tê-lo feito.
- [x] Evita falsificações ou alterações de histórico por terceiros.
- [x] A assinatura criptografa o conteúdo do commit, permitindo verificar que ele não foi alterado desde que foi criado.

### Geração das Chaves e configuração Git
- [x] `gpg --full-generate-key`
- [ ] gpg --list-secret-keys --keyid-format=long
```
$ gpg --list-secret-keys --keyid-format=long
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2030-03-10 [expires: 4712-31-12]
uid                          Hubot <your_email@example.com>
ssb   4096R/4BB6D45482678BE3 2030-03-10
```

- [x] `gpg --armor --export 3AA5C34371567BD2`
- [x] `git config --global commit.gpgsign true`
- [x] `git config --global user.signingkey <ID_DA_CHAVE>`
- [x] `git commit -S -m "YOUR_COMMIT_MESSAGE"`
- [x] `git log --show-signature`

## Gerando um Patch no Git
- [x] Edite o arquivo: `nome-do-arquivo.xxx`
- [x] `git diff nome-do-arquivo.xxx`
- [x] Crie um arquivo de patch com o comando git diff: `git diff README.md > changes.patch`
- [x] Se alguém receber o patch, pode aplicá-lo com o comando: `it apply changes.patch`

## Fazendo Backup Local
Se você deseja criar um repositório Git que possa ser acessado remotamente, como em um servidor ou pendrive, o processo envolve criar um repositório bare e configurá-lo para ser usado como um repositório central.

- [x] `git clone <URL_DO_REPOSITORIO>`
- [x] `cd repositorio`
- [x] `ls`
- [x] `git clone --bare . /media/pendrive/REPOSITORIO`
- [x] `git remote add origin /media/pendrive/REPOSITORIO`
- [x] `git push origin main`
- [x] `Entrar no diretório ".git" e começar fazendo "git --bare update-server-info" e depois "mv hooks/- [x] post-update.sample hooks/post-update"`
- [x] `python -m http.server 8000`
- [x] `Pra testar, basta ir no "/tmp" ou qualquer lugar e fazer "git clone https://localhost:8000 teste"`
- [x] `ngrok http 8000`

## Simulando um GitFlow

### Feature branch
- [x] `git clone <URL_DO_REPOSITORIO>`
- [X] `git branch develop`
- [X] `git push -u origin develop`
- [X] `git checkout develop`
- [X] `git checkout -b feature_branch`
- [X] `git checkout develop`
- [X] `git merge feature_branch`

### Release branch
- [X] `git checkout develop`
- [X] `git checkout -b release/0.1.0`
- [X] `git checkout main`
- [X] `git merge release/0.1.0`

### Hotfix branch
- [X] `git checkout main`
- [X] `git checkout -b hotfix_branch`
- [X] `git checkout main`
- [X] `git merge hotfix_branch`
- [X] `git checkout develop`
- [X] `git merge hotfix_branch`
- [X] `git branch -D hotfix_branch`

### Comandos


- [x] `git config --global user.name "User name"`
- [x] `git config --global user.email "user_name@gmail.com"`
- [x] `git config --global core.editor Vim`
- [x] `git config -list`

#### Alias

- [x] `git config --global alias.co checkout`
- [x] `git config --global alias.br branch`
- [x] `git config --global alias.ci commit`
- [x] `git config --global alias.st status`

#### Inicializando
#### Create a local repository:

- [x] `git init`
- [x] `git clone`
- [x] `git add Filename`
- [x] `git add *`
- [x] `git commit -m " Commit Message"`

#### Track changes
##### Git diff
Acompanhe as mudanças que não foram encenadas:

- [x] `git diff`

Acompanhe as alterações que foram preparadas, mas não confirmadas:

- [x] `git diff --staged`

Acompanhe as alterações após confirmar um arquivo:

- [x] `git diff HEAD`

Acompanhe as alterações entre dois commits:

- [x] `git diff Git Diff Branches:`
- [x] `git diff < branch 2>`

##### Git status
Exibe o estado do diretório de trabalho e da área de preparação.

- [x] `git status`

##### Git show Shows objects

- [x] `git show`

#### Commit History
##### Git log
Display the most recent commits and the status of the head:
$ git log
Display the output as one commit per line:
$ git log -oneline
Displays the files that have been modified:
$ git log -stat
Display the modified files with location:
$ git log -p
#####  Git blame
Display the modification on each line of a file:

$ git blame <file name>

##### Ignoring files
##### .gitignore
Specify intentionally untracked files that Git should ignore. Create .gitignore:
$ touch .gitignore List the ignored files:
$ git ls-files -i --exclude-standard

#### Branching
##### Git branch Create branch:

- [x] `git branch List Branch:`
- [x] `git branch --list Delete a Branch:`
- [x] `git branch -d Delete a remote Branch:`
- [x] `git push origin -delete Rename Branch:`
- [x] `git branch -m`

##### Git checkout
Alternar entre branches em um repositório.
Alternar para um branch em particular:
- [x] `git checkout`

Crie uma nova ramificação e alterne para ela:

- [x] `git checkout -b Checkout a Remote branch:`
- [x] `git checkout`

##### Git stash
- Trocar branches sem fazer commit do branch atual. Armazenar trabalho atual:
- [x] `git stash`
- Salvando estoques com uma mensagem:
- [x] `git stash save ""`
- Verifique os estoques armazenados:
- [x] `git stash list`
- Reaplique as alterações que você acabou de armazenar:
- [x] `git stash apply`
- Acompanhe os estoques e suas alterações:
- [x] `git stash show`
- Reaplique os commits anteriores:
- [x] `git stash pop`
- Exclua o estoque mais recente da fila:
- [x] `git stash drop`
- Exclua todos os estoques disponíveis de uma só vez:
- [x] `git stash clear`
- Guarde o trabalho em um branch separado:
- [x] `git stash branch`

##### Git cherry pic
Aplique as alterações introduzidas por algum commit existente:
- [x] `git cherry-pick`

#####  Merging
######  Git merge
Merge the branches:
- [x] `git merge`
Merge the specified commit to currently active branch:
- [x] `git merge`
##### Git rebase
Apply a sequence of commits from distinct branches into a final commit.
- [x] `git rebase`
Continue the rebasing process:
- [x] `git rebase -continue Abort the rebasing process:`
- [x] `git rebase --skip`
##### Git interactive rebase
Allow various operations like edit, rewrite, reorder, and more on existing commits.
- [x] `git rebase -i`
#### Remote
#####  Git remote
Check the configuration of the remote server:
- [x] `git remote -v`
Add a remote for the repository:
- [x] `git remote add Fetch the data from the remote server:`
- [x] `git fetch`
Remove a remote connection from the repository:
- [x] `git remote rm`
Rename remote server:
- [x] `git remote rename`
Show additional information about a particular remote:
- [x] `git remote show`
Change remote:
- [x] `git remote set-url`

#####  Git origin master
Push data to the remote server:

$ git push origin master Pull data from remote server:`
$ git pull origin master`

#### Pushing Updates
#####  Git push
Transfer the commits from your local repository to a remote server. Push data to
the remote server:

$ git push origin master Force push data:`
$ git push -f`
Delete a remote branch by push command:
$ git push origin -delete edited`

#### Pulling updates
##### Git pull
Pull the data from the server:
$ git pull origin master
Pull a remote branch:
$ git pull

#####  Git fetch
Download branches and tags from one or more repositories. Fetch the remote
repository:
$ git fetch< repository Url> Fetch a specific branch:
$ git fetch
Fetch all the branches simultaneously:
$ git fetch -all
Synchronize the local repository:
$ git fetch origin
1.  Undo changes
o Git revert
Undo the changes:
$ git revert
Revert a particular commit:
$ git revert
o Git reset
Reset the changes:
$ git reset -hard
$ git reset -soft:
$ git reset --mixed

##### Git rm
Remove the files from the working tree and from the index:
$ git rm <file Name>
Remove files from the Git But keep the files in your local repository:
$ git rm --cached

### Documentation as Code (DaC)
Usar um repositório de sistema de controle de versão de gerenciamento de documentaçãounificada. A ideia deste repositório é simular um monorepo significa usar um repositório,em vez de vários repositórios.
Este repositório contem um diretório de `documentacao` para os outros repositórios dedocumentação.
Como efetuar esta configuração:

- [x] `git clone https://servidor/repositorio.git`
- [x] `cd PORTIFOLIO/`
- [x] `cd documentacao/`
- [x] `git submodule add --name NOME_DO_DIRETORIO https://servidor/repositorio.gitNOME_DO_DIRETORIO`
- [x] `git submodule update --remote`

![](img/60pportunities-dac.png)

### Branches

- [x] Quando o sprint começar, crie um conjunto de branches, que serão aqui discutidas.
    - [x] sprint (Inicial e que deverá ser atualizado no término da Sprint)
    - [x] O Tech Leader deverá efetuar a criação das branches diretamente da main;
        - [x] wit|wip/ (Static Application Security Testing (SAST) e Unit Test devem ser realizados.)
        - [x] wip (Working in progress): O desenvolvedor esta efetuando a criação de um objeto.
        - [x] wit (Working Item): Work Item liberado para o pessoal de qualidade.
- [x] qualidade (Processo de qualidade, onde os testes: PlanTest, CyPress e Security Test (IAST(Interactive Application Security Testing), MAST(Mobile Application Security Test), DAST(Dynamic Application Security Testing)), RAST (Re Application Security Testing);

![](img/prj_int_branches_003.png)

![](img/prj_int_branches_004.png)

O desenvolvedor deverá efetuar o clone do repositório criado :  `git clone --branch <branchname> --single-branch <remote-repo-url>`

- [x] `git clone --branch <branchname> --single-branch <remote-repo-url>`
- [x] `git clone --branch "wip/nome-feature-witnum" https://servidor/repositorio.git`
- [x] `git branch -a`
    - [x] `wip/nome-feature-witnum`
    - [x] `remotes/origin/HEAD -> origin/main`
    - [x] `remotes/origin/main`
    - [x] `remotes/origin/qualidade`
    - [x] `remotes/origin/sprint`
    - [x] `remotes/origin/wip/nome-feature-witnum`
    - [x] `remotes/origin/wip/nome-feature-witnum`
    - [x] `remotes/origin/wip/nome-feature-witnum`
- [x] `git fetch`
- [x] `git pull`
- [x] Ao terminar o desenvolvimento, o desenvolvedor deverá renomear a branch `wip` etorna-la `wit`, indicando que o mesmo foi finalizado.
- [x] `vi arquivo.txt`
- [x] `git add arquivo.txt`
- [x] `git commit -m "<feat> :sparkles: - Inclusão xxxxxxxxxxxxxxxxxxxx"`
- [x] `git push origin main`
![](img/prj_int_branches_005.png)
- [x] Continuei as atividades até completa-la, efetuando os Testes Unitários e devalidação. (Não demonstrarei o SAST);
- [x] Como nós terminamos o trabalho, precisamos renomear a branch;
- [x] `git branch -m "wit/nome-feature-witnum"`
- [x] `git push origin -u "wit/nome-feature-witnum"`

![](img/prj_int_branches_006.png)

- [x] Repare que ao subir a nova branch, a antiga branch, ficou lá também, por isso há anecessidade de exclui-la do repositório.

- [x] `git push origin --delete "wip/nome-feature-witnum"`
- [x] Deleta a branch de trabalho, podemos agora solicitar um Pull Request para informar aopessoal de Qualidade, que o processo, finalizou e agora há a necessidade de validação poresta equipe. O pessoal de qualidade, acatará o recebimento do Pull Request.

![](img/prj_int_branches_007.png)

- [x] Eu esqueci de efetuar o arquivo Markdown, Qualidade e Sprint. Como NÃO havia sidocriado, podemos optar em utilizar o template pull_request_template.md

![](img/prj_int_branches_008.png)

### Segurança
Imaginemos que tenhamos um repositório em: http://servidor/repositorio.git, e gostaria de alem de ter um backup no repositório central, pudesse ficar com um repositório fora do meu hd/ssd?
Efetuo a clonagem do meu repositório remoto, para um disco local de trabalho.

- [x] `git clone http://servidor/repositorio.git ou git clone --branch "main" http://servidor/repositorio.git`

Criado o repositório local, vou para o diretório criado e efetuo o clone para um outro diretório, de preferencia um pendrive ou um hd/ssd externo.

- [x] cd casa
- [x] `git clone --bare . DISCO:/repositorio.git`

Informo ao repositório, que existirão dois remotos: O origin que será o meu remoto do repositório central e um local, que será o meu backup local.

- [x] `git remote add local DISCO:/repositorio.git`
- [x] `git remote -v`

```
local	DISCO:/repositorio.git (fetch)
local	DISCO:/repositorio.git (push)
origin	http://servidor/repositorio.git (fetch)
origin	http://servidor/repositorio.git (push)
```

- [x] Agora vamos construir uma aplicaçõa e verificar se esta tudo de acordo, como imaginávamos.Criaremos um arquivo unico chamado horacio.txt e efetuaremos os passos normais.

```
> vi arquivo.txt
> ls -al
drwxr-xr-x⠀staff⠀224 ⠀Feb  1 08:37:12⠀ﱮ⠀.
drwxr-xr-x⠀staff⠀1536⠀Feb  1 08:14:00⠀ﱮ⠀..
drwxr-xr-x⠀staff⠀384 ⠀Feb  1 08:27:06⠀⠀.git/
-rw-r--r--⠀staff⠀394 ⠀Feb  1 08:14:00⠀⠀.gitignore
-rw-r--r--⠀staff⠀32  ⠀Feb  1 08:37:12⠀⠀arquivo.txt
-rw-r--r--⠀staff⠀1077⠀Feb  1 08:14:00⠀⠀LICENSE.md
-rw-r--r--⠀staff⠀13  ⠀Feb  1 08:14:00⠀⠀README.md

> git add arquivo.txt
> git status
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   arquivo.txt

> git commit -m "<doc>(ptb) Inclusão do arquivo arquivo.txt"
[main 193b33b] <doc>(ptb) Inclusão do arquivo arquivo.txt
 1 file changed, 3 insertions(+)
 create mode 100644 arquivo.txt

> git push (irá sempre mandar para o origin)
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 10 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 970 bytes | 970.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
To http://servidor/repositorio.git
   193b33b..be3129f  main -> main

> git push local
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 10 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 970 bytes | 970.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
To DISCO:/repositorio.git
   193b33b..be3129f  main -> main
```
### Recuperando o repositório perdido

<p align="justify">Aqui é outro chopp, mas vamos iniciar explicando o que é o Ngrok. Ngrok é uma ferramenta que te permite a criação de um túnel seguro, atrás de NATs(Network Address Translation) e Firewalls, que expõem serviços locais para a Internet.</p>

### Compartilhando o diretório com outras pessoas
Entre no diretório `/DISCO:/repositorio.git` e execute o comando `git --bare update-server-info` e depois `mv hooks/post-update.sample hooks/post-update`.
