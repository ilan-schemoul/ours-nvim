local get_tab_folder = require("config/utils").get_tab_folder

local fr = { "&", "é", "\"", "'", "(", "-", "è", "_", "ç" }

local function add_keymap(modes, keys, cmd)
  for _, mode in ipairs(modes) do
    if mode == "t" then
      vim.keymap.set(mode, "," .. keys, cmd, { silent = true })
    elseif mode == "i" then
      vim.keymap.set(mode, keys, cmd, { silent = true })
    else
      vim.keymap.set(mode, "<leader>" .. keys, cmd, { silent = true })
    end
  end
end

-- Many mappings defined inside plugins (grep "keys =" to find those)

add_keymap({ "n" }, "[d", vim.diagnostic.goto_prev)
add_keymap({ "n" }, "]d", vim.diagnostic.goto_next)

add_keymap({ "n" }, "lD", vim.diagnostic.open_float)
add_keymap({ "n" }, "lh", vim.lsp.buf.hover)
add_keymap({ "n" }, "li", "<cmd>Telescope lsp_references<cr>")
add_keymap({ "n" }, "ld", "<cmd>Telescope lsp_definitions<cr>")
add_keymap({ "n" }, "lb", "<cmd>Telescope diagnostic<cr>")
add_keymap({ "n" }, "ls", "<cmd>Telescope lsp_workspace_symbols<cr>")
add_keymap({ "n" }, "lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
add_keymap({ "n" }, "ln", vim.lsp.buf.rename)
add_keymap({ "n" }, "la", vim.lsp.buf.code_action)
add_keymap({ "n" }, "lt", require("lsp_lines").toggle)

add_keymap({ "i" }, "<C-s>", vim.lsp.buf.signature_help)

add_keymap({ "n" }, "A", "<cmd>NodeAction<cr>")

add_keymap({ "n" }, "N", "<cmd>set invrelativenumber | set invnumber<cr>")

add_keymap({ "n" }, "q", _G.CloseWindowIfNotLast)
add_keymap({ "n" }, "Q", "<cmd>qa!<cr>")

add_keymap({ "n" }, "m", "<cmd>Mason<cr>")

add_keymap({ "n" }, "F", "<cmd>echo @%<cr>")

add_keymap({ "n" }, "u", "<cmd>Telescope undo<cr>")

add_keymap({ "n" }, "tt", "<cmd>Telescope<cr>")
add_keymap({ "n" }, "tg", "<cmd>Telescope live_grep<cr>")
add_keymap({ "n" }, "tr", "<cmd>Telescope resume<cr>")
add_keymap({ "n" }, "tz", "<cmd>Telescope buffers<cr>")
add_keymap({ "n" }, "tq", "<cmd>Telescope quickfix<cr>")

add_keymap({ "n" }, "tw", function()
  require("telescope-tabs").list_tabs({
    entry_formatter = function(tab_id, _, _, _, _)
      return get_tab_folder(tab_id)
    end,
    entry_ordinal = function(tab_id, _, _, _, _)
      return get_tab_folder(tab_id)
    end,
  })
end)
add_keymap({ "n" }, "t-", require("telescope-tabs").go_to_previous)

for i = 1, 9 do
  if os.getenv("KEYBOARD_FR") then
    add_keymap({ "n" }, "t" .. fr[i], "<cmd>" .. tostring(i) .. "tabn" .. "<cr>")
  end

  add_keymap({ "n" }, "t" .. tostring(i), "<cmd>" .. tostring(i) .. "tabn" .. "<cr>")
end

add_keymap({ "n" }, "tq", function() require("telescope.builtin").quickfix({
  trim_text = true,
  path_display = { "smart" }
}) end)

add_keymap({ "n" }, "pn", "<cmd>term<cr>")
add_keymap({ "n" }, "ph", "<cmd>vsplit | term<cr>")
add_keymap({ "n" }, "pj", "<cmd>belowright split | term<cr>")
add_keymap({ "n" }, "pk", "<cmd>topleft split | term<cr>")
add_keymap({ "n" }, "pl", "<cmd>botright vs | term<cr>")
add_keymap({ "n" }, "pr", "<cmd>SendToTerm !!<cr>")
add_keymap({ "n" }, "ps", "<cmd>SendToTerm<cr>")

add_keymap({ "n" }, "pp", "<cmd>put<cr>")
add_keymap({ "n" }, "pP", "<cmd>put!<cr>")

add_keymap({ "n" }, "tf", "<cmd>lua require('telescope-tabs').list_tabs()<cr>")
add_keymap({ "n" }, "tn", "<cmd>tabnew<cr>")
add_keymap({ "n" }, "tx", "<cmd>tabclose<cr>")
add_keymap({ "n" }, "tl", "<cmd>tabnext<cr>")
add_keymap({ "n" }, "th", "<cmd>tabprevious<cr>")
add_keymap({ "n" }, "tL", "<cmd>+tabmove<cr>")
add_keymap({ "n" }, "tH", "<cmd>-tabmove<cr>")

add_keymap({ "n" }, "vc", "<cmd>next ~/.config/nvim/init.lua<cr>")
add_keymap({ "n" }, "vp", "<cmd>next ~/.config/nvim/lua/plugins<cr>")
add_keymap({ "n" }, "vm", "<cmd>next ~/.config/nvim/lua/config/mappings.lua<cr>")
add_keymap({ "n" }, "vg", "<cmd>Telescope live_grep search_dirs=~/.config/nvim<cr>")
add_keymap({ "n" }, "vl", "<cmd>Telescope find_files search_dirs=~/.config/nvim<cr>")
add_keymap({ "n" }, "vt", "<cmd>e ~/nvim-main/todo.norg<cr>")
add_keymap({ "n" }, "vv", "<cmd>mapclear | source ~/.config/nvim/init.lua<cr>")

add_keymap({ "i" }, "jk", "<esc>")
vim.keymap.set({ "t" }, "jk", "<C-\\><C-N>", { silent = true })

add_keymap({ "n" }, "nm", "<cmd>e ~/notes/memory.norg<cr>")
add_keymap({ "n" }, "nM", "<cmd>botright 30vnew ~/notes/memory.norg | set invrelativenumber | set invnumber<cr>")
add_keymap({ "n" }, "nl", "<cmd>Telescope find_files search_dirs={'~/notes'} follow=true<cr>")
add_keymap({ "n" }, "ng", "<cmd>Telescope live_grep search_dirs={'~/notes'}<cr>")
add_keymap({ "n" }, "nn", _G.create_org_file)

add_keymap({ "n" }, "sc", "1z=")
add_keymap({ "n" }, "s=", "<cmd>CustomTelescopeSpellSuggest<cr>")
add_keymap({ "n" }, "sl", "<cmd>CustomTelescopeSpellSuggest<cr>")
add_keymap({ "n" }, "sr", "<cmd>spellr<cr>")
add_keymap({ "n" }, "sg", "zg")
add_keymap({ "n" }, "sw", "zw")
add_keymap({ "n" }, "sb", "zw")

-- See also ../plugins/gitsigns.lua
add_keymap({ "n" }, "gl", "<cmd>G log -50<cr>")
add_keymap({ "n" }, "gp", "<cmd>G push<cr>")
add_keymap({ "n" }, "gg", "<cmd>G pull<cr>")
add_keymap({ "n" }, "go", "<cmd>10split | 0Git<cr>")
add_keymap({ "n" }, "go", "<cmd>10split | 0Git<cr>")
add_keymap({ "n" }, "gq", require("config/gerrit-quickfix").load_interactive_input)

for _, key in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set({ "t", "n", "i" }, "<A-" .. key .. ">", "<C-\\><C-N><C-w>" .. key)

  -- Move window
  local upper = string.upper(key)
  vim.keymap.set({ "t", "n", "i" }, "<A-" .. upper .. ">", "<C-\\><C-N><C-w>" .. upper)
end

if os.getenv("KEYBOARD_FR") then
  for i = 1, 9 do
    -- WORKAROUND: use noremap instead of vim.keymap.set as otherwise motions
    -- such as d"j (d3j) does not work
    vim.cmd("noremap <silent> " .. fr[i] .. " " .. tostring(i))
    vim.cmd("noremap <silent> " .. tostring(i) .. fr[i])
    -- vim.keymap.set("n", fr[i], tostring(i), { remap = false, silent = true })
    -- vim.keymap.set("n", tostring(i), fr[i], { remap = false })
  end
end

vim.keymap.set("t", "<C-x>", "<c-\\><c-n><cmd>set scrollback=1 | sleep 100m | set scrollback=10000<cr>")

vim.cmd([[
  " Custom env variable
  if !empty($KEYBOARD_FR)
    nmap <silent> ù `
  endif

  noremap <C--> <C-^>
  tmap <C-^> <C-\><C-N><C-^>

  inoremap <C-k> <Up>
  inoremap <C-h> <Left>
  inoremap <C-l> <Right>
  inoremap <C-j> <Down>
]])