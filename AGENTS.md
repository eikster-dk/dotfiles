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

## Landing the Plane (Session Completion)

**When ending a work session**, you MUST complete ALL steps below. Work is NOT complete until `git push` succeeds.

**MANDATORY WORKFLOW:**

1. **File issues for remaining work** - Create issues for anything that needs follow-up
2. **Run quality gates** (if code changed) - Tests, linters, builds
3. **Update issue status** - Close finished work, update in-progress items
4. **PUSH TO REMOTE** - This is MANDATORY:
   ```bash
   git pull --rebase
   bd sync
   git push
   git status  # MUST show "up to date with origin"
   ```
5. **Clean up** - Clear stashes, prune remote branches
6. **Verify** - All changes committed AND pushed
7. **Hand off** - Provide context for next session

**CRITICAL RULES:**
- Work is NOT complete until `git push` succeeds
- NEVER stop before pushing - that leaves work stranded locally
- NEVER say "ready to push when you are" - YOU must push
- If push fails, resolve and retry until it succeeds
