" Useful others gF open file with line number (a.c:10)
" Mappings defined by plugins
" gA to see all bases for a number under the cursor cr{b/x/d/o} to change a
" number base

" toggle relativenumber + number. It shows on the left column the number
" of the current line and the relative number of lines aboves and below
map <silent> <leader>I :set invrelativenumber<cr>
map <silent> <leader>N :set invnumber<cr>

map <silent> <leader>E :lua require("lsp_lines").toggle()<cr>

" closes everything
map <silent> <leader>q :q<cr>
tmap <silent> <leader>q <C-\><C-o>:q<cr>
map <silent> <leader>Q :qa!<cr>
tmap <silent> <leader>Q <C-\><C-o>:qa!<cr>

map <silent> <leader>D :lua vim.diagnostic.open_float()<cr>
map <silent> <leader>h :lua vim.lsp.buf.hover()<cr>
map <silent> [d :lua vim.diagnostic.goto_prev()<cr>
map <silent> ]d :lua vim.diagnostic.goto_next()<cr>
" i for implementation
map <silent> <leader>i :Telescope lsp_references<cr>
map <silent> <leader>d :Telescope lsp_definitions<cr>
map <silent> <leader>sd :Telescope lsp_dynamic_workspace_symbols<cr>
map <silent> <leader>ss :Telescope lsp_workspace_symbols<cr>
map <silent> <leader>tr :Telescope resume<cr>
imap <silent> <C-s> <C-\><C-O>:lua vim.lsp.buf.signature_help()<cr>

map <silent> <leader>a :CodeActionMenu<cr>
map <silent> <leader>n :lua require('renamer').rename()<cr>

map <silent> <leader>/ :!g

" map <silent> <leader>G :GodotRunLast<cr>
" map <silent> <leader>R :GodotRunCurrent<cr>

map <silent> <leader>m :Mason<cr>

map <silent> <leader>T :Telescope<cr>
map <silent> <leader>z :Telescope buffers<cr>
map <silent> <leader>l :Telescope find_files<cr>
map <silent> <leader>G :Telescope grep_string<cr>
map <silent> <leader>g :Telescope live_grep_args<cr>
map <silent> <leader>ù :Telescope marks<cr>
map <silent> <leader>$ :Telescope oldfiles<cr>

tmap <silent> <leader>T <C-\><C-n>:Telescope<cr>
tmap <silent> <leader>z <C-\><C-n>:Telescope buffers<cr>
tmap <silent> <leader>l <C-\><C-n>:Telescope find_files<cr>
tmap <silent> <leader>g <C-\><C-n>:Telescope live_grep<cr>
tmap <silent> <leader>G <C-\><C-n>:Telescope grep_string<cr>
tmap <silent> <leader>ù <C-\><C-n>:Telescope marks<cr>
tmap <silent> <leader>$ <C-\><C-n>:Telescope oldfiles<cr>

map <silent> <leader>rr :Resurrect<cr>
tmap <silent> <leader>rr <C-\><C-n>:Resurrect<cr>
" Close buffer not window
" (https://superuser.com/questions/289285/how-to-close-buffer-without-closing-the-window)
map <silent> <leader>x :bp<bar>sp<bar>bn<bar>bd<CR>
tnoremap <silent> <leader>x <C-\><C-n>:bp<bar>sp<bar>bn<bar>bd<CR>

nmap <silent> <leader>vc :next ~/.config/nvim/init.lua<cr>
nmap <silent> <leader>vp :next ~/.config/nvim/lua/config/packages.lua<cr>
nmap <silent> <leader>vm :next ~/.config/nvim/lua/config/mappings.vim<cr>
nmap <silent> <leader>vr :next ~/.config/nvim/lua/config/packages-preferences.lua<cr><cr>
nmap <silent> <leader>vg :Telescope live_grep_args search_dirs=~/.config/nvim<cr>
nmap <silent> <leader>vl :Telescope find_files search_dirs=~/.config/nvim<cr>

nmap <silent> <leader>V :source $MYVIMRC <cr>
inoremap <silent> jk <esc>
tnoremap <silent> jk <C-\><C-N>
tnoremap <silent> ,: <C-\><C-N>:

map <silent> <leader>u :UndotreeToggle<cr>

"  b fo bugs
map <silent> <leader>b :TroubleToggle<cr>

map <silent> <leader>o :Vista!!<cr>

lua << EOF
function _G.create_org_file()
  local dirman = require('neorg').modules.get_module("core.dirman")
  local file = vim.fn.input("File : ", "", "file")

  dirman.create_file(file, "notes", {
      no_open  = false, -- open file after creation?
      force    = false, -- overwrite file if exists
  })
end
EOF

map <silent> <leader>yi :Neorg index<cr>
map <silent> <leader>yr :Neorg return<cr>
map <silent> <leader>ym :e ~/notes/memory.norg<cr>Ga
map <silent> <leader>yM :botright 30vnew ~/notes/memory.norg<cr>:set invrelativenumber<cr>:set invnumber<cr>GA
map <silent> <leader>yl :Telescope find_files search_dirs={"~/notes"}<cr>
map <silent> <leader>yg :Telescope live_grep_args search_dirs={"~/notes"}<cr>
map <silent> <leader>yn :call v:lua.create_org_file()<cr>

