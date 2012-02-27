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

set pastetoggle=<F2>

set wildmenu
set wildmode=list:longest
set wildignore+=*coverage*,*.pyc,*.o,*.obj,.git,*.beam,ebin/*,*.gem

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
"}}}

" GUI {{{
set guioptions=egmrt
set gfn=Monaco\ for\ Powerline:h12
"}}}

" File format {{{
set encoding=utf-8

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
"}}}

" Visibile {{{
set number
set cursorline

set colorcolumn=+1,+41

set list
set listchars=tab:>\ ,trail:-
set listchars+=extends:>,precedes:<
set listchars+=nbsp:+

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
noremap! jj <ESC>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

nnoremap <tab> %
vnoremap <tab> %

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

nnoremap <S-h> gt
nnoremap <S-l> gT
nnoremap <C-t> :tabnew<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
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
let g:NERDTreeDirArrows=0
nnoremap <leader>n :NERDTreeToggle<CR>
"}}}

" Tagbar {{{
nnoremap <leader>t :TagbarToggle<CR>
"}}}

" Powerline {{{
let g:Powerline_symbols="compatible"
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
let syntastic_enable_signs=1
"}}}

" Command-T and CtrlP {{{
if has('ruby')
" We've got Ruby, use Command T

" Conditional Mappings
  if has("gui_macvim")
    nnoremap <silent><D-t> :CommandT<CR>
  else
    nnoremap <silent><M-t> :CommandT<CR>
  endif

" Leader Commands
  nnoremap <leader>ff :CommandT<CR>
  nnoremap <leader>fu :CommandT %%<CR>
  let g:CommandTCancelMap=['<Esc>']
else
" Fallback on ctrlp.vim if Ruby for Command T not available

" Conditional Mappings
  if has("gui_macvim")
    let g:ctrlp_map = '<D-t>'
  else
    let g:ctrlp_map = '<M-t>'
  endif

" Leader Commands
  nnoremap <leader>ff :CtrlPRoot<CR>
endif

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:CommandTMaxHeight = 10

" Mapping from ctrlp we always use
if has('gui_macvim')
  nnoremap <silent><D-u> :CtrlPCurFile<CR>
  nnoremap <silent><D-y> :CtrlPMRUFiles<CR>
else
  nnoremap <silent><M-u> :CtrlPCurFile<CR>
  nnoremap <silent><M-y> :CtrlPMRUFiles<CR>
end
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
nnoremap <script> <silent> <leader>Q :call ToggleQuickfixList()<CR>
nnoremap <script> <silent> <leader>L :call ToggleLocationList()<CR>
"}}}

" Tabularize {{{
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
nnoremap <Leader>a, :Tabularize /,\zs<CR>
vnoremap <Leader>a, :Tabularize /,\zs<CR>
nnoremap <Leader>a> :Tabularize /=>\zs<CR>
vnoremap <Leader>a> :Tabularize /=>\zs<CR>
"}}}

" vim: foldmethod=marker
