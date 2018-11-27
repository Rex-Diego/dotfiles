set nocompatible

" Vundle settings.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
"" ---> Add you favorate vundle plugins here.
Plugin 'gmarik/Vundle.vim'
Plugin 'violetcherry/vim-ncl'
"Plugin 'wkyo/vim-help-doc-zh'
Plugin 'bling/vim-airline'
"Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'ervandew/supertab'
Plugin 'easymotion/vim-easymotion'
Plugin 'anscoral/winmanager.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'godlygeek/tabular.git'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tomasr/molokai'
Plugin 'lyokha/vim-xkbswitch'
call vundle#end()
filetype plugin indent on
" ###############################################
"
" indent-guides setting
"" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
"" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
"" 色块宽度
"let g:indent_guides_guide_size=1
"{{{  判断操作系统 & 判断是终端还是 Gvim 
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux   = 1
let g:ismac     = 0
let g:iscygwin  = 0
" {{{  fold start get the os type
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
    let g:ismac     = 0
    let g:os_flag   = "windows"
elseif has("linux")
    let g:islinux = 1
    let g:ismac   = 0
    let g:os_flag = "linux"
elseif has("win32unix")
    let g:iscygwin = 1
    let g:ismac    = 0
    let g:os_flag  = "cygwin"
elseif has("mac")
    let g:ismac   = 1
    let g:os_flag = "mac"
endif " }}}  fold end 

if g:iswindows == 1 " {{{  fold start get os_flag
    let g:os_flag="windows"
elseif g:islinux == 1
    let g:os_flag="linux"
elseif g:iscygwin ==1
    let g:os_flag="cygwin"
elseif g:ismac == 1
    let g:os_flag="mac"
endif " }}}  fold end 
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
"}}}

" -----------------------------------------------------------------------------
" {{{ < Windows Gvim 默认配置> 做了一点修改
if (g:iswindows && g:isGUI)
    "source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/mswin.vim
    "behave mswin
    set diffexpr=MyDiff()

    function MyDiff() "{{{ function fold start
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction "}}} end function fold
endif
"}}}
" -----------------------------------------------------------------------------
" {{{   < Linux Gvim/Vim 默认配置> 做了一点修改
if g:islinux||g:ismac||g:iscygwin
    set hlsearch        "高亮搜索
    set incsearch       "在输入要搜索的文字时，实时匹配

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    if g:isGUI
        " Source a global configuration file if available
        if filereadable("/etc/vim/gvimrc.local")
            source /etc/vim/gvimrc.local
        endif
    else
        " This line should not be removed as it ensures that various options are
        " properly set to work with the Vim-related packages available in Debian.
        runtime! debian.vim

        " Vim5 and later versions support syntax highlighting. Uncommenting the next
        " line enables syntax highlighting by default.
        if has("syntax")
            syntax on
        endif

        "set t_Co=256                   " 在终端启用256色
        set backspace=2                " 设置退格键可用

        " Source a global configuration file if available
        if filereadable("/etc/vim/vimrc.local")
            source /etc/vim/vimrc.local
        endif
    endif
endif
"}}}
" -----------------------------------------------------------------------------
"{{{最大化设置
if(g:iswindows==1) "允许鼠标的使用
    "防止linux终端下无法拷贝
    if has('mouse')
        set mouse=a "可以在buffer的任何地方使用鼠标
        set selection=exclusive
        set selectmode=mouse,key
    endif
    au GUIEnter * simalt ~x "windows窗口最大化设置
endif

if(g:islinux==1||g:ismac==1||g:iscygwin==1) "允许鼠标的使用
    "set mouse=a "可以在buffer的任何地方使用鼠标
    set selection=exclusive
    "set selectmode=mouse,key
endif
"}}}
"=============================================================================="{{{
if g:isGUI==1 " {{{ gui setting  fold start 
    " 禁止光标闪烁
    set gcr=a:block-blinkon0
    "设置不显示下方的横向滚动条
    set guioptions-=b
    "关闭上侧工具栏
    set guioptions-=T
    set guioptions-=m
    "关闭右侧滚动条
    set guioptions-=r
    set guioptions-=R
    "关闭左侧滚动条
    set guioptions-=l
    set guioptions-=L
    if g:ismac==1
        set nofu " mac fullscreen
        set wrap
    endif
endif " }}}  gui setting fold end "}}}

