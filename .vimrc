
:set nocompatible              " We want the latest Vim settings/options
so ~/.vim/plugins.vim
syntax enable
 set backspace=indent,eol,start                            
set number                          "To active line numbers"
set autowriteall                     "automatic save all"
set complete=.,w,b,u,t,i                "Set our disared autocompletion matching
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_working_path_mode = 0
set guioptions-=l
set guioptions-=l
set guioptions-=r
set guioptions-=R
let mapleader =','                   "The default leader is \"
"---------Search----------" 
set hlsearch
set incsearch

colorscheme darkburn	
"----------Visuals--------"
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
set t_CO=256                       "Use 256 colors"
set guioptions-=e              "We don't want gui tabs
set guifont=Monospace\ 13
set linespace=13
"---------Split management----------" 
set splitbelow                                      " make new split appear below
set splitright                                      " make new split appera on the right side
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
"set nosmartcase
set ignorecase                                      " ignore case when searching
"----------Visuals--------"
hi foldcolumn guibg=bg
vmap <C-c> "+yi
vmap <C-x> "+cuto-commands---------"
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
hi vertsplit guifg=bg guibg=bg
"---------Mappings---------"
"Make it easy to edit the Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/php.snippets<cr>
nmap <Leader>1 :NERDTreeToggle<cr>
nmap <F11> :FullscreenToggle<cr>
"Add simple highlight removal"
nmap <Leader><space>  :nohlsearch<cr>
nmap <c-R> :CtrlPBufTag<cr>
nmap <Leader>2 :CtrlPMRUFiles<cr>
nmap <Leader>f :tag<space>

"----- buffers -----"
nmap <leader>d :bd<cr>                              " delete current buffer
nmap <leader>ls :ls<cr>                             " list all buffers




"----- Movement keys -----"
noremap ; l
noremap l k
noremap k j
noremap j h
"-------------------------"

nnoremap pwd :pwd<cr>					            " quick pwd call
inoremap jj <esc>					                " exit insert mode
nmap <leader>w :w<cr> 				            	" quick save
nmap <leader>d :bd<cr>				             	" quick buffer deletion


"//uto-commands---------"
"/Greeplace
"/
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

"//
"/vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>
"----------Plugins-------------"

let g:ctrlp_custom_ignore='node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let NERDTreeHijackNetrw=0
set tags=./tags,tags;$HOME

"---------Laravel-Specific---------"
nmap <Leader>pl :e ~/.vim/plugins.vim<cr>
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>nf :call PhpInsertUse()<CR>
                                   "Automatically source the Vimrc file on save"
augroup autosourcing
      autocmd!
      autocmd BufWritePost .vimrc source %
augroup END

"Notes and tips
"-Press 'zz' to instantly the line where the cursor is located.

"Press  'Ctrl+]' to go through the class or method and press 'Ctrl+6' to return back
"Press cst change to tag
"Press dst do delete the tag
"Press cs<some key> to change symbol
"mark down some place after press d'<some key> to delete all that stuff
"mark down some place after press v'<some key> to select all that stuff
" ,pf to format the code
"yyp to copy and paste to below and . to paste again and again
