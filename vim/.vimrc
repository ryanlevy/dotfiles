syntax on
filetype indent plugin on
set softtabstop=2   " number of spaces in tab when editing
set tabstop=2   " number of spaces in tab when editing
set shiftwidth=2
set smarttab
set expandtab
set exrc " if a .vimrc is found in pwd, use that
set secure " make said sourcing more secure
set background=dark
set wildmenu "visual autocomplete for command menu
if has("gui_macvim")
    " MacVim settings	
    let g:solarized_termtrans=1
    colorscheme solarized
    set transparency=5
    " Disable all blinking:
    :set guicursor+=a:blinkon0
else
    colorscheme desert
    "colorscheme monokai
endif    
"<f5> saves then runs program in python
map <f5> :w\|!python3 %<cr> 
" build info:
" most of the time work is done with cmake in ./build
if filereadable(expand("%:p:h")."/Makefile")
	    setlocal makeprg=make\ \ -j8
elseif !filereadable(expand("%:p:h")."/build/Makefile")
	    setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
else 
	    setlocal makeprg=make\ -C\ build\ -j8
endif
:noremap <F9> :make<cr><cr>:botright cwindow<cr>
set ruler
set history=1000         " remember more commands and search history
set undolevels=1000      " use more levels of undo

" make tabs=>>>, spaces=..., and nbsp to ~
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list
