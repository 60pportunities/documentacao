## Conflitos
- [x] Após tentar realizar um merge ou pull que resultou em conflitos, o primeiro passo é verificar o status do seu repositório. Use o comando: `git status`, esse comando mostrará quais arquivos estão em conflito.
- [x] Os arquivos que estão em conflito serão listados sob "Unmerged paths". Você pode também usar o comando git diff para ver as diferenças entre as versões e entender melhor os conflitos: `git diff`
- [x] Abra os arquivos listados em conflito em um editor de texto. O Git marca as seções conflitantes com os seguintes delimitadores:

```
<<<<<<< HEAD
Conteúdo da sua branch atual
=======
Conteúdo da branch que está sendo mesclada
>>>>>>> nome-da-branch
```

- [x] Você deve editar o arquivo para resolver o conflito, mantendo apenas as partes desejadas e removendo os marcadores.
- [x] Após resolver os conflitos, adicione os arquivos resolvidos ao stage: `git add <nome_do_arquivo>`
- [x] Depois, finalize o merge com um commit: `git commit -m "Resolvendo conflitos"`
- [x] Para garantir que tudo foi resolvido corretamente, você pode verificar o histórico de commits: `git log`
## Quebrando de Produto na Branch sprint
- [x] Identifique o último commit estável;
- [x] Crie uma nova ramificação com base neste commit estável: `git checkout -b develop-fix hash`;
- [x] Envie esta ramificação "estável" como o novo desenvolvimento: `git push origin develop-fix --force`
## Revertendo uma implementação
- [x] Identifique o hash de confirmação da mesclagem problemática;
- [x] Reverter a mesclagem: `git revert -m 1 merge123` O sinalizador -m 1 indica que o primeiro pai (geralmente o principal) deve ser a base para a reversão.
- [x] Empurre o commit de reversão: `git push origin main`
- [x] Mais tarde, quando o recurso estiver pronto para ser relançado, use uma mesclagem reversa para reintroduzi-lo:` git checkout feature-branch git merge main`
## Ressuscitando `após git reset --hard`
- [x] Execute `git reflog` para visualizar o histórico do seu repositório
- [x] Encontre o hash de confirmação que você deseja recuperar;
- [x] Restaure-o usando `git reset --hard: `git reset --hard hash`
- [x] Seus commits perdidos estão de volta, e você pode respirar novamente.

## Trabalho em Equipe
O trabalho em equipe envolve diferentes estratégias de pensamento: criativo, compreensivo e decisivo.

- [x] O pensamento criativo envolve desafiar o status quo e propor novas ideias;
- [x] O pensamento compreensivo é a capacidade de focar em uma tarefa e entender um problema em profundidade.
- [x] Para planejar reuniões eficazes, um padrão de início, engajamento e conclusão.
- [x] Reuniões de ideação para projetos podem incluir: identificar o problema, debater soluções, estruturar ideias e selecionar as melhores para testar.
- [x] O branch principal deve conter apenas trabalho testado e nunca deve ser quebrado.
- [x] À medida que o projeto amadurece, o número de branches pode aumentar, é importante encontrar um número de tipos de branches que funcionem bem para a equipe.
- [x] Documentar o processo da equipe é crucial para manter a consistência e facilitar a compreensão do histórico do código.
- [x] Documentar as decisões codificadas é outra prática importante, utilizando um sistema de tickets para capturar todos os requisitos.
- [x] O ideal é não exagerar na categorização e permitir que o time adicione estados conforme necessário;
- [x] O review de código faz parte do fluxo, com merge realizado pelo revisor.
- [x] Quando uma versão do software é lançada, um novo branch chamado main é criado a partir do commit aprovado, e um tag de versão é adicionado.
- [x] Para hotfixes, um branch é criado a partir do último lançamento, e segue o mesmo processo de review.
- [x] O versionamento baseado em issues é destacado, com cada tarefa sendo uma maneira de ajudar alguém.
- [x] O processo de trabalho deve incluir a criação do ticket, um novo branch com o número do ticket, o trabalho no ticket, testes e o commit.
