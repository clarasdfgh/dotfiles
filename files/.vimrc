" ==============================================================================
" GROCTEL'S VIMRC FILE
" ==============================================================================

" ==============================================================================
" GENERAL SETTINGS
"
" Settings to make everything work as intended.
" ==============================================================================

set nocompatible                  " Required by plugins
filetype off                      " Required by plugins
autocmd BufWritePre * %s/\s\+$//e " Trim trailing blanks when saving
set splitbelow splitright


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

" ==============================================================================
" VUNDLE
"
" Vundle is my plugin loader of choice.
" All plugins are loaded from here with their corresponding options.
" ==============================================================================

" Required Vundle settings
" ------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" AIRLINE
"
" The airline is the bar that is shown at the bottom of the screen. It shows
" information about the active document's current status.
" ------------------------------------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Use large separator characters to force an uniform look
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" ALE (Asynchronous Lint Engine)
Plugin 'dense-analysis/ale'
let g:ale_linters = {'cpp': ['g++']}
let g:ale_c_gcc_options = '-std=c++11 -Wall -Iinclude'
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'
let g:ale_c_parse_makefile = 1

" Fugitive
Plugin 'tpope/vim-fugitive'

" Goyo
Plugin 'junegunn/goyo.vim'
execute "set <M-G>=\eg"
map <M-G> :Goyo<CR>

" Gundo
Plugin 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" Limelight
Plugin 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

" NERDTree
Plugin 'scrooloose/nerdtree'
execute "set <M-N>=\en"
map <M-N> :NERDTree<CR>

" Taboo
Plugin 'gcmt/taboo.vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Surround
Plugin 'tpope/vim-surround'

" Syntnastic
" Plugin 'scrooloose/syntastic'

" Tagbar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

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
