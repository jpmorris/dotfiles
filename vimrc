set nocompatible 		" disable vi compatability; allow exclusive-vim features
syntax enable			" syntax highlighting
filetype plugin on		" load filetype plugins for the filetype
filetype indent on		" load indent rules for the filetype


" {{{ OS/Computer Specific
if has('win32')
   if hostname() == 'S217648'
      let vimrplugin_r_path = "C:\\Users\\mor20\\progs2\\R\\R-3.2.2\\bin\\x64"
      let g:rplugin_sumatra_path = "C:\\Users\\mor20\\progs2\\SumatraPDF-3.0\\SumatraPDF.exe"
   elseif hostname() == 'SPIKE'
      let vimrplugin_r_path = "C:\\Program Files\\R\\R-3.2.2\\bin\\x64"
      "let g:rplugin_sumatra_path = "C:\\Users\\mor20\\progs2\\SumatraPDF-3.0\\SumatraPDF.exe"
   elseif hostname() == 'julia'
      let g:rplugin_sumatra_path = "C:\Program Files (x86)\SumatraPDF\\SumatraPDF.exe"
   endif
elseif has('unix')
endif
" let vimrplugin_latexmk = 1
" let vimrplugin_latexcmd = 'latexmk -bibtex -pdf -pdflatex="pdflatex -file-line-error -synctex=1"'
"let g:latex_viewer='C:\Users\mor20\progs2\SumatraPDF-3.0\SumatraPDF.exe -reuse-instance -inverse-search '.
"\ '"gvim --servername '.v:servername.' --remote-send \"^<C-\^>^<C-n^>'.
"\ ':execute ''drop ''.fnameescape(''\%f'')^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'.
"\ ':call remote_foreground('''.v:servername.''')^<CR^>\""'

nnoremap <expr><silent> gb ':VimLatexView -forward-search '
        \ . shellescape(expand('%:p')) . ' '
        \ . line(".") . ' '
        \ . shellescape(g:latex#data[b:latex.id].out()) . '<CR>'

"let g:rct_completion_use_fri = 1
"let g:Tex_DefaultTargetFormat = "pdf"
"let g:Tex_ViewRule_pdf = "kpdf"
" }}}

" {{{ Vundle Plugins
" VUNDLE
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#rc(expand(vimDir . '/bundle'))
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/gundo.vim'                    " undo history
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'                " line up characters use :Tabularize /<char>
Plugin 'ervandew/supertab'                " tab insert completion
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'                " tagbar navigation
Plugin 'rodjek/vim-puppet'                " vim puppet syntax
Plugin 'jistr/vim-nerdtree-tabs'          " put nerdtree on all tabs
Plugin 'tpope/vim-surround'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'chrisbra/Recover.vim'
call vundle#end()
"}}}

" {{{ Input
" FILE HANDLING
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

set showcmd                   " This shows what you are typing as a command.
set foldmethod=marker         " Folding Stuffs
set autoindent                " Who doesn't like autoindent?
set expandtab                 " Spaces are better than a tab character
set smarttab
set shiftwidth=3              " Who wants an 8 character tab?  Not me!
set softtabstop=3
if version >= 700             " Use english for spellchecking, but
   set spl=en spell
endif
set wildmenu                  " Cool tab completion stuff
set wildmode=list:longest,full
set mouse=a                   " Enable mouse support in console
set backspace=2               " Got backspace?
set number                    " Line Numbers PWN!
set relativenumber
set ignorecase                " Ignoring case is a fun trick
set smartcase                 " And so is Artificial Intellegence!
set incsearch                 " Incremental searching is sexy
set hlsearch                  " Highlight things that we find with the search
let g:clipbrdDefaultReg = '+' " Since I use linux, I want this
set nohidden                  " When I close a tab, remove the buffer
highlight MatchParen ctermbg=4   " Set off the other paren
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast
set noerrorbells
set visualbell
set t_vb=
set fileformat=unix

"syntastic settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let NERDTreeShowHidden=1      " show hidden files in nerdtree
let vimrplugin_assign=2       " stop _ to -> remapping


" backup to tmp
set backupdir=~/vimtmp/backup//
set directory=~/vimtmp/swap//
set undodir=~/vimtmp/undo//

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
" syntastic r checking
let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'

" }}}

"{{{Look and Feel

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" highlight current line
set cul                                           " highlight current line
hi CursorLine term=none cterm=none ctermbg=3      " adjust color

set scrolloff=10            " keep at least 10 lines above/below
set sidescrolloff=5         " keep at least 5 lines left/right
set showmatch                 " show matching bracket

" THEME
set background=dark
colorscheme solarized

set colorcolumn=80
set textwidth=80
if has('gui_running')
"   set background=light
"   set guifont=Terminus\ 9
   set background=dark
  if has('gui_win32')
"   set guifont=Courier\ New:h10
   set guifont=Dina:h8
  else
"    set guifont=DejaVu\ Sans\ Mono\ 12
  endif
else
   set background=dark
endif




" }}}

"{{{ Functions

" Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = f
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc


" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END


"}}}

"{{{ Mappings
"This is totally awesome - remap jj to escape
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Move between split screens
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
" easymotion search
map <C-u> <Leader><Leader>s
" easier page up/down movement
noremap <C-j> <C-d>
noremap <C-k> <C-u>


" Open the Project Plugin <F2>
nnoremap <silent> <F2> :Project<CR>

" Open the Project Plugin
nnoremap <silent> <Leader>pal  :Project .vimproject<CR>

" Open the TagList Plugin <F3>
nnoremap <silent> <F3> :Tlist<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

"Nerdtree open
map <F9> :NERDTreeTabsToggle<CR>


" Paste Mode!  Dang! <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Space will toggle folds!
nnoremap <space> za

" TagBar
nmap <F8> :TagbarToggle<CR>

" Insert Blank lines in normal mode
nmap <CR> O<Esc>j
nmap <S-Enter> o<Esc>k

"}}}

"{{{Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
"}}}


