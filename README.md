
# 🐳 AWS DevContainer Setup for Amazonia + VSCode + Docker

This project provides a reproducible DevContainer setup for developing AWS-based applications using **Amazonia**, **VSCode**, and **Docker**. It enables AWS role-based access using `saml2aws` and runs all development tools within a Docker container configured via `.devcontainer`.

---

## 📦 Repository Structure

```
/
├── .devcontainer/
│   ├── devcontainer.json
│   └── Dockerfile
├── setup.sh         # Optional helper to install packages
├── README.md        # This file
```

---

## 🛠️ Prerequisites

Install the following tools before proceeding:

| Tool | Description | Install |
|------|-------------|---------|
| Homebrew | MacOS package manager | https://brew.sh |
| AWS CLI | AWS command line interface | `brew install awscli` |
| saml2aws | SAML-based AWS login tool | `brew install saml2aws` |
| Docker | Container runtime | https://www.docker.com/products/docker-desktop |
| VSCode | Development editor | https://code.visualstudio.com |
| Remote Containers Extension | VSCode extension | `ms-vscode-remote.remote-containers` |

---

## 🔐 AWS Authentication with Amazonia + saml2aws

Authenticate into AWS using:

```bash
saml2aws login --profile myawsprofile
awsro myawsprofile
```

This will update your `~/.aws/credentials` and `~/.aws/config` files, which will be mounted into the container.

---

## ⚙️ DevContainer Configuration

### `.devcontainer/devcontainer.json`

Key features:

- Mounts AWS credentials into the container.
- Sets environment variables for CLI access.
- Installs essential VSCode extensions.

```json
"mounts": [
  "source=${env:HOME}/.aws,target=/home/vscode/.aws,type=bind,consistency=cached"
],
"containerEnv": {
  "AWS_SHARED_CREDENTIALS_FILE": "/home/vscode/.aws/credentials",
  "AWS_CONFIG_FILE": "/home/vscode/.aws/config",
  "AWS_PROFILE": "${localEnv:AWS_PROFILE}",
  "AWS_DEFAULT_REGION": "${localEnv:AWS_DEFAULT_REGION}"
}
```

### `Dockerfile`

Installs required tools inside the container, such as:

- AWS CLI
- Python
- Terraform
- `jq`, `fzf`, `bat`, and more

```dockerfile
RUN apt-get update && apt-get install -y \
    awscli \
    unzip \
    zsh \
    curl \
    jq
```

---

## ▶️ How to Use

1. Open VSCode in this folder.
2. Run: `Dev Containers: Reopen in Container` from Command Palette.
3. Container will build and mount your AWS credentials.
4. Test with:

```bash
aws sts get-caller-identity
```

You should see your authenticated IAM identity.

---

## 📸 Example Screenshots

| Screenshot | Description |
|------------|-------------|
| `terminal_auth.png` | Terminal after `saml2aws login` |
| `vscode_container_open.png` | VSCode DevContainer running |
| `aws_cli_inside_devcontainer.png` | AWS CLI from inside container |

---

## 🔧 Maintenance

- **To update packages:** edit the `Dockerfile` and rebuild.
- **To change extensions:** edit `devcontainer.json`.
- **Primary author:** [Nick Beagley](https://github.com/nickbac3)

---

## 💡 Tips

- Use `awsro` or shell helpers to assume roles.
- Install `starship`, `bat`, `fzf` for enhanced terminal UX.
- Mount `.env`, `.aws`, or `.azure` secrets into the container for automation.

---

## 📘 References

- [saml2aws GitHub](https://github.com/Versent/saml2aws)
- [DevContainers Docs](https://containers.dev/)
- [Amazonia](https://github.com/Versent/amazonia)
