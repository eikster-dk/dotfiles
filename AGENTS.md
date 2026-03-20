# Dotfiles Repository

Personal dotfiles managed with GNU Stow. Each directory is a stow package that symlinks to `~/.config/` when activated.

## Quick Reference

```bash
stow -t ~ <package>     # Activate package
stow -t ~ -R <package>  # Restow (remove + recreate symlinks)
```

## Notes

- Stow symlinks to `~/.config/` - this repo IS the source of truth
- Omarchy reference: Use `.context/omarchy/` submodule for building on top of Omarchy
- Git: All commits signed with SSH via 1Password agent
- Update submodule: `git submodule update --remote .context/omarchy`
