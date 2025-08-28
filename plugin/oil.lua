local border = vim.o.winborder

require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`) if true
  default_file_explorer = true,

  -- See :help oil.skip_confirm_for_simple_edits
  skip_confirm_for_simple_edits = true,

  -- See :help oil-columns
  columns = { -- Id is automatically added at the beginning, and name at the end
    "icon",
    "permissions",
    "size",
    --"mtime",
  },

  -- Send deleted files to the trash instead of permanently deleting them
  delete_to_trash = false, --  (:help oil-trash)

  -- Selecting a new/moved/renamed file will prompt you to save changes first
  prompt_save_on_select_new_entry = true, -- (:help prompt_save_on_select_new_entry)

  lsp_file_methods = {
    -- Enable or disable LSP file operations
    enabled = true,
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },

  -- Constrain the cursor to the editable parts of the oil buffer
  constrain_cursor = "editable", -- `false` to disable; "name" for file names

  -- Set to true to watch the filesystem for changes and reload oil
  watch_for_changes = false,
 
  -- Keymaps in oil buffer. See :help oil-actions to view all available actions
  keymaps = { --:
    -- | table of keymap options (e.g. { callback = func, desc = "", mode = "n" })
    -- | any value that `vim.keymap.set` accepts | string ("actions.<name>")
    ["<CR>"]   = { "actions.select" },
    ["<C-s>v"] = { "actions.select", opts = { vertical = true } },
    ["<C-s>h"] = { "actions.select", opts = { horizontal = true } },
    ["<C-s>t"] = { "actions.select", opts = { tab = true } },

    ["<C-h>"] = { "actions.toggle_hidden" },
    ["<C-p>"] = { "actions.preview", mode = "n" },
    ["<F5>"]  = { "actions.refresh", mode = "n" },

    ["<leader>q"] = { "actions.close",    mode = "n" },
    ["~"]         = { "actions.parent",   mode = "n" },
    ["=="]        = { "actions.cd",       mode = "n" },
    ["--"]        = { "actions.open_cwd", mode = "n" },

    ["gx"]  = { "actions.open_external" },
    ["gs"]  = { "actions.change_sort",  mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  use_default_keymaps = false, -- if false: use only explicitly defined keymaps

  view_options = {
    show_hidden = false,

    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      local dot    = name:match("^%.")    ~= nil
      local dotdot = name:match("^%.%.$") ~= nil
      return dot and not dotdot
    end,

    -- Sort file names with numbers in a more intuitive order for humans.
    natural_order = "fast", --: bool | "fast" (true but not for large directories)

    -- Sort
    case_insensitive = false,
    sort = { -- see :help oil-columns to see which columns are sortable
      { "type", "asc" }, -- order: "asc" or "desc"
      { "name", "asc" }, -- order: "asc" or "desc"
    },
  },

  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
 
  -- EXPERIMENTAL support for performing file operations with git
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)                return false end,
    mv  = function(src_path, dest_path) return false end,
    rm  = function(path)                return false end,
  },
 
  -- Configuration for the floating SSH window
  ssh = {
    border = border,
  },

  -- Configuration for the floating action confirmation window
  confirmation = {
    border = border,

    -- dim := integer (num chars) | float between 0 and 1 (%)
    width  = 20, --: optional dim (exact width of the window)
    height = 2,  --: optional dim (exact height of the window)
  },

  -- Configuration for the floating window in oil.open_float
  float = {
    border = border,

    -- dim := integer (num chars) | float between 0 and 1 (%)
    padding = 0.2 , --: dim, dim

    max_width  = 0.8,         --: [ dim, dim ], takes the lesser
    min_width  = { 40, 0.4 }, --: [ dim, dim ], takes the lesser
    max_height = 0.9,       --: [ dim, dim ], takes the lesser
    min_height = { 5, 0.1 },--: [ dim, dim ], takes the lesser

    preview_split = "auto", --: "auto", "left", "right", "above", "below".
  },
})