" {{{  fold start vim basic setting
" 剪切板设置
set clipboard=unnamed
" 缩进线设置
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:¬
"set listchars=trail:.,extends:>,precedes:<,eol:¬
"设置不自动换行
set wrap lbr
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

noremap <F8> :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
" map zL zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl zl
" map zH zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh zh
map <C-H> <C-w>h
map <C-L> <C-w>l
map <C-J> <C-w>j
map <C-K> <C-w>k

set sidescroll=3
set sidescrolloff=10

" history文件中需要记录的行数
set history=100
"关闭兼容模式
set nocompatible
"模仿快捷键，如：Ctrl+c，Ctrl+V等等
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"gvim字体设置
if (g:iswindows==1) "  {{{  guifont setting fold start
    set guifont=DejaVu_Sans_Mono:h11:cANSI " windows 系统设置字体
elseif (g:islinux==1)
    set guifont=Mono\ 12  " linxu 系统设置字体
elseif (g:ismac==1)
    set guifont=Monaco:h12  " mac` 系统设置字体
endif " }}}  fold end
"设置模式行为首尾10行
set modelines=10
"gvim内部编码
set encoding=utf-8
"当前编辑的文件编码
set fileencoding=utf-8
"gvim打开支持的编码文件
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
"set langmenu=zh_CN
"let SLANG='zh_CN.UTF-8'
"解决consle输出乱码
language messages zh_CN.utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"设置终端编码为gvim内部编码encoding
let &termencoding=&encoding
"防止特殊符号无法正常显示
set ambiwidth=double
"缩进宽度为2个字符
set sw=4
"tab宽度为2个字符
set ts=4
set softtabstop=4
"编辑时将所有tab替换为空格
set expandtab
"按一次backspace就删除4个空格了
set smarttab
" 自动计算缩进
set shiftround
"不生成备份文件，如index.html~
set nobackup
set writebackup
" 当文件在外部被修改，自动更新该文件
set autoread
"配色方案为desert
"colo graywh
color molokai 
hi CursorLine term=BOLD cterm=BOLD ctermbg=black ctermfg=white"
" 总是显示状态栏
set laststatus=2
" 设置powerline状态栏主题风格
" let g:Powerline_colorscheme='solarized256'
 "let g:Powerline_symbols='fancy'
" let g:Powerline_symbols='unicode'
"开启自动缩进
set autoindent
"------------the contest below was added by fh at 2013.2.5.21:47-----------
"设置语法高亮
if has("syntax")
    syntax enable
    syntax on
endif
"高亮显示匹配的括号
set showmatch
set linebreak " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"打开文件类型自动检测
filetype on
filetype plugin on
"在状态栏显示光标所在位置的行号和列号
set ruler
if v:version>=704
    set rnu nu
else
    set rnu nonumber
endif
"设置静音模式
set noerrorbells
set novisualbell
set visualbell t_vb=
"--命令行设置-------------------------
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式
set showmatch
set matchtime=1

" scrooll smooth 
"map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
"map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
set scrolloff=3
"--fold setting--
set foldmethod=marker " 用marker来定义折叠
set foldlevel=1 " 启动vim时不要自动折叠代码
"set foldcolumn=5 " 设置折叠栏宽度
"--find setting----------------------
" 在搜索的时候忽略大小写
set ignorecase
" 不要高亮被搜索的句子（phrases）
set hlsearch
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
set ignorecase
set smartcase
set t_RV=
" reopening a file
if has("autocmd")
        au BufReadPost * 
        \if line("'\"") > 1 && line("'\"") <= line("$") |
            \ exe "normal! g'\"" | 
        \endif
        "have Vim load indentation rules and plugins according to the detected filetype
    filetype plugin indent on
endif

