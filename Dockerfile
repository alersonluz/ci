FROM ubuntu:16.04

LABEL   alersonluz.github.com="Brasil IO" \
        ci.alersonluz.github.com="foo" \
        version="0.1" \
        description="Imagem do Brasil.io para executar os código de extração de dados." \
        maintainer="luiz@thenets.org"

# Libs, dependências do sistema
RUN apt-get update && \
    apt-get install make virtualenv -y 

# Dir do projeto
RUN mkdir -p /app/src
WORKDIR /app

# Copiar arquivos do projeto
ADD src /app/src
ADD Makefile /app

# Preparar projeto
RUN make install

# Comando principal
#/bin/sh -c "make run"
CMD [ "make", "run" ]
