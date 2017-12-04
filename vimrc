set nocompatible
autocmd BufWritePost $MYVIMRC source $MYVIMRC

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'Kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'sirver/ultisnips'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
Plugin 'DfrankUtil'
Plugin 'vimprj'
Plugin 'indexer.tar.gz'
"Plugin 'autocomplpop'
"Plugin 'omnicppcomplete'

Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

if !has("gui_running")
	set t_Co=256
endif

set background=dark
"set background=light
"colorscheme solarized
colorscheme molokai
"colorscheme phd

"set guifont=Monospace\ 12
set guifont=DejaVu\ Sans\ Mono\ 12
set laststatus=2
"set cursorline
"set cursorcolumn

" 禁止光标闪烁
set gcr=a:block-blinkon0
" " 禁止显示滚动�?
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" " 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

set nu
"set expandtab
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4

syntax enable
syntax on

set incsearch
set ignorecase smartcase
set hlsearch
set smartindent
set wildmenu

let mapleader=","

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>n :tn<CR>

inoremap <leader>,  <esc>

nmap <C-l> <C-W>l
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k

vnoremap <leader>y "+y
nmap <leader>p "+p

set foldmethod=syntax
set nofoldenable

" vim-fsswitch begin
nmap <silent> <leader>sw :FSHere<cr>
" vim-fsswitch begin

" airline  begin "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>
" airline  end"

"indexer begin
" 设置插件 indexer 调用 ctags 的参�?
" " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" " 默认 --fields=+iaS 不满�? YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
let g:indexer_disableCtagsWarning=1
"indexer end 

"tagbar begin
let tagbar_left=1
nnoremap <leader>tl :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
		\ 'kinds' : [
			\ 'c:classes:0:1',
			\ 'd:macros:0:1',
			\ 'e:enumerators:0:0', 
			\ 'f:functions:0:1',
			\ 'g:enumeration:0:1',
			\ 'l:local:0:1',
			\ 'm:members:0:1',
			\ 'n:namespaces:0:1',
			\ 'p:functions_prototypes:0:1',
			\ 's:structs:0:1',
			\ 't:typedefs:0:1',
			\ 'u:unions:0:1',
			\ 'v:global:0:1',
			\ 'x:external:0:1'
		\ ],
		\ 'sro'        : '::',
		\ 'kind2scope' : {
			\ 'g' : 'enum',
			\ 'n' : 'namespace',
			\ 'c' : 'class',
			\ 's' : 'struct',
			\ 'u' : 'union'
		\ },
		\ 'scope2kind' : {
			\ 'enum'      : 'g',
			\ 'namespace' : 'n',
			\ 'class'     : 'c',
			\ 'struct'    : 's',
			\ 'union'     : 'u'
		\ }
\ }
"tagbar end 

"ctrlsf begin
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>sp :CtrlSF<CR>
nnoremap <leader>sl :CtrlSFToggle<CR>
"ctrlsf end 

"UltiSnipsSnippet begin
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"UltiSnipsSnippet end 

"YCM begin
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 只能�? #include 或已打开的文�?
"nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_complete_in_comments=1
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
"YCM end

"NERDTree begin
" " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <leader>fl :NERDTreeToggle<CR>
" " 设置NERDTree子窗口宽�?
let NERDTreeWinSize=32
" " 设置NERDTree子窗口位�?
let NERDTreeWinPos="right"
" " 显示隐藏文件
let NERDTreeShowHidden=1
" " NERDTree 子窗口中不显示冗余帮助信�?
let NERDTreeMinimalUI=1
" " 删除文件时自动删除文件对�? buffer
let NERDTreeAutoDeleteBuffer=1
" autocmd VimEnter * NERDTree
"NERDTree end

" omnicomplete begin
set completeopt=menu,menuone  
let OmniCpp_MayCompleteDot=1    "打开  . 操作�?
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作�?
let OmniCpp_MayCompleteScope=1  "打开 :: 操作�?
let OmniCpp_NamespaceSearch=1   "打开命名空间
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_DefaultNamespace=["std"]  
let OmniCpp_ShowPrototypeInAbbr=1  "打开显示函数原型
let OmniCpp_SelectFirstItem = 2    "自动弹出时自动跳至第一�?
" omnicomplete end

" ctrlp begin
set wildignore+=*.swp,*.o,*.in,*.inf 
let g:ctrlp_by_filename=1
" ctrlp end 

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

