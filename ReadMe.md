# dotfiles

Personal dotfiles and setup scripts to bootstrap a macOS development environment.

## Prerequisites

- macOS (this repository and `setup.sh` assume macOS and Homebrew).
- A POSIX shell (the included `setup.sh` uses `bash`).
- Internet access for installing Homebrew, oh-my-zsh, and cloning repositories.

If you prefer to manually install dependencies, ensure you have:

- Homebrew: https://brew.sh/
- Homebrew: [https://brew.sh/](https://brew.sh/)
- GNU Stow (the `setup.sh` expects `stow` to be available; it is included via the `Brewfile`).

## Quick start

1. Inspect the `setup.sh` script and the `brew/Brewfile` to confirm the packages and dotfiles that will be installed.

2. Make the bootstrap script executable (if needed) and run it:

```bash
chmod +x setup.sh
./setup.sh
```

On first run the script will:

- Install Homebrew if it is missing.
- Run `brew bundle --file=./brew/Brewfile` to install packages listed in `brew/Brewfile`.
- Install Oh My Zsh if it's not present at `~/.oh-my-zsh`.
- Clone the Tmux Plugin Manager into `~/.tmux/plugins/tpm` if missing.
- Run `stow` for each top-level config folder to create symlinks in your home directory.

## Customization

- Edit the `brew/Brewfile` to add/remove Homebrew packages.
- Adjust which directories are stowed by editing `setup.sh` or running `stow` manually for individual folders:

```bash
cd /path/to/dotfiles
stow nvim  # only link nvim config
```

- If you use a different shell or prefer not to install Oh My Zsh, remove or modify that section in `setup.sh`.

## Troubleshooting

- If `brew bundle` fails, run `brew update` and try again. You can also run `brew bundle --file=./brew/Brewfile --verbose` for more output.
- If `stow` can't find files or links fail, run `stow --adopt --target=$HOME <package>` to repair or inspect the specific package.
- If you already have existing config files, `stow` may refuse to overwrite them. Back up or remove the old files first.

## Contributing

This is a personal repository. Pull requests are welcome for improvements or bug fixes — open an issue or PR with a clear description.
