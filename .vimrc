" Basics {
        set nocompatible
        set background=dark
        syntax on
        " change map leader
        let mapleader = "," 
        let g:mapleader = ","
        set nobackup
        filetype plugin on
        filetype indent on
        set history=700
        set nobackup
        set mouse=a
        set tabpagemax=128
	set number
" }

" Vim UI {
        set so=7
        set cursorline
        set incsearch
        set laststatus=2
        set linespace=0
        set matchtime=5
        set novisualbell
        set vb
        set scrolloff=10
        set showcmd
        set showmatch
        set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
        set guioptions-=m
        set guioptions-=T
        set guioptions-=L
        set guioptions-=r
        set guioptions-=b
        "set list listchars=tab:»·,trail:·
        set wildmenu
        set wildignore=*.o,*~,*.pyc
        set wildmode=list:longest
        set ruler
        set cmdheight=2
        set hid
        set backspace=indent,eol,start
        set whichwrap+=<,>,h,l
        set ignorecase
        nnoremap / /\v
        vnoremap / /\v
        set smartcase
        set infercase
        set hlsearch
        set gdefault
        nnoremap <leader><space> :noh<cr>
        nnoremap <tab> %
        vnoremap <tab> %
        set magic
        set noerrorbells
        set novisualbell
        set t_vb=
        set tm=500
        set nobackup
        set nowb
        set noswapfile
        set guifont=Inconsolata\ for\ Powerline\ 10
" }

" Text Formatting/Layout {
        set shiftwidth=8
        set tabstop=8

        set t_Co=256
        " colorscheme twilight
        set background=dark

        " if has("gui_running")
        "        set guioptions-=T
        "        set guioptions+=e
        "        set guitablabel=%M\ %t
        "        colorscheme codeschool
        " endif

        set encoding=utf8
        set ffs=unix,dos,mac
" }

" Folding {
        set foldenable
        set foldmarker={,}
        set foldmethod=marker
        set foldlevel=100
        set foldopen=block,hor,mark,percent,quickfix,tag
" }

" Formatting {
        set nowrap
        set autoindent
        set shiftwidth=8
        set tabstop=8
        set softtabstop=8
" }

" Bundles {
" }

"" Cscope {
if has("cscope")
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.

        if (filereadable("cscope.out"))
                execute "cs add cscope.out"
        else
                let s:dirs = split(getcwd(), "/")
                while s:dirs != []
                        let s:path = "/" . join(s:dirs, "/")
                        if (filereadable(s:path . "/cscope.out"))
                                execute "cs add " . s:path . "/cscope.out " . s:path
                                break
                        endif
                        let s:dirs = s:dirs[:-2]
                endwhile
        endif

        set csto=0
        set cst
        set csverb

        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

        map <F10> :copen<CR>
        map <F11> :cprevious<CR>
        map <F12> :cnext<CR>

        " Open a quicfix window for the following queries.
        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif
" }


" Mappings {
        nnoremap <F6> :NERDTreeToggle<CR>
        map <C-n> :NERDTreeToggle<CR>
        map <F9>e :!p4 edit '%'<CR>

        " Window movement
        map <C-j> <C-W>j
        map <C-k> <C-W>k
        map <C-h> <C-W>h
        map <C-l> <C-W>l
       
        " Comment out a line by #
        nnoremap <C-C> 0i#<Esc>

        " Switch CWD to the directory of the open buffer
        map <leader>cd :cd %:p:h<cr>:pwd<cr>

        " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
        nmap <M-j> mz:m+<cr>`z
        nmap <M-k> mz:m-2<cr>`z
        vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
        vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`zv

        " Pressing ,ss will toggle and untoggle spell checking
        map <leader>ss :setlocal spell!<cr>

        " Shortcuts using <leader>
        map <leader>sn ]s
        map <leader>sp [s
        map <leader>sa zg
        map <leader>s? z=

        " Disable arrow keys
        " nnoremap <up> <nop>
        " nnoremap <down> <nop>
        " nnoremap <left> <nop>
        " nnoremap <right> <nop>
        " inoremap <up> <nop>
        " inoremap <down> <nop>
        " inoremap <left> <nop>
        " inoremap <right> <nop>
        " nnoremap j gj
        " nnoremap k gk

        " No, I don't want help
        inoremap <F1> <ESC>
        nnoremap <F1> <ESC>
        vnoremap <F1> <ESC>

        nnoremap <leader>a :Ack
" }


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" VS {
function FixVsTabs()
  let file_path=expand('%:p')
  let vs_proj_path="/opt/vs_projects"

  " VS counts a tab as four spaces, while vim counts it as eight
  " Use the VS convention, if we want to view files edited with it
  if l:file_path =~ l:vs_proj_path
    set ts=4
  endif
endfunction

autocmd BufEnter *.hpp,*.cpp :call FixVsTabs()
" }


colorscheme koehler
execute pathogen#infect()
set title
set fileformats=unix
set omnifunc=syntaxcomplete#Complete
set splitbelow
set splitright


