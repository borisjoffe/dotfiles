"set clipboard=unnamed		"normal keyboard behavior

set hlsearch
set showmatch

set tabstop=4
set nu!
set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?	"for dvorak keyboard layout in command mode
set smartindent
set shiftwidth=4

" JSHint uses the SpellBad colors for errors which makes the text invisible
hi SpellBad	term=bold ctermbg=Red ctermfg=Green guibg=Red guifg=White

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set foldmethod=indent
set foldlevel=99

"filetype plugin on " filetype plugin on fucks everything up and inserts garbage when pressing 'v'
execute pathogen#infect()
execute pathogen#helptags()

" filetype plugin on fucks everything up and inserts garbage when pressing 'v'
" key in insert mode
"filetype plugin on  

" This doesn't work and autocompletes trash - does it? RETEST
" set omnifunc=syntaxcomplete#Complete

" FIX JEDI VIM as soon as possible
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"autocmd BufWritePost *.adoc *.ad :silent !asciidoc <afile>
autocmd BufWritePost *.adoc\|*.ad :silent !asciidoc <afile>
"autocmd BufWritePost *.adoc *.ad asciidoc <afile>
