"""""""""""""""""""""""""""""""""""""""""""""""
"" General
"""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible        " get out of horrible vi-compatible mode
filetype on             " detect the type of file
set history=1000        " How many lines of history to remember
"set cf                  " enable error files and error jumping
set clipboard+=unnamed  " turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac    " support all three, in this order
filetype plugin on      " load filetype plugins
"set viminfo+=!          " make sure it can save viminfo
set isk+=_,$,@,%,#,-    " none of these should be word dividers, so make them not be

""""""""""""""""""""""""""""""""""""""""""""""""
"" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark     " we are using a dark background
syntax on               " syntax highlighting on

""""""""""""""""""""""""""""""""""""""""""""""""
"" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""
""" set backup                          " make backup file
"set backupdir=$VIM\vimfiles\backup  " where to put backup file
"set directory=$VIM\vimfiles\temp    " directory is the directory for temp file
"set makeef=error.err                " When using make, where should it dump the file
"
""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""
"set lsp=0               " space it out a little more (easier to read)
"set wildmenu            " turn on wild menu
set ruler               " Always show current positions along the bottom
"set cmdheight=2         " the command bar is 2 high
set number              " turn on line numbers
"set lz                  " do not redraw while running macros (much faster) (LazyRedraw)
"set hid                 " you can change buffer without saving
"set backspace=2         " make backspace work normal
"set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=a             " use mouse everywhere
"set shortmess=atI       " shortens messages to avoid 'press a key' prompt
"set report=0            " tell us when anything is changed via :...
set noerrorbells        " don't make noise
"" make the splitters between windows be blank
"set fillchars=vert:\ ,stl:\ ,stlnc:\
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
"set nohlsearch " do not highlight searched for phrases
"set incsearch " BUT do highlight as you type you search phrase
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
"set so=10 " Keep 10 lines (top/bottom) for scope
"set novisualbell " don't blink
"set noerrorbells " no noises
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""
"set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent
"set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set expandtab sw=4 ts=4 sts=4
set softtabstop=4 " unify
set shiftwidth=4 " unify
"set noexpandtab " real tabs please!
"set nowrap " do not wrap lines
set smarttab " use tabs at the start of a line, spaces elsewhere
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Folding
""    Enable folding, but by default make it act like folding is off, because folding is annoying in anything but a few rare cases
""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable " Turn on folding
"set foldmethod=indent " Make folding indent sensitive
"set foldlevel=100 " Don't autofold anything (but I can still fold manually)
"set foldopen-=search " don't open folds when you search into them
"set foldopen-=undo " don't open folds when you undo stuff
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" File Explorer
""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:explVertical=1 " should I split verticially
"let g:explWinSize=35 " width of 35 pixels
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Win Manager
""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWidth=35 " How wide should it be( pixels)
"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer' " What windows should it
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" CTags
""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = $VIM.'\ctags.exe' " Location of ctags
"let Tlist_Sort_Type = "name" " order by
"let Tlist_Use_Right_Window = 1 " split to the right side of the screen
"let Tlist_Compart_Format = 1 " show small meny
"let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
"let Tlist_File_Fold_Auto_Close = 0 " Do not close tags for other files
"let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Minibuf
""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
"let g:miniBufExplModSelTarget = 1
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Matchit
""""""""""""""""""""""""""""""""""""""""""""""""""
"let b:match_ignorecase = 1
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Perl
""""""""""""""""""""""""""""""""""""""""""""""""""
"let perl_extended_vars=1 " highlight advanced perl vars inside strings
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
"function! SuperRetab(width) range
"silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
"endfunction
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
"map <right> <ESC>:MBEbn<RETURN> " right arrow (normal mode) switches buffers  (excluding minibuf)
"map <left> <ESC>:MBEbp<RETURN> " left arrow (normal mode) switches buffers (excluding minibuf)
"map <up> <ESC>:Sex<RETURN><ESC><C-W><C-W> " up arrow (normal mode) brings up a file list
"map <down> <ESC>:Tlist<RETURN> " down arrow  (normal mode) brings up the tag list
"map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
"map <F2> <ESC>ggVG:call SuperRetab()<left>
"map <F12> ggVGg? " encypt the file (toggle)
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
"au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
"au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
"au BufNewFile,BufRead *.hta :set ft=html " all my .tpl files ARE html
"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Useful abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""
"iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
"iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"
""""""""""""""""""""""""""""""""""""""""""""""""""
"" Language Specific
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    "au FileType cpp,c,java,sh,pl,php,phtml,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,phtml,asp,xml,javascript  set smartindent
    nnoremap <C-p> :set invpaste paste?<CR>
    set pastetoggle=<C-p>
    set showmode
    "au FileType cpp,c,java,sh,pl,php,phtml,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72

    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.phtml  set syntax=php
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf

    " Ctrl+X O
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete

    autocmd FileType php noremap <C-L> :!php -l %<CR>
    autocmd Filetype html,xml,xsl source ~/.vim/closetag.vim
endif