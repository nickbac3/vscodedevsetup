
# VS Code Dev Setup for AC3 AWS Development

This repository provides a pre-configured development environment for AC3 developers working with AWS. It leverages **VS Code Dev Containers** to ensure a consistent and efficient setup across machines. You can add this .devcontainer folder and it's content into the root of any code in vscode and open devcontainers to work within the terminal

## Features

- 🐳 **Docker-based Dev Container** for isolated and reproducible development
- 🧰 Pre-installed tools and libraries for AWS or Azure development
- 🖥️ Custom **Zsh** shell with **Oh My Zsh**, **Powerlevel10k**, and useful aliases
- ⚙️ Configured `devcontainer.json` for seamless integration with VS Code
- 🧑‍💻 Ideal for AC3 developers working on cloud development

## What's Included

- `Dockerfile`: Defines the base image and installs essential tools (AWS CLI, Terraform, etc.)
- `devcontainer.json`: VS Code configuration for the development container
- `.zshrc`: Custom Zsh configuration with plugins and aliases
- `.p10k.zsh`: Powerlevel10k theme configuration for a beautiful and informative terminal
- `aws`: Will mount your local .aws directory so you can authenticate from vscode container after you have awsro/rw on your machine locally 

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Remote - Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Installation

add the .devcontainer folder and it's contents to your local development folder root and open in vscode. Be sure to add `.devcontainer/` to your .gitignore file so you don't mess anyone else's configs up
