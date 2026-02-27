# dotfiles
My simplified dotfiles setup with stow.

## Usage

Since these dotfiles aren't located directly in `~`, you need to specify the target:

```bash
stow -t ~ <package>
```

For example:
```bash
stow -t ~ bin
stow -t ~ nvim
stow -t ~ git
```
