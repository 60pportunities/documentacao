Backstage é uma estrutura de código aberto para a construção de portais de desenvolvedores.
Backstage unifica as suas ferramentas de infraestrutura, serviços e documentação para criar um ambiente de desenvolvimento simplificado de ponta a ponta.
Backstage para automatizar a criação de novos repositórios, incluindo algumas tarefas personalizadas como parte desse processo.
## Pré-requisitos
Estaremos automatizando usando apenas as seguintes ferramentas:

- [x] Conta GitHub
- [x] Espaços de código do GitHub
- [x] Extensão VSCode e Codespaces

### VSCode
Antes de começar, você deve instalar o plugin Codespaces na sua instalação local do VSCode, porque depois conectaremos sua instância do vscode ao codespace no GitHub.

```
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/typescript-node
{
  "name": "AATT Workshop",
  "build": {
    // O caminho é relativo ao arquivo devcontainer.json.
    "dockerfile": "Dockerfile"
  },
  "features": {
    "ghcr.io/devcontainers/features/github-cli:1": {}
  },

  // Use 'forwardPorts' para disponibilizar localmente uma lista de portas dentro do contêiner.
  "forwardPorts": [3000, 7007],

  "portsAttributes": {
    "3000": {
      "label": "Frontend",
      "onAutoForward": "openBrowserOnce"
    },
    "7007": {
      "label": "Backend",
      "onAutoForward": "ignore"
    }
  },

  "mounts": [
    {
      "source": "${localWorkspaceFolderBasename}-backstage-node_modules",
      "target": "${containerWorkspaceFolder}/backstage/node_modules",
      "type": "volume"
    },
    {
      "source": "${localWorkspaceFolderBasename}-backstage-yarn-cache",
      "target": "${containerWorkspaceFolder}/backstage/.yarn/cache",
      "type": "volume"
    }
  ],

  // Use 'postCreateCommand' para executar comandos após a criação do contêiner.
  // "postCreateCommand": "yarn install",

  // Configure tool-specific properties.
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "orta.vscode-jest",
        "streetsidesoftware.code-spell-checker",
        "intility.vscode-backstage"
      ]
    }
  },

  // Remova o comentário para conectar-se como root. Mais informações: https://aka.ms/dev-containers-non-root.
  // "remoteUser": "root"

  "postCreateCommand": {
    // A montagem de volumes traz problemas de permissão, então precisamos corrigi-los
    // para ter certeza de que podemos gravar nos volumes montados ao executar em devcontainers
    "fix_permissions": "sudo chown node backstage/node_modules && sudo chown node backstage/.yarn/cache"
  }
}
```
## Arquitetura
O Backstage dessa forma porque vemos três grupos de colaboradores que trabalham com o Backstage de três maneiras diferentes.