"set cursorcolumn "高亮当前列 cuc
set cursorline  "高亮当前行 cul

"设定文件浏览器目录为当前目录
set autochdir

"show autocomplete menus.
set complete-=k complete+=k
set wildmode=list:full
"增强模式中的命令行自动完成操作
set wildmenu
" }}}  fold end for vim basic setting
" 自动切换中文输入
let g:XkbSwitchEnabled = 1

"使用NeoComplete
let g:NeoComplCache_EnableAtStartup     = 1
let g:SuperTabDefaultCompletionType     = "<c-x><c-k>"
let g:neocomplcache_enable_auto_select  = 0
let g:acp_enableAtStartup               = 1
let g:NeoComplCache_DisableAutoComplete = 0

" --------------------------minibuferexplorer setting-------------------
let g:miniBufExplorerMoreThanOne=0
"-------------------------indent---setting -----------------------
"离开插入模式时是红色
au InsertLeave * hi Cursor guibg=red

"插入模式时是绿色
au InsertEnter * hi Cursor guibg=green

"set textwidth=80
"set cc=+1 " 设置列宽为80 只对vim 7.3及以上有效
map <Leader>ch :call SetColorColumn()<CR>
function! SetColorColumn()
   let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" {{{ easymotin setting--------
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" }}}  fold end 

"{{{  配置WinManager
let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
let g:winManagerWidth=35
nmap wm :WMToggle<cr><cr>
"}}}

" {{{  fold start "在多buffer情况下的关闭
map fc <Esc>:call CleanClose(1)<CR>
map fq <Esc>:call CleanClose(0)<CR>
function! CleanClose(tosave)
    if (a:tosave == 1)
        w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b!".newbufNr
    else
        bnext
    endif
    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd!".todelbufNr
  endfunction " }}} function fold end

"{{{ -------echofunc ,括号自动匹配等----------------------------------
" 括号匹配
 :inoremap ( ()<ESC>i
 :inoremap ) <c-r>=ClosePair(')')<CR>
 ":inoremap { {}<ESC>i
 ":inoremap } <c-r>=ClosePair('}')<CR>
 :inoremap [ []<ESC>i
 :inoremap ] <c-r>=ClosePair(']')<CR>
 :inoremap < <><ESC>i
 :inoremap > <c-r>=ClosePair('>')<CR>
  
 function ClosePair(char)
     if getline('.')[col('.') - 1] == a:char
         return "\<Right>"
     else
         return a:char
     endif
 endf "}}}  

au Bufread,BufNewfile *.tags setlocal filetype=tags | &tags = expand("%:t")
"{{{ fold start-----------setting for ncl edit--------------------------------------
"-com set for ncl help doc
"au Bufread,BufNewfile *.ncl set filetype=ncl tags=ncludef.tags tags+=./ncludef.tags
"au Bufread,BufNewfile *.ncl map <F2> :        sp $HOME/zy/.vim-zy/bundle/ncl_vim/doc/ncl_list_alpha.ncl<CR> :  set noma readonly wrap<CR>
"au Bufread,BufNewfile *.ncl imap <F2><ESC> :  sp $HOME/zy/.vim-zy/bundle/ncl_vim/doc/ncl_list_alpha.ncl<CR> :  set noma readonly wrap<CR>
"au Bufread,BufNewfile *.ncl vmap <F2><ESC> :  sp $HOME/zy/.vim-zy/bundle/ncl_vim/doc/ncl_list_alpha.ncl<CR> :  set noma readonly wrap<CR>
"au Bufread,BufNewfile *-help.ncl   set noma readonly wrap
"au Bufread,BufNewfile Res_help*.ncl   set noma readonly wrap

