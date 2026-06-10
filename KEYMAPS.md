# Neovim Keymaps and Commands

Leader key: `<Space>`

## Key Notation

| Notation   | Meaning                                                                          |
| ---------- | -------------------------------------------------------------------------------- |
| `<leader>` | Space bar (configured as the leader key)                                         |
| `<C-x>`    | Ctrl + x                                                                         |
| `<D-x>`    | Cmd + x (macOS). Only works in GUI clients like Neovide, not in terminal Neovim. |
| `<S-x>`    | Shift + x                                                                        |
| `<C-S-x>`  | Ctrl + Shift + x                                                                 |
| `<Esc>`    | Escape key                                                                       |
| `<CR>`     | Enter / Return key                                                               |
| `<Tab>`    | Tab key                                                                          |
| `<BS>`     | Backspace key                                                                    |
| n          | Normal mode                                                                      |
| i          | Insert mode                                                                      |
| v          | Visual mode                                                                      |
| x          | Visual + Select mode                                                             |
| t          | Terminal mode                                                                    |

## Commands

These are useful `:` commands configured directly or surfaced by mapped plugins.

| Command                                                               | Description                                                                                                    |
| --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `:FormatOnSave`                                                       | Toggle auto-formatting on save globally. This is the command currently configured for "toggle format on save". |
| `:ConformInfo`                                                        | Show conform.nvim formatter status and diagnostics.                                                            |
| `:LspInfo`                                                            | Show native LSP client info via `:checkhealth vim.lsp`.                                                        |
| `:LspRestart`                                                         | Restart LSP clients attached to the current buffer.                                                            |
| `:LspStop`                                                            | Stop LSP clients attached to the current buffer.                                                               |
| `:ToggleCursorAnimations`                                             | Toggle Neovide cursor animations.                                                                              |
| `:DiffviewOpen`                                                       | Open the Diffview panel for Git changes.                                                                       |
| `:DiffviewClose`                                                      | Close the current Diffview panel.                                                                              |
| `:Neotree reveal`                                                     | Reveal the current file in NeoTree.                                                                            |
| `:Neotree reveal toggle`                                              | Toggle NeoTree while revealing the current file.                                                               |
| `:Neotree focus`                                                      | Focus the NeoTree window.                                                                                      |
| `:ToggleTerm direction=float`                                         | Toggle the last-used floating terminal.                                                                        |
| `:1ToggleTerm direction=float` through `:5ToggleTerm direction=float` | Toggle floating terminal slots 1 through 5.                                                                    |
| `:RenderMarkdown toggle`                                              | Toggle rendered Markdown for the current buffer.                                                               |
| `:UfoInspect`                                                         | Inspect fold provider/status information from nvim-ufo.                                                        |
| `:Lazy`                                                               | Open the lazy.nvim plugin manager.                                                                             |

s adsag asd
| `:Lazy sync` | Install, clean, and restore plugins to match `lazy-lock.json` without choosing newer dependency versions. |
| `:Lazy update` | Update installed plugins through lazy.nvim. |

## General

| Keys        | Mode    | Description                 |
| ----------- | ------- | --------------------------- |
| `<Esc>`     | n       | Clear search highlights     |
| `jk`        | i       | Exit insert mode            |
| `kj`        | i       | Exit insert mode            |
| `<D-s>`     | n, i, v | Save file (Cmd+S, GUI only) |
| `<leader>w` | n       | Save file                   |

## Neovide (GUI only)

Active only when running inside Neovide (`vim.g.neovide` is set). They adjust `vim.g.neovide_scale_factor` so the font scales with the window.

| Keys    | Mode    | Description               |
| ------- | ------- | ------------------------- |
| `<D-k>` | n, i, v | Increase font size (×1.1) |
| `<D-j>` | n, i, v | Decrease font size (÷1.1) |
| `<D-0>` | n, i, v | Reset font size to 1.0    |

## Diagnostics

