set nocompatible
syntax on

set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype off
call pathogen#infect()
filetype plugin indent on
" set re=1
" Options
set exrc
set secure
set autoindent
set nosmartindent
set history=10000
set number
set showmatch
set incsearch
set hlsearch
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ignorecase smartcase
set cursorline
set nowrap
set noswapfile
set bs=2
set winwidth=90
set winminwidth=20

if &t_Co == 256
  colorscheme Tomorrow-Night
endif

" highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" treat hamlc as haml
au BufRead,BufNewFile *.hamlc set ft=haml

" Open NERDTree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set wildignore+=*.mp3,*.ogg,*.jpg,*.jpeg

" keymaps
nmap , \
nmap ; :
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>t :CtrlP<CR>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
imap <C-L> =>
imap <C-K> ->

function! Trim()
  exe "normal mz"
  %s/\s*$//
  exe "normal `z"
  exe "normal zz"
endfunction

command! -nargs=0 Trim :call Trim()
nnoremap <silent> <LocalLeader>rw :Trim<CR>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git', '.vimrc', '.DS_Store']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My customizations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

" Remember info about open buffers on close
set viminfo^=%

" Toggle paste mode
map <leader>pp :setlocal paste!<cr>

" Shortcuts to copy and paste from clipboard
map <LocalLeader>c :w !pbcopy<CR><CR>
map <LocalLeader>p :r !pbpaste<CR>
set mouse=a

" Tmux key bindings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" CtrlP

let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'

" Pry key binding
"
map <Leader>pry orequire 'pry'; binding.pry<ESC>

" Python code.
augroup python
    autocmd!
    autocmd BufRead,FileReadPre,BufNewFile      *.py,*.pyw setlocal filetype=python
    autocmd BufRead,FileReadPre,BufNewFile      pythonrc setlocal filetype=python
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup END

" Temporary mappings:
map <LocalLeader>h :!rspec<CR>

