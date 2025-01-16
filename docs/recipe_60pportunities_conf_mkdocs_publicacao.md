A grande vantagem sobre hospedar a documentação do projeto em um repositório git, é a capacidade de implantá-lo automaticamente quando novas alterações são empurradas ou passam pelo processo de revisão e confirmação.
Como estamos hospedando nosso código no GitHub, o GitHub Pages é certamente a maneira mais conveniente de publicar sua documentação do projeto, sendo gratuito e muito fácil de configurar.

Para configurar o MkDocs e publicar seu site no GitHub Pages, vamos efetuar um passo a passo, que irá da instalação até a sua publicação. 

- [x] **Instalar o MkDocs**: Antes de tudo, você precisa ter o Python e o pip instalados. 
      - [x] Faça o download do instalador executável e clique duas vezes nele para iniciar o assistente de instalação do python.
      - [x] O processo de instalação é bem simples. Marque a opção "Add Python to PATH" e "Install Now".
      - [x] Para verificar se a instalação do Python foi bem-sucedida, pesquise no menu iniciar por "cmd" e clique duas vezes para abri-lo.
      - [x] Digite o seguinte comando: $ python --version e posteriormente pip --version
      - [x] O pip é o gerenciador de pacote do Python. Com ele você poderá adicionar novas funcionalidades ao seu Python.
      - [x] Para instalar o MkDocs, execute o seguinte comando da linha de comando: pip install mkdocs
      - [x] Efetue a geração do arquivo : bibliotecas.txt, contendo os pacotes definidos e `pip install -r bibliotecas.txt`.
- [x] Efetue o clone do Projeto, `git clone NOME_DO_REPOSITORIO`.
- [x] **Adicionar conteúdo**: Adicione seus documentos Markdown na pasta docs. Os arquivos Markdown são onde você escreve o conteúdo do seu site.
- [x] **Adicionar `mkdocs.yml`**, para ajustar as configurações do seu projeto, como título, tema e estrutura de navegação.
- [x] **Visualizar localmente** : Para ver como o seu site ficará, você pode executar o servidor local, no diretório raiz do projeto clonado. `mkdocs serve` e posteriormente acesse `http://127.0.0.1:8000` no seu navegador para visualizar.
- [x] **Preparar para publicação**: Quando estiver satisfeito, você pode gerar os arquivos para publicação: `mkdocs build`, isso criará uma pasta chamada site com todos os arquivos necessários.
- [x] **Publicar no GitHub Pages**: Para publicar no GitHub Pages, você pode usar o seguinte comando: `mkdocs gh-deploy`, isso irá construir o projeto e enviar o conteúdo da pasta site para a branch gh-pages do seu repositório.
- [x] **Para fazer atualizações** no seu site, basta editar os arquivos Markdown, executar mkdocs build novamente e usar **mkdocs gh-deploy** para publicar as mudanças.
      
**Observação**: 

- [x] Você precisa adicionar a CNAME arquivo do arquivo para a raiz de seu **docs_dir**. 
- [x] O arquivo deve conter um único domínio ou subdomínio em uma única linha (veja o próprio arquivo CNAME do MkDocs como exemplo).
- [x] mkdocs gh-deploy --help
- [x] mkdocs gh-deploy --config-file mkdocs.yml --remote-branch main
- [x] Exemplo de uma script em Shell:

      ```
      #!/bin/bash
      #mike delete --all
      set -x
      git commit -m "<doc> Criação versão documentaca" --allow-empty
      LASTTAG=$(git describe --tags `git rev-list --tags --max-count=1`)
      mike deploy --update-aliases "${LASTTAG}" latest
      mike set-default --push latest
      ```