"set for ncl dictionary and tags
"if(g:islinux==1||g:ismac==1||g:iscygwin==1)
    "au! Syntax newlang source $HOME/zy/.vim-zy/bundle/ncl_vim/syntax/ncl.vim
    "au Bufread,BufNewfile *.ncl set dictionary=$HOME/zy/.vim-zy/bundle/ncl_vim/dict/ncl.dict
    "au Bufread,BufNewfile *.ncl set tags+=$GEODIAG_ROOT/nclgeo.tags 
    "au Bufread,BufNewfile *.ncl set tags+=$NCARG_ROOT/nclstd.tags 
    "au Bufread,BufNewfile *.ncl set tags+=$HOME/zy/.vim-zy/bundle/ncl_vim/tags/ncl_func_help_inx.tags
    "au Bufread,BufNewfile *.ncl set tags+=$HOME/zy/.vim-zy/bundle/ncl_vim/tags/ncl_res_help_inx.tags
"elseif(g:iswindows==1)
    "au! Syntax newlang source $VIM/vimfiles/bundle/ncl/syntax/ncl.vim
    "au Bufread,BufNewfile *.ncl set dictionary=$VIM/vimfiles/bundle/ncl/dict/ncl.dic tags+=C:/Soft/cygwin/opt/tags
"endif
"{{{ fold start-----------定义快ncl捷操作-----------------------------
"added by fh at 2013.2.6.9:45-----------------------------------------
"ab loadgsn load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
"ab loadcsm load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
"ab loadcon load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
"ab loadske load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/skewt_func.ncl"
"ab loadshe load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
"ab loadwin load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/wind_rose.ncl"
"ab loadfh  load "$NCARG_ROOT/lib/ncarg/nclscripts/zy/def_fh.ncl"
"ab loadgeo load "$GEODIAG_ROOT/geodiag.ncl" ;
"ab loadcnm load "$NCARG_ROOT/lib/ncarg/nclscripts/cnmap/cnmap.ncl"
"ab ;~ ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"ab ;* ;***************************************************************
"ab ;= ;===============================================================
"ab ;- ;---------------------------------------------------------------
"----------定义结束-------}}} function fold end
" }}} setting fold end 

"ab {{{  {{{  fold start
ab }}}  }}}  fold end
"-------------setting for matlab {{{  fold start{
ab setfull set(gcf,'outerposition',get(0,'screensize'))
ab setfull set(gcf,'PaperPositionMode','auto')
ab printeps print('-depsc','-tiff','-r300','filename.eps')
"---------------------------------}}}  fold end 
 
"{{{ -ctags setting---------------------------------------------------------
" ncl_ctags.sh(在$HOME/.vim/exec/ncl_ctags.sh) 是一个shell脚本，用来生成ncl脚本的tags"
" 按下F7重新生成tag文件，并更新taglist

let g:needsilent=1
map <F7> :call Do_CTags(g:needsilent) <CR> :TlistUpdate<CR> 
imap <F7> <ESC>:call Do_CTags(g:needsilent) <CR><CR> :TlistUpdate<CR>

function Str_Trim(Str_Original) " {{{  fold start 
    " Remove the \r in the String
    let StrLen=len(a:Str_Original)
    let Str_New=strpart(a:Str_Original,0,StrLen-1)
    return Str_New
endf " }}}  fold end 

function Do_CTags(isSilent) " {{{  fold start 
    if &filetype =~ "ncl"
        "silent! execute "! sh $HOME/zy/.vim-zy/bundle/ncl/exec/ncl_ctags.sh $PWD ".g:os_flag
        if(g:iswindows==1)
            let Pwd_Cygwin_Orignal=system("pwd")
            let Pwd_Cygwin_New = Str_Trim(Pwd_Cygwin_Orignal)
            let Pwd_Win_Orignal=system("cygpath -w ".Pwd_Cygwin_New)
            let Pwd_Win_New=Str_Trim(Pwd_Win_Orignal)
         
            if(a:isSilent==1) " {{{  fold start 
                silent!  execute "! sh ".$VIM."/vimfiles/bundle/ncl/exec/ncl_ctags.sh  ".Pwd_Win_New."  ".g:os_flag
            else
                execute "! sh ".$VIM."/vimfiles/bundle/ncl_vim/exec/ncl_ctags.sh  ".Pwd_Win_New."  ".g:os_flag
            endif " }}}  fold end 
        else
            execute "! sh $HOME/zy/.vim-zy/bundle/ncl_vim/exec/ncl_ctags.sh $PWD  ".g:os_flag
        endif
    endif "}}} fold end
