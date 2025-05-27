FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu


# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive


# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    vim \
    bat \
    zsh \
    nodejs \
    npm \
    python3 \
    python3-pip \
    software-properties-common \
    gnupg \
    lsb-release \
    fonts-powerline \
    && apt-get clean

# Set Zsh as default shell
SHELL ["/bin/zsh", "-c"]

# Install Oh My Zsh
#SRUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
USER vscode

# Install Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
RUN echo 'source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
#RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
#RUN echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
USER root

RUN curl -o ./p10k.zsh https://raw.githubusercontent.com/nickbac3/vscodedevsetup/main/p10k.zsh
RUN cp ./p10k.zsh /home/vscode/.p10k.zsh
RUN cp ./p10k.zsh .p10k.zsh
RUN curl -o ./zshrc https://raw.githubusercontent.com/nickbac3/vscodedevsetup/main/zshrc
RUN cp ./zshrc /home/vscode/.zshrc
RUN cp ./zshrc .zshrc

RUN chown -R vscode:vscode /home/vscode/.oh-my-zsh /home/vscode/.zshrc /home/vscode/.p10k.zsh

RUN chsh -s $(which zsh) vscode


# Install AWS CLI v2

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
    && apt-get update && apt-get install -y unzip \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws


# Install Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install -y terraform

# Install AWS CDK
RUN npm install -g aws-cdk

# Installl Kubectl
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
    && chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl


# Clean up
RUN apt-get autoremove -y && apt-get clean


RUN ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime && \
    echo "Australia/Melbourne" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata



# Set working directory
WORKDIR /workspace

# Start Zsh shell
CMD ["zsh"]

