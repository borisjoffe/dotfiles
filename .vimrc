set nocompatible
set nomodeline

"set clipboard=unnamed		"normal keyboard behavior
set hlsearch
set showmatch
set showcmd
set showmode

set laststatus=2
set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=%y        " Filetype of the file

set tabstop=4
set shiftwidth=4
set smarttab
set autoindent      " smartindent screws up indenting '#'

set wrap
set textwidth=79
set formatoptions=qronwc1
set colorcolumn=80
set linebreak 		" soft wrap. list option must be off for this to work

set number
"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?	"for dvorak keyboard layout in command mode
set ignorecase
set smartcase

set wildmenu

set encoding=utf-8

" JSHint uses the SpellBad colors for errors which makes the text invisible
hi SpellBad	term=bold ctermbg=Red ctermfg=Green guibg=Red guifg=White

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set foldmethod=indent
set foldlevel=99

let mapleader=" "
nmap s :
"nmap

"let <leader>

"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

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

set tags=./tags,tags;$HOME

"set omnifunc=syntaxcomplete#Complete

" FIX JEDI VIM as soon as possible
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"\ "\<lt>C-n>" :
"\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
"imap <C-@> <C-Space>

" Statusline must be set after colorscheme
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_jsxhint_exec = 'eslint'
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_checkers = ['jshint', 'jscs']
" let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:vim_json_syntax_conceal = 0

let g:syntastic_typescript_checkers = ['tsc']
let g:syntastic_typescript_tsc_args = '--noEmitOnError --noImplicitAny --strictNullChecks'
let g:typescript_indent_disable = 1

let g:syntastic_python_python_exec = '/usr/bin/python'
let g:syntastic_python_checkers = ['flake8']
autocmd BufRead,BufNewFile,BufWritePost *.py :if getline(1) =~# '^#!.*python2' | let g:syntastic_python_flake8_exec = 'flake8-python2' | endif

"let g:syntastic_html_tidy_exec = ''
let g:syntastic_html_tidy_exec = 'tidy'
"fix config file not working
let g:syntastic_html_tidy_args = '-config /home/boris/.tidyrc'
"['tidy']
" temporarily disable until config file works
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_haskell_checkers = ['']

" Syntastic is extremely slow with these
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss', 'hs'] }

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufWinEnter * match ExtraWhitespace /\s\+$/


set nolist   " tab char too obtrusive. find way to make it more subtle
"set list
set listchars=tab:——       ",space:·eol:⏎,nbsp:?


" ==== FILE TYPE SPECIFIC BEHAVIOR ====

autocmd BufRead,BufNewFile *.es6\|*.jsx\|*.ts setfiletype javascript
autocmd BufRead,BufNewFile .jshintrc\|.eslintrc\|.babelrc  setfiletype json
autocmd BufRead,BufNewFile *.adoc\|*.ad\|*.asciidoc setfiletype asciidoc
autocmd BufRead,BufNewFile *.md\|*.markdown setlocal filetype=ghmarkdown
autocmd BufRead,BufNewFile .shellrc\|*.aliases setfiletype sh
autocmd BufRead,BufNewFile *.tsv setfiletype tsv

au FileType javascript setlocal smartindent
au FileType html setlocal smartindent
au FileType html.handlebars setlocal smartindent
au FileType css setlocal smartindent
au FileType python setlocal expandtab
au FileType haskell setlocal expandtab
au FileType tsv setlocal ts=13 sw=13 sts=13 nowrap  " nicer tsv columns


" Abbreviations

"" Abbreviations:JS
iabbr cl console.log(
iabbr cla console.log('ARGUMENTS:', arguments)
iabbr clt console.log('THIS:', this)
iabbr cw console.warn(
iabbr ce console.error(
iabbr cdr console.dir(
iabbr d; debugger
iabbr jst JSON.stringify(
iabbr jsp JSON.parse(
iabbr clok console.log(Object.keys(
iabbr ok( Object.keys(
iabbr tpo typeof

iabbr r( require('
iabbr =r( = require('
iabbr rfs const fs = require('fs')
iabbr ras const assert = require('assert')
iabbr ros const os = require('os')
iabbr rlg const l = require('log4js').getLogger('
iabbr r_ const _ = require('lodash')
iabbr rmo const moment = require('moment')
iabbr rt) const t = require('tcomb')
iabbr rj const Joi = require('joi')
iabbr rco const co = require('co')

iabbr us; 'use strict'
iabbr me= module.exports = () => {return {}}
iabbr fn function () {}
iabbr fn) function () {})
iabbr f( function (
inoreabbr f* function* () {}
inoreabbr f*( function* (
iabbr f*) function* () {})
iabbr fd( function (done) {
iabbr fd function (done) {})
iabbr ,f( , function (
iabbr ,fd( , function (done) {

" Testing
iabbr d( describe('
iabbr dsfn) describe('', function () {})
iabbr it( it('
iabbr itfn) it('', function (done) {done();})
iabbr bfn) before(function (done) {done();})
iabbr afn) after(function (done) {done();})
iabbr dn done()

iabbr co( return co(function* () {})
iabbr cob( return co(function* () {}.bind(this))
iabbr cotc( return co(function* () {}).then(done).catch(done)

iabbr lgt logger.trace(
iabbr lgd logger.debug(
iabbr lgi logger.info(
iabbr lgw logger.warn(
iabbr lge logger.error(
iabbr lgf logger.fatal(

iabbr aok assert.ok(
iabbr aeq assert.equal(
iabbr ade assert.deepEqual(

iabbr jo Joi.
iabbr ja Joi.assert(
iabbr jos Joi.string()
iabbr jno Joi.number()
iabbr joo Joi.object()
iabbr joa Joi.array()
iabbr jopt .options(joiOptions);

"" Abbreviations:CSS
iabbr imp! !important;

" Emmet - https://github.com/mattn/emmet-vim
" let g:user_emmet_install_global = 0
" autocmd FileType html,html.handlebars,css EmmetInstall

"au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

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
autocmd FileType gitcommit setlocal spell
"autocmd FileType workout setlocal nospell

" copy/paste
command! -range Cz :silent :<line1>,<line2>w !xsel -i -b
command! -range Cx :silent :<line1>,<line2>w !xsel -i -p
command! -range Cv :silent :<line1>,<line2>w !xsel -i -s
cabbrev cv Cv
cabbrev cz Cz
cabbrev cx Cx

command! -range Pz :silent :r !xsel -o -b
command! -range Px :silent :r !xsel -o -p
command! -range Pv :silent :r !xsel -o -s

cabbrev pz Pz
cabbrev px Px
cabbrev pv Pv

" http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
"command! -nargs=1 Silent
"\ | execute ':silent !'.<q-args>
"\ | execute ':redraw!'

command! Adoc :silent execute '!asciidoc %' | redraw!
command! PrettyJson %!python -m json.tool

command! R :silent :source ~/.vimrc

" Force save files as root
cmap w!! w !sudo tee > /dev/null %
