#!/bin/bash

DE="horacio.vasconcellos@gmail.com"
PARA="horacio.vasconcellos@gmail.com"
ASSUNTO="Assunto do e-mail"
CORPO="Corpo do e-mail"
ANEXO="backup.zip"

echo "$CORPO" | mailx "$DE" -s "$ASSUNTO" "$PARA"
