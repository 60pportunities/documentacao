#!/bin/bash
#mike delete --all

LASTTAG=$(git describe --tags `git rev-list --tags --max-count=1`)

mike deploy --update-aliases "${LASTTAG}" latest
echo "PublicadaL: ${LASTTAG}"