tmap <silent> <leader>yi <C-\><C-n>:Neorg index<cr>
tmap <silent> <leader>yr <C-\><C-n>:Neorg return<cr>
tmap <silent> <leader>ym <C-\><C-n>:e ~/notes/memory.norg<cr>Ga
tmap <silent> <leader>yM <C-\><C-n>:botright 30vnew ~/notes/memory.norg<cr>:set invrelativenumber<cr>:set invnumber<cr>GA
tmap <silent> <leader>yl <C-\><C-n>:Telescope find_files search_dirs={"~/notes"}<cr>
tmap <silent> <leader>yg <C-\><C-n>:Telescope live_grep search_dirs={"~/notes"}<cr>
tmap <silent> <leader>yn <C-\><C-n>:call v:lua.create_org_file()<cr>

noremap <silent> zc 1z=
map <silent> z= :CustomTelescopeSpellSuggest<cr>
map <silent> zl :CustomTelescopeSpellSuggest<cr>
map <silent> zr :spellr<cr>

map <leader>pp :term<cr>

" select recently paste content
nnoremap <silent> <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Custom env variable
if !empty($KEYBOARD_FR)
  noremap <silent> à 0
  noremap <silent> & 1
  noremap <silent> é 2
  noremap <silent> " 3
  noremap <silent> ' 4
  noremap <silent> ( 5
  noremap <silent> - 6
  noremap <silent> è 7
  noremap <silent> _ 8
  noremap <silent> ç 9

  noremap <silent> 0 à
  noremap <silent> 1 &
  noremap <silent> 2 é
  noremap <silent> 3 "
  noremap <silent> 4 '
  noremap <silent> 5 (
  noremap <silent> 6 -
  noremap <silent> 7 è
  noremap <silent> 8 _
  noremap <silent> 9 ç

  nmap <silent> ù `
  noremap <C--> <C-^> " Otherwise C-^ for alternate file
endif

inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>

map <silent> <leader>F :echo @%<cr>

map <leader>t& :tabn 1<cr>
map <leader>té :tabn 2<cr>
map <leader>t" :tabn 3<cr>
map <leader>t' :tabn 4<cr>
map <leader>t( :tabn 5<cr>
map <leader>t- :tabn 6<cr>
map <leader>tè :tabn 7<cr>

map <leader>t1 :tabn 1<cr>
map <leader>t2 :tabn 2<cr>
map <leader>t3 :tabn 3<cr>
map <leader>t4 :tabn 4<cr>
map <leader>t5 :tabn 5<cr>
map <leader>t6 :tabn 6<cr>
map <leader>t7 :tabn 7<cr>

map <leader>tn :tabnew<cr>
map <leader>tx :tabclose<cr>
map <leader>tà :tabnext<cr>
map <leader>t0 :tabnext<cr>
map <leader>tç :tabprevious<cr>
map <leader>t9 :tabprevious<cr>
map <leader>tl :+tabmove<cr>
map <leader>th :-tabmove<cr>

tmap <leader>t& <C-\><C-n>:tabn 1<cr>
tmap <leader>té <C-\><C-n>:tabn 2<cr>
tmap <leader>t" <C-\><C-n>:tabn 3<cr>
tmap <leader>t' <C-\><C-n>:tabn 4<cr>
tmap <leader>t( <C-\><C-n>:tabn 5<cr>
tmap <leader>t- <C-\><C-n>:tabn 6<cr>
tmap <leader>tè <C-\><C-n>:tabn 7<cr>

tmap <leader>t1 <C-\><C-n>:tabn 1<cr>
tmap <leader>t2 <C-\><C-n>:tabn 2<cr>
tmap <leader>t3 <C-\><C-n>:tabn 3<cr>
tmap <leader>t4 <C-\><C-n>:tabn 4<cr>
tmap <leader>t5 <C-\><C-n>:tabn 5<cr>
tmap <leader>t6 <C-\><C-n>:tabn 6<cr>
tmap <leader>t7 <C-\><C-n>:tabn 7<cr>

tmap <leader>tn <C-\><C-n>:tabnew<cr>
tmap <leader>tx <C-\><C-n>:tabclose<cr>
tmap <leader>tà <C-\><C-n>:tabnext<cr>
tmap <leader>t0 <C-\><C-n>:tabnext<cr>
tmap <leader>tç <C-\><C-n>:tabprevious<cr>
tmap <leader>t9 <C-\><C-n>:tabprevious<cr>
tmap <leader>tl <C-\><C-n>:+tabmove<cr>
tmap <leader>th <C-\><C-n>:-tabmove<cr>

" ------ alt instead of ctrl for moving windows
tnoremap <silent> <A-h> <C-\><C-N><C-w>h
tnoremap <silent> <A-j> <C-\><C-N><C-w>j
tnoremap <silent> <A-k> <C-\><C-N><C-w>k
tnoremap <silent> <A-l> <C-\><C-N><C-w>l

inoremap <silent> <A-h> <C-\><C-N><C-w>h
inoremap <silent> <A-j> <C-\><C-N><C-w>j
inoremap <silent> <A-k> <C-\><C-N><C-w>k
inoremap <silent> <A-l> <C-\><C-N><C-w>l

nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l

tnoremap <silent> <A-H> <C-\><C-N><C-w>H
tnoremap <silent> <A-J> <C-\><C-N><C-w>J
tnoremap <silent> <A-K> <C-\><C-N><C-w>k
tnoremap <silent> <A-L> <C-\><C-N><C-w>L

inoremap <silent> <A-H> <C-\><C-N><C-w>H
inoremap <silent> <A-J> <C-\><C-N><C-w>J 
inoremap <silent> <A-K> <C-\><C-N><C-w>K
inoremap <silent> <A-L> <C-\><C-N><C-w>L

nnoremap <silent> <A-H> <C-w>H
nnoremap <silent> <A-J> <C-w>J
nnoremap <silent> <A-K> <C-w>K
nnoremap <silent> <A-L> <C-w>L
" ----- end of window movement
