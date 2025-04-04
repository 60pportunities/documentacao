#!/bin/bash
REPO="horaciovasconcellos/estudo-actions"
DAYS_TO_CHECK=1
EMAIL_TO="horacio.vasconcellos@gmail.com"
EMAIL_SUBJECT="Relatório de Workflows Falhos - $(date +'%d/%m/%Y')"

if ! command -v gh &> /dev/null; then
    echo "Erro: GitHub CLI (gh) não está instalado."
    echo "Instale com: brew install gh  (macOS) ou sudo apt-get install gh (Linux)"
    exit 1
fi

gh auth status || gh auth login

REPORT_FILE=$(mktemp)
echo "📅 Relatório gerado em: $(date +'%d/%m/%Y %H:%M')" > $REPORT_FILE
echo "📦 Repositório: $REPO" >> $REPORT_FILE
echo "🔍 Período: últimos $DAYS_TO_CHECK dia(s)" >> $REPORT_FILE
echo "====================================" >> $REPORT_FILE

FAILED_WORKFLOWS=$(gh run list --repo $REPO --limit 100 --json conclusion,createdAt,databaseId,displayTitle,event,headBranch,status,url \
    --jq ".[] | select(.status == \"completed\") | select(.conclusion == \"failure\") | select(.createdAt > \"$(date -v-${DAYS_TO_CHECK}d +'%Y-%m-%d')\")")

if [ -z "$FAILED_WORKFLOWS" ]; then
    echo "✅ Nenhum workflow falho encontrado nos últimos $DAYS_TO_CHECK dia(s)." >> $REPORT_FILE
else
    echo "❌ Workflows com erro encontrados:" >> $REPORT_FILE
    echo "$FAILED_WORKFLOWS" | jq -r '[
        .createdAt,
        "| Titulo: \(.displayTitle)",
        "| Branch: \(.headBranch)",
        "| Evento: \(.event)",
        "| URL: \(.url)",
        "| ID: \(.databaseId)"
    ] | join("\n")' >> $REPORT_FILE
fi

TOTAL_FAILURES=$(echo "$FAILED_WORKFLOWS" | jq -s 'length')
TEXTO_ENVIADO=$(cat $REPORT_FILE)
echo "====================================" >> $REPORT_FILE
echo "📊 Total de workflows falhos: $TOTAL_FAILURES" >> $REPORT_FILE

swaks \
        --from horacio.vasconcellos@gmail.com \
        --to horacio.vasconcellos@gmail.com \
        --server smtp.gmail.com \
        --port 587 \
        --auth plain \
        --tls \
        --auth-user 'horacio.vasconcellos@gmail.com ' \
        --auth-isenha "pkbu hqzd dude oqcp" \
        --header '$EMAIL_SUBJECT' \
        --body "$TEXTO_ENVIADO"
