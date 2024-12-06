#!/bin/bash
#mike delete --all
set -x
git commit -m "<doc> Criação versão documentaca" --allow-empty
LASTTAG=$(git describe --tags `git rev-list --tags --max-count=1`)
mike deploy --update-aliases "${LASTTAG}" latest
#mike set-default --push latest --allow-empty
echo "Publicada: ${LASTTAG}"
