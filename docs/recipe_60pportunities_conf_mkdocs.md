<p align="justify">Optamos em utilizar um Static Site Generator (SSG) como o MkDocs, por entender que  traz diversas vantagens, especialmente quando se trata de criar documentação e sites de conteúdo estáticos. Abaixo colocamos algumas razões que justificam nossa escolha:</p>

- [x] **Simplicidade e Facilidade de Uso**: MkDocs é fácil de configurar e usar. A sintaxe Markdown, que é utilizada para escrever a documentação, é simples e acessível, permitindo que pessoas com pouco conhecimento técnico possam contribuir.
- [x] **Documentação Organizada**: MkDocs permite estruturar a documentação de maneira clara e organizada, facilitando a navegação entre os diferentes tópicos. Isso é especialmente útil em projetos grandes, onde a documentação pode se tornar complexa.
- [x] **Desempenho**: Sites estáticos gerados pelo MkDocs têm desempenho superior em comparação com sites dinâmicos, pois não exigem consultas a bancos de dados ou processamento em tempo real. Isso resulta em tempos de carregamento mais rápidos.
- [x] **Facilidade de Deploy**: Como os sites gerados são apenas arquivos estáticos (HTML, CSS, JavaScript), eles podem ser facilmente hospedados em diversos serviços, como GitHub Pages, Netlify ou qualquer servidor web. Isso simplifica o processo de publicação.
- [x] **Versionamento**: Ao utilizar um sistema de controle de versões como Git, é possível gerenciar as alterações na documentação ao longo do tempo, permitindo que diferentes versões da documentação sejam mantidas e consultadas conforme necessário. Cada mudança no código pode vir acompanhada de uma atualização na documentação correspondente.
- [x] **Customização**: MkDocs oferece uma série de temas e plugins que permitem personalizar a aparência e as funcionalidades do site, adequando-o às necessidades específicas do projeto.
- [x] **Integração com CI/CD e Automação de Builds e Deploys**: A geração e publicação automatizada do site através de pipelines de CI/CD facilita a atualização contínua da documentação, garantindo que as mudanças sejam refletidas rapidamente no site.Isso facilita a publicação de atualizações e garante que a documentação esteja sempre disponível e atualizada.
- [x] **SEO e Acessibilidade**: Sites estáticos podem ser otimizados para motores de busca, melhorando a visibilidade e a acessibilidade da documentação, o que é crucial para usuários que buscam informações.

Em se utilizar o Mermaid junto com o MkDocs teremos inúmeras vantagens, especialmente no contexto de documentação técnica e projetos de desenvolvimento, pois:

- [x] **Visualização de Dados**: O Mermaid permite criar diagramas e gráficos de forma simples usando uma sintaxe textual. Isso é útil para representar visualmente processos, fluxos de trabalho, relações entre componentes, entre outros, melhorando a compreensão do conteúdo.
- [x] **Facilidade de Atualização**: Como o Mermaid utiliza uma sintaxe de texto, as alterações nos diagramas são rápidas e fáceis de fazer. Isso permite que a documentação se mantenha atualizada sem a necessidade de ferramentas gráficas complexas.
- [x] **Integração com Markdown**: O Mermaid se integra facilmente com a sintaxe Markdown, que é amplamente utilizada em SSGs como o MkDocs. Isso possibilita a inclusão de diagramas diretamente no texto da documentação, facilitando a leitura e o entendimento.
- [x] **Consistência Visual**: Ao utilizar Mermaid, todos os diagramas seguem um estilo visual consistente, o que contribui para a uniformidade estética da documentação. Isso é especialmente importante em projetos grandes, onde a consistência ajuda na navegação e na experiência do usuário.
- [x] **Colaboração Eficiente**: Como os diagramas são baseados em texto, é fácil para a equipe colaborar e revisar esses elementos, da mesma forma que fariam com o código. Isso promove uma cultura de colaboração e permite que mais pessoas contribuam para a visualização do conteúdo.
- [x] **Documentação Dinâmica**: Ao usar Mermaid, você pode criar diagramas que se adaptam às mudanças na documentação ou no código. Isso garante que as representações visuais estejam sempre atualizadas, refletindo a realidade do projeto.
- [x] **Acessibilidade**: Diagramas criados com Mermaid são renderizados diretamente no navegador, o que elimina a necessidade de arquivos externos ou imagens que podem ser difíceis de gerenciar. Isso melhora a acessibilidade e a portabilidade da documentação.
- [x] **Suporte a Diversos Tipos de Diagramas**: O Mermaid oferece suporte a diferentes tipos de diagramas: Flowchart, Sequence Diagram, Class Diagram, State Diagram,Entity Relationship Diagram,User Journey,Gantt,Pie Chart,Quadrant Chart, Requirement Diagram,Gitgraph (Git) Diagram, C4 Diagram, Mindmaps,Timeline,ZenUML,Sankey, XY Chart ,Block Diagram ,Packet, Architecture dentre outros.