| Keys        | Mode | Description                   |
| ----------- | ---- | ----------------------------- |
| `<leader>q` | n    | Open diagnostic quickfix list |

## Terminal

| Keys         | Mode | Description                |
| ------------ | ---- | -------------------------- |
| `<Esc><Esc>` | t    | Exit terminal mode         |
| `<C-g>`      | t    | Exit terminal mode         |
| `jk`         | t    | Exit terminal mode         |
| `kj`         | t    | Exit terminal mode         |
| `<leader>tt` | n, t | Toggle floating terminal 1 |
| `<leader>t1` | n, t | Toggle floating terminal 1 |
| `<leader>t2` | n, t | Toggle floating terminal 2 |
| `<leader>t3` | n, t | Toggle floating terminal 3 |
| `<leader>t4` | n, t | Toggle floating terminal 4 |
| `<leader>t5` | n, t | Toggle floating terminal 5 |
| `<leader>tq` | n, t | Toggle last open terminal  |

Terminals are managed by **toggleterm.nvim**. Each numbered terminal is an independent shell session that persists across toggles. They open as floating windows.

## Window Navigation

| Keys    | Mode | Description                    |
| ------- | ---- | ------------------------------ |
| `<C-h>` | n    | Move focus to the left window  |
| `<C-l>` | n    | Move focus to the right window |
| `<C-j>` | n    | Move focus to the lower window |
| `<C-k>` | n    | Move focus to the upper window |

## Folding (nvim-ufo)

Treesitter provider when available, indent otherwise. Bare `z` fold keys (`za`, `zo`, `zR`, …) are disabled — use `<leader>z` instead. Non-fold `z` bindings (`zz`, `zt`, `zb`, etc.) are unchanged.

All standard vim fold commands (`zo`, `zO`, `zc`, `zC`, `za`, `zA`, `zj`, `zk`, `zn`, `zN`, `zd`, `zD`, `zE`, `zf`, `zF`, `zv`, `zx`, `zX`) work as `<leader>z` + the same suffix (e.g. `<leader>zo`). Exception: `zi` (toggle foldenable) is mapped to `<leader>zI`.

| Keys         | Mode | Description                    |
| ------------ | ---- | ------------------------------ |
| `<leader>zR` | n    | Open all folds (ufo)           |
| `<leader>zM` | n    | Close all folds (ufo)          |
| `<leader>zr` | n    | Open folds except kinds (ufo)  |
| `<leader>zm` | n    | Close folds with level (ufo)   |
| `<leader>zp` | n    | Peek folded lines under cursor |
| `<leader>zi` | n    | `:UfoInspect`                  |

Peek window: `<C-b>`/`<C-f>` page, `<C-u>`/`<C-d>` half-page, `g`/`G` top/bottom, `q` close.

## Search (Telescope)

| Keys               | Mode | Description                                                |
| ------------------ | ---- | ---------------------------------------------------------- |
| `<leader>sh`       | n    | Search help tags                                           |
| `<leader>sk`       | n    | Search keymaps                                             |
| `<leader>sf`       | n    | Search files (includes hidden files)                       |
| `<leader>ss`       | n    | Search Telescope builtin pickers                           |
| `<leader>sw`       | n, v | Search for the word under the cursor (or visual selection) |
| `<leader>sg`       | n    | Live grep across the project                               |
| `<leader>sd`       | n    | Search diagnostics                                         |
| `<leader>sr`       | n    | Resume last Telescope search                               |
| `<leader>s.`       | n    | Search recent/old files                                    |
| `<leader>sc`       | n    | Search available commands                                  |
| `<leader><leader>` | n    | Find open buffers                                          |
| `<leader>/`        | n    | Fuzzy search in current buffer (dropdown)                  |
| `<leader>s/`       | n    | Live grep only in open files                               |
| `<leader>sn`       | n    | Search Neovim config files                                 |

### Telescope picker mappings (normal mode inside picker)

