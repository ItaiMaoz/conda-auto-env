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

# Function to remove conda environment based on current directory name
conda_remove_env() {
  local env_name=$(basename "$PWD")

  if conda env list | grep -q "^$env_name "; then
    echo "Removing environment: $env_name"
    read -q "REPLY?Are you sure you want to remove this environment? (y/n) "
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      # Check if the environment is currently active
      if [[ "$CONDA_DEFAULT_ENV" == "$env_name" ]]; then
        echo "Deactivating environment '$env_name' before removal."
        conda deactivate
      fi
      conda env remove -n "$env_name" -y
      echo "Environment '$env_name' has been removed."
    else
      echo "Operation cancelled. Environment '$env_name' was not removed."
    fi
  else
    echo "Environment '$env_name' does not exist."
  fi
}

# Function to create and activate conda environment
conda_create_activate_env() {
  conda_create_env "$@"
  conda_activate_env
}

# Create aliases
alias ccenv='conda_create_env'
alias caenv='conda_activate_env'
alias crenv='conda_remove_env'
alias ccaenv='conda_create_activate_env'
