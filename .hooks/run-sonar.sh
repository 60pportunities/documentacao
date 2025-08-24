#!/bin/bash
echo "🔍 Executando SonarScanner..."

# Executa o sonar-scanner
sonar-scanner

status=$?

if [ $status -ne 0 ]; then
  echo "❌ SonarScanner encontrou problemas."
  exit 1
else
  echo "✅ SonarScanner finalizado com sucesso."
  exit 0
fi
