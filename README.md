
# VS Code Dev Setup for AC3 AWS Development

This repository provides a pre-configured development environment for AC3 developers working with AWS. It leverages **VS Code Dev Containers** to ensure a consistent and efficient setup across machines.

## Features

- 🐳 **Docker-based Dev Container** for isolated and reproducible development
- 🧰 Pre-installed tools and libraries for AWS or Azure development
- 🖥️ Custom **Zsh** shell with **Oh My Zsh**, **Powerlevel10k**, and useful aliases
- ⚙️ Configured `devcontainer.json` for seamless integration with VS Code
- 🧑‍💻 Ideal for AC3 developers working on cloud-native applications

## What's Included

- `Dockerfile`: Defines the base image and installs essential tools (AWS CLI, Terraform, etc.)
- `devcontainer.json`: VS Code configuration for the development container
- `.zshrc`: Custom Zsh configuration with plugins and aliases
- `.p10k.zsh`: Powerlevel10k theme configuration for a beautiful and informative terminal

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Remote - Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
