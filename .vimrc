"Settings "{{{

"General"{{{
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

set foldmethod=marker "Automatic folding with markers

"}}}

"Searching"{{{
set wrapscan	    "Continue search at beginning of file
set ignorecase
set smartcase       "Only ignore case for lower characters given
set hlsearch	    "Highlight search results
set incsearch       "Jump to search results while typing
"}}}

"Programming"{{{
set smartindent
set showmatch       "Show matching paranthesis
set shiftwidth=4    "Indent 4 spaces
set tabstop=4	    "Set tabwith to 4 characters
set softtabstop=4   "Make 4 Spaces to tab
set expandtab       "Save tab as 4 spaces
"}}}

"Set screen title - VimTip http://vim.wikia.com/wiki/VimTip1126
if (&term =~ '^screen')"{{{
    set title t_Co=256
    set t_ts=k
    set t_fs=\
    set titlestring=%t%m%<%(\ %{&encoding},%p%%%)
endif      "}}}

"}}}

"Plugins "{{{

syntax on	 "Activate syntax highlighting
filetype on
filetype plugin on

colorscheme matrix

"Hexman plugin: change char with \hc
map <leader>hc <leader>hd <leader>hi

"Use symmetric encryption for gpg plugin
let g:GPGPreferSymmetric = 1

" Tag-List settings
" let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;m:port maps;r:procedures' 
 "let tlist_tex_settings='latex;s:section;c:chapter;l:label;r:ref'

"}}}

" Mappings"{{{

"Correct typos"{{{
noremap q: :q
command! W w
command! Wq wq
command! Wqa wqa
command! Qa qa
command! Q q
"}}}

" show buffers C-y
noremap <C-y> :buffers<CR>

"Use , instead of ; to go to next inline search
noremap , ;

"Rechtschreibung
"map <F9> :w!<CR>:!aspell -c %<CR>:e! %<CR>

"Map next tab/buffer
map <C-n> :bn!<CR>

" Map space to next page
map <Space> <PageDown>

"Y Copies until end of line
map Y y$

":noh with #
map # :noh<CR>

" Window bindings"{{{
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
"}}}

"Jump to next diff
map <C-m> ]c

" Open Help-Link in new vertical splitscreen
map <leader>ts :vsp<CR>:exec("tag ".expand("<cword>"))<CR><C-w>x


" Function calls"{{{

map <leader>ll :call RunLaTeX()<CR>

map <leader>lv :call ViewLaTeX()<CR>

map <silent> <c-h> :call HtmlEscape()<CR>"}}}

"}}}

"Autocommands "{{{

" automatically give executable permissions if file begins with #! and contains  '/bin/' in the path 
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile>


" automatically insert shebang line for script files
au BufEnter * call CreateShebang()

"}}}

"Functions"{{{

" automatically insert shebang line for script files
function CreateShebang()"{{{
    let myfile = expand("%")
    let myfiletype = expand("%:e")
    if getline(1) == ""
        if myfiletype == "pl"
            call setline(1, "\#!/usr/bin/perl")
        elseif myfiletype == "sh"
            call setline(1, "\#!/bin/bash")
        end
    end
endfunction
"}}}

" Call pdflatex with \ll
function RunLaTeX()"{{{
    if &ft == 'tex'
        !pdflatex "%"
    end
endfunction
"}}}

" Call pdf of actual LaTeX document with \lc
function ViewLaTeX()"{{{
    if &ft == 'tex'
        let filename = expand("%:r").".pdf"
        exec "!evince " . filename . "&"
    end
endfunction
"}}}

" Encode all special characters with html-escape sequences
function HtmlEscape()"{{{
    silent s/ö/\&ouml;/eg
    silent s/ä/\&auml;/eg
    silent s/ü/\&uuml;/eg
    silent s/Ö/\&Ouml;/eg
    silent s/Ä/\&Auml;/eg
    silent s/Ü/\&Uuml;/eg
    silent s/ß/\&szlig;/eg
endfunction
"}}}


"Automatically update helptags (See VimTip 823)
au BufWritePost ~/.vim/doc/* helptags ~/.vim/doc
map <leader>ut :helptags ~/.vim/doc<CR>

"}}}

"Sessions"{{{
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
"}}}


" vim: foldmethod=marker foldmarker={{{,}}} foldlevel=0 
