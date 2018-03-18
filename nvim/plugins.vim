" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = 'omnifunc'

" Ultisnips
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/snips'
let g:UltiSnipsSnippetDirectories = ["snips", "priv_snips", "UltiSnips" ]
let g:UltiSnipsEditSplit = "vertical"

" signify (gutter for git)
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '!'
let g:signify_realtime = 1

" Grepper tools preference
let g:grepper = { 'tools': ['rg', 'ag', 'git'] }

" Show those languages with syntax highliting inside Markdown
let g:vim_markdown_folding_level = 2

" neoterm
let g:neoterm_size = '15%'
let g:neoterm_autoinsert = 1

" vim-test
let g:test#strategy = "dispatch"
let g:test#runner_commands = ['RSpec', 'Mix']

" ALE - Asynchronous Linting Engine
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_elm_make_use_global = 1
let g:ale_elm_format_use_global = 1

let g:ale_linters = {
      \ 'elixir': ['credo'],
      \ 'elm': ['make'],
      \ 'ruby': ['rubocop', 'ruby'],
      \ 'vim': ['vimt'],
      \}

let g:ale_fixers = {
      \ 'elixir': ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'elm': ['format'],
      \ 'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace'],
      \}

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" elm-vim
let g:elm_format_autosave = 0

" Disable polyglot in favor of real language packs
" Polyglot is great but it doesn't activate all the functionalities for all
" languages in order to make it load fast.
let g:polyglot_disabled = ['elm', 'elixir', 'markdown']

" localvimrc
let g:localvimrc_persistent = 2

" Nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore=[
      \ '_build$[[dir]]',
      \ 'doc$[[dir]]',
      \ 'deps$[[dir]]',
      \ 'elm-stuff$[[dir]]',
      \ 'node_modules$[[dir]]',
      \ 'tags$[[file]]',
      \ 'mix.lock$[[file]]'
      \ ]

" tagbar config for elixir