| Keys | Description                     |
| ---- | ------------------------------- |
| `t`  | Open result in a new tab        |
| `s`  | Open result in a vertical split |

## LSP (buffer-local, active when a language server attaches)

| Keys         | Mode | Description                                     |
| ------------ | ---- | ----------------------------------------------- |
| `grn`        | n    | Rename symbol under cursor                      |
| `gra`        | n, x | Open code actions menu                          |
| `grD`        | n    | Go to declaration (e.g. header in C)            |
| `grr`        | n    | Find all references (Telescope)                 |
| `gri`        | n    | Go to implementation (Telescope)                |
| `grd`        | n    | Go to definition (Telescope)                    |
| `grt`        | n    | Go to type definition (Telescope)               |
| `gO`         | n    | List document symbols (Telescope)               |
| `gW`         | n    | List workspace symbols (Telescope)              |
| `<leader>th` | n    | Toggle inlay hints (if supported by the server) |

## Formatting (conform.nvim)

| Keys        | Mode | Description                                                                                      |
| ----------- | ---- | ------------------------------------------------------------------------------------------------ |
| `<leader>f` | n, v | Format the current buffer. Falls back to LSP formatting if no dedicated formatter is configured. |

Files are also auto-formatted on save (except C/C++). Use `:FormatOnSave` to toggle that behavior.

## Git — Diffview

| Keys        | Mode | Description                                                            |
| ----------- | ---- | ---------------------------------------------------------------------- |
| `<leader>7` | n    | Toggle the Diffview panel (shows all uncommitted changes side-by-side) |

### Diffview file panel mappings (inside the file / file history panel)

| Keys        | Mode | Description                                                                                                                                                        |
| ----------- | ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `<leader>e` | n    | Jump back to the previous window (diff view) — overrides Diffview's default `focus_files` so `<leader>e` becomes a real toggle between the panel and the diff view |
| `s`         | x    | Stage / unstage selected entries                                                                                                                                   |
| `-`         | x    | Stage / unstage selected entries                                                                                                                                   |
| `X`         | x    | Restore selected entries                                                                                                                                           |

## Git — Hunks (gitsigns, buffer-local)

Navigation:

| Keys | Mode | Description                   |
| ---- | ---- | ----------------------------- |
| `]c` | n    | Jump to next changed hunk     |
| `[c` | n    | Jump to previous changed hunk |

Staging and resetting:

| Keys         | Mode | Description                     |
| ------------ | ---- | ------------------------------- |
| `<leader>hs` | n    | Stage the hunk under the cursor |
| `<leader>hs` | v    | Stage the selected lines        |
| `<leader>hr` | n    | Reset the hunk under the cursor |
| `<leader>hr` | v    | Reset the selected lines        |
| `<leader>hS` | n    | Stage the entire buffer         |
| `<leader>hu` | n    | Undo last stage hunk            |
| `<leader>hR` | n    | Reset the entire buffer         |

Inspecting:

| Keys         | Mode | Description                                            |
| ------------ | ---- | ------------------------------------------------------ |
| `<leader>hp` | n    | Preview the hunk in a floating window                  |
| `<leader>hb` | n    | Show git blame for the current line                    |
| `<leader>hd` | n    | Diff the current file against the index                |
| `<leader>hD` | n    | Diff the current file against the last commit (`HEAD`) |

Toggles:

| Keys         | Mode | Description                            |
| ------------ | ---- | -------------------------------------- |
| `<leader>tb` | n    | Toggle inline git blame on every line  |
| `<leader>tD` | n    | Toggle inline preview of deleted lines |

## File Explorer (NeoTree)

