#!/bin/bash
set -e
function print_info() {
    echo -e "\e[36mINFO: ${1}\e[m"
}
for package in ${EXTRA_PACKAGES}
do
    apk add --no-cache "${package}"
done
if [ -n "${REQUIREMENTS}" ] && [ -f "${GITHUB_WORKSPACE}/${REQUIREMENTS}" ]; then
    pip install -r "${GITHUB_WORKSPACE}/${REQUIREMENTS}" --root-user-action=ignore
else
    REQUIREMENTS="${GITHUB_WORKSPACE}/requirements.txt"
    if [ -f "${REQUIREMENTS}" ]; then
        pip install -r "${REQUIREMENTS}" --root-user-action=ignore
    fi
fi
#CUSTOM_DOMAIN="60pportunities.com.br"
#if [ -n "${CUSTOM_DOMAIN}" ]; then
#    print_info "Setting custom domain for github pages"
#    echo "${CUSTOM_DOMAIN}" > "${GITHUB_WORKSPACE}/docs/CNAME"
#fi

if [ -n "${CONFIG_FILE}" ]; then
    print_info "Setting custom path for mkdocs config yml"
    export CONFIG_FILE="${GITHUB_WORKSPACE}/${CONFIG_FILE}"
else
    export CONFIG_FILE="${GITHUB_WORKSPACE}/mkdocs.yml"
fi
#if [ -n "${GITHUB_TOKEN}" ]; then
#    print_info "setup with GITHUB_TOKEN"
#    remote_repo="https://x-access-token:${GITHUB_TOKEN}@${GITHUB_DOMAIN:-"github.com"}/${GITHUB_REPOSITORY}.git"
#elif [ -n "${PERSONAL_TOKEN}" ]; then
#    print_info "setup with PERSONAL_TOKEN"
#    remote_repo="https://x-access-token:${PERSONAL_TOKEN}@${GITHUB_DOMAIN:-"github.com"}/${GITHUB_REPOSITORY}.git"
#else
#    print_info "no token found; linting"
#    exec -- mkdocs build --config-file "${CONFIG_FILE}"
#fi
# git config --global --add safe.directory "$GITHUB_WORKSPACE"
git config --global --add safe.directory /github/workspace
if ! git config --get user.name; then
    git config --global user.name "${GITHUB_ACTOR}"
fi
if ! git config --get user.email; then
    git config --global user.email "${GITHUB_ACTOR}@users.noreply.${GITHUB_DOMAIN:-"github.com"}"
fi
#git remote rm origin
#git remote add origin "${remote_repo}"
LASTTAG=$(git describe --tags "$(git rev-list --tags --max-count=1)")
mike deploy --update-aliases "${LASTTAG}" latest
mike set-default --push latest
echo "Publicada: ${LASTTAG}"
