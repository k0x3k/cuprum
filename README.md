# copper

The Copper design language of the gl1tch estate, packaged for machines that
are not part of it. Warm hues, visible borders, no decoration that lies.

Everything here is **generated** — rendered from `universe.nix` by
`mech portable build --work-safe` and published as-is. Do not edit files in
this repo; changes land upstream and are re-published. The bundle contains
only presentation config and a tool list: no identity, no secrets, no
network topology.

## Install

```sh
git clone https://github.com/k0x3k/copper-theme && ./copper-theme/install.sh
```

Rerunning is safe: existing ghostty/starship configs are never overwritten —
the script installs the theme files beside them and prints the one line to
add. `./install.sh --tools` additionally installs the Brewfile (macOS).

## What you get

| Piece | What it does |
| --- | --- |
| `ghostty/` | Copper dark + light terminal themes and a reference config |
| `vscode/` | The Copper theme as an extension (`.vsix`, also on the marketplace as `gl1tch.copper-theme`) |
| `starship.toml` | Prompt in the same palette |
| `zsh/copper.zsh` | Shell colours (ls, completion, syntax highlighting) |
| `Brewfile` | The work-safe CLI tool set, optional |

Fonts are referenced but not distributed: Berkeley Mono is licensed
software; Sora and Symbols Nerd Font Mono install from any package manager.

## License

MIT — see [LICENSE](LICENSE). The palette is yours to use; attribution
appreciated, not required.
