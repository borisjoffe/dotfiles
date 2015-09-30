"set clipboard=unnamed		"normal keyboard behavior
set hlsearch
set showmatch
set showcmd
set showmode

set tabstop=4
set shiftwidth=4
set smarttab
set autoindent      " smartindent screws up indenting '#'

set nu!
set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?	"for dvorak keyboard layout in command mode
set smartcase

" JSHint uses the SpellBad colors for errors which makes the text invisible
hi SpellBad	term=bold ctermbg=Red ctermfg=Green guibg=Red guifg=White

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set foldmethod=indent
set foldlevel=99

" https://github.com/dag/vim-fish
if &shell =~# 'fish$'
	set shell=bash
endif

filetype off
execute pathogen#infect()
execute pathogen#helptags()

" filetype plugin on messes everything up and inserts garbage when pressing 'v'
" key in insert mode
" filetype plugin on
"filetype plugin indent on
syntax on
set term=xterm-256color " fix home and end keys and colors
"set t_ut=    " Background Color Erase
set background=dark

"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
let g:is_solarized=$SOLARIZED
if $SOLARIZED == 1
	colorscheme solarized
elseif $SOLARIZED == 2
	set background=light
	colorscheme solarized
else
	colorscheme elflord
endif

"set omnifunc=syntaxcomplete#Complete

" FIX JEDI VIM as soon as possible
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"\ "\<lt>C-n>" :
"\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
"imap <C-@> <C-Space>

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jsxhint_exec = 'jshint'
" let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:vim_json_syntax_conceal = 0

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufWinEnter * match ExtraWhitespace /\s\+$/

" ==== FILE TYPE SPECIFIC BEHAVIOR ====

autocmd BufRead,BufNewFile *.es6\|*.jsx\|*.ts\|.jshintrc setfiletype javascript
autocmd BufRead,BufNewFile *.adoc\|*.ad\|*.asciidoc setfiletype asciidoc

au FileType python setlocal expandtab
au FileType haskell setlocal expandtab

"autocmd BufWritePost *.adoc *.ad :silent !asciidoc <afile>
"autocmd BufWritePost *.adoc *.ad asciidoc <afile>

" disabled for now - don't need extra overhead
"autocmd BufWritePost *.adoc\|*.ad :silent !asciidoc <afile>
"autocmd BufWritePost *.md :silent !markdown <afile> > <afile>.html
"autocmd BufWritePost *.jade :silent !jade -P <afile> > /dev/null
"autocmd BufWritePost *.styl :silent !stylus <afile> > /dev/null

" Spellcheck
autocmd FileType text,markdown,asciidoc setlocal spell
autocmd FileType html,jade setlocal spell
autocmd FileType tex setlocal spell
autocmd FileType workout setlocal nospell

" copy/paste
command -range Cz :silent :<line1>,<line2>w !xsel -i -b
command -range Cx :silent :<line1>,<line2>w !xsel -i -p
command -range Cv :silent :<line1>,<line2>w !xsel -i -s
cabbrev cv Cv
cabbrev cz Cz
cabbrev cx Cx

command -range Pz :silent :r !xsel -o -b
command -range Px :silent :r !xsel -o -p
command -range Pv :silent :r !xsel -o -s

cabbrev pz Pz
cabbrev px Px
cabbrev pv Pv

" http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
"command! -nargs=1 Silent
"\ | execute ':silent !'.<q-args>
"\ | execute ':redraw!'

command! Adoc :silent execute "!asciidoc %" | redraw!
