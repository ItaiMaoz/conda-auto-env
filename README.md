# Conda Auto Environment Plugin for Oh My Zsh

This Oh My Zsh plugin provides convenient aliases for managing Conda environments based on the current directory name.

## Features

- Create a Conda environment with the current directory name
- Activate a Conda environment matching the current directory name
- Remove a Conda environment matching the current directory name
- Create and activate a Conda environment in one command

## Installation

1. Navigate to your Oh My Zsh custom plugins directory:
   ```
   cd ~/.oh-my-zsh/custom/plugins
   ```

2. Clone this repository:
   ```
   git clone https://github.com/ItaiMaoz/conda-auto-env.git
   ```

3. Add the plugin to your Oh My Zsh configuration. Open your `~/.zshrc` file and add `conda-auto-env` to your plugins list:
   ```
   plugins=(... conda-auto-env)
   ```

4. Reload your shell configuration:
   ```
   source ~/.zshrc
   ```

## Usage

### Create a Conda environment

```
ccenv [packages...]
```
Creates a Conda environment with the current directory name. You can specify packages to install, including Python version.

Example:
```
ccenv python=3.11 numpy pandas
```

### Activate a Conda environment

```
caenv
```
Activates the Conda environment matching the current directory name.

### Remove a Conda environment

```
crenv
```
Removes the Conda environment matching the current directory name. If the environment is currently active, it will be deactivated before removal.

### Create and activate a Conda environment

```
ccaenv [packages...]
```
Creates a Conda environment with the current directory name and immediately activates it. You can specify packages to install, including Python version.

Example:
```
ccaenv python=3.11 numpy pandas
```

## Notes

- The plugin uses the current directory name as the Conda environment name.
- When creating or removing environments, the plugin will ask for confirmation if the environment already exists.
- The plugin will automatically deactivate an environment before removing it if it's currently active.

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or encounter any bugs.

## License

This project is licensed under the MIT License.
