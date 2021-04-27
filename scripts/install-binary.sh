#!/bin/bash

# Shamelessly copied from https://github.com/databus23/helm-diff

version=$1

PROJECT_NAME="helm-mirror"
PROJECT_GH="openSUSE/$PROJECT_NAME"

: ${HELM_PLUGIN_PATH:="$(helm env --debug=false |grep HELM_PLUGINS|awk -F '=' '{print $2}'| sed -e 's/^"//' -e 's/"$//')/helm-mirror"}

cd $HELM_PLUGIN_PATH
make mirror
mv bin/helm-mirror bin/mirror