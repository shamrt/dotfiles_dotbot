# Dotfiles

Dotfile management using [Dotbot](https://github.com/anishathalye/dotbot).
Structure of this repository is strongly inspired by [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).

## Dependencies

- python3 (consider `pyenv`)
- git
- ruby
- node (npm)
- nvim / vim (depending of profile)

## Installation

```bash
~$ git clone --recursive https://github.com/shamrt/dotfiles_dotbot .dotfiles
```

For installing a predefined profile:

```bash
~/.dotfiles$ ./install-profile <profile> [<configs...>]
# see meta/profiles/ for available profiles
```

For installing single configurations:

```bash
~/.dotfiles$ ./install-standalone <configs...>
# see meta/configs/ for available configurations
```

You can run these installation commands safely multiple times, if you think that helps with better installation.

## License

This software is hereby released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE` for details.
