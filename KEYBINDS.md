# Neovim IDE – Keybinds Reference

**Leader key:** `<Space>`

---

## File & Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle **file explorer** (neo-tree) on the left |
| `<leader>E` | Focus file explorer |
| `<leader>eP` | **Pin** file tree open (show and keep visible) |
| `<leader>sf` | Search **files** (Telescope) |
| `<leader>s.` | Search **recent files** |
| `<leader><leader>` | Find **open buffers** |
| `<leader>sn` | Search **Neovim config** files |

---

## Search & Go To

| Key | Action |
|-----|--------|
| `<leader>sh` | Search **help** tags |
| `<leader>sk` | Search **keymaps** |
| `<leader>sg` | **Live grep** (search in files) |
| `<leader>sw` | Search **current word** (normal/visual) |
| `<leader>s/` | Live grep in **open files** |
| `<leader>/` | **Fuzzy search** in current buffer |
| `<leader>ss` | Open Telescope **picker list** |
| `<leader>sd` | Search **diagnostics** |
| `<leader>sr` | **Resume** last Telescope search |
| `<leader>sc` | Search **commands** |

---

## LSP (Code Intelligence)

| Key | Action |
|-----|--------|
| `grd` | Go to **definition** |
| `grr` | Go to **references** |
| `gri` | Go to **implementation** |
| `grt` | Go to **type definition** |
| `grD` | Go to **declaration** |
| `gO` | **Document symbols** (current file) |
| `gW` | **Workspace symbols** |
| `grn` | **Rename** symbol |
| `gra` | **Code action** |
| `<leader>th` | Toggle **inlay hints** |
| `<leader>q` | Open **diagnostic quickfix** list |

---

## Completions & AI (Copilot)

