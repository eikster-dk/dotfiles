# Dotfiles Repository

Personal dotfiles managed with GNU Stow. Each directory is a stow package that symlinks to `~` when activated.

## Quick Reference

```bash
stow -t ~ <package>     # Activate package
stow -t ~ -R <package>  # Restow (remove + recreate symlinks)
```


## Notes

- Omarchy reference: Use `.context/omarchy/` submodule for building on top of Omarchy
- All commits signed with SSH (1Password agent)
- Git submodules: `git submodule update --remote .context/omarchy`
