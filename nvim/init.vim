" vim: fdm=marker fmr={{{,}}} fdl=0 fen

set encoding=utf-8 " default character encoding

" Set leader keys before anything else
let mapleader      = " "
let maplocalleader = ","

filetype off

" Plugins install {{{
call plug#begin()

" Thank to the universe for Tim Pope {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch' " Syntax sugar for unix commands
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
"}}}

" Misc {{{
Plug 'kana/vim-smartinput' " To have automatic closed pairs like () or {}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'embear/vim-localvimrc'
"}}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
"}}}

" Language support {{{
Plug 'plasticboy/vim-markdown'
Plug 'noprompt/vim-yardoc'
Plug 'jgdavey/vim-blockle'
Plug 'sheerun/vim-polyglot'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'janko-m/vim-test'
"}}}

" Search {{{
Plug '/usr/local/opt/fzf' " Use locally instaled fzf from homebrew
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'brooth/far.vim'
"}}}

" Colors {{{
Plug 'jnurmine/Zenburn'
"}}}

call plug#end()
" }}}

" Config {{{

" Misc {{{

set relativenumber
set nowrap
set modeline

" Go to Normal mode fast
inoremap jj <ESC>
inoremap <ESC> <NOP>

" Colorscheme
let base16colorspace=256

set background=dark
colorscheme zenburn

" Show non visual chars
set listchars=trail:~,tab:▸\ ,eol:¬ " show special characters
set list

" To use the system clipboard (xclip)
set clipboard=unnamed,unnamedplus

" Folding
set foldmethod=syntax
set nofoldenable

" Show undo list
nnoremap <leader>u :GundoToggle<CR>

" Edit and reload vimrc
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Exit vim
nnoremap <silent><leader>qq :qall<CR>

" Write one or all open files
nnoremap <leader>fs :write<CR>
nnoremap <leader>fS :wall<CR>
nnoremap <leader>fo :edit<space>

" LocalVIMRC
let g:localvimrc_persistent=1

" Highlight all non ascii characters
syntax match nonascii "[^\x00-\xFF]"
highlight nonascii guibg=Red ctermbg=2

" Find any non ascii character
nnoremap <leader>na /[^\x00-\xFF]<CR>
"}}}

" Edit {{{

" Indention
set tabstop=2      " number of visual spaces per TAB.
set shiftwidth=2   " number of spaces to use for each step of (auto)indent.
set softtabstop=2  " number of spaces in tab when editing.
set shiftround     " round indent to multiple of 'shiftwidth'
set expandtab      " tabs are spaces
set smarttab
set autoindent
set copyindent
set smartindent

" Best options for changing text
set cpoptions+=$

" ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" Others
nnoremap <leader>, A,<ESC>
nnoremap <leader>; A;<ESC>

" Don't loose selection when shifting
xnoremap <  <gv
xnoremap >  >gv

"}}}

" Git {{{

" Add spell check to git commits
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Gcommit -n<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
" git log for current file
nnoremap <leader>gl :GV!<CR>
" git log for project
nnoremap <leader>gL :GV<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" signify (gutter for git)
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '!'
let g:signify_realtime = 1

"}}}

" Search {{{

" Search niceties
set inccommand=split

" Remove search highlithing
nnoremap <silent><leader>nh :nohlsearch<CR>

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_command_prefix = 'FZF'
nnoremap <leader>ff :FZFFiles<cr>
nnoremap <leader>fb :FZFBuffers<cr>

" grepper
let g:grepper = { 'tools': ['rg', 'ag', 'git'] }

nnoremap \\ :Grepper -noprompt -cword<CR>
nnoremap <leader>s :Grepper -query<SPACE>
"}}}

" Windows & tabs {{{

" Move between windows
nnoremap <silent><leader>wj :wincmd j<CR>
nnoremap <silent><leader>wk :wincmd k<CR>
nnoremap <silent><leader>wl :wincmd l<CR>
nnoremap <silent><leader>wh :wincmd h<CR>

" Move windows around
nnoremap <silent><leader>wJ :wincmd J<CR>
nnoremap <silent><leader>wK :wincmd K<CR>
nnoremap <silent><leader>wL :wincmd L<CR>
nnoremap <silent><leader>wH :wincmd H<CR>

" Split screens
nnoremap <silent><leader>wv :wincmd v<CR>
nnoremap <silent><leader>ws :wincmd s<CR>

" quick list and location list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

