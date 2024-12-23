## Contribuindo com Código Aberto

Identifique a template do `.gitignore`: `gh repo gitignore list`

- [x] Criar um Fork do Projeto: `gh repo fork <usuario>/<repositorio>`
- [x] Clonar o Fork:            `gh repo clone <seu_usuario>/<repositorio>`
- [x] Sincronizar o Fork com o Repositório Original:
```
git remote add upstream https://github.com/<usuario>/<repositorio>.git
git fetch upstream
```
- [x] Criar uma Branch para a Feature
```
cd <repositorio>
git checkout -b feature
```
- [x]  Manter o Fork Atualizado
```
git remote add upstream https://github.com/<usuario>/<repositorio>.git
git fetch upstream
git checkout main
git merge upstream/main
git checkout feature
git merge main
```
- [x] Enviar as Alterações para o Fork
```
git push origin feature
```
- [x] Criar a Pull Request
```
gh pr create --base main --head <seu_usuario>:feature --title "Título da PR" --body "Descrição da PR e referência a qualquer questão relevante, como #1"
```
- [x] Criar uma Pull Request `gh pr create --base main --head <seu_usuario>:main --title "Título da PR" --body "Descrição da PR"`

## Exemplos

```
mkdir teste
cd teste
git init .
vi horacio.txt
git add horacio.txt 
git rm --cached horacio.txt
git add horacio.txt 
git commit -m "<doc> Meu primento commit."
vi horacio.txt
git restore horacio.txt
```