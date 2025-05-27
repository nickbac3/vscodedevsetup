#!/bin/bash

# Navigate to your local project root
cd "$(dirname "$0")"

# Initialize a temporary Git repo
git init temp-devcontainer
cd temp-devcontainer

# Add the remote
git remote add -f origin https://github.com/nickbac3/vscodedevsetup.git

# Enable sparse checkout
git config core.sparseCheckout true
echo ".devcontainer/" >> .git/info/sparse-checkout

# Pull only the .devcontainer folder
git pull origin main  # or master, depending on the repo

# Move the folder to your project root
mv .devcontainer ../
cd ..
rm -rf temp-devcontainer

# Add .devcontainer to .gitignore if not already present
if ! grep -q ".devcontainer/" .gitignore; then
  echo ".devcontainer/" >> .gitignore
fi
