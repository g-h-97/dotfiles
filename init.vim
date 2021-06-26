"deactivating modelines for security reasons (the ability to execute vim script form a file)
set nomodeline
set modelines=0

"base config
set number	" enable number line
set relativenumber	" move number line relative to position
set autoindent smartindent
syntax on " highlighting
set termguicolors " true color
set hlsearch " highlight search
set smartcase " upper maches upper only / lower maches *
set incsearch " highlighting while seach typing (used to be replaced with incsearch plugin)
set ignorecase " case insensetive search
set encoding=utf-8
set linebreak " wrap when hitting screen end
"  🢒 ▷ ⏵ ▸ 🢖 ▹ ⇒ ↦ ⇛ ⇉ ⇨ ↠ ⇰ ➾ show the that line is wraping
let &showbreak = '🢖 '

" tab settings
set expandtab
set shiftwidth=4 " optional if not set will == 'tabstop'
set softtabstop=4
set tabstop=4

" show cursor more clearly with horizontal and virtical lines
set cursorline
set nocursorcolumn

" setting higher redraw time to fix syntax highlighting in large files
" due to error -> 'redrawtime` exeeded, syntax highlighting disabled
set redrawtime=10000

"move display lines not actual lines
nnoremap <silent> k gk
nnoremap <silent> j gj

"Disabling arow keys
map <Up> <NOP>
map <Down> <NOP>
map <Right> <NOP>
map <Left>  <NOP>

" setting the leader key from '\' to 'space'
let mapleader = " "

" enable external clipboard register instead of the internal one
" set clipboard+=unnamedplus

" remove useless spaces at the end when saving
" autocmd BufLeave * %s/\s\+$//e

" split screen shortcuts
nnoremap <C-h> :split<Space>
nnoremap <C-v> :vsplit<Space>

" split navigation shortcuts
map <leader><leader>h <C-w>h
map <leader><leader>j <C-w>j
map <leader><leader>k <C-w>k
map <leader><leader>l <C-w>l

" tab navigation shortcuts
map <leader>h gT
map <leader>l gt

" when spliting don't change my split locations
set splitbelow splitright

" center screen where the cursor moves
autocmd CursorMoved * norm zz

" remember folds
" augroup keep_folds
  " autocmd!
  " autocmd BufWinLeave * mkview
  " autocmd BufWinEnter * silent! loadview
" augroup END

" remap the escape in insert & command modes
" inoremap jj <Esc>
" cnoremap jj <C-C>

" Ctrl-e to jump to the end of the line in insert mode
" inoremap <C-a> <C-o>$
" inoremap <C-i> <C-o>1

" make words behind the cursor uppercase in insert mode
:map! <C-f> <Esc>gUiw`]a

" custom autocomplete
:imap <C-x> <C-x><C-f>
" :imap <S-tab> <C-p>
" :imap <tab> <C-n>

" ask to compile
autocmd BufwritePost *.cpp :!clang++ % -o %.out

"setting up vim-plug (plugin manager)
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline' "vim bar
Plug 'vim-airline/vim-airline-themes' " vim bar theme
Plug 'kien/rainbow_parentheses.vim' " color for parentheses
Plug 'terryma/vim-multiple-cursors' " edit by multi cursors
Plug 'tomasiser/vim-code-dark' " vscode dark theme like and airline
Plug 'preservim/nerdcommenter' " Comment multiple lines at once
Plug 'Yggdroot/indentLine' " add virtical indentation lines
"Plug 'easymotion/vim-easymotion' " change cursor position simply
Plug 'junegunn/fzf.vim' " fuzzy search everything
Plug 'dhruvasagar/vim-table-mode' " creating pnadoc tables
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-surround' " make editing ',,[,(,{ easier
Plug 'voldikss/vim-floaterm' " floating terminal

call plug#end()

" color scheme configuration
colorscheme deus_ex "desert codedark elflord industry

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme = 'codedark' "~/.vim/autoload/airline/themes
let g:airline_extensions = ['tabline']
" let g:airline#extensions#tabline#enabled = 1

"rainbow_parentheses config
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['black',       'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" nerdcommenter config
filetype plugin on
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCreateDefaultMappings = 1
  " mapping uncomment keys form 'u' to 'cu'
"map <leader>u <leader>uc

" indent line config
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = "‣" " ◦ ‣ •
let g:indentLine_fileTypeExclude = [ 'help', 'pandoc', 'terminal', 'tutor' ]
let g:indentLine_bufTypeExclude = [ 'help', 'pandoc', 'terminal', 'tutor' ]

" easymotion config
" map <leader>f <Plug>(easymotion-w)
" map <leader>b <Plug>(easymotion-b)
" nmap s <Plug>(easymotion-overwin-f)
  " " seach bindings
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
  " " for next / previous maches
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" Vim-Multiple-Cursors
let g:multi_cursor_quit_key = '<Esc>'

" floaterm keys
let g:floaterm_keymap_toggle = '<C-s>'

" tablemode pandoc
let g:table_mode_corner = '+'
let g:table_mode_corner_corner = '+'



autocmd BufWritePost *.dot :silent !dot -Tpng -Gdpi=600 % -o %.png
