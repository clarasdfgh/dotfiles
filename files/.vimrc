" ==============================================================================
" GROCTEL'S VIMRC FILE
" ==============================================================================


" ==============================================================================
" EDITOR STYLISATION
"
" Visual settings to improve the Vim experience.
" ==============================================================================

set wrap linebreak           " Lines break on window border
set relativenumber nu        " Show relative and current number lines
colorscheme atom-dark-256    " Colour pallette (onedark is also available)
set t_ut=""                  " Constantly redraw vim to keep background colour
set cc=81                    " Vertical bar which you shall not pass
set tabstop=3                " Hard tabs represent 3 spaces for me, not sorry
syntax on                    " Highlight my text, thanks! 

set nocompatible              " be iMproved, required
filetype off                  " required

" ==============================================================================
" CUSTOM KEY MAPPINGS
"
" Maps key combinations to complex commands for ease of use
" ==============================================================================

" Move through window splits (sp/vsp)
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Airline
Plugin 'vim-airline/vim-airline'

" Airline themes
Plugin 'vim-airline/vim-airline-themes'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" ALE (Asynchronous Lint Engine)
Plugin 'w0rp/ale'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

" NERDTree
Plugin 'scrooloose/nerdtree'

" Surround
Plugin 'tpope/vim-surround'

" Syntnastic
" Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

au VimEnter ~/Documents/UGR/Club\ Videojuegos/Inform6/Presentación\ Inform6.md command! GO normal M16jzzH
au VimEnter ~/Documents/UGR/Club\ Videojuegos/Inform6/Presentación\ Inform6.md command! BACK normal M16kzzH
