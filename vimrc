" Tim Holt's vimrc file
" Created probably in 2010, Idunno.
"   modified extensively continuously since then.
"
" This file is full of ‘*’ command ‘links’ __in_this_format.
"
" Free to use for anyone

"│-v-1 │ To-Do's
"└─────┴─────────
  " (not actually settings, just settings todo's)
  " TODO Look into the 'tabline' setting
  " TODO When numbers are off, change window width.
  "
  " TODO Use winnr("$"), winnr(), winfixwidth to create a better resize
    " This may be obsolete, but I don’t think it is—it’s still necessary when
    " not on a wide screen.
  " TODO Look into the conceal setting and this reddit thread:
  "   http://redd.it/okzja
  " TODO Extract multi-compatible font changing shpiel to a function, instead
  "      of repetitive if, else block.
  " TODO Make special vim characters into unicode symbols (like the
  "      window-dividers into box characters, and 'no line' characters into
  "      null-set characters.
  " TODO Have timdisplaymode switch display mode switched into!
  " TODO look into changing “__keyword” style ‘links’ herein to actual tag
  "      links
  " TODO Maybe try YouCompleteMe plugin.
  " TODO Look into NeoComplete and vim-marching, from this:
  "           http://www.reddit.com/r/vim/comments/1p0u0j/n/ccxlgc6
  " TODO Get reedes/vim-textobj-quote working, or at least post about it not
  "      working

"│-v-1 │ “precedence” necessaries.
"└─────┴───────────────────────────
  if exists('+shellslash')
    set shellslash
  endif

  " Expand the runtime path to a global, cloud-based location.
  set runtimepath+=$HOME/Dropbox/Vim/GlobalRuntimePath

  "For virtually everything, and sanity in general:
  set nocompatible
  filetype plugin on

  "For that which __requires_utf_8:
  set encoding=utf8

  " Note: Make sure to link here from _every_ line that has a prerequisite,
  " and from every location in this file where the prerequisite would more
  " naturally be categorized.

  "│-v-2 │ Leader Key settings
  "└─────┴─────────────────────
  " See __mapleader_settings
    let mapleader = "\<space>"

