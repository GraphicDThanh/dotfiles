call neobundle#append()

:syntax enable

NeoBundle 'editorconfig/editorconfig-vim' 
NeoBundle 'altercation/vim-colors-solarized'

" Improve neocomplete performance a bit
" Just look a head one word for auto completion.
" https://github.com/Shougo/neocomplete.vim/blob/master/doc/neocomplete.txt
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
end
    
let g:neocomplete#keyword_patterns['default'] = '\w'

let g:neocomplete#sources#syntax#min_keyword_length = 3

" the number of candidates displayed in the pop-up menu.
let g:neocomplete#max_list = 10

" Control the keywork length
let g:neocomplete#max_keyword_width = 30

let g:neocomplete#auto_completion_start_length = 3



" Multi-line editing feature like sublime text.
NeoBundle 'terryma/vim-multiple-cursors'

" Fix performance issue between multiple cursors vs. neocomplete
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
        exe 'NeoCompleteLock'
    endif
endfunction

function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
    endif
endfunction

" http://vimawesome.com/plugin/ctrlp-vim-state-of-grace
NeoBundle 'kien/ctrlp.vim'

" https://github.com/tpope/vim-dispatch
NeoBundle 'tpope/vim-dispatch'

" http://vimawesome.com/plugin/vim-case-convert
NeoBundle 'chiedojohn/vim-case-convert'


" http://vimawesome.com/plugin/omnisharp
NeoBundle 'nosami/Omnisharp'
let g:OmniSharp_selector_ui = 'unite'  " Use unite.vim"

" http://vimawesome.com/plugin/vim-coffee-script
NeoBundle 'kchmck/vim-coffee-script'
au BufRead,BufNewFile *.coffee setlocal filetype=coffee

" Add Jade syntaxhighlighting
" http://vimawesome.com/plugin/jade-vim
"NeoBundle 'digitaltoad/vim-jade'
au BufRead,BufNewFile *.jade setlocal filetype=jade

" NeoBundle 'cmaureir/snipmate-snippets-rst'
" Sets of RST snippets
NeoBundle 'cmaureir/snipmate-snippets-rst'

call neobundle#end()

 
" Make sure vim run in 256 colors
set t_Co=256
colorscheme molokai256


"set background=dark
"colorscheme solarized
"let g:solarized_termtrans=1

nnoremap ; :

" Quickly go to normal mode
inoremap jj <esc>

" Quickly save a file
inoremap zz <esc>:w<CR>

" Quickly reformat a whole paragraph
inoremap kk <esc>gqipi

" Quickly reformat the whole paragraph
nnoremap F Jgqip

" Wild ignore for Unity
set wildignore+=*.meta

" Wild ignore for python
set wildignore+=*.pyc

" Wild ignore for web development
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,solr/**,log/**,*.psd,*.PSD,.git/**
set wildignore+=.gitkeep,.gems/**
set wildignore+=*.ico,*.ICO,backup/**,*.sql,*.dump,*.tmp,*.min.js,Gemfile.lock
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif,*.pdf,*.PDF
set wildignore+=vendor/**,coverage/**,tmp/**,rdoc/**,*.BACKUP.*,*.BASE.*
set wildignore+=*.LOCAL.*,*.REMOTE.*,.sass-cache/**

" Wildignore for javascript/nodejs
set wildignore+=*/bower_components/*,*/node_modules/*

" Turns of auto word wrap.
" See http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set linebreak
set nolist
set formatoptions-=t
set formatoptions+=l

" Quickly reload vim
nnoremap <leader>sv :source $MYVIMRC<CR>   


" Wild ignore for Unity
set wildignore+=*.meta

" Wild ignore for python
set wildignore+=*.pyc

" Wild ignore for web development
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,solr/**,log/**,*.psd,*.PSD,.git/**
set wildignore+=.gitkeep,.gems/**
set wildignore+=*.ico,*.ICO,backup/**,*.sql,*.dump,*.tmp,*.min.js,Gemfile.lock
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif,*.pdf,*.PDF
set wildignore+=vendor/**,coverage/**,tmp/**,rdoc/**,*.BACKUP.*,*.BASE.*
set wildignore+=*.LOCAL.*,*.REMOTE.*,.sass-cache/**

" Wildignore for javascript/nodejs
set wildignore+=*/bower_components/*,*/node_modules/*


" Just enjoy my very first vim function
" This function convert a line into a snake variable
function! LineToRstLabelFunc(start_line, end_line)

    let search_for = '\s\+'
    let replace_with = '_'
    let modifiers = 'ge'

    " Duplicates and paste above
    normal! yyP

    " Selects the whole new line
    normal! 0v$

    exec a:start_line . "," . a:end_line . "s#" . search_for . '#' . replace_with . "#" . modifiers

    let lnum = line('.')
    let line = getline(lnum)
    let line = '.. _' . tolower(line) . ':'
    call setline(lnum, line)

endfunction               

command! -range -bang LineToRstLabel call LineToRstLabelFunc(<line1>, <line2>)
 
