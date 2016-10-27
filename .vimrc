set nocompatible
"set pathpgen path
runtime bundle/pathogen/autoload/pathogen.vim
"run pathogen
execute pathogen#infect() 

set background=dark
"set background=light
colorscheme solarized
"colorscheme molokai
"colorscheme phd

set guifont=YaHei\ Consolas\ Hybrid\ 14
set laststatus=2
"set cursorline
"set cursorcolumn

" 禁止光标闪烁
set gcr=a:block-blinkon0
" " 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" " 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

let g:Powerline_colorscheme='solarized256'

set nu
"set expandtab
set ts=4
set ss=4
set sw=4

filetype on
filetype plugin on
filetype indent on
syntax enable
syntax on

set incsearch
set hlsearch
set smartindent
set wildmenu

let mapleader=","

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

inoremap <leader>,  <esc>

nmap <C-l> <C-W>l
nmap <C-h> <C-W>h

vnoremap <leader>y "+y
nmap <leader>p "+p

set foldmethod=syntax
set nofoldenable

" 设置插件 indexer 调用 ctags 的参数
" " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

let tagbar_left=1
nnoremap <leader>tl :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_cpp={
	\ 'kinds':[
	\	'd:macros:1',
	\	'g:enums',
	\	't:typedefs:0:0',
	\	'e:enumerators:0:0',
	\	'n:namespaces',
	\	'c:classes',
	\	's:structs',
	\	'u:unions',
	\	'f:functions',
	\	'm:members:0:0',
	\	'v:global:0:0',
	\	'x:external:0:0',
	\	'l:local:0:0'
	\ ],
	\ 'sro':'::',
	\ 'kind2scope':{
	\	'g':'enum',
	\	'n':'namespace',
	\	'c':'class',
	\	's':'struct',
	\	'u':'union'
	 \ },
	 \ 'scope2kind':{
	 \	'enum':'g',
	 \	'namespace':'n',
	 \	'class':'c',
	 \	'struct':'s',
	 \	'union':'u'
	 \ }
 \ }

nnoremap <leader>sp :CtrlSF<CR>

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 只能是 #include 或已打开的文件
"nnoremap <leader>je :YcmCompleter GoToDefinition<CR>

let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_complete_in_comments=1
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <leader>fl :NERDTreeToggle<CR>
" " 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" " 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" " 显示隐藏文件
let NERDTreeShowHidden=0
" " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" " 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

