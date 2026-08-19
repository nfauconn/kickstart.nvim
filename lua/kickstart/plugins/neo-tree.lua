vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = 'main' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

require('neo-tree').setup {
  -- Default is "NC" (a special style meant to blend with 'winborder'). We want
  -- a visibly rounded border on every popup instead.
  popup_border_style = 'rounded',

  -- Default is false (case-sensitive sort). Sort file/folder names ignoring case.
  sort_case_insensitive = true,

  -- Default is { "terminal", "Trouble", "qf", "edgy" }.
  -- CAVEAT: "trouble" here is lowercase, but trouble.nvim's actual filetype is
  -- "Trouble" (capital T) -- so this entry silently matches nothing unless you
  -- fix the case. Harmless if you don't use trouble.nvim/edgy.nvim.
  open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },

  default_component_configs = {
    icon = {
      -- Default folder icons are different glyphs from these.
      folder_closed = '',
      folder_open = '',
      folder_empty = '', -- default uses a distinct "empty folder" glyph; we reuse the closed-folder icon instead
    },
    indent = {
      -- Default padding is 1 (one extra space before the indent guide). We want it flush.
      padding = 0,
      -- Default expander glyphs (for collapsed/expanded nested files) are different from these.
      expander_collapsed = '',
      expander_expanded = '',
    },
    modified = {
      -- Default is "[+] " (with a trailing space). We drop the trailing space.
      symbol = '[+]',
    },
    git_status = {
      -- All of these override neo-tree's default glyph set for git status symbols.
      symbols = {
        added = '',
        modified = '',
        deleted = '✖', -- happens to match the default already, kept for clarity
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
  },

  window = {
    -- Default is "left" (a sidebar). We float the tree instead.
    position = 'float',
    -- Not set by default (no border on the sidebar). Rounded border for the float.
    border = 'rounded',
    popup = {
      -- Not set by default; matches the outer window border.
      border = 'rounded',
    },
    mappings = {
      -- Default "<esc>" closes the preview/floating window ("cancel").
      -- We reuse it to revert an open preview instead.
      ['<esc>'] = 'revert_preview',
      -- Default has "s" = open_vsplit and no mapping on "v".
      -- We swap them: "s" = split, "v" = vsplit (more mnemonic).
      ['s'] = 'open_split',
      ['v'] = 'open_vsplit',
      -- Not mapped by default: expand every nested node at once.
      ['Z'] = 'expand_all_nodes',
      -- Default "a" (add file) prompts with show_path = "none" (just the bare name).
      -- We show the absolute path in the prompt instead.
      ['a'] = { 'add', config = { show_path = 'absolute' } },
    },
  },

  filesystem = {
    -- Default is "open_default": neo-tree hijacks netrw and auto-opens when you
    -- start nvim on a directory (`nvim .`). "disabled" stops that auto-open.
    hijack_netrw_behavior = 'disabled',
    filtered_items = {
      -- Default is false: filtered items are hidden entirely.
      -- true = show them, just dimmed/marked differently.
      visible = true,
      -- Default is true (dotfiles hidden). We want dotfiles visible.
      hide_dotfiles = false,
    },
    -- Default is false: use nvim autocmd-based change detection.
    -- true = use the OS-level file watcher instead (libuv).
    use_libuv_file_watcher = true,
    -- Default is { enabled = false, ... }: the tree doesn't track the active buffer.
    -- true = jump to and reveal whatever file is open in the current buffer.
    follow_current_file = { enabled = true },
    window = {
      fuzzy_finder_mappings = {
        -- Default fuzzy-finder navigation is <C-n>/<C-p> (emacs-style).
        -- We add vim-style j/k navigation instead.
        ['<C-j>'] = 'move_cursor_down',
        ['<C-k>'] = 'move_cursor_up',
      },
    },
  },

  buffers = {
    -- Default is false: buffers restored-but-unfocused from a session are hidden.
    -- true = show them anyway.
    show_unloaded = true,
  },

  git_status = {
    window = {
      -- Same float + rounded-border treatment as the main window above.
      position = 'float',
      border = 'rounded',
    },
  },
}
