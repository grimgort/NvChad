

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '²', "[[<C-\><C-n>]]CloseAll, opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<DOWN>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<UP>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd('autocmd FocusGained * checktime') --auto reload file if modified by another apps
vim.api.nvim_command('let g:vim_current_word#highlight_current_word = 0')
vim.api.nvim_command('let g:asyncrun_open = 8') -- alow to open quickfix list for asyncrun command automatically

vim.api.nvim_set_option("scrolloff",5)

-- vim.api.nvim_win_set_option(0,"foldenable")
vim.api.nvim_win_set_option(0,"foldmethod","expr")
vim.api.nvim_win_set_option(0,"foldlevel",20)
vim.api.nvim_win_set_option(0,"foldexpr","nvim_treesitter#foldexpr()")
-- vim.cmd("setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()")

-- vim.cmd('autocmd BufRead * "set foldmethod=expr"')

local result = vim.api.nvim_exec(
[[

 let g:term_buf = 0
  let g:term_win = 0
let g:history_win_id = []
function History_cursor_window()
  echomsg("history_cursor_window")
  "echomsg(g:saved_winnr_previous)
  let saved_winnr = win_getid()
    "echom(g:saved_winnr_previous)
  "if saved_winnr != g:saved_winnr_previous 
    "let g:saved_winnr_previous = saved_winnr
    "echom("saved_winnr")
    "echom(saved_winnr)
    "echom("saved_winnr_prev")
    "echom(g:saved_winnr_previous)
    call add(g:history_win_id,saved_winnr)
  "endif
    "let history_win_reverse = g:history_win_id
    "call reverse(history_win_reverse)
    "call len(history_win_id)
    let indice = 0
  for elem in g:history_win_id
    let indice += 1 
    "echom(indice)
      "echo(win_id2win(elem))
      echom("indoce")
      echom(indice)
    if win_id2win(g:history_win_id[-indice]) != 0 
      echo("g:history_win_id[-indice]")
      echo(g:history_win_id[-indice])
      "echom(elem)
      let toto = g:history_win_id[-indice]
      echom("toto")
      echom(toto)
      return toto
    endif
  endfor
endfunction

function Close_all()
  let nodelete = 0
  let list_file_to_delete= []
  let list_file_to_keep = ['.vimrc','vimrcWindows' ]
  if expand('%:e') !=# ''
    let nodelete = 1
  endif
  for word in list_file_to_delete
    if expand('%:e') ==# word || expand('%:t') ==# word
      let  nodelete = 0
      break
    endif
  endfor

  for word in list_file_to_keep
    if expand('%:e') ==# word || expand('%:t') ==# word
      let  nodelete = 1
      break
    endif
  endfor

  if nodelete !=# 1
    execute "bw"
  endif
endfunction
function! CloseWindo()
  "echomsg("closewindo")
  "let saved_winnr = winnr()
  "let saved_winnr = bufname()
  let saved_winnr = win_getid()
  "echom saved_winnr
  "call feedkeys("\<c-c>")
  "call feedkeys("\<c-c>")
  call feedkeys("\<esc>")
  call feedkeys("\<esc>")
 "execute 'normal("CTRL-\ CTRL-N")
  pclose
  helpclose
  ccl
  silent! :FloatermHide!<cr>
  "silent! :CocCommand explorer --quit 
  
  "cache le terminal
  if has('nvim')
    if win_gotoid(g:term_win)
      hide
      silent! :ToggleTermCloseAll<cr>
    endif
  endif
  silent! :ToggleTermCloseAll
  windo call Close_all()
  "exec "silent! saved_winnr . 'wincmd w'"
  "exec "silent! saved_winnr . 'bufload'"
  "exec "silent! saved_winnr . 'win_gotoid'"
  "let saved_winnr = History_cursor_window()
  "echom("saved_winnr")
  "echom(saved_winnr)
  "echo saved_winnr
  call win_gotoid(saved_winnr)
endfunction

silent! command! CloseAll call CloseWindo()
  set autoread
]],
true)

vim.api.nvim_command('set undofile')
local result = vim.api.nvim_exec(
[[


nnoremap << >>
nnoremap >> <<
vnoremap << >gv
vnoremap >> <gv
nnoremap dd "_dd
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap x "_x
vnoremap x "_x
nnoremap cc dd
nnoremap c d
vnoremap c d
noremap <Del> "_x

nnoremap <A-&> 1gt
nnoremap <A-é> 2gt
nnoremap <A-"> 3gt
nnoremap <A-'> 4gt
nnoremap <A-(> 5gt
nnoremap <A--> 6gt
nnoremap <A-è> 7gt
nnoremap <A-_> 8gt
nnoremap <A-ç> 9gt
nnoremap <A-à> 10gt

tnoremap <A-&> <C-\><C-n>1gt
tnoremap <A-é> <C-\><C-n>2gt
tnoremap <A-"> <C-\><C-n>3gt
tnoremap <A-'> <C-\><C-n>4gt
tnoremap <A-(> <C-\><C-n>5gt
tnoremap <A--> <C-\><C-n>6gt
tnoremap <A-è> <C-\><C-n>7gt
tnoremap <A-_> <C-\><C-n>8gt
tnoremap <A-ç> <C-\><C-n>9gt
tnoremap <A-à> <C-\><C-n>10gt


   vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>		"+gP
    map <S-Insert>		"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+


   tmap <C-V>		<C-\><C-n>"+gP
   tmap <S-Insert>		<C-\><C-n>"+gP


set swapfile
set shortmess+=A " disable warniong message with swapfile
if !isdirectory($HOME . "/.vim/.backup")
   call mkdir($HOME . "/.vim/.backup", "p", 0700)
endif
if !isdirectory($HOME . "/.vim/.undo")
   call mkdir($HOME . "/.vim/.undo", "p", 0700)
endif
if !isdirectory($HOME . "/.vim/.swp")
   call mkdir($HOME . "/.vim/.swp", "p", 0700)
endif

set undofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

]]
,
true)



