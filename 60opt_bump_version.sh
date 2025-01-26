#!/bin/bash
#set -x
TITULO="Promover Objetos CEERP"
PROJETO_NOME="Documentação da APIs - 60PPORTUNITIES";
DIRDESTINO="`pwd`";
CHANGELOG="CHANGELOG.md";
TEMP_FILE="$(mktemp /tmp/gitlab.XXXXXX)"

git_mike() {
# para excluir qualquer documentação - mike delete --all
# mike deploy 1.0
# Faça uma alteração em docs/index.md e publique a primeira versão: mike deploy --push --update-aliases 0.1 latest
# Define a versão como Latest: mike set-default --push latest
# Agora, faça outra alteração e publique uma nova versão: mike deploy --push --update-aliases 0.2 latest
null;


}
git_bump() {
local dirgit="${DIRDESTINO}";
local titulo_tag="${PROJETO_NOME}";
local titulo_data="$(date +'%Y-%m-%d')"
local lista_tags=()
local lista_tags_keys=()
local dirorg=`pwd`
local work="";
local destino="${dirgit}/${CHANGELOG}";
echo "Destino: ${destino}"
touch ${TEMP_FILE}
local lasttag=$(cd $dirgit && git describe --tags `git rev-list --tags --max-count=1` && cd $dirorg)
work=$(cd $dirgit &&  git log --tags --simplify-by-decoration --date="short" --pretty="format:%h$%x09%ad$%x09%d"  >> ${TEMP_FILE} && cd $dirorg)
echo -e "\n" >>${TEMP_FILE}
while IFS=$'\t' read ref data tag; do
  tag="${tag# }"; tag="${tag//[()]/}"
  if [ -z "${tag}" ]; then
     break;
  fi
  echo "TAG = ${tag# }";
  tag="${tag#HEAD*, }"
  tag="${tag%%,*}"; tag="${tag#tag: }"
  lista_tags+=( "${tag}:${ref}:${data}" )
  lista_tags_keys+=( "${tag}" )
done < ${TEMP_FILE}
titulo="${titulo_tag} / ${titulo_data}"
titulo_trace=""
for i in $(seq ${#titulo}); do
    titulo_trace+="="
done
IFS=$OLDIFS
printf '\n%s\n%s\n' "$titulo" "$titulo_trace"               > $destino
printf '\n%s\n\n%s\n\n' "#Changelog" "$MENSAGEM_PADRAO"     >> $destino
lista_tags_keys_length="${#lista_tags_keys[@]}"
for (( i=0; i< "${lista_tags_keys_length}"; i++ )); do
    curr_tag="${lista_tags_keys[$i]}"
    prev_tag="${lista_tags_keys[$i+1]:-null}"
    data_tag=`echo ${lista_tags[$i]} | cut -d: -f3 | cut -d$ -f1`
    printf "\n%s\n" "## [ $curr_tag ] - $data_tag"         >> $destino
    if [[ ( -z "$prev_tag" || "$prev_tag" == "null" ) ]]; then
       work=$(cd $dirgit && git log  "$curr_tag" --graph --pretty=format:'**%h** -  %s %N %an - **(%aE)**'              > $TEMP_FILE && cd $dirorg)
    else
       work=$(cd $dirgit && git log  "$prev_tag".."$curr_tag" --graph --pretty=format:'**%h** -  %s %N %an - **(%aE)**' > $TEMP_FILE && cd $dirorg)
    fi
    contador=0
    while IFS='' read -r linharquivo || [[ -n "${linharquivo}" ]]; do
        ((contador++))
        printf "\n%s" "${linharquivo}"                    >> $destino
    done < "$TEMP_FILE"
    printf "\n"                                           >> $destino
done
work=$(cd $dirgit && git add --all && cd $dirorg)
#work=$(cd $dirgit && git commit -S --amend --no-edit && cd $dirorg)
work=$(cd $dirgit && git commit --amend && cd $dirorg)
}
TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
git_bump;
