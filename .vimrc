set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan
set gdefault
set scrolloff=5
set number
set relativenumber
set so=5

" Sets yank/delete/paste functionality to 
" interact with the system's clipboard, 
" rather than internal vim registers
set clipboard=unnamed " For Windows/MacOS
" set clipboard=unnamedplus " For Linux

let mapleader = " "

" Add new line 
" nmap <Enter> o<ESC>
" CHANGED BECAUSE <ENTER> INTERFERES WITH COMMAND-LINE WINDOW
nmap o o<ESC>
nmap <leader>o A<Enter>
nmap O O<ESC>
nmap <leader>O kA<Enter>

" --------------------------------------------------
" Screen movements keep cursor near center of screen
" --------------------------------------------------
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz

" 'Clear Line' - Delete all text on the line, but leave the space in tact
nmap cl ^d$

" -------------------------------------------
" Copy/Paste/Delete Behavior Modifications
" -------------------------------------------

" ------
" x
" ------

" Normal character delete does not save values
nnoremap x "_x

" Special character delete saves values
nnoremap <leader>x x

" ------
" c/C
" ------

" Normal change does not save values
nnoremap c "_c

" Special change saves values
nnoremap <leader>c c

" 'Change to end of line' does not save values
nnoremap C "_C

" Special 'change to end of line' saves values
nnoremap <leader>c c

" Normal visual change does not save values
vnoremap c "_c

" Special visual change saves values (like 'cut')
vnoremap <leader>c c

" ------
" d/D
" ------

" Normal delete does not save values
nnoremap d "_d

" Special delete saves values
nnoremap <leader>d d

" Delete to end of line does not save values
nnoremap D "_D

" Special 'delete to end of line' saves values
nnoremap <leader>D D

" Normal visual delete does not save values
vnoremap d "_d

" Special visual delete saves values (like 'cut')
vnoremap <leader>d d

