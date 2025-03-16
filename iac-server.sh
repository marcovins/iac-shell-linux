#!/bin/bash

# Ativar modo de falha em caso de erro
set -e

# Definir variáveis
REPO_URL="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"
TEMP_DIR="/tmp"
WEB_DIR="/var/www/html"
ZIP_FILE="$TEMP_DIR/main.zip"
EXTRACT_DIR="$TEMP_DIR/linux-site-dio-main"

echo "Atualizando servidor..."

# Atualizar repositórios e pacotes
apt-get update && apt-get upgrade -y
apt-get install apache2 unzip -y

echo "Baixando e copiando dependências do servidor..."

# Ir para o diretório temporário
cd $TEMP_DIR

# Baixar o arquivo .zip
if wget $REPO_URL -O $ZIP_FILE; then
  echo "Arquivo baixado com sucesso."
else
  echo "Erro ao baixar o arquivo. Saindo."
  exit 1
fi

# Descompactar o arquivo baixado
unzip $ZIP_FILE

# Verificar se a extração foi bem-sucedida
if [ ! -d "$EXTRACT_DIR" ]; then
  echo "Erro ao extrair o arquivo. O diretório não foi encontrado."
  exit 1
fi

# Copiar os arquivos extraídos para o diretório do Apache
cp -R $EXTRACT_DIR/* $WEB_DIR/

# Limpar arquivos temporários
rm -rf $ZIP_FILE $EXTRACT_DIR

echo "Servidor configurado com sucesso!"
