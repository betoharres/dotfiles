if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'vim-scripts/tComment'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-expand-region'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'airblade/vim-gitgutter'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'sheerun/vim-polyglot'
  Plug 'mattn/emmet-vim'
  Plug 'dense-analysis/ale'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'matze/vim-move'
  Plug 'jiangmiao/auto-pairs'
  Plug 'luochen1990/rainbow'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-scripts/SingleCompile'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'Yggdroot/indentLine'
  Plug 'kadekillary/skull-vim'
  Plug 'logico/typewriter-vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'ruby-formatter/rufo-vim'
  Plug 'romgrk/doom-one.vim'
  Plug 'lunacookies/vim-colors-xcode'

  " golang debug
  Plug 'preservim/vimux'
  Plug 'sebdah/vim-delve'


  if filereadable(expand("~/.vimrc.bundles.linux"))
    source ~/.vimrc.bundles.linux
  endif

  if filereadable(expand("~/.vimrc.bundles.osx"))
    source ~/.vimrc.bundles.osx
  endif

call plug#end()

syntax on

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
set spelllang=en_us,pt_br
autocmd FileType gitcommit setlocal spell

set t_Co=256

set cursorline

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:\ \ ,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number relativenumber
set numberwidth=1

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Toggle identation in INSERT mode
set pastetoggle=<F2>

" Set line max leng; if you do gql for example vim will break the line at the
" white space before the last character at the 80 column.
setl tw=80

" jsx
let g:vim_jsx_pretty_highlight_close_tag = 1

" NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1
let NERDTreeStatusline=0
let NERDTreeAutoDeleteBuffer=1


" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_sizestyle = "h"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Emmet
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
\}

" Ale
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 'disabled'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver'],
\   'rust': ['rls'],
\   'go': ['gopls'],
\}
let g:ale_fixers = {
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\   'rust': ['rustfmt'],
\   'ruby': ['rubocop'],
\   'php': ['prettier'],
\}

" rufo ruby formatter
let g:rufo_auto_formatting = 1

" vim-go
let g:go_fmt_command = "golines"
let g:go_fmt_options = {
    \ 'golines': '-m 80',
    \ }
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" (golang) vim-delve & vimux
let g:delve_use_vimux=1

"Fzf key customization
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_tags_command = 'ctags -R .'

" https://github.com/Yggdroot/indentLine
let g:indentLine_color_term = 239

" gitgutter
set signcolumn=yes
set updatetime=100
let g:gitgutter_max_signs = 200

" tComment
" Disable new line with comment (if the current line is a comment)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Leader
let mapleader = "\<SPACE>"

" sql-language-server
let g:LanguageClient_serverCommands = {
    \ 'sql': ['sql-language-server', 'up', '--method', 'node-ipc'],
    \ }

"Fugitive
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>ga :Gwrite<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gv :Gvsplit<CR>

" Git Gutter
nmap <leader>sh <Plug>(GitGutterStageHunk)
nmap ]c :GitGutterNextHunk<CR>zz
nmap [c :GitGutterPrevHunk<CR>zz

" Ale
nmap <leader>d :ALENext<CR>
nmap <leader>D :ALEDetail<CR>
nmap <leader>u :ALEPrevious<CR>
nmap <leader>f :ALEFix<CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" Go to Normal mode
inoremap jk <esc>
inoremap jj <esc>

" Too old for this shit
noremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
vmap <leader>y "+y
nmap <leader>p "+P


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

" Mappings for moving lines and preserving indentation
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"switch panes
nmap , <C-W><C-W>

" Expand pane
nmap <leader>+ <C-w>_<C-w><bar>

" Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" fzf git
nmap <leader>C :Commits<cr>
nmap <leader>/ :History/<cr>
nmap <leader>: :History:<cr>

" Fzf + the_silver_searcher
nmap <leader>a :Ag<cr>

" fzf cmds
nmap <leader>c :Commands<cr>

" Move through panes
nnoremap <down> <C-w>+
nnoremap <up> <C-w>-
nnoremap <right> <C-w><
nnoremap <left> <C-w>>

" Tab navigation
nmap <leader><Tab> :tabnew<CR>
nmap <S-Tab> :tabprevious<CR>
nmap <Tab>  :tabnext<CR>

" Equalize panes
nmap <leader>= <C-w>=

" swap panes
nmap <leader>, <C-w><C-r>

" search and replace in visual mode
vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/g<left><left>

" Open fuzzy finder files(faster than ctrlP)
nmap <leader>j :GFiles --others --exclude-standard --cached<CR>

" emmet
inoremap <C-e>e <esc>:call emmet#expandAbbr(0,"")<cr>h:call emmet#splitJoinTag()<cr>wwi
nnoremap <C-e>e :call emmet#expandAbbr(0,"")<cr>h:call emmet#splitJoinTag()<cr>ww

" coc.vim
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! FormatToMax80()
  :g/\%>79v/norm 77|gql
endfunction
noremap <leader>gm :call FormatToMax80()<CR>

" Remove trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" NETRW - netrw
""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Vexplore with Ctrl-O
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()

        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile

            close
        endif

        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction

" Toggle Vexplore with Ctrl-O
function! ToggleLExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()

        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile

            close
        endif

        unlet t:expl_buf_num
    else
         Lexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""
" ////////////////////////////////////////////////
""""""""""""""""""""""""""""""""""""""""""""""""""

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

if filereadable(expand("~/.vimrc.linux"))
  autocmd VimEnter * source ~/.vimrc.linux
end

if filereadable(expand("~/.vimrc.osx"))
    autocmd VimEnter * source ~/.vimrc.osx
end

if filereadable(expand("~/.vimrc.local"))
    source ~/code/dotfiles/.vimrc.local
end

colorscheme skull
autocmd VimEnter * command! -bang -nargs=? GFiles call fzf#vim#gitfiles(<q-args>, {'options': '--no-preview'}, <bang>0)

" =============== TRASH =============== 

" let g:forest_night_disable_italic_comment = 1
" let g:everforest_background = 'hard'
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
" set bg=dark

" Enable true color
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

" yarn test
" nmap <leader>t :exec "!yarn test:watch " . expand('%:r')<CR>
" nmap <leader>T :exec "!yarn test:debug " . expand('%:r')<CR>

" rust
" nmap <leader>r :!clear<cr> \| :RustRun<cr>

" " prettier for PHP
" function PrettierPhpCursor()
"   let save_pos = getpos(".")
"   %! prettier --stdin --parser=php
"   call setpos('.', save_pos)
" endfunction
" " define custom command
" command PrettierPhp call PrettierPhpCursor()
" " format on save
" autocmd BufwritePre *.php PrettierPhp

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" sneak
" let g:sneak#s_next = 1
" nmap f <Plug>Sneak_f
" nmap F <Plug>Sneak_F

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-n>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>

" " UtilSnips
" let g:UltiSnipsExpandTrigger="<C-y>"
" let g:UltiSnipsJumpForwardTrigger="<C-l>"
" let g:UltiSnipsJumpBackwardTrigger="<C-\>"

" rust
" let g:rustfmt_autosave = 1
" let g:racer_experimental_completer = 1
" let g:ale_rust_rls_toolchain = 'stable'
" let g:ale_rust_cargo_use_clippy = 1
