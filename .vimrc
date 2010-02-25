"
" Options
"

"General
set fileencoding=utf-8
set encoding=utf-8

set noerrorbells    "No error-beeps
set report=0 	    "Show number of changed lines
set showmode        "Show the mode at bottom
set nocompatible    "No vi compatibility mode
set number		    "Show line numbers
set showcmd		    "Show the entered command at bottom
set scroll=1	    "Scroll up and down without cursor movement with C-u and C-d
set wildmenu
set lazyredraw      "Do not redraw while running macros

set cursorline      "highlight actual line

"Searching
set wrapscan	    "Continue search at beginning of file
set ignorecase
set smartcase       "Only ignore case for lower characters given
set hlsearch	    "Highlight search results
set incsearch       "Jump to search results while typing

"Programming
set smartindent
set showmatch       "Show matching paranthesis
set shiftwidth=4    "Indent 4 spaces
set tabstop=4	    "Set tabwith to 4 characters
set softtabstop=4   "Make 4 Spaces to tab
set expandtab       "Save tab as 4 spaces

"
"Plugins
"

syntax on	 "Activate syntax highlighting
filetype on
filetype plugin on

colorscheme matrix

"Hexman plugin: change char with \hc
map <leader>hc <leader>hd <leader>hi

"Use symmetric encryption for gpg plugin
let g:GPGPreferSymmetric = 1


" 
" Mappings
"

"Correct typos
noremap q: :q
command! W w
command! Wq wq
command! Wqa wqa
command! Qa qa
command! Q q

" show buffers on double space
noremap <Space><Space> :buffers<CR>

"Use , instead of ; to go to next inline search
noremap , ;

"Rechtschreibung
map <F9> :w!<CR>:!aspell -c %<CR>:e! %<CR>

"Automatic folding with markers
set foldmethod=marker

"Map next tab
map <C-n> :bn!<CR>

"Y Copies until end of line
map Y y$

":noh with #
map # :noh<CR>

"Jump to windows
map + <C-w>w
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Switch two windows
map <C-x> <C-w>x

"Change window size with arrow keys
noremap <Left> <C-w><
noremap <Right> <C-w>>
noremap <Up> <C-w>+
noremap <Down> <C-w>-


"Jump to next diff
map <C-m> ]c



"Sessions
" autocmd VimEnter * call LoadSession() 
" autocmd VimLeave * call SaveSession() 
" function! SaveSession() 
"    execute 'mksession! $HOME/.vim/sessions/session.vim' 
" endfunction 
" function! LoadSession() 
"    if argc() == 0 
"       execute 'source $HOME/.vim/sessions/session.vim' 
"    endif 
" endfunction 

" Tag-List settings
" let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;m:port maps;r:procedures' 
 let tlist_tex_settings='latex;s:section;c:chapter;l:label;r:ref'


" VHDL Stuff
" if has("autocmd")
" 	filetype plugin indent on
" 	" filetype dependent settings
" 	au Filetype vhdl call FT_vhdl()
" 	" filetype dependent templates
" "	au BufNewFile *.{vhd,py,tex,asm,sh,c,java,html} call Template_Load(expand("%"))
" 	" replace $template:date$ and $template:filename$
" "	au BufNewFile *.{vhd,py,tex,asm,html} call Template_Replace_Special()
" else
" 	set autoindent
" endif 
" 
" function FT_vhdl()
" 	if exists("+omnifunc")
" 		setlocal omnifunc=syntaxcomplete#Complete
" 	endif
" 	setlocal errorformat=ERROR:%.%#\ -\ \"%f\"\ Line\ %l.\ %m
" 	let g:vhdl_indent_genportmap=0
" 	" for taglist
" 	" command mappings for perl scripts
" 	":command! -nargs=1 -complete=file VHDLcomp r! ~/.vhdl/vhdl_comp.pl <args>
" 	":command! -nargs=1 -complete=file VHDLinst r! ~/.vhdl/vhdl_inst.pl <args>
" endfunction



" automatically give executable permissions if file begins with #! and contains  '/bin/' in the path 
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> 



"Set screen title
if (&term =~ '^screen')
   " set title for screen
   " VimTip http://vim.wikia.com/wiki/VimTip1126
    set title t_Co=256
    set t_ts=k
    set t_fs=\
    "let &titleold = fnamemodify(&shell, ":t")
    "set titlelen=15
    " set information for title in screen (see :h 'statusline')
    set titlestring=%t%m%<%(\ %{&encoding},%p%%%)
    "set titlestring=%t%=%<%(\ %{&encoding},[%{&modified?'+':'-'}],%p%%%)
endif      