A utilização de um SSG como o MkDocs no contexto do conceito "Documentation as Code" (Doc as Code) é altamente benéfica para equipes de desenvolvimento de produto, pois:

- [x] **Integração com o Fluxo de Trabalho**: Ao tratar a documentação como código, as equipes podem integrá-la diretamente em seus fluxos de trabalho de desenvolvimento. Isso significa que a documentação é atualizada junto com o código, garantindo que as informações estejam sempre alinhadas.
- [x] **Colaboração e Revisão**: A documentação pode ser revisada e comentada da mesma forma que o código, permitindo feedback e melhorias constantes. Isso encoraja a colaboração entre desenvolvedores e outros stakeholders, resultando em uma documentação mais completa e precisa.
- [x] **Consistência e Padronização**: O uso de uma estrutura de SSG como MkDocs promove a consistência no formato e na organização da documentação. Isso é essencial para que a equipe mantenha padrões claros e compreensíveis ao longo do projeto.
- [x] **Acessibilidade e Manutenção**: A documentação é facilmente acessível e pode ser mantida por qualquer membro da equipe, não apenas por quem escreve. Isso reduz a dependência de uma única pessoa e torna a documentação um esforço coletivo.
- [x] **Facilidade de Testes**: Documentar como código permite que a equipe teste a documentação de maneira similar ao código, garantindo que informações críticas e instruções funcionem como esperado, especialmente em tutoriais ou guias de uso.
- [x] **Cultura de Documentação**: Encorajar a equipe a tratar a documentação como parte integral do desenvolvimento ajuda a criar uma cultura de valorização da documentação, onde todos reconhecem sua importância e contribuem para mantê-la atualizada e útil.

Sugerimos que instalem o mkdocs, para ver localmente suas alterações e configurações, antes de publicar o material.

- [x] [MkDocs](https://www.mkdocs.org/)
- [x] [Docs as Code](https://www.writethedocs.org/guide/docs-as-code/)
- [x] Lista de Plugins a serem instalados.
<div class="mdx-columns2" markdown>
| Plugins                           | Versão       | Plugins                           | Versão       |
| -----                             | ----         | -----                             | ----         |
| manim                             |       0.18.1 |mkdocs-glightbox                   |       0.4.0  | 
| ManimPango                        |       0.5.0  |mkdocs-include-markdown-plugin     |       6.2.1  |
| mapbox-earcut                     |       1.0.1  |mkdocs-material                    |       9.5.31 |
| Markdown                          |       3.6    |mkdocs-material-extensions         |       1.3.1  |
| markdown-callouts                 |       0.4.0  |mkdocs-mermaid2-plugin             |       1.1.1  |
| markdown-include                  |       0.8.1  |mkdocs-minify-plugin               |       0.8.0  |
| markdown-it-py                    |       3.0.0  |mkdocs-monorepo-plugin             |       1.1.0  |
| MarkupSafe                        |       2.0.1  |mkdocs-pdf-export-plugin           |       0.5.10 |
| attrs                             |       23.2.0 |mkdocs-print-site-plugin           |       2.5.0  |
| Babel                             |       2.15.0 |mkdocs-render-swagger-plugin       |       0.1.2  |
| backoff                           |       2.2.1  |mkdocs-swagger-ui-tag              |       0.6.10 |
| bcrypt                            |       3.2.0  |mkdocs-table-reader-plugin         |       2.2.2  |
| mike                              |       2.1.2  |mkdocs-with-pdf                    |       0.9.3  |
| mkdocs                            |       1.6.0  |mkdocstrings                       |       0.25.2 |
| mkdocs-autorefs                   |       1.0.1  |mkdocstrings-crystal               |       0.3.7  |
| mkdocs-get-deps                   |       0.2.0  |mkdocstrings-python                |       1.10.7 |
</div>
**Observação**: Consulte seu provedor de código para verificar se há compatibilidade da versão do mermaid, ao escrever sua documentação.
