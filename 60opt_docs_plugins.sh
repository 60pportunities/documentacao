#!/bin/bash
if ! command -v mkdocs &> /dev/null
then
    echo "MkDocs não está instalado. Por favor, instale o MkDocs antes de executar este script."
    exit 1
fi
pip freeze | sed 's/==.*//' > requirements.txt
if [ -f requirements.txt ]; then
    echo "Arquivo requirements.txt gerado com sucesso."
else
    echo "Erro ao gerar o arquivo requirements.txt."
    exit 1
fi
