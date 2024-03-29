vim.g.VM_mouse_mappings = 1
vim.g.resurrect_ignore_patterns = { "/.git/", "^fugitive://" }
vim.g.code_action_menu_show_details = false
vim.g.vista_default_executive = "nvim_lsp"
vim.g.asyncrun_open = 6 -- for AsyncTask

vim.g.chadtree_settings = {
  view = {
    width = 30,
  },
  keymap = { copy_relname = { "<c-c>" } },
}

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "<C-b>", api.node.open.vertical, opts("Open: Vertical Split"))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
})
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require("nvim-dap-virtual-text").setup()
require("trouble").setup({})
require("fidget").setup({ progress = {
  display = { render_limit = 1 },
} })

require("colorizer").setup()

require("telescope").load_extension("fzf")
require("telescope").load_extension("notify")
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-b>"] = "file_vsplit",
      },
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        width = 0.85,
      },
    },
  },
})

require("dapui").setup({
  controls = {
    enabled = false,
  },
})

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end

vim.g.code_action_menu_window_border = "single"

require("leap").add_default_mappings()

vim.keymap.del({ "x", "o" }, "x")
vim.keymap.del({ "x", "o" }, "X")

require("renamer").setup()

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-rust"),
  },
})

require("better_escape").setup()

require("catppuccin").setup({
  integrations = {
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = true,
    mason = true,
    neotest = true,
    dap = true,
    dap_ui = true,
    rainbow_delimiters = true,
    telescope = { enabled = true },
    illuminate = { enabled = true, lsp = false },
    dashboard = true,
  },
})

vim.cmd.colorscheme("catppuccin-macchiato")

require("telescope").load_extension("harpoon")