| Keys        | Mode | Description                                               |
| ----------- | ---- | --------------------------------------------------------- |
| `\`         | n    | Reveal the current file in NeoTree                        |
| `<leader>E` | n    | Toggle NeoTree (reveal + toggle)                          |
| `<leader>e` | n    | Focus NeoTree, or return to editor if already in the tree |

### NeoTree internal mappings (inside the tree window)

| Keys | Description                                         |
| ---- | --------------------------------------------------- |
| `\`  | Close NeoTree                                       |
| `s`  | Open file in a vertical split                       |
| `O`  | Open file but keep focus in the tree                |
| `Y`  | Copy the absolute file path to the system clipboard |

## Multi-Cursor (vim-visual-multi)

| Keys      | Mode | Description                                                                                        |
| --------- | ---- | -------------------------------------------------------------------------------------------------- |
| `<C-S-d>` | n    | Select the word under the cursor and add a virtual cursor; repeat to select additional occurrences |

## Markdown (render-markdown.nvim)

| Keys         | Mode | Description                                         |
| ------------ | ---- | --------------------------------------------------- |
| `<leader>tm` | n    | Toggle rendered Markdown view in the current buffer |

Markdown buffers render automatically in normal, command, and terminal modes. Insert and visual editing still show the raw Markdown text.

## Completion (blink.cmp, `super-tab` preset)

These mappings are active in insert/command mode when the completion menu is visible.

| Keys                | Description                                                    |
| ------------------- | -------------------------------------------------------------- |
| `<Tab>` / `<S-Tab>` | Accept completion or navigate snippet placeholders             |
| `<C-Space>`         | Manually trigger completion menu, or show docs if menu is open |
| `<C-n>` / `<C-p>`   | Select next / previous completion item                         |
| `<C-e>`             | Dismiss the completion menu                                    |
| `<C-k>`             | Toggle function signature help                                 |

## Autopairs (nvim-autopairs)

VSCode-style bracket and quote pairing. Behaves automatically on typing — no explicit normal-mode keymaps. Treesitter-aware, so pairs aren't inserted inside strings/comments where they'd be noisy.

| Keys                                        | Mode | Description                                                                                                                      |
| ------------------------------------------- | ---- | -------------------------------------------------------------------------------------------------------------------------------- |
| `(`, `[`, `{`, `"`, `'`, `` ` ``            | i    | Insert the opening character and its matching closer; cursor stays in the middle                                                 |
| Same closing char on top of an existing one | i    | Jump over the existing closer instead of duplicating it                                                                          |
| `<BS>` on an empty pair (e.g. `(\|)`)       | i    | Delete both the opening and closing characters                                                                                   |
| `<CR>` between a pair (e.g. `{\|}`)         | i    | Split into a properly-indented multi-line block                                                                                  |
| `<M-e>` (Alt+e)                             | i    | Fast-wrap: surround the next chunk with the chosen pair (then press a hint key like `$` for end-of-line, `q`/`w`/… for a target) |

Function-call brackets after completion (`foo` → `foo(\|)`) are inserted by blink.cmp's own `auto_brackets`, not by this plugin.

## Debug (DAP)

Go debugging is configured through `lua/kickstart/plugins/debug.lua` with `nvim-dap`, `nvim-dap-ui`, `mason-nvim-dap`, and `nvim-dap-go`. Mason installs the `delve` debug adapter automatically.

| Keys        | Mode | Description                                           |
| ----------- | ---- | ----------------------------------------------------- |
| `<F5>`      | n    | Start or continue the debug session                   |
| `<F1>`      | n    | Step into                                             |
| `<F2>`      | n    | Step over                                             |
| `<F3>`      | n    | Step out                                              |
| `<leader>b` | n    | Toggle breakpoint on the current line                 |
| `<leader>B` | n    | Set a conditional breakpoint (prompts for expression) |
| `<F7>`      | n    | Toggle the DAP UI panel                               |

## Which-Key Groups

These aren't keymaps themselves but named prefixes that show a popup menu when pressed:

| Prefix      | Description                              |
| ----------- | ---------------------------------------- |
| `<leader>s` | Search                                   |
| `<leader>t` | Toggle                                   |
| `<leader>h` | Git Hunk                                 |
| `<leader>z` | Folds (see [Folding](#folding-nvim-ufo)) |
| `gr`        | LSP Actions                              |
