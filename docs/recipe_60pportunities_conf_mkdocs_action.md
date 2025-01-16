No cenário de desenvolvimento ágil e de constante inovação tecnológica, a relação entre o código e documentação  para o usuário e desenvolvedores — é frequentemente considerada um ponto crítico.
Em uma análise simples, podemos adotar boas práticas de desenvolvimento e da documentação, sendo possível evitar essa defasagem, mantendo a documentação sempre alinhada com as alterações.

As aplicações e documentações, quando mantidas de acordo com padrões e processos adequados, não apresentam defasagem em seu conteúdo e de suas alterações.

## Documentação Contínua e Acompanhamento Ágil
A documentação de software deve ser tratada de forma contínua e DaC (Documentation as Code)  e não como uma atividade pontual após o desenvolvimento do código. 

Ao longo do ciclo de vida de um projeto, a documentação (tanto técnica quanto voltada para o usuário) deve ser constantemente atualizada, paralelamente ao progresso do desenvolvimento da aplicação.

A documentação "viva" é atualizada com a mesma frequência do código, garantindo que os engenheiros, gestores de qualidade e até mesmo os usuários, tenham acesso a informações precisas, em tempo real. 

Em nossa aboardagem, trateremos de uma documentação contínua, que inclui:

- [x] Documentação de código:
      - [x] Commit Conventional (Comentários explicativos);
      - [x] Testes e cobertura de testes;
      - [x] Documentação de Código (Javadoc, Docstrings, JSDOC, PLDoc, RDoc,PHPDoc + phpDocumentor, GoDoc, Rustdoc)
      - [x] Documentação de APIs (OAS, Swagger ou ReDoc);
      - [x] Geradores de Dependencia e Vulnerabilidades;
      - [x] Preenchimento de Templates durante o processo de Pull-Request;
      - [ ] Documentação de releases;

- [x] Documentação do usuário, em um primeiro momento deverão ser utilizados as issues ou wits para a criação de épicos, pbis ou issues e mantidas na Wiki apenas o manual de operação da Aplicação.
      - [x] Wiki
      - [ ] Planejamento do Projeto;
      - [ ] Documentação do usuário final orientada a processos;
      - [ ] Changelog (O que foi corrigido, adicionado e alterado nas releases);
      - [ ] Documentação técnica para manutenção;
      - [ ] Portifólio de Produtos
      - [ ] A documentação do Portifólio, será a unificação da Wiki (Manual do usuário - wiki2mkdocs);
      - [ ] Pull Request/Code Review efetuará a geração de chagelogs e republicação do Portifólio;
 - [x] Geração do Report Book;
 - [x] Geração de Catálogo de APIs por grupo;


Josemar Viana da Silva e Rafael Favorito Miyahira vocês me deram uma ideia que estou colocando em prática agora.. com uma pipeline de dados simples.
 
Qual a ideia: Portifólio de Produto (O desenho já estava feito e implantado:
 
 http://devdocs.bbts.com.br/cesuc/arquitetura_bbts_plataforma_proposta/
 
Como você esta participando da ética, pensei pq não envolver tudo e me perguntei?
 
Como podemos garantir a privacidade e conformidade por meio da higienização contínua de dados e da documentação.
 
Como lidar com dados confidenciais em documentos passa ser  essencial e desafiador, especialmente com regulamentações como LGPD, GPDR e CCPA?
 
Como garantir que imagens não sejam ofensivas em um contexto empresarial?  Como podemos garantir a usabilidade de documento e de materiais removendo as  informações confidenciais.
 
Aí, pensei: Azure Language Service e Data Scrubbing (password, passwd e etc)?
```
name: 'Produce Presentation Content'
on:
  push:
    branches:
      - main
jobs:
  build-pptx:
    name: 'Build PowerPoint Presentation'
    runs-on: ubuntu-latest
    container:
      image: seesharprun/pandoc-build
    steps:
      - name: 'Checkout Code'
        uses: actions/checkout@v2
      - name: 'Run Pandoc Builds'
        run: ls | grep '.md' | xargs basename -s '.md' | xargs -I % sh -c "pandoc %.md --standalone --reference-doc=../.production/template.pptx --highlight-style ../.production/code.theme --variable=monofont:'Cascadia Code' --output %.pptx"
        working-directory: ./presentations
      - name: 'Upload Presentation Artifacts'
        uses: actions/upload-artifact@v2
        with:
          name: presentations
          path: ./presentations/*.pptx
  release-content:
    name: 'Create GitHub Release'
    runs-on: ubuntu-latest
    needs: [ build-pptx ]
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }} 
    steps:      
      - name: 'Download Presentation Artifacts'
        uses: actions/download-artifact@v2
        with:
          name: presentations
      - name: 'Create GitHub Release'
        uses: softprops/action-gh-release@v1
        with:
          files: ./**/*.pptx         
          tag_name: v${{ github.run_number }}
          name: Release V${{ github.run_number }}
```
