Existem várias ferramentas de secret scanning que ajudam a identificar e evitar a exposição de credenciais e segredos em repositórios de código. Relacionei abaixo algumas das ferramentas instaladas em meu computador:

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
- [ ] pre-commit sample-config > .pre-commit-config.yaml