" Tabs management
nnoremap <leader><leader>t :tabnew<CR>
nnoremap <leader><TAB> gt
nnoremap <leader><S-TAB> gT

" Close window
nnoremap <silent><leader>cc :wincmd c<CR>
"}}}

" Nerdtree {{{
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore=[
      \ '_build$[[dir]]',
      \ 'doc$[[dir]]',
      \ 'deps$[[dir]]',
      \ 'elm-stuff$[[dir]]',
      \ 'node_modules$[[dir]]',
      \ 'tags$[[file]]',
      \ 'mix.lock$[[file]]',
      \ '\.bs\.js$[[file]]',
      \ '\.css[[file]]'
      \ ]

nnoremap <silent><leader><leader>f :NERDTreeToggle<CR>
nnoremap <silent><leader><leader>ff :NERDTreeFind<CR>

" configuration for netrw
let g:netrw_liststyle= 3

"}}}

" Projections {{{
let g:projectionist_heuristics = {
      \  "mix.exs": {
      \    "lib/*.ex": {
      \      "type": "lib",
      \      "alternate": "test/{}_test.exs"
      \    },
      \    "test/*_test.exs": {
      \      "type": "test",
      \      "alternate": "lib/{}.ex"
      \    },
      \    "mix.exs": {
      \      "type": "mix"
      \    },
      \    "config/config.exs": {
      \      "type": "config"
      \    }
      \  }
      \ }
"}}}

" Linting {{{

" Disable language server disgnostics
let g:LanguageClient_diagnosticsEnable=0

" ALE - Asynchronous Linting Engine
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_elm_make_use_global = 1
let g:ale_elm_format_use_global = 1

let g:ale_linters = {
      \ 'elixir': ['mix', 'elixir-ls'],
      \ 'ruby': ['rubocop', 'ruby'],
      \ 'typescript': ['tslint']
      \}

let g:ale_fixers = {
      \ 'elixir': ['mix_format'],
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier']
      \}

nnoremap <silent><leader>af :ALEFix<CR>
nnoremap <silent><leader>ad :ALEDetail<CR>
"}}}

" Tests {{{

" test-vim
let test#strategy="dispatch"

nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tr :TestLast<CR>
nnoremap <leader>to :Copen<CR>
"}}}

" Autocomplete {{{

" Improve the files autocomplete
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" Language client
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658'],
    \ 'elixir': ['elixir-ls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio']
    \ }
"}}}

" Change diff sign colors {{{
" This has to be after the general.vim loading since loading the colorscheme
" overwrites this... however I can't add it to the plugins.vim file and load
" that after the general.vim because the neomake autocommands for the colors
" need to be defined before loading the colorscheme :D cool, eh?

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=2
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=1
highlight DiffChange        cterm=bold ctermbg=none ctermfg=4

highlight SignifySignAdd    cterm=bold ctermbg=none ctermfg=2
highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=1
highlight SignifySignChange cterm=bold ctermbg=none ctermfg=4
"}}}

" Status line {{{
let g:airline_theme='deus'
let g:airline#extensions#ale#enabled = 1

" Don't display encoding unless it is unexpected
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Use abbreviations to display modes
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Disable showing hunks
let g:airline#extensions#hunks#enabled = 0

function! MyAirline()
  let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
endfunction
autocmd User AirlineAfterInit call MyAirline()
"}}}

" Backupfiles {{{
set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo/
set viminfo     ='100,n$HOME/.config/nvim/files/info/viminfo
"}}}

"}}}

" Language specific {{{

" Disable polyglot in favor of real language packs
" Polyglot is great but it doesn't activate all the functionalities for all
" languages in order to make it load fast.
let g:polyglot_disabled = ['markdown', 'javascript', 'jsx']

" Markdown {{{
let g:vim_markdown_folding_level = 2

autocmd FileType markdown call SetMarkdownOptions()

function! SetMarkdownOptions()
  setlocal textwidth=79
  setlocal spell spelllang=en_us
  setlocal noshiftround
endfunction
"}}}

" Ruby {{{
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
"}}}

" Elixir {{{

" ALE config
let g:ale_elixir_elixir_ls_release='/opt/elixir-ls'
let g:ale_elixir_elixir_ls_config= {
    \   'elixirLS': {
    \     'dialyzerEnabled': v:false,
    \   },
    \ }

autocmd FileType elixir call SetElixirOptions()

function! SetElixirOptions()
  setlocal formatprg=
  setlocal foldmethod=indent
endfunction
"}}}
"}}}