| Key | Action |
|-----|--------|
| `Ctrl+J` (insert) | **Accept** Copilot suggestion |
| `Ctrl+]` (insert) | **Dismiss** Copilot suggestion |
| `Ctrl+\` (insert) | **Trigger** Copilot suggestion |
| `<leader>cc` | Toggle **Copilot Chat** panel |
| `<leader>ce` | Copilot **Explain** (selection or code under cursor) |
| `<leader>cF` | Copilot **Fix** |
| `<leader>cR` | Copilot **Refactor** |
| `<leader>cG` | Copilot **Generate** (code) |
| `Ctrl+S` (in chat) | **Submit** message in Copilot Chat |

*First time: run `:Copilot auth` to sign in to GitHub Copilot.*

---

## Outline / Symbols Sidebar

| Key | Action |
|-----|--------|
| `<leader>o` | Toggle **outline** (symbols) sidebar (aerial) |
| `[[` | Previous symbol |
| `]]` | Next symbol |

---

## Git

| Key | Action |
|-----|--------|
| `<leader>gd` | Open **diff view** (all changes) |
| `<leader>gD` | Close diff view |
| `<leader>gh` | **File history** (current file) |
| `<leader>gH` | **Project** file history |
| `]h` | Next **hunk** |
| `[h` | Previous **hunk** |
| `<leader>hs` | **Stage** hunk |
| `<leader>hr` | **Reset** hunk |
| `<leader>hp` | **Preview** hunk |
| `<leader>hb` | **Blame** line |

---

## Terminal

| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle **terminal** (float) |
| `<leader>tH` | Terminal **horizontal** split |
| `<leader>tv` | Terminal **vertical** split |
| `Ctrl+\` | Toggle terminal (float) |
| `Esc Esc` (in terminal) | **Exit** terminal mode |

---


---

## Undo, Format & Lint

| Key | Action |
|-----|--------|
| `<leader>u` | Toggle **undo tree** (undotree) |
| `<leader>f` | **Format** buffer (Conform) |
| `<leader>xl` | Run **linter** (nvim-lint) |

---

## Diagnostics / Errors & Warnings Pane (Trouble)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle **document diagnostics** (current buffer) |
| `<leader>xw` | Toggle **workspace diagnostics** |
| `<leader>xq` | Toggle **quickfix** list |
| `<leader>xL` | Toggle **loclist** |
| `<leader>xr` | Toggle **LSP references** |

*In the Trouble pane: Enter/Tab to jump, q/Esc to close, j/k to move.*

---

## Spotify (macOS only)

| Key | Action |
|-----|--------|
| `<leader>mp` | **Play / Pause** |
| `<leader>mn` | **Next** track |
| `<leader>mb` | **Previous** track |
| `<leader>mi` | **Show current song** (info) |
| `<leader>m+` | Volume **up** |
| `<leader>m-` | Volume **down** |
| `<leader>ms` | Toggle **shuffle** |
| `<leader>mr` | Toggle **repeat** |
| `<leader>mm` | Toggle **mute** |

*Requires Spotify app running on macOS. On Linux, use a playerctl-based plugin instead.*

---

## Debugger (DAP)

| Key | Action |
|-----|--------|
| `F5` | **Start / Continue** |
| `F9` | **Toggle breakpoint** |
| `F10` | **Step over** |
| `F11` | **Step into** |
| `F12` | **Step out** |
| `<leader>db` | Toggle **breakpoint** |
| `<leader>dB` | **Conditional** breakpoint |
| `<leader>dc` | **Continue** |
| `<leader>dq` | **Terminate** debug session |
| `<leader>du` | Toggle **debug UI** |

*Install debug adapters via `:Mason` (debugpy, codelldb, coreclr, java-debug-adapter).*

---

## Tabs

| Key | Action |
|-----|--------|
| `<leader>tn` | **New** tab |
| `<leader>tc` | **Close** current tab |
| `<leader>to` | **Only** this tab (close others) |
| `Tab` | **Next** tab |
| `Shift+Tab` | **Previous** tab |
| `<leader>1` … `<leader>5` | Go to **tab 1–5** |
| `<leader>0` | Go to **last** tab |

**Open a file in a new tab:** `:tabedit path/to/file` or `:tabe path/to/file`. From file tree (neo-tree): open the file, then drag it to the tab bar, or use `:tabe %` to duplicate current file in a new tab.

---

## Windows & UI

### Focus between panes (move cursor to another split)

| Key | Action |
|-----|--------|
| **`Ctrl+h`** | Focus **left** pane |
| **`Ctrl+j`** | Focus **down** pane |
| **`Ctrl+k`** | Focus **up** pane |
| **`Ctrl+l`** | Focus **right** pane |

### Resize panes

| Key | Action |
|-----|--------|
| **`<leader>+`** | Resize **wider** (focus the pane first, then Space then +) |
| **`<leader>-`** | Resize **narrower** (Space then -) |
| `<leader>w=` | **Equal** size all splits |

**Built-in:** Focus a pane, then `Ctrl+w` then `+` / `-` (height) or `>` / `<` (width). E.g. `Ctrl+w` `+` makes the current pane taller. — `Esc` clears search highlight.

### Quit Neovim entirely (close everything)

| Key | Action |
|-----|--------|
| **`<leader>qq`** | **Quit all** and exit (prompts if unsaved) |
| **`<leader>qQ`** | Quit all, **discard** unsaved and exit |
| **`<leader>qw`** | **Save all**, then quit all and exit |

Or type: `:qa` (quit all), `:qa!` (quit all discard), `:wqa` (save all and quit).

---

## Default panel sizes (change in config)

| Panel | File | Option |
|-------|------|--------|
| File tree (neo-tree) | `lua/plugins/neo-tree.lua` | `window.width = 35` |
| Terminal horizontal | `lua/plugins/toggleterm.lua` | `size=15` in keymap |
| Terminal vertical | `lua/plugins/toggleterm.lua` | `size=60` in keymap |
| Outline (aerial) | `lua/plugins/aerial.lua` | `layout.min_width = 28` |
| Copilot Chat | `lua/plugins/copilot.lua` | `window.width = 0.5` |

---

## Text Objects (mini.ai, mini.surround)

| Key | Action |
|-----|--------|
| `va)` / `vi)` | Select **around** / **inside** parentheses |
| `va'` / `vi'` | Select around / inside quotes |
| `saiw)` | **Surround** word with `()` |
| `sd'` | **Delete** surrounding quotes |
| `sr)'` | **Replace** `()` with `''` |

---

## Neo-tree (inside file explorer)

| Key | Action |
|-----|--------|
| `<Space>` | Toggle expand/collapse |
| `Enter` / `l` | Open (current window) |
| **`t`** | **Open in new tab** |
| `S` | Open in horizontal split |
| `s` | Open in vertical split |
| `h` | Close node / go up |
| `a` | Add file/dir |
| `d` | Delete |
| `r` | Rename |
| `y` | Copy to clipboard |
| `x` | Cut |
| `p` | Paste |
| `R` | Refresh |
| `?` | Help |

---

## Which-key

Press `<leader>` and wait briefly to see all **leader keybindings** grouped (Search, Toggle, Git Hunk, etc.).

---

*Config root: `~/.config/nvim/`. Plugin keymaps live in `lua/plugins/*.lua`.*