"│-v-1 │ Plug-in Settings
"└─┬───┴─┬────────────────
  "│-v-2 │ plug-in manager (neobundle)
  "└─────┴─────────────────────────────
    " TODO Evaluate using VAM or vim-flavor instead.
    "" precedence necessaries for neobundle: ─────────────────────────────-v-3
    if has('vim_starting')
      set runtimepath+=~/.vim/neobundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/.vim/neobundle/'))

    " Let NeoBundle manage NeoBundle
    NeoBundleFetch 'Shougo/neobundle.vim'

    "" Plugins from the nice people of the Vim community: ────────────────-v-3

    NeoBundle 'PProvost/vim-ps1' " ────────── Syntax, etc, for powershell
    NeoBundle 'Shougo/unite.vim' " ────────── UI and search
    NeoBundle 'SirVer/ultisnips', 'release' " ─── powerful snippets
    NeoBundle 'Valloric/YouCompleteMe' " ──── Powerful c-family lang completion
    NeoBundle 'aaronbieber/vim-vault' " ───── password manager-ness
    NeoBundle 'bling/vim-airline' " ───────── status line with shiny stuff
    NeoBundle 'bpstahlman/txtfmt' " ───────── vim is now semi-WYSIWYG!
    NeoBundle 'dawikur/algorithm-mnemonics.vim' " ── snippets for C++ algorithms
    NeoBundle 'derekwyatt/vim-fswitch' " ──── alternates between .cpp & .h
    NeoBundle 'fboender/bexec' " ──────────── Execute the current buffer.
    NeoBundle 'gisraptor/vim-lilypond-integrator' " ── lilypond file syntax etc.
    NeoBundle 'junegunn/vader.vim' " ──────── Unit test suite for VimL
    NeoBundle 'kshenoy/vim-signature' " ───── Show marks on the left
    NeoBundle 'ludovicchabant/vim-gutentags' " ── Tag manager
    NeoBundle 'luochen1990/rainbow' " ─────── matching brackets match colors
    NeoBundle 'majutsushi/tagbar' " ───────── tag explorer
    NeoBundle 'mbbill/undotree' " ───────── view undo history as a tree
    NeoBundle 'mhinz/vim-startify' " ──────── covenient Vim start screen
    NeoBundle 'octol/vim-cpp-enhanced-highlight' " ── Improved C++ highlighting
    NeoBundle 'scrooloose/nerdcommenter' " ── handle auto-commenting lines
    NeoBundle 'scrooloose/nerdtree' " ─────── Tree file explorer
    NeoBundle 't9md/vim-choosewin' " ──────── “random access” window navigation
    NeoBundle 'tmhedberg/SimpylFold' " ────── simple Python syntax folding
    NeoBundle 'tpope/vim-surround' " ──────── change surroundings (e.g. {})
    NeoBundle 'vimwiki/vimwiki' " ─────────── personal wiki in vim
    NeoBundle 'w0rp/ale' " ────────────────── Asynchronus Lint Engine
    " Because they’re compatible with vim-airline:
    NeoBundle 'ludovicchabant/vim-lawrencium' " ── Mercurial integration
    NeoBundle 'tpope/vim-fugitive' " ──────── git integration
    " Used by vim-surround:
    NeoBundle 'tpope/vim-repeat' " ────────── makes some plugins .-able
    " Used by ultisnips:
    NeoBundle 'honza/vim-snippets' " ──────── snippets for ultisnips

    " TODO: get this working
    "NeoBundle 'kkoenig/wimproved.vim', {
    "  \ 'build' : {
    "  \     'build_commands' : 'cmake',
    "  \     'windows' : 'cmake -G ^"NMake Makefiles^" . ^&^& nmake',
    "        " Or try switching shell to powershell (& back, if necessary)
    "        " (still didn’t work from actual Powershell)
    "  \     'windows' : '^(cmake -G ^"NMake Makefiles^" .^) -and ^(nmake^)',
    "  \    },
    "  \ }

    "" Color Schemes: ────────────────────────────────────────────────────-v-3

    NeoBundle 'sjl/badwolf' " ─────────────── ★★★★★ Beautiful & subdued

    " unrated:
    NeoBundle 'noahfrederick/vim-hemisu' " ── some colorscheme or other
    " TODO: fix this:
    "NeoBundle 'bdesham/biogoo', {'lazy' : 1, 'directory' : '~/.vim/bundle/biogoo/colors'} " ──────────── 

    "" My own plugins: ───────────────────────────────────────────────────-v-3
    NeoBundle 'bitbucket:atimholt/my_vimrc_extended',
       \ {'rev' : 'f1dd0c03f31c',
       \ 'type': 'hg',
       \ 'directory': 'my_vimrc_extended'}
    NeoBundle 'bitbucket:atimholt/ArrowKeyRepurpose', {'type': 'hg'}
    NeoBundle 'bitbucket:atimholt/UltiSnipsSnippets', {'type': 'hg'}
    NeoBundle 'bitbucket:atimholt/spiffy_foldtext', {'type': 'hg'}

    "" Same thing as Pathogen plugin manager: ────────────────────────────-v-3
    " Here for messing with stuff not ready for the light of day, or just
    " for messing around with.
    NeoBundleLocal ~/.vim/bundle
    NeoBundleLocal ~/Dropbox/Vim/GlobalRuntimePath/bundle/

    "" Plugins to try: ───────────────────────────────────────────────────-v-3

    " Not totally sure:
    "NeoBundle 'git://git.wincent.com/command-t.git'
    "NeoBundle 'kien/ctrlp.vim'
    "NeoBundle 'git://repo.or.cz/vcscommand'

    " replaces vim-signature:
    "NeoBundle 'jeetsukumaran/vim-markology' " ── Show marks on the left
    "
    " replaces fswitch:
    "NeoBundle 'ivan-cukic/vim-ctrlp-switcher' " ── Alternates between similarly named files
    "
    
    " Full screen in Windows. doesn't quite just work out of the box.
    "NeoBundle 'kkoenig/wimproved.vim', {
    "  \ 'build' : {'windows' : 'cmake -G "NMake Makefiles" . && nmake'}}
    "  " ───── Full screen in Windows

    "" Finishing up: ─────────────────────────────────────────────────────-v-3

    call neobundle#end()

    filetype plugin indent on
    NeoBundleCheck

  "│-v-2 │ Individual plug-ins
  "└─┬───┴─┬───────────────────
    "│-v-3 │ airline
    "└─────┴─────────
      if !exists('g:airline_symbols')
        let g:airline_symbols = {}
      endif

      let g:airline_left_sep = '⮀'
      let g:airline#extensions#tabline#left_sep = '⮀'
      let g:airline_left_alt_sep = '⮁'
      let g:airline#extensions#tabline#left_alt_sep = '⮁'
      let g:airline_right_sep = '⮂'
      let g:airline#extensions#tabline#right_sep = '⮂'
      let g:airline_right_alt_sep = '⮃'
      let g:airline#extensions#tabline#right_alt_sep = '⮃'
      let g:airline_symbols.branch = '⭠'
      let g:airline_symbols.readonly = '⭤'
      let g:airline_symbols.linenr = '⭡'

      "Trying this one:
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
      let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
      let g:airline#extensions#whitespace#enabled = 0

      let g:airline_section_z="%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#:%3c [%02B]"
      let g:airline#extensions#tabline#show_buffers = 0
      let g:airline#extensions#tabline#tab_min_count = 2
      let g:airline#extensions#tabline#tabs_label = ''
      let g:airline#extensions#tabline#show_close_button = 0
      let g:airline#extensions#tabline#show_tab_type = 1

      let g:airline#extensions#gutentags#enabled = 1

    "│-v-3 │ ALE
    "└─────┴─────
      nmap <a-a>t <Plug>(ale_toggle)
      nmap <a-a>d <Plug>(ale_detail)
      nmap <a-k> <Plug>(ale_previous)
      nmap <a-j> <Plug>(ale_next)

      " Not actually ALE, but oh well
      function! g:DiffWithClangTidyOutput()
        if &mod
          echoerr "Buffer is not saved! clang-tidy uses the file!"
          return
        endif
        exe "normal \<c-w>s\<c-w>T"

        let s:preserved_autoread = &l:autoread
        setlocal autoread
        silent !clang-tidy -fix %
        edit
        let &l:autoread = s:preserved_autoread

        let l:file_name = expand('%:t:r')
        let l:file_extension = expand('%:e')
        let l:file_type = &ft
        let l:tidied_buffer_name = l:file_name . ".tidied." . l:file_extension

        %yank
        let l:yanked_buffer = @"
        normal u
        vnew
        let b:ale_enabled = 0

        if bufnr(l:tidied_buffer_name) == -1
          exe "silent! file" l:tidied_buffer_name
          let &ft = l:file_type
        else
          exe "silent! buffer" l:tidied_buffer_name
          setlocal ma noro
          %delete
        endif

        let @" = l:yanked_buffer
        put!
        let @" = 'Yank buffer was eaten by a gru.'

        normal Gdd
        silent! call ClangFormatWholeBuffer()
        normal gg
        setlocal nomod noma ro
        normal zR
        normal \<c-w>hgg
        silent! windo diffthis
      endfunction
      nnoremap <silent> <a-a>D :call g:DiffWithClangTidyOutput()<cr>

    "│-v-3 │ Arrow Key Repurpose
    "└─────┴─────────────────────
      let g:ArrowKeyRepurp_settings = {}
      let g:ArrowKeyRepurp_settings.smart_space_mode = "always"

    "│-v-3 │ FSwitch
    "└─────┴─────────
      nmap <silent> <Leader>of :FSHere<cr>
      nmap <silent> <Leader>ol :FSRight<cr>
      nmap <silent> <Leader>oL :FSSplitRight<cr>
      nmap <silent> <Leader>oh :FSLeft<cr>
      nmap <silent> <Leader>oH :FSSplitLeft<cr>
      nmap <silent> <Leader>ok :FSAbove<cr>
      nmap <silent> <Leader>oK :FSSplitAbove<cr>
      nmap <silent> <Leader>oj :FSBelow<cr>
      nmap <silent> <Leader>oJ :FSSplitBelow<cr>

    "│-v-3 │ Full-Screen Mode Settings
    "└─────┴───────────────────────────
      function! ToggleFullScreen()
        if has('win32')
          :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
        endif
      endfunction

      "" Mappings: ───────────────────────────────────────────────────-v-4
      map <silent> <F11> <Esc>:call ToggleFullScreen()<CR>

    "│-v-3 │ NERDTree
    "└─────┴──────────
      let NERDTreeShowHidden = 1
      let NERDTreeShowLineNumbers = 1
      autocmd FileType nerdtree setlocal number relativenumber

      let NERDTreeMapCloseDir='zc'
      let NERDTreeMapCloseChildren='zC'

      "TODO: consider a mapping for easily opening a NERDTree window

    "│-v-3 │ Undotree Settings
    "└─────┴────────────────
      let g:undotree_SetFocusWhenToggle=1
      let g:undotree_SplitWidth=40

      " May as well try this again.
      if has("persistent_undo")
        set undodir='~/.undodir/'
        set undofile
      endif

      "" Mappings: ───────────────────────────────────────────────────-v-4
      nnoremap <silent> <leader>u :UndotreeToggle<cr>

    "│-v-3 │ Rainbow Parentheses Settings
    "└─────┴──────────────────────────────
      " Settings apply to the luochen1990 version.
      let g:rainbow_active = 1

      function! RainbowOff()
        if exists('b:rainbow_loaded')
          call rainbow_main#clear()
        endif
      endfunction

      au BufEnter *.vault call RainbowOff()
      au BufEnter *.wiki call RainbowOff()

      "" Mappings: ───────────────────────────────────────────────────-v-4
      nnoremap <silent> <leader>r :RainbowToggle<cr>

    "│-v-3 │ Startify
    "└─────┴──────────
      let g:startify_list_order = [
                 \ [' Sessions'], 'sessions',
                 \ [' Bookmarks'], 'bookmarks',
                 \ [' Recent Files (current directory)'], 'dir',
                 \ [' Recent Files'], 'files']

      let g:startify_skiplist = [
                 \ 'COMMIT_EDITMSG',
                 \ $VIMRUNTIME .'/doc',
                 \ 'C:/Program Files (x86)/vim/doc',
                 \ 'neobundle/.*/doc',
                 \ '\.DS_Store',
                 \ 'smb-share'
                 \ ]

      let g:startify_bookmarks = ['~/dot_files/vimrc', '~/Dropbox/.tim.vault']
      let g:startify_session_dir = '~/.vim/neobundle/my_vimrc_extended/Sessions'

      let g:startify_files_number = 5
      "let g:startify_custom_indices
      let g:startify_custom_header = []
      let g:startify_custom_footer = ["",
          \ "  Current instance started: " . strftime("%Y-%m-%d %a %I:%M %p")]
      let g:startify_restore_position = 1
      let g:startify_session_savevars = [
             \ 'g:startify_session_savevars',
             \ 'g:startify_session_savecmds'
             \ ]

    "│-v-3 │ Surround
    "└─────┴──────────
      " lenticular brackets
      let g:surround_{char2nr("l")} = "〖\r〗"
      " directional quotes
      let g:surround_{char2nr("q")} = "“\r”"
      " single directional quotes
      let g:surround_{char2nr("a")} = "‘\r’"
      " txtfmt italics delimiters
      let g:surround_{char2nr("i")} = "\r"

    "│-v-3 │ Tagbar
    "└─────┴────────
      " map_showproto used <space> (my <leader>), and map_help used '?'.
      let g:tagbar_map_help = '<F1>'
      let g:tagbar_map_showproto = '?'

      let g:tagbar_width = 40
      let g:tagbar_zoomwidth = 0
      let g:tagbar_show_linenumbers = 2
      let g:tagbar_autopreview = 1

      nnoremap <silent> <a-t>/ :TagbarOpenAutoClose<cr>
      nnoremap <silent> <a-t>t :TagbarToggle<cr>

    "│-v-3 │ UltiSnips Settings
    "└─────┴────────────────────
      let g:UltiSnipsSnippetsDir = "~/Dropbox/Vim/GlobalRuntimePath/UltiSnipsSnippets/"
      let g:UltiSnipsSnippetDirectories=["UltiSnips", "UltiSnipsSnippets"]
      let g:UltiSnipsEditSplit = "horizontal"
      let g:UltiSnipsUsePythonVersion = 3

      " Wasn't compatible with digraphs, so I thought I'd try a remap.
      " Also wasn't compatible with my custom use of <s-tab>, even though it
      " is after a reestablishment of said custom use, so there you go.
      let g:UltiSnipsExpandTrigger="<c-t>"
      let g:UltiSnipsJumpForwardTrigger="<c-l>"
      let g:UltiSnipsJumpBackwardTrigger="<c-h>"

      "" Mappings: ───────────────────────────────────────────────────-v-4
      nnoremap <leader>U :UltiSnipsEdit<cr>

    "│-v-3 │ vim-signature
    "└─────┴───────────────
      nnoremap <silent> <leader>m :SignatureToggleSigns<cr>

    "│-v-3 │ vim-vault
    "└─────┴───────────
      if has('win32')
        :let g:vault_password_command = 'python "\Program Files (Manually Installed)\pyxkcdpass\pyxkcdpass.py"'
      endif

    "│-v-3 │ vimwiki Settings
    "└─────┴──────────────────
      let g:vimwiki_folding = 'expr'

      let wiki_1 = {}
      let wiki_1.path = '~/Dropbox/Vim/vimwiki/'
      let wiki_1.nested_syntaxes = {'c++': 'cpp', 'asm': 'asm', 'sh': 'sh'}

      let wiki_2 = {}
      let wiki_2.path = '~/Documents (Actual)/Inhuman Universe/wiki/'
      let wiki_2.index = 'index'
      let wiki_2.auto_toc = 1
      let wiki_2.auto_tags = 1
      let wiki_2.maxhi = 1

      let wiki_3 = {}
      let wiki_3.path = '~/Dropbox/code/zigzagdungeon/productionwiki/'

      " The old Inhuman Universe wiki
      "let wiki_4 = {}
      "let wiki_4.path = '~/Dropbox/timwrite/vimfriendly/Inhuman_Universe/wiki/'

      let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

      let g:vimwiki_dir_link = 'main_page'

      "" Mappings: ───────────────────────────────────────────────────-v-4
      nnoremap <leader># :VimwikiTable<cr>
      nnoremap <F13> :VimwikiAll2HTML<cr>
      nnoremap <F14> :Vimwiki2HTMLBrowse<cr>
      nnoremap <F15> :VimwikiTOC<cr>

    "│-v-3 │ Wimproved
    "└─────┴───────────
      " Not actually working
      "autocmd GUIEnter * silent! WToggleClean

    "│-v-3 │ YouCompleteMe
    "└─────┴───────────────
      let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
      let g:ycm_filetype_specific_completion_to_disable = {
            \ 'gitcommit': 1,
            \ 'hgcommit': 1
            \}
      let g:ycm_collect_identifiers_from_tags_files = 1
      let g:ycm_seed_identifiers_with_syntax = 1
      let g:ycm_autoclose_preview_window_after_insertion = 1
      let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']

