![](img/git-devops-002.png){width="200" height="200" style="display: block; margin: 0 auto"}
## Detecção de segredos
Existem ótimas ferramentas de código aberto disponíveis para automatizar a tarefa de digitalizar seu código para segredos codificados no início do SDLC, para que você possa pegá-los antes da produção.

Relacionei abaixo algumas das ferramentas instaladas em meu computador:

- [x] [Pre-commit](https://pre-commit.com/)
      - [ ] O pre-commit é uma ferramenta de gerenciamento de hooks para Git, e pode ser configurada para realizar secret scanning antes de commits. Existem diversos hooks de secret scanning como o detect-secrets e o truffleHog que podem ser integrados com pre-commit.
      - [ ] brew install pre-commit
- [x] [TruffleHog](https://github.com/trufflesecurity/trufflehog)
       - [x] Escaneia repositórios Git em busca de chaves de API e outros segredos sensíveis, usando técnicas como a análise de histórico Git para procurar strings que correspondem a padrões de segredos (como tokens, senhas, etc.).
       - [x] brew install pre-commit
- [x] [Gitleaks](https://github.com/gitleaks/gitleaks)
      - [x] É uma ferramenta para escanear repositórios Git e identificar segredos sensíveis. Ele permite realizar varreduras tanto em commits passados quanto em alterações no código.
      - [ ] brew install gitleaks
- [x] [Ddetect-secrets](https://github.com/Yelp/detect-secrets)
      - [x] É uma ferramenta criada pela empresa Yelp para encontrar segredos em repositórios de código. Ele faz uma verificação para encontrar segredos sensíveis no código, usando detecção de padrões baseados em regex.
      - [ ] brew install detect-secrets
- [x] [Credential-Manager](https://github.com/git-ecosystem/git-credential-manager)
      - [ ] Ele tem como objetivo fornecer uma experiência de autenticação consistente e segura, incluindo autenticação multifator, para todos os principais serviços e plataformas de hospedagem de controle de origem.
      - [ ] brew install --cask git-credential-manager
## Configuração Básica
- [x] No repositório do projeto git, execute:  `pre-commit install`;
- [x] pre-commit sample-config > .pre-commit-config.yaml
- [x] detect-secrets scan > .secrets.baseline
- [x] pre-commit run --all-files


```
# .pre-commit-config.yaml
repos:
    - repo: https://github.com/pre-commit/pre-commit-hooks
      rev: v5.0.0
      hooks:
          - id: trailing-whitespace
          - id: end-of-file-fixer
          - id: check-yaml
            exclude: mkdocs.yml
          - id: check-added-large-files

    - repo: https://github.com/Yelp/detect-secrets
      rev: v1.5.0
      hooks:
          - id: detect-secrets
            args: ['--baseline', '.secrets.baseline']
            exclude: package.lock.json

```
Observação: Para aprender mais acesse [Featured Hooks](https://pre-commit.com/hooks.html)


## Software Composition Analysis  (SCA)
As ferramentas de verificação de vulnerabilidades de código aberto - também conhecidas como Análise de Composição de Software - podem ajudá-lo a identificar vulnerabilidades e outros problemas em suas dependências de código aberto.

Essas ferramentas geralmente funcionam identificando as dependências que seu código está usando e determinando se elas introduzem vulnerabilidades ou problemas conhecidos.

Cabe lembrar que ao utilizar o GitHub, você irá validar através do Dependabot.

Para este contexto, resolvi instalar e configurar a `OSV-Scanner`, onde demonstro como efetuar a instalação.

- [x] brew install go
- [x] brew install osv-scanner
- [x] osv-scanner --recursive .

## Infraestrutura como código (IaC)
Prática que envolve o uso de código para gerenciar e provisionar sua infraestrutura.

Pode incluir tudo, desde servidores e armazenamento até redes e balanceadores de carga.

Usar o código para gerenciar sua infraestrutura garante que seus ambientes sejam consistentes e que as alterações sejam previsíveis e controladas.

![](img/git-devops-001.png){width="200" height="200" style="display: block; margin: 0 auto"}

## Security Incident and Event Management (SIEM),
 Essas ferramentas ajudam você a entender o que está acontecendo em seu sistema, identificar problemas à medida que surgem e tomar medidas corretivas prontamente.

 Usando ferramentas como o Security Incident and Event Management (SIEM), você pode entender melhor o que está acontecendo em seu sistema e ser notificado quando algo der errado.

 Alertas em tempo real permitem que você tome medidas corretivas antes que os problemas tenham consequências irreversíveis.

 Com ferramentas como rastreamento distribuído, você pode identificar a causa raiz dos bugs e corrigi-los mais rapidamente sem afetar a funcionalidade do aplicativo.
