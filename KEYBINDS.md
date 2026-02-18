# Neovim IDE – Keybinds Reference

**Leader key:** `<Space>`

---

## Insert & Normal (fast)

| Key | Action |
|-----|--------|
| `jk` or `kj` (insert) | **Exit insert** (faster than Esc) |
| `Esc` (insert) | Exit insert and clear search highlight |
| `;;` (normal) | **Enter insert** at cursor |
| `''` (normal) | Enter insert **after** cursor |
| `<leader>Lc` | **Lazy clean** (remove unused/disabled plugins) |

---

## File & Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle **file explorer** (neo-tree) on the left |
| `<leader>E` | Focus file explorer |
| `<leader>eP` | **Pin** file tree open (show and keep visible) |
| `<leader>sf` | Search **files** (Telescope) |

**In file tree (neo-tree):** `a` = add file, **`A`** = add **directory**. `y` = copy, `p` = paste (duplicate: paste with new name). `c` = copy to path, `x` = cut, `r` = rename, `d` = delete.  
**Multi-select move:** `V` (or `v`) then `j`/`k` to select lines → **`x`** to cut (or **`y`** to copy) → go to destination folder → **`p`** to paste.

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
| `grd` | Go to **definition** (Telescope picker) |
| `grr` | Go to **references** |
| `gri` | Go to **implementation** |
| `grt` | Go to **type definition** |
| `grD` | Go to **declaration** (direct jump) |
| `K` | **Hover** — definition/signature in popup (cursor on symbol) |
| `gO` | **Document symbols** (current file) |
| `gW` | **Workspace symbols** |
| `grn` | **Rename** symbol |
| `gra` | **Code action** |
| `<leader>th` | Toggle **inlay hints** |
| `<leader>q` | Open **diagnostic quickfix** list |

---

## Completions & AI (Copilot)

**Official** (github/copilot.vim) only; copilot.lua is disabled.

| Key | Action |
|-----|--------|
| `Alt+J` (insert) | **Accept** suggestion |
| `Alt+]` (insert) | **Dismiss** suggestion |
| `Alt+\` (insert) | **Suggest** |
| **Copilot Chat** | |
| `<leader>cc` | Toggle **Copilot Chat** panel |
| `<leader>ce` | Copilot **Explain** (selection or code under cursor) |
| `<leader>cF` | Copilot **Fix** |
| `<leader>cR` | Copilot **Refactor** |
| `<leader>cG` | Copilot **Generate** — type an instruction, get code at cursor (then accept diff in chat) |
| `<leader>ci` | **Inline** — open chat with “add a function that …” prefilled (finish the sentence, submit, accept diff) |
| `<leader>cn` | **New** buffer (then use chat to generate and accept diff) |
| `Ctrl+S` (in chat) | **Submit** message in Copilot Chat |

*Run `:Copilot auth` to sign in. Use **`<leader>Lc`** once to run Lazy clean and remove the disabled copilot.lua plugin.*

---

## 99 (AI agent — cursor-agent)

[ThePrimeagen/99](https://github.com/ThePrimeagen/99): AI agent with **Cursor** backend. Requires `cursor-agent` CLI. In the prompt buffer use **`#`** for rules and **`@`** for file completion.

| Key | Action |
|-----|--------|
| `<leader>9v` (visual) | **Visual** — send selection + prompt |
| `<leader>99` | **Search** — open prompt (no selection) |
| `<leader>9s` | **Stop** all in-flight requests |
| `<leader>9l` | **Logs** — view last run |
| `<leader>9[` | **Prev** log |
| `<leader>9]` | **Next** log |
| `<leader>9i` | **Info** (rules, request count) |
| `<leader>9q` | **Quickfix** — request history |
| `<leader>9c` | **Clear** previous requests |
| `<leader>9m` | Clear **marks** |

*Model: provider default (sonnet-4.5). Completion in prompt: `source = "blink"`.*

### Inline: “write a function here” from an instruction

- **Generate at cursor:** Put the cursor where the function should go → **`<leader>cG`** → type your instruction (e.g. *“a function that converts Celsius to Fahrenheit”*) → **Ctrl+S** → in the chat window, **accept the diff** to insert the code into the file.
- **Chat with prefilled prompt:** **`<leader>ci`** opens Copilot Chat with *“#buffer At the cursor, add a function that ”* — finish the sentence, submit (**Ctrl+S**), then accept the diff to insert in the file.

### Create or edit files (Cursor-style)

1. **New file from scratch:** `<leader>cn` to open an empty buffer, then `<leader>cc` to open Copilot Chat. Type `@copilot` and ask e.g. *"Create a Python script that does X"*. When the model suggests an **edit** (create file), approve it to create/write the file.
2. **Apply code from chat:** In Copilot Chat, when the assistant shows a code block, use **`gd`** (in chat window) to show the diff, then **accept** the diff (see chat help with **`gh`**) to apply it to your buffer. **`gy`** yanks the nearest diff so you can paste elsewhere.
3. **Let the AI edit files:** In chat, type **`@copilot`** so the model can use tools (e.g. `edit` to create/change files). Ask e.g. *"Create src/foo.py with a hello function"* and approve the tool call when prompted.

---

## Outline / Symbols Sidebar

| Key | Action |
|-----|--------|
| `<leader>o` | Toggle **outline** (symbols) sidebar (aerial) |
| `[[` | Previous symbol |
| `]]` | Next symbol |

