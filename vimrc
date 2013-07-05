" Pathogen {{{
call pathogen#infect()
syntax on
filetype plugin indent on
"}}}

" General {{{
let mapleader = ","

set viminfo+=n~/.vim/viminfo

set autoread
set autowrite
au FocusLost * :wa

set title

set pastetoggle=<F2>

set wildmenu
set wildmode=list:longest
set wildignore+=*coverage*,*.pyc,*.o,*.obj,.git,*.beam,ebin/*,*.gem,*.class
set wildignore+=*.log

set tags=./tags,tags,~/tags

set backspace=indent,eol,start

set hidden

set directory=~/.vim/vimswp
set nobackup
set nowritebackup
set backupdir=~/.vim/vimbak
if version >= 703
    set undofile
    set undodir=~/.vim/vimundo
endif

if has("balloon_eval")
    set ballooneval
endif

set foldenable
set foldmethod=marker
set foldopen=block,hor,mark,percent,quickfix,tag

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd bufwritepost {.vimrc,vimrc} source %
autocmd BufNewFile,BufEnter * set formatoptions-=ro

command! W exec 'w !sudo tee % > /dev/null' | e!

set splitright
set splitbelow
"}}}

" Specific VIM settings per folder {{{
set exrc
set secure
"}}}

" GUI {{{
set guioptions=egmrt
set gfn=Monaco\ for\ Powerline:h12
"}}}

" File format {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,default,gbk,latin1

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set autoindent
set cindent
set smartindent

set wrap
set textwidth=79
autocmd FileType markdown setlocal textwidth=0
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
"}}}

" Visibile {{{
set number
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

if version >= 703
  set colorcolumn=+1,+41
  autocmd FileType markdown setlocal colorcolumn=0
endif

set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮

set scrolloff=3

set laststatus=2
"}}}

" Mouse {{{
set mouse=nv
set mousehide
set ttymouse=xterm2
set ttyfast
"}}}

" Search {{{
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap / /\v
vnoremap / /\v

nnoremap <leader><space> :noh<cr>
"}}}

" Mapping {{{
inoremap jj <ESC>
cnoremap jj <C-c>

inoremap <F1> <NOP>
nnoremap <F1> <NOP>
vnoremap <F1> <NOP>

nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>
nnoremap <LEFT> g<LEFT>
nnoremap <RIGHT> g<RIGHT>

inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>

nnoremap ; :
nnoremap ;; :!

" Conflict with
"nnoremap <tab> %
"vnoremap <tab> %

nnoremap <leader>ws :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> + <C-w>>
nnoremap <silent> _ <C-w><
nnoremap <silent> <C-=> <C-w>+
nnoremap <silent> <C--> <C-w>-
nnoremap <silent> <Leader>w= :wincmd =<CR>

nnoremap <S-h> gT
nnoremap <S-l> gt
nnoremap <C-t> :tabnew<CR>

nnoremap <leader>w :w<CR>

inoremap <C-a> <C-O><S-i>
inoremap <C-e> <End>
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>
inoremap <C-h> <BACKSPACE>
inoremap <C-d> <DELETE>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>
cnoremap <C-b> <LEFT>
cnoremap <C-f> <RIGHT>
cnoremap <C-h> <BACKSPACE>
cnoremap <C-d> <DELETE>

vnoremap < <gv
vnoremap > >gv

nnoremap <C-]> g<C-]>

nnoremap <Leader>fn :cn<CR>
nnoremap <Leader>fp :cp<CR>
"}}}

" Completion {{{
set completeopt-=preview
" close scratch preview when a selection is made
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"}}}

" Colorscheme {{{1
set background=dark

" Solarized {{{2
"let g:solarized_termcolors=256
"colorscheme solarized
"}}}2

" Inkpot {{{2
let g:inkpot_black_background = 0
colorscheme inkpot
"}}}2
"}}}1

" NERDTree {{{
let g:NERDTreeDirArrows=1
let g:NERDTreeChDirMode=2
nnoremap <leader>n :NERDTreeToggle<CR>
"}}}

" Tagbar {{{
nnoremap <leader>t :TagbarToggle<CR>

" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
"}}}

" NeoComplcache {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_select = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"}}}

" YankRing {{{
let g:yankring_history_dir = '$VIM'
"}}}

" Syntastic {{{
let g:syntastic_check_on_open=1
let g:syntastic_cpp_include_dirs = ['/opt/local/include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_c_include_dirs = ['/opt/local/include']
let g:syntastic_c_compiler = 'clang'
"}}}

" Command-T and CtrlP {{{
if has('ruby')
  let g:CommandTMaxHeight = 10

  nnoremap <leader>ff :CommandT<CR>
  nnoremap <leader>fu :CommandT %%<CR>
  nnoremap <leader>fb :CommandTBuffer<CR>
  let g:CommandTBackspaceMap=['<BS>', '<C-h>']
  let g:CommandTDeleteMap=['<Del>', '<C-d>']
  let g:CommandTCursorLeftMap=['<Left>', '<C-b>']
  let g:CommandTCursorRightMap=['<Right>', '<C-f>']
  let g:CommandTCancelMap=['<Esc>', '<C-c>']
else
  let g:ctrlp_max_height = 10

  nnoremap <leader>ff :CtrlPRoot<CR>
endif
"}}}

" Ruby {{{
let ruby_enable_balloons=0

autocmd FileType ruby,eruby setlocal ts=2 sts=2 sw=2

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
"}}}

" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"}}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"
" Use omni completion if module_name:something, for erlang:
" (by default, supertab uses . :: ->, but not a single :
function! SuperErlangContext()
    let exclusions = exists('g:SuperTabContextTextFileTypeExclusions') ?
        \ g:SuperTabContextTextFileTypeExclusions : []
    if index(exclusions, &ft) == -1
        let curline = getline('.')
        let cnum = col('.')
        let synname = synIDattr(synID(line('.'), cnum - 1, 1), 'name')
        if curline =~ '.*\(\w\|[\])]\)\(:\)\w*\%' . cnum . 'c' && synname !~ '\(String\|Comment\)'
            return "\<c-x>\<c-o>"
        endif
    endif
    " no return will result in the evaluation of the next
    " configured context
endfunction
autocmd FileType erlang let g:SuperTabCompletionContexts = ['SuperErlangContext', 's:ContextText']
"}}}

" Python {{{
autocmd FileType python let python_highlight_all=1
"}}}

" Gundo {{{
nnoremap <leader>ud :GundoToggle<CR>
"}}}

" Ack {{{
nnoremap <leader>a :Ack<space>
"}}}

" Fugitive {{{
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
nnoremap <leader>gb :Gblame<CR>
"}}}

" GitGrep {{{
nnoremap <leader>gr :GitGrep <C-R><C-W><CR>
"}}}

" Togglelist {{{
nnoremap <script> <silent> <leader>fw :call ToggleQuickfixList()<CR>
nnoremap <script> <silent> <leader>fl :call ToggleLocationList()<CR>
"}}}

" Tabularize {{{
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
nnoremap <Leader>a, :Tabularize /,<CR>
vnoremap <Leader>a, :Tabularize /,<CR>
nnoremap <Leader>a> :Tabularize /=><CR>
vnoremap <Leader>a> :Tabularize /=><CR>
"}}}

" MRU {{{
let MRU_File = $HOME . '/.vim/vim_mru_files'
"}}}

" FSwitch {{{
au BufEnter *.h let b:fswitchdst  = 'cpp,cc,c'
au BufEnter *.cc let b:fswitchdst  = 'h,hpp'
nnoremap <silent> <Leader>of :FSHere<cr>
nnoremap <silent> <Leader>ol :FSRight<cr>
nnoremap <silent> <Leader>oL :FSSplitRight<cr>
nnoremap <silent> <Leader>oh :FSLeft<cr>
nnoremap <silent> <Leader>oH :FSSplitLeft<cr>
nnoremap <silent> <Leader>ok :FSAbove<cr>
nnoremap <silent> <Leader>oK :FSSplitAbove<cr>
nnoremap <silent> <Leader>oj :FSBelow<cr>
nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>
"}}}

" Octopress {{{
autocmd BufNewFile,BufRead *.markdown set filetype=octopress
"}}}

" Splice{{{
let g:splice_initial_scrollbind_grid = 1
let g:splice_initial_scrollbind_loupe = 1
let g:splice_initial_scrollbind_compare = 1
let g:splice_initial_scrollbind_path = 1
"}}}

" Clang Completion{{{
let g:clang_auto_select = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
"let g:clang_snippets_engine = 'ultisnips'
"}}}

" Vitality{{{
let g:vitality_fix_focus = 0
"}}}

" C++ {{{
autocmd FileType c,cpp setlocal ts=2 sts=2 sw=2
"}}}

" NeoComplcache & Clang Complete {{{
let g:neocomplcache_force_overwrite_completefunc = 1
let g:clang_complete_auto = 1
"}}}

" cSyntaxAfter {{{
"autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,cc,h,hpp,javascript} call CSyntaxAfter()
"}}}

" TagHighlight {{{
if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['DoNotGenerateTagsIfPresent'] = 1
let g:TagHighlightSettings['OnlyGenerateTypesIfPresent'] = 1
autocmd BufWritePost * UpdateTypesFile
"}}}

" jedi-vim {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = "<leader>gg"
let g:jedi#get_definition_command = "<leader>gd"
let g:jedi#rename_command = "<leader>rr"
let g:jedi#related_names_command = "<leader>rn"
"}}}

" Powerline {{{
set rtp+=~/.vim/powerline/powerline/bindings/vim
"}}}

" UltiSnips {{{
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}

" vim: foldmethod=marker
