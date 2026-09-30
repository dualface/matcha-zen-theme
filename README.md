# Matcha Zen theme export

Colors come from the QuickTUI client terminal theme `matcha-zen`
(upstream: https://github.com/livlign/posh-palette, MIT; ANSI colors below
4.5:1 contrast were darkened).

| Target | File | Install |
| --- | --- | --- |
| Windows Terminal | `windows-terminal/matcha-zen.json` | `powershell -ExecutionPolicy Bypass -File .\install.ps1` |
| kitty (macOS / Linux) | `kitty/matcha-zen.conf` | `sh kitty/install.sh` |
| herdr | `herdr/matcha-zen.toml` | `sh herdr/install.sh` |

## Windows Terminal

`install.ps1` copies the JSON fragment to
`%LOCALAPPDATA%\Microsoft\Windows Terminal\Fragments\matcha-zen\`.
Restart Windows Terminal, then choose **Matcha Zen** under
Settings > Profile > Appearance > Color scheme, or set
`"colorScheme": "Matcha Zen"` on a profile or in `profiles.defaults`.
The fragment only adds the scheme; it does not switch any profile to it.

## kitty

`install.sh` copies the theme to `~/.config/kitty/themes/` and runs
`kitten themes --reload-in=all "Matcha Zen"`. The kitten writes
`current-theme.conf` and adds an `include` for it to `kitty.conf`.
Manual alternative: copy the file anywhere and add
`include /path/to/matcha-zen.conf` to `kitty.conf`.

## herdr

herdr has no named user themes and no config include. `install.sh` appends a
`[theme.custom]` table to `config.toml` (after making a backup) and reloads the
running server. It refuses to run when a `[theme.custom]` table already exists.
This themes herdr's own UI only; pane colors follow the host terminal, so
install the Windows Terminal or kitty theme as well.
