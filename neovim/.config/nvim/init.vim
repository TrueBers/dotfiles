call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'jeffkreeftmeijer/vim-numbertoggle'	" Make switch between relative and absolute line number
Plug 'airblade/vim-gitgutter'                   " Shows a git diff in the sign column
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language Server Protocol

call plug#end()

" Prevent .pacnew files from editing
"autocmd BufRead *.pacnew set readonly

set expandtab
set shiftwidth=2				" 'tab' width
set number relativenumber			" Relative but current line number
set cursorline					" Highlight current line
set signcolumn=yes

set undofile

set path+=**                                    " fuzzy find

set spell spelllang=en,ru			" Test words here, привет, ошипка

set termguicolors				" TrueColor for terminals that support it
set background=dark

let g:netrw_liststyle = 3                       " netrw directory tree style
"let g:netrw_browse_split = 4                    " open files in a previous buffer
let g:netrw_winsize = 80                        " % size
let g:netrw_banner = 0                          " hide help banner
let g:netrw_altv = 1                            " default split goes to the right
"let g:netrw_preview = 1                         " open in Vertical Split on <cr>

let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
let g:gruvbox_italic=1
colorscheme gruvbox

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_check_on_open=1
let g:syntastic_cpp_compiler_options="-std=c++20 -Wall -Wextra"

let g:rustfmt_command = 'rustfmt +stable'
let g:rustfmt_autosave = 1

"
" Coc 
"
"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" Rename symbol
nmap <leader>rr <Plug>(coc-rename)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
