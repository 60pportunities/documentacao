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
- [ ] `git branch develop`
- [ ] `git push -u origin develop`
- [ ] `git checkout develop`
- [ ] `git checkout -b feature_branch`
- [ ] `git checkout develop`
- [ ] `git merge feature_branch`
  
### Release branch
- [ ] `git checkout develop`
- [ ] `git checkout -b release/0.1.0`
- [ ] `git checkout main`
- [ ] `git merge release/0.1.0`

### Hotfix branch
- [ ] `git checkout main`
- [ ] `git checkout -b hotfix_branch`
- [ ] `git checkout main`
- [ ] `git merge hotfix_branch`
- [ ] `git checkout develop`
- [ ] `git merge hotfix_branch`
- [ ] `git branch -D hotfix_branch`
