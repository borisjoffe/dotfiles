"set clipboard=unnamed		"normal keyboard behavior

set hlsearch
set showmatch

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
set showmode
set foldmethod=indent
set foldlevel=99

filetype off
execute pathogen#infect()
execute pathogen#helptags()

" filetype plugin on messes everything up and inserts garbage when pressing 'v'
" key in insert mode
" filetype plugin on
"filetype plugin indent on
syntax on

"set omnifunc=syntaxcomplete#Complete

" FIX JEDI VIM as soon as possible
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"\ "\<lt>C-n>" :
"\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
"imap <C-@> <C-Space>

let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufWinEnter * match ExtraWhitespace /\s\+$/

" ==== FILE TYPE SPECIFIC BEHAVIOR ====

autocmd BufRead,BufNewFile sl5x5.txt setfiletype workout
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufWritePost *.adoc\|*.ad\|*.asciidoc setfiletype asciidoc

" HTML
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
