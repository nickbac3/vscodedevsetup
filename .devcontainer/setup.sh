#!/bin/bash

# # Ensure Oh My Zsh is sourced
# echo 'source ~/.oh-my-zsh/oh-my-zsh.sh' >> ~/.zshrc

# # Source Powerlevel10k theme if available
# if [ -f ~/.p10k.zsh ]; then
#   echo 'source ~/.p10k.zsh' >> ~/.zshrc
# fi

# Add helpful cloud CLI aliases
cat << 'EOF' >> ~/.zshrc

# AWS CLI shortcuts
alias awslogin='aws sso login'
alias awswhoami='aws sts get-caller-identity'

# Azure CLI shortcuts
alias azlogin='az login'
alias azwhoami='az account show'

EOF

# # Optional: Set Zsh as default shell for the user
# chsh -s $(which zsh) vscode

# echo "✅ Zsh, AWS, and Azure CLI environment configured."