endf " }}}  fold end 

" {{{  fold start ------setting fortran------------------------------------
ab fcom !--------1---------2---------3---------4---------5---------6---------7--
" }}}  fold end 
"{{{ fold start--------------------------tabluar setting------------------------------
"let g:tabular_loaded = 1 不使用tabluar
let mapleader=','
"if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
  nmap <Leader>, :Tabularize /,<CR>
  vmap <Leader>, :Tabularize /,<CR>
"endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction " }}} function fold end

"{{{Taglist setting
"let Tlist_Ctags_Cmd='/usr/bin/ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
"TagList参数设置
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim
" }}} setting fold end

"{{{ One key Run
"Fri Jul 10 12:57:52 CST 2015 update 
map <F5> :bp<CR>    
map <F6> :bn<CR>   

map <F10> :        !clear&&date<CR> :  call CompileCode()<CR> :  call RunResult()<CR>
imap <F10> <ESC>:  !clear&&date<CR> :  call CompileCode()<CR> :  call RunResult()<CR>
vmap <F10> <ESC>:  !clear&&date<CR> :  call CompileCode()<CR> :  call RunResult()<CR>
 
" Fri Jul 10 13:34:35 CST 2015 update One_Key_Run function failure
"map <F10> :         :  call One_Key_Run()<CR>
"imap <F10> <ESC>:   :  call One_Key_Run()<CR>
"vmap <F10> <ESC>:   :  call One_Key_Run()<CR>

"func! One_Key_Run() " {{{  function fold start 
"    " clear the screen
"    exec "!clear&&date"
"    " silent to avoid press enter key
"     exec "call CompileCode()"
"    if v:shell_error == 0 "v:shell_error=0 stand for shell command right
"        exec "call RunResult()"
"    endif
"endfunc " }}}  fold end 
func! CompileGcc() "{{{ function flod start
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi/.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut/.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv/.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp/.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math/.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc "}}}a function fold end

func! CompileGpp() " {{{ function fold start
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi/.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut/.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv/.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp/.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math/.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc " }}} function fold end

func! CompileJava()
    exec "!javac %"
endfunc

func! CompileFor()
    exec "w"
    let compilecmd="!ifort "
    let compileflag="-o ".expand("%:r").".o"
    exec compilecmd." % ".compileflag
endfunc
 
func! CompileCode() " {{{ function fold start
    exec "w"
    if &filetype == "cpp"
        exec "call CompileGpp()"
    elseif &filetype == "c"
        exec "call CompileGcc()"
    elseif &filetype == "java"
        exec "call CompileJava()"
    elseif &filetype == "fortran"
        exec "call CompileFor()"
    endif
endfunc " }}} function fold end
 
func! RunResult() " {{{ function fold start
    exec "w"
    if search("mpi/.h") != 0
        exec "!mpirun -np 4 ./%<"
    elseif &filetype == "cpp"
        exec "! ./%<"
    elseif &filetype == "c"
        exec "! ./%<"
    elseif &filetype == "python"
        exec "!python ./%"
    elseif &filetype == "java"
        exec "!java %<"
    elseif &filetype == "ncl"
        exec "!ncl %"
    elseif &filetype == "sh"
        exec "!bash ./%"
    elseif &filetype == "fortran"
        if v:shell_error == 0
            exec "! ./".expand("%:r").".o"
        else
            exec '! echo "Compile Failure"'
            " fail and  stop
        endif
    elseif &filetype == "mma"
        exec "!math -script %"
    elseif &filetype == "matlab"
        exec "!matlab -nodesktop -nosplash -nodisplay < %"
    endif
endfunc " }}} function fold end
"}}}

map <F3> :w<cr>
"{{{ 进行版权声明的设置
map <F4> :call TitleDet()<cr>
function TitleDet() "{{{ function fold start
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
    let CommentFlag = FileDet()
    let n=1
    "默认为添加
    while n < 200
        let Line = strpart(getline(n),2,4)
        if Line == 'Last'
            call UpdateTitle(CommentFlag,n)
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle(CommentFlag)
    unlet CommentFlag