"│-v-1 │ Set-up
"└─┬───┴─┬──────
  "│-v-2 │ Behavior
  "└─┬───┴─┬────────
    "│-v-3 │ “meta” (settings settings)
    "└─────┴────────────────────────────

      " Quick settings access
      function! g:EditSettings()
        tabedit ~/.vim/neobundle/my_vimrc_extended/
        vsplit ~/dot_files/vimrc
        set number relativenumber
        vertical resize 120
        normal `.
        normal zx
      endfunction

      "" Mappings: ───────────────────────────────────────────────────────-v-4
      nnoremap <silent> <F2> :call g:EditSettings()<cr>

    "│-v-3 │ Tweakings/Feature Settings
    "└─┬───┴─┬──────────────────────────
      "│-v-4 │ Intended/Built-In Settings
      "└─┬───┴─┬──────────────────────────
        "│-v-5 │ Editing Settings
        "└─────┴──────────────────
          " TODO: set some of these in ftplugin
          set expandtab
          set shiftwidth=0
          set softtabstop=4
          set tabstop=4
          set backspace=indent,eol,start
          set ruler
          set nojoinspaces
          :syntax enable
          :set cindent

          :set switchbuf=useopen,usetab,newtab

          " Allows the closing of buffers without saving.
          set hidden

          " allows cursor position past true end of line
          set virtualedit=all

          " Whether jumping to another line (like with "G") goes to the start
          " of the line, or tries to stay in the same column.
          set nostartofline

          set directory=~/temp/vim_swaps

        "│-v-5 │ vimdiff settings
        "└─────┴──────────────────
          set diffopt=filler,vertical,context:3,foldcolumn:0

        "│-v-5 │ Spelling
        "└─────┴──────────
          set spelllang=en_us,eo,es

        "│-v-5 │ Status Line
        "└─────┴─────────────
          "Old tries at it, for reference:
          ":set statusline=%F%m%r%h%w\ (%{&ff})\ typ:%Y\ ASCII=\%04.8b\ HEX=\%04.4B\ %l,%v %p%%\ LEN=%L
          "set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]

          " For when AirlineToggle is off
          set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%02B]

          set laststatus=2
            " “The value of this option influences when the
            " last window will have a status line…”

        "│-v-5 │ WildMenu
        "└─────┴──────────
          set wildmode=longest,list,full
          set wildmenu

        "│-v-5 │ persistent undo
        "└─────┴─────────────────
          set undofile
          set undodir=~/Dropbox/Vim/vim_undo_files

        "│-v-5 │ search settings
        "└─────┴─────────────────
          set ignorecase
          set smartcase
          set gdefault
          set incsearch
          set hlsearch
          " Mappings (@__search_mappings):
          " - Switch off search highlighting.

        "│-v-5 │ netrw settings
        "└─────┴────────────────
          let g:netrw_liststyle=3

        "│-v-5 │ Custom Digraph Settings
        "└─────┴─────────────────────────
        " Esperanto: ─────────────────────────────────────────────────────-v-6
          :digraph Cx 264
          :digraph cx 265
          :digraph Gx 284
          :digraph gx 285
          :digraph Hx 292
          :digraph hx 293
          :digraph Jx 308
          :digraph jx 309
          :digraph Sx 348
          :digraph sx 349
          :digraph Ux 364
          :digraph ux 365

        " Graphical, dark diamond suit and dark heart suit: ──────────────-v-6
          :digraph cD 9830
          :digraph cH 9829

        " Some assorted punctuation: ─────────────────────────────────────-v-6
          "ellipsis
          :digraph .. 8230

          "small bullet
          :digraph ** 8729

          "Directional quotes
          :digraph \", 8220
          :digraph \". 8221
          :digraph ', 8216
          :digraph '. 8217

          "Bullet
          :digraph .b 8226

          "Interrobang
          :digraph ?! 8253

        " Some math stuff: ───────────────────────────────────────────────-v-6
          "funcapply, for immediately after a function name and before its
          "arguments
          :digraph fa 8289

        " lower case superscript letters: ────────────────────────────────-v-6
        " (ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻ)
          :digraph aS 7491
          :digraph bS 7495
          :digraph cS 7580
          :digraph dS 7496
          :digraph eS 7497
          :digraph fS 7584
          :digraph gS 7501
          :digraph hS 688
          :digraph iS 8305
          :digraph jS 690
          :digraph kS 7503
          :digraph lS 737
          :digraph mS 7504
          :digraph nS 8319
          :digraph oS 7506
          :digraph pS 7510
          " No superscript “q” in unicode
          " :digraph qS
          :digraph rS 691
          :digraph sS 738
          :digraph tS 7511
          :digraph uS 7512
          :digraph vS 7515
          :digraph wS 695
          :digraph xS 739
          :digraph yS 696
          :digraph zS 7611

        "│-v-5 │ augmented filetype detection
        "└─────┴──────────────────────────────
          au BufRead .hgignore set ft=hgignore
          au BufRead .md set ft=markdown

        "│-v-5 │ Window Split settings
        "└─────┴───────────────────────
          set splitright

      "│-v-4 │ Encryption Settings
      "└─────┴─────────────────────
        set cm=blowfish2

      "│-v-4 │ Customized behavior
      "└─┬───┴─┬───────────────────
        "│-v-5 │ (function) EchoToggle
        "└─────┴───────────────────────
          " For any local toggle setting
          function! g:EchoToggle(...)
            :execute "set " . a:1 . "!"
            :execute "if &l:" . a:1
              echo (a:0 == 1 ? a:1 : a:2) "ON"
            else
              echo (a:0 == 1 ? a:1 : a:2) "OFF"
            endif
          endfunction
        "│-v-5 │ (function BufInTab
        "└─────┴────────────────────
          "Tests whether a buff with the given name is in the tab.
          function! g:BufInTab(...)
            let s:current_tabpagebuflist = tabpagebuflist()
            for i in s:current_tabpagebuflist
              if bufname(i) == a:1
                return 1
              endif
            endfor
            return 0
          endfunction

        "│-v-5 │ (function) Box character (turburul) hax
        "└─────┴─────────────────────────────────────────
          " This:
          " r---—v-,
          " |    | |
          " >----+-<
          " |    | |
          " >————+—<
          " |    | |
          " L----^—’
          "
          " Becomes This:
          " ┌────┬─┐
          " │    │ │
          " ├────┼─┤
          " │    │ │
          " ├────┼─┤
          " │    │ │
          " └────┴─┘
        " (mapping @__box_characters_mapping)
          function! g:BoxCharacters()
            :'<,'>s'r'┌'e
            :'<,'>s','┐'e
            :'<,'>s'’'┘'e
            :'<,'>s/'/┘/e
            :'<,'>s'L'└'e

            :'<,'>s'|'│'e
            :'<,'>s'-'─'e
            :'<,'>s'—'─'e
            :'<,'>s'+'┼'e

            :'<,'>s'\^'┴'e
            :'<,'>s'>'├'e
            :'<,'>s'v'┬'e
            :'<,'>s'T'┬'e
            :'<,'>s'<'┤'e
          endfunction

          "" Mappings: ───────────────────────────────────────────────────-v-6
          vnoremap <silent> <leader>x :call g:BoxCharacters()<cr>

        "│-v-5 │ (function) switch off & preserve relnum state
        "└─────┴───────────────────────────────────────────────
          function! g:OffRelNumPreserve()
            let w:preserved_rnu = &relativenumber
            let w:preserved_nu = &number

            set norelativenumber
            if w:preserved_rnu || w:preserved_nu
              set number
            endif
          endfunction

          function! g:RestoreRelNum()
            if exists('w:preserved_rnu')
              let &relativenumber = w:preserved_rnu
            endif
            if exists('w:preserved_nu')
              let &number = w:preserved_nu
            endif
          endfunction

          "" Auto Commands: ──────────────────────────────────────────────-v-6
          au WinLeave * call g:OffRelNumPreserve()
          au WinEnter * call g:RestoreRelNum()

        "│-v-5 │ (function) Insert contrary tabs
        "└─────┴─────────────────────────────────
          " Inserts tabs when &expandtab, spaces when &noet
          function! g:InsertContraryTabs()
            if &et
              normal i	la
            else
              exe ':normal i' . repeat(' ', &ts) . 'la'
            endif
          endfunction

          "" Mappings: ───────────────────────────────────────────────────-v-6
          inoremap <silent> <s-tab> <c-o>:call g:InsertContraryTabs()<cr>

        "│-v-5 │ (function) Toggle both line numberings
        "└─────┴────────────────────────────────────────
          function! g:ToggleBothNums()
            if &relativenumber && &number
              set norelativenumber nonumber
            else
              set relativenumber number
            endif
          endfunction

          "" Mappings: ───────────────────────────────────────────────────-v-6
          nnoremap <silent> <leader>nr :set relativenumber!<cr>
          nnoremap <silent> <leader>na :set number!<cr>
          nnoremap <silent> <leader>nn :call g:ToggleBothNums()<cr>

        "│-v-5 │ (function) :cd between current file's directory and global cwd
        "└─────┴────────────────────────────────────────────────────────────────
          function! g:LocalFileCDToggle()
            if !exists('w:global_cwd')
              let w:global_cwd = getcwd()
              lcd %:p:h
            else
              exe 'lcd' w:global_cwd
              unlet w:global_cwd
            endif
          endfunction

          "" Mappings: ───────────────────────────────────────────────────-v-6
          nnoremap <leader>d :call g:LocalFileCDToggle()<cr>

        "│-v-5 │ (function) vsplit with a file in a parallel directory structure
        "└─────┴─────────────────────────────────────────────────────────────────
          function! g:ParallelVSplit()
            if !exists('g:other_wd')
              echom "No g:other_wd set!"
            else
              exe "vsplit " . g:other_wd . "/" . expand("%:p:.")
            endif
            windo difft
            normal zR
            echom "Diff is on!"
          endfunction

          function! g:CurrentNetrwIsParallelDir()
            if expand("%") =~? "netrwtreelisting"
              let g:other_wd = substitute(getline(3), '^\"\s\+', "", "")
            else
              echom "Current window is not a Netrw listing!"
            endif
          endfunction

          "" Mappings: ───────────────────────────────────────────────────-v-6
          nnoremap <silent> <leader>/ :call g:ParallelVSplit()<cr>
          nnoremap <silent> <leader><Bslash> :call g:CurrentNetrwIsParallelDir()<cr>

        "│-v-5 │ (function) Mercurial diff two changesets completely
        "└─────┴─────────────────────────────────────────────────────
          function! g:MyHGDiff(...)
            let l:use_working_dir = 1
            let l:stat_command = ""

            if a:0 == 0
              " Compare working directory to parent
              let l:stat_command = "hg stat"
            elseif a:0 == 1
              " Compare working directory to given rev
              let l:stat_command = "hg stat --rev " . a:1
            elseif a:0 == 2
              " Compare revs to each other
              let l:use_working_dir = 0
              let l:stat_command = "hg stat --rev " . a:1 . " --rev " . a:2
            endif

            let l:stat_output = split(system(l:stat_command), '\n')

            " Note: the string manipulation here works with exactly the kind
            " of output that ‘hg stat’ gives.
            for changed_file in l:stat_output
              let l:file_name = strpart(changed_file, 2)
              let l:diff_type = "none"
              let l:left_command = ""
              let l:right_command = ""
              let l:del_right_line1 = 0
              let l:del_left_line1  = 0

              if changed_file[0] == 'M'
                let l:diff_type = "full"

                if l:use_working_dir
                  let l:left_command = "vert sv " . l:file_name
                else
                  let l:left_command = "vnew " . l:file_name . " (rev " . a:2 . ") | "
                  let l:left_command .= "read !hg cat " . l:file_name
                  let l:left_command .= " --rev " . a:2
                  let l:del_left_line1 = 1
                endif

                let l:right_command = "read !hg cat " . l:file_name
                let l:del_right_line1 = 1
                if a:0 > 0
                  let l:right_command = "tabnew " . l:file_name . " (rev " . a:1 . ") | " . l:right_command
                  let l:right_command .= " --rev " . a:1
                else
                  let l:right_command = "tabnew " . l:file_name . " (last commit) | " . l:right_command
                endif

              elseif changed_file[0] == 'A'
                let l:diff_type = "partial"

                if l:use_working_dir
                  let l:left_command = "vert sv " . l:file_name
                else
                  let l:left_command = "vnew " . l:file_name . " (rev " . a:2 . ") | "
                  let l:left_command .= "read !hg cat " . l:file_name
                  let l:left_command .= " --rev " . a:2
                  let l:del_left_line1 = 1
                endif

                let l:right_command = "tabnew " . l:file_name . "(added) | "
                let l:right_command .= "call setline(line('.'),'Added file')"
              elseif changed_file[0] == 'R'
                let l:diff_type = "partial"

                let l:left_command = "vnew " . l:file_name . "(removed) | "
                let l:left_command .= "call setline(line('.'),'Removed file')"

                let l:right_command = "read !hg cat " . l:file_name
                let l:del_right_line1 = 1
                if a:0 > 0
                  let l:right_command = "tabnew " . l:file_name . " (rev " . a:1 . ") | " . l:right_command
                  let l:right_command .= " --rev " . a:1
                else
                  let l:right_command = "tabnew " . l:file_name . " (last commit) | " . l:right_command
                endif
              elseif changed_file[0] == '?'
                let l:diff_type = "partial"
                let l:left_command = "vnew " . l:file_name . " (unknown) | "
                let l:left_command .= "call setline(line('.','Unknown file ' . l:file_name)"
                let l:right_command = "tabnew " . l:file_name . " (unknown) | "
                let l:right_command .= "call setline(line('.'),'? Unknown file')"
              endif

              if l:diff_type != "none"
                execute l:right_command
                execute l:left_command
              endif

              if l:del_right_line1
                wincmd b
                normal ggdd
              endif

              if l:del_left_line1
                wincmd t
                normal ggdd
              endif

              if l:diff_type == "full"
                windo difft
              endif

              :wincmd t
              :normal gg
            endfor

            echo len(l:stat_output) . " files compared."
          endfunction

          "" Mappings: ───────────────────────────────────────────────────-v-6
          nnoremap <leader>vd :call g:MyHGDiff()<cr>
          command! -nargs=* MyHGDiff :call g:MyHGDiff(<f-args>)

        "│-v-5 │ (function) Diff current window
        "└─────┴────────────────────────────────
          function! g:DiffCurrentWindow()
            if exists(':Hgvdiff') == 2
              let l:which_VCS = 'hg'
            elseif exists(':Gvdiff') == 2
              let l:which_VCS = 'git'
            else
              return
            endif

            exe "normal \<c-w>s\<c-w>T"
            if l:which_VCS == 'hg'
              Hgvdiff
            else
              let l:file_name = expand('%')
              let l:file_prefix = expand('%:t:r')
              let l:file_extension = expand('%:e')
              let l:file_type = &ft
              let l:HEAD_SHA1 = system('git rev-parse HEAD')
              let l:diff_buffer_name = l:file_prefix . '.' . l:HEAD_SHA1[0:9] . "." . l:file_extension
              vnew
              if bufnr(l:diff_buffer_name) == -1
                let b:ale_enabled = 0
                exe "file" l:diff_buffer_name
                let &ft = l:file_type
                exe 'silent read !git show HEAD:' . expand(l:file_name)
                normal ggdd
              else
                exe "buffer" l:diff_buffer_name
              endif
              setlocal nomod noma ro
              normal zR
              normal \<c-w>hgg
              windo diffthis
            endif
          endfunction

          "" Mappings: ───────────────────────────────────────────────────-v-6
          nnoremap <leader>D :call g:DiffCurrentWindow()<cr>

    "│-v-3 │ Mappings, Auto-Commands & Abbreviations.
    "└─┬───┴─┬────────────────────────────────────────
      "│-v-4 │ Mappings
      "└─┬───┴─┬────────
        "│-v-5 │ navigation remaps
        "└─────┴─────────────────────
          nnoremap <silent> <leader>t :tabs<cr>
          nnoremap <silent> <leader>B :buffers<cr>

          nnoremap j gj
          nnoremap k gk
          nnoremap gj j
          nnoremap gk k

          vnoremap j gj
          vnoremap k gk
          vnoremap gj j
          vnoremap gk k

          nnoremap <leader>h <C-W>h
          nnoremap <leader>l <C-W>l
          nnoremap <leader>j <C-W>j
          nnoremap <leader>k <C-W>k

          nnoremap <leader>ct :tabc<cr>

        "│-v-5 │ display remaps
        "└─────┴────────────────
          nnoremap <leader>b :set linebreak!<cr>

        "│-v-5 │ font size mappings
        "└─────┴────────────────────
          if has('win32')
            nnoremap <leader>T7 :set guifont=Consolas_for_Powerline_FixedD:h7<cr>
            nnoremap <leader>T8 :set guifont=Consolas_for_Powerline_FixedD:h8<cr>
            nnoremap <leader>T10 :set guifont=Consolas_for_Powerline_FixedD:h10<cr>
            nnoremap <leader>T12 :set guifont=Consolas_for_Powerline_FixedD:h12<cr>
            nnoremap <leader>T14 :set guifont=Consolas_for_Powerline_FixedD:h14<cr>
            nnoremap <leader>T16 :set guifont=Consolas_for_Powerline_FixedD:h16<cr>
            nnoremap <leader>T18 :set guifont=Consolas_for_Powerline_FixedD:h18<cr>
          else
            " TODO  Make sure this is correct!
            nnoremap <leader>T7 :set guifont=Consolas\ for\ Powerline\ FixedD\ 7<cr>
            nnoremap <leader>T8 :set guifont=Consolas\ for\ Powerline\ FixedD\ 8<cr>
            nnoremap <leader>T10 :set guifont=Consolas\ for\ Powerline\ FixedD\ 10<cr>
            nnoremap <leader>T12 :set guifont=Consolas\ for\ Powerline\ FixedD\ 12<cr>
            nnoremap <leader>T14 :set guifont=Consolas\ for\ Powerline\ FixedD\ 14<cr>
            nnoremap <leader>T16 :set guifont=Consolas\ for\ Powerline\ FixedD\ 16<cr>
            nnoremap <leader>T18 :set guifont=Consolas\ for\ Powerline\ FixedD\ 18<cr>
          endif


        "│-v-5 │ toggle showing of invisible characters
        "└─────┴────────────────────────────────────────
          nnoremap <silent> <leader>I :call g:EchoToggle('list', 'List Invisible Characters')<cr>

        "│-v-5 │ OS clip-board easy-integration.
        "└─────┴─────────────────────────────────
          nnoremap <leader>y "+y
          vnoremap <leader>y "+y

          nnoremap <leader>Y "+Y
          vnoremap <leader>Y "+Y

          nnoremap <leader>p "+p
          vnoremap <leader>p "+p

          nnoremap <leader>P "+P
          vnoremap <leader>P "+P

        "│-v-5 │ Jump to file shortcut
        "└─────┴───────────────────────
          nnoremap <silent> <leader>f <c-w>gf

        "│-v-5 │ Insertion mode completion shortcuts
        "└─────┴─────────────────────────────────────
          "File-name completion
          inoremap <c-f> <c-x><c-f>
          " Current & included files completion
          inoremap <c-s> <c-x><c-i>

        "│-v-5 │ __search_mappings:
        "└─────┴────────────────────
          " Switch off search highlighting.
          nnoremap <silent> <leader>, :noh<cr>

        "│-v-5 │ Quick window-width reset
        "└─────┴──────────────────────────
          nnoremap <leader><Bar>    :vertical resize 85<cr>

        "│-v-5 │ spell
        "└─────┴───────
          nnoremap <silent> <leader>s :call g:EchoToggle('spell', 'Spell check')<cr>

        "│-v-5 │ Window Size
        "└─────┴─────────────
          nnoremap <silent> <leader>W :call g:EchoToggle('winfixwidth', 'Fixed Window Width')<cr>
          nnoremap <silent> <leader>H :call g:EchoToggle('winfixheight', 'Fixed Window Height')<cr>

        "│-v-5 │ Diff current tab's windows
        "└─────┴────────────────────────────
        
          nnoremap <silent> <leader>dt :windo difft<cr>zR
          nnoremap <silent> <leader>do :windo diffo<cr>

        "│-v-5 │ mappings to customized-behavior & functions.
        "└─┬───┴─┬────────────────────────────────────────────
          "│-v-6 │ Insert date:
          "└─────┴──────────────
            nmap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
            imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>
            vmap <F3> di<C-R>=strftime("%Y-%m-%d")<CR><Esc>

            nmap <S-F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
            imap <S-F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
            vmap <S-F3> di<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

      "│-v-4 │ Auto-commands
      "└─────┴───────────────────────────
        autocmd BufRead,BufNewFile *.txtfmt setfiletype txtfmt

      "│-v-4 │ Abbreviations
      "└─┬───┴─┬─────────────
        "│-v-5 │ Corrections
        "└─────┴─────────────
          :cab Wa wa

  "│-v-2 │ Appearance
  "└─┬───┴─┬──────────
    "│-v-3 │ Built-in Settings
    "└─┬───┴─┬─────────────────
      "│-v-4 │ GUI Options (default is "egmrLtT")
      "└─────┴────────────────────────────────────
        :set guioptions=c
        " Note that fullscreen plugin doesn't work well with anything but null
        " (or similar).

      "│-v-4 │ Windows Terminal Options (ConEmu)
      "└─────┴───────────────────────────────────
        " From https://www.reddit.com/r/PowerShell/comments/3lym4q/cvalfcx
        if !empty($CONEMUBUILD)
          set termencoding=utf8
          set encoding=utf8
          set term=xterm
          set t_Co=256
          let &t_AB="\e[48;5;%dm"
          let &t_AF="\e[38;5;%dm"
        endif

      "│-v-4 │ matching paren highlighting
      "└─────┴─────────────────────────────
        set showmatch

      "│-v-4 │ Color scheme
      "└─────┴──────────────
        set t_Co=256

        " Not sure if this one's actually necessary.
        :set background=dark

        if &t_Co > 2 || has("gui_running")
          ":colorscheme timbat
          :colorscheme badwolf
          ":colorscheme timatrix " I've put a lot of my own adjustments into this one.
          ":colorscheme pyte
        else
          :colorscheme morodark
        endif

      "│-v-4 │ Current-Row-Column highlighting
      "└─────┴─────────────────────────────────
        nnoremap <silent> <leader>v :call g:EchoToggle('cursorcolumn')<cr>

        " Toggle the cursor column and cursor line depending on active window
        " (these 2 funcs)
        function! g:PreserveCursorColumn()
          if &cursorcolumn
            let w:setting_cursorcolumn = 1
            set nocursorcolumn
          endif
        endfunction

        function! g:RestoreCursorColumn()
          if exists('w:setting_cursorcolumn')
            let &cursorcolumn = w:setting_cursorcolumn
            unlet w:setting_cursorcolumn
          endif
        endfunction

        autocmd WinLeave * call g:PreserveCursorColumn()
        autocmd WinEnter * call g:RestoreCursorColumn()

        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
        set cursorline

      "│-v-4 │ Window Width & Such
      "└─────┴─────────────────────
        set winminwidth=5
        set scrolloff=1
        set noequalalways

      "│-v-4 │ Invisible characters depiction.
      "└─────┴─────────────────────────────────
        " TODO: put in my_vimrc_extended
        au BufNewFile,BufRead *.cpp,*.h,*.vim,*.rb,*.java,*.snippets,*.py set list

      "│-v-4 │ Miscellaneous
      "└─────┴───────────────
        set showcmd
        setglobal display=lastline,uhex
        set breakindent
        set showbreak=›\ 
        set breakindentopt=shift:-2

        " So box drawing characters actually touch nicely:
        set linespace=-1

      "│-v-4 │ Color Column
      "└─────┴──────────────
        " __todo_display_mode
        set colorcolumn=81

        "" Mappings: ───────────────────────────────────────────────────-v-5
        " Turn it on & off
        function! g:ToggleColorcolumn()
          if &colorcolumn != ''
            let w:colorcolumn_setting = &colorcolumn
            set colorcolumn=
            echo "Color Columns OFF"
          else
            let &colorcolumn = w:colorcolumn_setting
            echo "Color Columns ON"
          endif
        endfunction

        nnoremap <silent> <leader>Cc :call g:ToggleColorcolumn()<cr>
        nnoremap <silent> <leader>CC :call g:ToggleColorcolumn()<cr>


        function! g:Left_cc()
          if &colorcolumn != ''
            if &colorcolumn > 121
              set colorcolumn=121
            elseif &colorcolumn > 101
              set colorcolumn=101
            elseif &colorcolumn > 81
              set colorcolumn=81
            endif
            echo "colorcolumn" &colorcolumn "←"
          endif
        endfunction

        nnoremap <leader>Ch :call g:Left_cc()<cr>


        function! g:Right_cc()
          if &colorcolumn != ''
            if &colorcolumn < 81
              set colorcolumn=81
            elseif &colorcolumn < 101
              set colorcolumn=101
            elseif &colorcolumn < 121
              set colorcolumn=121
            endif
            echo "colorcolumn →" &colorcolumn
          endif
        endfunction

        nnoremap <leader>Cl :call g:Right_cc()<cr>



      "│-v-4 │ fillchars
      "└─────┴───────────
        set fillchars=vert:│,fold:═

      "│-v-4 │ guifont
      "└─────┴─────────
        if has('win32')
          set guifont=Consolas_for_Powerline_FixedD:h10:cDEFAULT
        else
          set guifont=Consolas\ for\ Powerline\ 10
        endif
      "│-v-4 │ Code indentation
      "└─────┴──────────────────
        au BufNewFile,BufRead *.cpp,*.h,*.hpp,*.vim,*.rb,*.java,*.snippets,*.py set et ts=4 sw=0 sts=0

      "│-v-4 │ Fold method defaults
      "└─────┴──────────────────────
        au BufNewFile,BufRead *.java set fdm=syntax

    "│-v-3 │ Custom Settings
    "└─┬───┴─┬───────────────
      "│-v-4 │ Start maximized
      "└─────┴─────────────────
        if has('gui_running')
          if has('win32')
            au GUIEnter * simalt ~x
          else
            " Requires wmctrl to be installed. Works for 'most distros'
            " from: http://stackoverflow.com/a/12450225/837406
            call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
          endif
        endif

      "│-v-4 │ Toggle listchars mode
      "└─────┴───────────────────────
        " __requires_utf_8:
        function! ToggleListCharsMode() "-v-
          if !exists('g:listcharsmode')
            let g:listcharsmode = 'trail'
          else
            if g:listcharsmode == 'eol'
              let g:listcharsmode = 'trail'
            else
              let g:listcharsmode = 'eol'
            endif
          endif

          " It was like it was trail mode, it can be hard to tell.
          if !&list && !has('vim_starting')
            let g:listcharsmode = 'eol'
            set list
            let l:message_tail = " (and 'list' turned ON)"
          else
            let l:message_tail = ''
          endif

          let l:message_beginning = 'listchars mode set to '
          if g:listcharsmode == 'eol'
            set listchars=tab:│·,eol:¬,extends:→
          elseif g:listcharsmode == 'trail'
            set listchars=tab:│·,trail:·,extends:→
          endif

          echo l:message_beginning . g:listcharsmode . l:message_tail
        endfunction "-^-
        silent call ToggleListCharsMode()

        "" Mapping: ────────────────────────────────────────────────────-v-5
        nnoremap <leader>L :call ToggleListCharsMode()<cr>

      "│-v-4 │ LLVM/Clang integration
      "└─────┴────────────────────────

        function! ClangFormatWholeBuffer()
          let l:lines = "all"
          pyf C:/Program Files/LLVM/share/clang/clang-format.py
        endfunction

        "" Mappings: ───────────────────────────────────────────────────-v-5
        " TODO: make this work for multiple machines/OS's
        nnoremap <leader>= :call ClangFormatWholeBuffer()<cr>
        vnoremap <leader>= :pyf C:/Program Files/LLVM/share/clang/clang-format.py<cr>

" -^-1

" vim: set fmr=-v-,-^- fdm=marker cms="%s et ts=2 sw=0 sts=0 :

