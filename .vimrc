if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/tComment'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'terryma/vim-expand-region'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'rhysd/clever-f.vim'
  Plug 'mattn/emmet-vim'
  Plug 'SirVer/ultisnips'
  Plug 'betoharres/vim-react-es6-snippets'
  Plug 'w0rp/ale'
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-abolish'
  Plug 'tommcdo/vim-lion'
call plug#end()

syntax on
colorscheme onehalfdark

set t_Co=256
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Toggle identation in INSERT mode
set pastetoggle=<F2>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" airline
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#show_buffers = 0
let airline#extensions#tabline#tabs_label     = ''
let airline#extensions#tabline#show_splits    = 0

" NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let NERDTreeShowHidden = 1

" UtilSnips
let g:UltiSnipsExpandTrigger="<C-p>"
let g:UltiSnipsJumpForwardTrigger="<C-m>"
let g:UltiSnipsJumpBackwardTrigger="<C-g>"

" Emmet
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" Ale
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let b:ale_linters = ['eslint']
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"Fzf key customization
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.fzf-history'

" gitgutter
set signcolumn=yes
set updatetime=100
let g:gitgutter_max_signs = 100

" tComment
" Disable new line with comment (if the current line is a comment)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Leader
let mapleader = "\<SPACE>"

"Fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>ga :Gwrite<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gv :Gvsplit<CR>

" Git Gutter
nmap <Leader>sh <Plug>GitGutterStageHunk
nmap <Leader>rh <Plug>GitGutterRevertHunk

" easy motion keybinding
nmap m <Plug>(easymotion-prefix)
nmap <leader>f <Plug>(easymotion-prefix)s

" Ale
nmap <leader>d :ALENext<CR>
nmap <leader>u :ALEPrevious<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Go to Normal mode
inoremap jk <esc>
inoremap jj <esc>

" Too old for this shit
noremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
vmap <Leader>y "+y
nmap <Leader>p "+P


" Life saver
nnore ; :
vnore ; :
" no L $
" vno L $h
" no H _
nnoremap V vV

" Centering after searching word
nmap n nzz
nmap N Nzz

" Visual all content in the file
nmap gv ggVG$

" Move lines up and down
nno <C-K> ddkP
nno <C-J> ddp

nmap <leader>v :tabnew ~/.vimrc<cr>
nmap <leader>z :tabnew ~/.zshrc<cr>

"switch panes
nmap , <C-W><C-W>

" Expand pane
nmap <leader>+ <C-w>_<C-w><bar>

" Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" fzf git
nmap <leader>C :Commits<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>/ :Lines<cr>
" Fzf + the_silver_searcher
nmap <leader>a :Ag<cr>

" fzf cmds
nmap <leader>c :Commands<cr>

" Move through panes
nnoremap <up> <C-w>-
nnoremap <down> <C-w>+
nnoremap <left> <C-w><
nnoremap <right> <C-w>>

" Tab navigation
nmap <Leader><Tab> :tabnew<CR>
nmap <Leader>i :tabnew<CR>
nmap <S-Tab> :tabprevious<CR>
nmap <Tab>  :tabnext<CR>

" Equalize panes
nmap <leader>= <C-w>=

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeFind<CR>

" Open fuzzy finder files(faster than ctrlP)
nmap <leader>j :GFiles --others --exclude-standard --cached<CR>

" Remove trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>

if filereadable(expand("~/code/dotfiles/.vimrc.local"))
    source ~/code/dotfiles/.vimrc.local
end