endfunction "}}} function fold end

function FileDet() "{{{ function fold start  根据文件类型确定注释符号
    "let Suffix = tolower(expand("%:e"))
    "let FileName = tolower(expand("%:t"))
    "let FirstChar = strpart(FileName,0,1) "get the first letter of filename
    "if FirstChar == '.'
    "if  empty(Suffix)
    "	let CommentFlag = "#"
    "elseif Suffix=="ncl"
    "	let CommentFlag = ";"
    "elseif match(["f","f90","f77","for"],Suffix)>=0
    "	let CommentFlag = "!"
    "elseif Suffix == "sh"
    "	let CommentFlag = "#"
    "elseif match(Suffix,"vim")>=0
    "	let CommentFlag= '"'
    "endif
    if  &filetype == "python" || &filetype == "sh" || &filetype == "expect"
        let CommentFlag = "#"
    elseif &filetype == "ncl"
        let CommentFlag = ";"
    elseif &filetype == "matlab"
        let CommentFlag = "%"
    elseif &filetype == "vim"
        let CommentFlag = '"'
    elseif &filetype == "fortran"
        let CommentFlag = "!"
    elseif &filetype == "dosbatch"
        let CommentFlag = "REM "
    else
        let CommentFlag = " "
    endif
    return CommentFlag
endfunction "}}} function fold end

function AddTitle(CommentFlag) "{{{ function fold start 添加或更新copyright
    call append(1,a:CommentFlag."==========================================================")
    call append(2,a:CommentFlag." Author: fanghuan - fanghuan_nju@163.com")
    call append(3,a:CommentFlag." Filename: ".expand("%:t"))
    call append(4,a:CommentFlag." Creat time: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(5,a:CommentFlag." {{{ comment flod start-----------------------")
    call append(6,a:CommentFlag." Description: ")
    call append(7,a:CommentFlag." Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(8,a:CommentFlag." }}} comment flod end")
    call append(9,a:CommentFlag."==========================================================")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf "}}} function fold end

function UpdateTitle(CommentFlag,Line) "{{{ function fold start 更新最近修改时间和文件名
    "normal m'
    "execute '/; Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
    "normal ''
    "normal mk
    execute '/'.a:CommentFlag.' Filename:/s@:.*$@\=": ".expand("%:t")@'
    "execute "noh"
    "normal 'k
    call append(a:Line+0,a:CommentFlag." ---------------------------------------------")
    call append(a:Line+1,a:CommentFlag." Description: ")
    call append(a:Line+2,a:CommentFlag." Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction "}}} function fold end
"}}}

function! Replace(confirm, wholeword, replace) " 替换函数 {{{  fold start 
" 参数说明:confirm:是否替换前逐一确认" wholeword:是否整词匹配 " replace:被替换字符串
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif

    let search = ''

    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>' 
    else
        let search .= expand('<cword>')
    endif

    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update' 
endfunction " }}}  fold end 
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

let g:neocomplete#enable_at_startup    = 1
let g:neocomplete#enable_smart_case    = 1
let g:neocomplete#enable_cursor_hold_i = 1

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"
"----------------setting for tmux --- {{{  fold start 
" Tue Sep  8 00:04:20 CST 2015
"调整光标的形状
"在默认情况下，当通过 Tmux 运行 Vim 时，无论当前 Vim
"是处于插入模式、可视模式还是其他模式，光标的形状都是一样的。这样就很难判断当前的
"Vim 模式是什么。若要避免这个问题，就需要让 Tmux 通知 iTerm
"更新光标的形状。为此，需要将以下配置加入到文件 ~/.vimrc 中。
if exists('$ITERM_PROFILE')
   if exists('$TMUX') 
        let &t_SI = "\<Esc>[3 q"
        let &t_EI = "\<Esc>[0 q"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endif
"调整粘贴时的文本缩进
" happens in VIM UI)

function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"------------- }}} 
"* vim:set foldlevel=0:  *
