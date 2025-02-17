FROM mcr.microsoft.com/devcontainers/ruby:1-3.3-bookworm
LABEL maintainer="Oleksii Leonov <oleksii.leonov@syngenta.com>"

COPY scripts /home/vscode/initialization_scripts/
WORKDIR /home/vscode/poodi_virtual

RUN sudo chown -R vscode:vscode /home/vscode/initialization_scripts /home/vscode/poodi_virtual
