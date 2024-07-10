# conda-auto-env.plugin.zsh

# Function to create a conda environment based on current directory name
conda_create_env() {
  local env_name=$(basename "$PWD")
  local packages=("$@")

  # Check if the environment already exists
  if conda env list | grep -q "^$env_name "; then
    echo "Environment '$env_name' already exists."
    read -q "REPLY?Do you want to recreate it? (y/n) "
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      conda env remove -n "$env_name" -y
      conda create -n "$env_name" "${packages[@]}" -y
      echo "Environment '$env_name' has been recreated."
    else
      echo "Keeping existing environment '$env_name'."
    fi
  else
    echo "Creating new conda environment: $env_name"
    conda create -n "$env_name" "${packages[@]}" -y
  fi
}

# Function to activate conda environment based on current directory name
conda_activate_env() {
  local env_name=$(basename "$PWD")
  
  if conda env list | grep -q "^$env_name "; then
    conda activate "$env_name"
    echo "Activated environment: $env_name"
  else
    echo "Environment '$env_name' does not exist. Use 'ccenv' to create it."
  fi
}

# Create aliases
alias ccenv='conda_create_env'
alias caenv='conda_activate_env'