---

## Dropbar (breadcrumb at top)

| Key | Action |
|-----|--------|
| `<leader>;` | **Pick** symbol in winbar (jump to context) |
| `[;` | Go to **start** of current context |
| `];` | **Next** context |

*Click winbar components to open dropdowns; LSP/treesitter provide symbol context.*

---

## UI: Notifications & Animations

| Key | Action |
|-----|--------|
| `<leader>un` | **Dismiss** all notifications |

*Noice.nvim*: animated cmdline and message popups. *nvim-notify*: toast-style notifications. *mini.animate*: smooth cursor, scroll, resize, and window open/close.

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

## Terminal & Run

| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle **terminal** (float) |
| `<leader>tH` | Terminal **horizontal** split |
| `<leader>tv` | Terminal **vertical** split |
| `Ctrl+\` | Toggle terminal (float) |
| **`<leader>rr`** | **Run current file** (Python, Lua, Node, TS, Go, Rust, Ruby, shell) in floating terminal |
| `Esc Esc` (in terminal) | **Exit** terminal mode |

---


---

## Undo, Format & Lint

| Key | Action |
|-----|--------|
| `<leader>u` | Toggle **undo tree** (undotree) |
| `<leader>f` | **Format** buffer (Conform) |
| `<leader>xl` | Run **linter** (nvim-lint) |

**Auto format:** Conform formats on save (when a formatter is configured for the file type).  
**Linting:** Runs on save and when entering a buffer. Install linters via **`:Mason`** (e.g. ruff, eslint_d, jsonlint).

---

## Diagnostics / Errors & Warnings Pane (Trouble)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle **diagnostics** (all) |
| `<leader>xX` | Toggle **buffer diagnostics** (current buffer only) |
| `<leader>cs` | Toggle **symbols** (document symbols) |
| `<leader>cl` | Toggle **LSP** (definitions, references, implementations, …) |
| `<leader>xL` | Toggle **loclist** |
| `<leader>xQ` | Toggle **quickfix** list |

*In the Trouble pane: Enter/Tab to jump, q/Esc to close, j/k to move.*

---

## Markdown preview

Opening a `.md` file **renders it in-buffer** (headings, code blocks, tables, lists styled). Use the keys below to open a read-only preview split or toggle raw/rendered.

| Key | Action |
|-----|--------|
| `<leader>mv` | **Preview** — open rendered markdown in a side split (view only) |
| `<leader>mt` | **Toggle** — switch current buffer between rendered and raw markdown |

*Requires treesitter `markdown` and `markdown_inline` parsers (`:TSInstall markdown markdown_inline` if needed).*

---

## Spotify (macOS only)

**Current track** is shown on the **right side of the statusline** (when Spotify is running).

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

## File tabs (buffers) – VS Code style

The **top bar** shows one tab per open file. Switch between open files with:

| Key | Action |
|-----|--------|
| **`Ctrl+Tab`** | **Next** file (buffer) |
| **`Ctrl+Shift+Tab`** | **Previous** file (buffer) |
| `<leader>bn` | [B]uffer [N]ext |
| `<leader>bp` | [B]uffer [P]revious |
| `<leader>bc` | [B]uffer [C]lose current |
| `<leader>bC` | Close all **other** buffers |
| `<leader>b1` … `<leader>b5` | Go to **buffer 1–5** |

You can also **click** a tab in the top bar to switch to that file. Right-click a tab to close it.

---

## Tab pages (workspace tabs)

| Key | Action |
|-----|--------|
| `<leader>tn` | **New** tab page |
| `<leader>tc` | **Close** current tab page |
| `<leader>to` | **Only** this tab page (close others) |
| `Tab` | **Next** tab page |
| `Shift+Tab` | **Previous** tab page |
| `<leader>1` … `<leader>5` | Go to **tab page 1–5** |
| `<leader>0` | Go to **last** tab page |

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

### Change pane positions (move window)

| Key | Action |
|-----|--------|
| **`<leader>wH`** | Move **current pane** to far **left** (full height) |
| **`<leader>wJ`** | Move current pane to far **bottom** (full width) |
| **`<leader>wK`** | Move current pane to far **top** (full width) |
| **`<leader>wL`** | Move current pane to far **right** (full height) |
| **`<leader>wr`** | **Rotate** windows (current swaps with next) |
| **`<leader>wR`** | Rotate windows **backwards** |
| **`<leader>wx`** | **Exchange** current window with next |

*Focus the pane you want to move, then use the key above. Built-in: `Ctrl+w` then `H` / `J` / `K` / `L` does the same move.*

**Built-in:** Focus a pane, then `Ctrl+w` then `+` / `-` (height) or `>` / `<` (width). — `Esc` clears search highlight.

### Workspace / Session (save & restore layout per folder)

Sessions are **saved automatically** when you quit and **restored** when you open Neovim in the same folder. Layout (splits, tabs), open files, and cursor position are restored.

| Key | Action |
|-----|--------|
| `<leader>ws` | **Save** session (current folder) |
| `<leader>wl` | **Load** / restore session |
| `<leader>wf` | **Find** sessions (Telescope picker) |
| `<leader>wa` | **Toggle** auto-save on/off |

*Sessions are stored per directory; opening `nvim` in a project folder restores that project’s session.*

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
