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

    NeoBundle 'aaronbieber/vim-vault' " ───── password manager-ness
    NeoBundle 'bling/vim-airline' " ───────── status line with shiny stuff
    NeoBundle 'bpstahlman/txtfmt' " ───────── vim is now semi-WYSIWYG!
    NeoBundle 'derekwyatt/vim-fswitch' " ──── alternates between .cpp & .h
    NeoBundle 'fboender/bexec' " ──────────── Execute the current buffer.
    NeoBundle 'gisraptor/vim-lilypond-integrator' " ── lilypond file syntax etc.
    NeoBundle 'junegunn/vader.vim' " ──────── Unit test suite for VimL
    NeoBundle 'kana/vim-arpeggio' " ───────── map triggers with simultaneous keys
    NeoBundle 'kshenoy/vim-signature' " ───── Show marks on the left
    NeoBundle 'ludovicchabant/vim-gutentags' " ── Tag manager
    NeoBundle 'mbbill/undotree' " ───────── view undo history as a tree
    NeoBundle 'mhinz/vim-startify' " ──────── covenient Vim start screen
    NeoBundle 'octol/vim-cpp-enhanced-highlight' " ── Improved C++ highlighting
    NeoBundle 'OmniCppComplete' " ─────────── cpp completion
    NeoBundle 'PProvost/vim-ps1' " ────────── Syntax, etc, for powershell
    NeoBundle 'reedes/vim-thematic' " ─────── combines ‘theme’ settings
    NeoBundle 'luochen1990/rainbow' " ─────── matching brackets match colors
    NeoBundle 'scrooloose/nerdcommenter' " ── handle auto-commenting lines
    NeoBundle 'Shougo/unite.vim' " ────────── UI and search
    NeoBundle 'SirVer/ultisnips', 'release' " ─── powerful snippets
    NeoBundle 't9md/vim-choosewin' " ──────── “random access” window navigation
    NeoBundle 'tmhedberg/SimpylFold' " ────── simple Python syntax folding
    NeoBundle 'tpope/vim-surround' " ──────── change surroundings (e.g. {})
    NeoBundle 'vimwiki/vimwiki' " ─────────── personal wiki in vim
    " Because they’re compatible with vim-airline:
    NeoBundle 'ludovicchabant/vim-lawrencium' " ── Mercurial integration
    NeoBundle 'tpope/vim-fugitive' " ──────── git integration
    " Used by vim-surround:
    NeoBundle 'tpope/vim-repeat' " ────────── makes some plugins .-able
    " Used by ultisnips:
    NeoBundle 'honza/vim-snippets' " ──────── snippets for ultisnips

    " TODO: get this working
      "\ 'build_commands' : 'cmake',
    "NeoBundle 'kkoenig/wimproved.vim', {
    "  \ 'build' : {
    "  \     'windows' : 'cmake -G "NMake Makefiles" . && nmake',
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

    "│-v-3 │ Arpeggio Settings
    "└─────┴───────────────────
      call arpeggio#load()

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
      " Mappings (@__full_screen_mappings)
      function! ToggleFullScreen()
        if has('win32')
          :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
        endif
      endfunction

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

    "│-v-3 │ Multiple Cursors
    "└─────┴──────────────────
      " No settings messed with

      "" Mappings: ───────────────────────────────────────────────────-v-4
      " Note the end-of-line space! Use 'list' to see them.
      vnoremap <leader>N :'<,'>MultipleCursorsFind 
      nnoremap <leader>N :MultipleCursorsFind 

    "│-v-3 │ OmniCppComplete Settings
    "└─────┴──────────────────────────
      " TODO: grok this to see if it needs anything.
      au BufNewFile,BufRead,BufEnter *.cpp,*.h set omnifunc=omni#cpp#complete#Main
      let OmniCpp_ShowPrototypeInAbbr = 1

    "│-v-3 │ Rainbow Parentheses Settings
    "└─────┴──────────────────────────────
      " Settings apply to the luochen1990 version.
      " Mappings (@__rainbow_parentheses_mappings):
      let g:rainbow_active = 1

      function! RainbowOff()
        if exists('b:rainbow_loaded')
          call rainbow#clear()
        endif
      endfunction

      au BufEnter *.vault call RainbowOff()
      au BufEnter *.wiki call RainbowOff()

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

    "│-v-3 │ thematic
    "└─────┴──────────
      " Mappings (@__thematic_mappings):

      let g:thematic#defaults = {
      \ 'colorscheme': ''
      \ }

      let g:thematic#themes = {}
      " No idea why this difference is there. I’m *pretty* sure they’re the
      " same fonts.
      if has('win32')
        let g:thematic#themes.Consolas = { 'typeface': 'Consolas for Powerline FixedD' }
      else
        let g:thematic#themes.Consolas = { 'typeface': 'Consolas for Powerline' }
        let g:thematic#themes.LibMono = { 'typeface': 'Liberation Mono for Powerline' }
      endif
      let g:thematic#themes._7 = {'font-size':7}
      let g:thematic#themes._8 = {'font-size':8}
      let g:thematic#themes._10 = {'font-size':10}
      let g:thematic#themes._12 = {'font-size':12}
      let g:thematic#themes._14 = {'font-size':14}
      let g:thematic#themes._16 = {'font-size':16}
      let g:thematic#themes._18 = {'font-size':18}

    "│-v-3 │ UltiSnips Settings
    "└─────┴────────────────────
      " Mappings (@__Ultisnips_mappings):
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

    "│-v-3 │ vim-signature
    "└─────┴───────────────
      nnoremap <silent> <leader>m :SignatureToggleSigns<cr>

    "│-v-3 │ vim-vault
    "└─────┴───────────
      if has('win32')
        :let g:vault_password_command = 'python "\Program Files (Manually Installed)\pyxkcdpass\pyxkcdpass.py"'
      endif

    "│-v-3 │ vimfiler
    "└─────┴──────────
      let g:vimfiler_as_default_explorer = 1
      let g:vimfiler_edit_action = 'tabopen'

    "│-v-3 │ vimwiki Settings
    "└─────┴──────────────────
      " Mappings (@__vimwiki_mappings):
      let g:vimwiki_camel_case = 0

      let wiki_1 = {}
      let wiki_1.path = '~/Dropbox/Vim/vimwiki/'
      let wiki_1.nested_syntaxes = {'c++': 'cpp', 'asm': 'asm', 'sh': 'sh'}

      let wiki_2 = {}
      let wiki_2.path = '~/Dropbox/timwrite/vimfriendly/Inhuman_Universe/wiki/'

      let wiki_3 = {}
      let wiki_3.path = '~/Dropbox/code/zigzagdungeon/productionwiki/'

      let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

    "│-v-3 │ Wimproved
    "└─────┴───────────
      " Not actually working
      "autocmd GUIEnter * silent! WToggleClean

"│-v-1 │ Set-up
"└─┬───┴─┬──────
  "│-v-2 │ Behavior
  "└─┬───┴─┬────────
    "│-v-3 │ “meta” (settings settings)
    "└─────┴────────────────────────────

      " Quick settings access
        nnoremap <silent> <F2> :tabedit $MYVIMRC<cr>

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

        "│-v-5 │ External Shell Settings
        "└─────┴─────────────────────────
          " __requires_utf_8:

          " The && !(&diff) is there because shell=powershell.exe breaks
          " vimdiff.
          if has('win32') && !(&diff) && 0
            set shell=powershell.exe
            set shellcmdflag=-c
            set shellpipe=|
            set shellredir=>
          endif

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

      "│-v-4 │ Encryption Settings
      "└─────┴─────────────────────
        set cm=blowfish2
          
      "│-v-4 │ Customized behavior
      "└─┬───┴─┬───────────────────
        "│-v-5 │ (function) EchoToggle
        "└─────┴───────────────────────
        " (mappings @__echo_toggle_mappings)
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

        "│-v-5 │ (function) open writing project
        "└─────┴─────────────────────────────────
          " (mappings @__open_writing_project)
          function! g:Open_writing_project()
            cd ~/Dropbox/timwrite/Book2/2016/inhuman_universe/

            edit ./NovelOld.txtfmt
            setlocal relativenumber number
            setlocal nospell noma ro
            setlocal foldmethod=marker foldmarker=-v-,-^-
            normal zR

            split ./New_2011-07-09.txtfmt
            setlocal relativenumber number
            setlocal nospell noma ro
            setlocal foldmethod=marker foldmarker=-v-,-^-
            normal zR

            " The actual current file.
            split ./LaTeX/New_2016_05_25.tex
            setlocal relativenumber number
            set linebreak
            normal H
            normal zR
            execute "normal /set spellfile\<cr>vi[\"ty"
            execute @t
            set spell

            Thematic _12
            call ToggleFullScreen()
            execute "normal \<c-w>="
            
            execute "normal `."
            execute 'normal zMzxzczOzz'
          endfunction

        "│-v-5 │ (function) switch off & preserve relnum state
        "└─────┴───────────────────────────────────────────────
          " (auto commands @__switch_off_and_preserve_relnum_state_autocmds)
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

        "│-v-5 │ (function) Insert contrary tabs
        "└─────┴─────────────────────────────────
          " (mappings @__insert_contrary_tabs)

          " Inserts tabs when &expandtab, spaces when &noet
          function! g:InsertContraryTabs()
            if &et
              normal i	la
            else
              exe ':normal i' . repeat(' ', &ts) . 'la'
            endif
          endfunction
        "│-v-5 │ (function) Toggle both line numberings
        "└─────┴────────────────────────────────────────
          " (mappings @__line_number_modes_mappings)

          function! g:ToggleBothNums()
            if &relativenumber && &number
              set norelativenumber nonumber
            else
              set relativenumber number
            endif
          endfunction

        "│-v-5 │ (function) :cd between current file's directory and global cwd
        "└─────┴────────────────────────────────────────────────────────────────
          " (mappings @__local_file_cd_toggle)
          function! g:LocalFileCDToggle()
            if !exists('w:global_cwd')
              let w:global_cwd = getcwd()
              lcd %:p:h
            else
              exe 'lcd' w:global_cwd
              unlet w:global_cwd
            endif
          endfunction

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
              let l:diff_command = 'Hgvdiff'
            elseif exists(':Gvdiff') == 2
              let l:diff_command = 'Gvdiff'
            else
              return
            endif

            exe "normal \<c-w>\<c-s>\<c-w>T"
            exe l:diff_command
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
          nnoremap <leader><Bslash> :vertical resize 85<cr>

        "│-v-5 │ Digraph
        "└─────┴─────────
          Arpeggio inoremap jk <c-k>
          Arpeggio cnoremap jk <c-k>

        "│-v-5 │ spell
        "└─────┴───────
          nnoremap <silent> <leader>s :call g:EchoToggle('spell', 'Spell check')<cr>

        "│-v-5 │ Window Size
        "└─────┴─────────────
          nnoremap <silent> <leader>W :call g:EchoToggle('winfixwidth', 'Fixed Window Width')<cr>
          nnoremap <silent> <leader>H :call g:EchoToggle('winfixheight', 'Fixed Window Height')<cr>

        "│-v-5 │ mappings to customized-behavior & functions.
        "└─┬───┴─┬────────────────────────────────────────────
          "│-v-6 │ __box_characters_mapping:
          "└─────┴───────────────────────────
            vnoremap <silent> <leader>x :call g:BoxCharacters()<cr>

          "│-v-6 │ __line_number_modes_mappings:
          "└─────┴───────────────────────────────
            nnoremap <silent> <leader>nr :set relativenumber!<cr>
            nnoremap <silent> <leader>na :set number!<cr>
            nnoremap <silent> <leader>nn :call g:ToggleBothNums()<cr>

          "│-v-6 │ __local_file_cd_toggle
          "└─────┴────────────────────────
            nnoremap <leader>d :call g:LocalFileCDToggle()<cr>

          "│-v-6 │ __insert_contrary_indentation
          "└─────┴───────────────────────────────
            inoremap <silent> <s-tab> <c-o>:call g:InsertContraryTabs()<cr>

          "│-v-6 │ Insert date:
          "└─────┴──────────────
            nmap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
            imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>
            vmap <F3> di<C-R>=strftime("%Y-%m-%d")<CR><Esc>

            nmap <S-F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
            imap <S-F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
            vmap <S-F3> di<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

          "│-v-6 │ Remove i_ctrl-u:
          "└─────┴──────────────────
            " When using <C-k> to trigger digraphs, <C-u> is a hugely frequent
            " typo. Whereas <c-k> is a command I’d never actually want to use.
            " (My arpeggio jk trigger for digraphs was incompatible with the
            " crappy vimlatex plugin, but even without it, <c-k> is useless.)
            imap <C-u> <nop>

          "│-v-6 │ __open_writing_project :
          "└─────┴──────────────────────────
            " This mapping is meant to be changed as needed.
            nnoremap <silent> <f7> :call g:Open_writing_project()<cr>

          "│-v-6 │ __toggle_listchars_mode
          "└─────┴─────────────────────────
            nnoremap <leader>L :call ToggleListCharsMode()<cr>

        "│-v-5 │ mappings to Plug-ins
        "└─┬───┴─┬────────────────────
          "│-v-6 │ __full_screen_mappings
          "└─────┴─────────────────────────
            map <silent> <F11> <Esc>:call ToggleFullScreen()<CR>

          "│-v-6 │ __rainbow_parentheses_mappings:
          "└─────┴─────────────────────────────────
            nnoremap <silent> <leader>r :RainbowToggle<cr>

          "│-v-6 │ __thematic_mappings:
          "└─────┴──────────────────────
            nnoremap <leader>T7 :Thematic _7<cr>
            nnoremap <leader>T8 :Thematic _8<cr>
            nnoremap <leader>T10 :Thematic _10<cr>
            nnoremap <leader>T12 :Thematic _12<cr>
            nnoremap <leader>T14 :Thematic _14<cr>
            nnoremap <leader>T16 :Thematic _16<cr>
            nnoremap <leader>T18 :Thematic _18<cr>

          "│-v-6 │ __Ultisnips_mappings
          "└─────┴──────────────────────
            nnoremap <leader>U :UltiSnipsEdit<cr>
          "│-v-6 │ __vimwiki_mappings
          "└─────┴────────────────────
            nnoremap <leader># :VimwikiTable<cr>

      "│-v-4 │ Auto-commands
      "└─┬───┴─┬─────────────
        "│-v-5 │ Independent auto-commands
        "└─────┴───────────────────────────
          autocmd BufRead,BufNewFile *.txtfmt setfiletype txtfmt

        "│-v-5 │ Auto commands for customized behavior & functions
        "└─┬───┴─┬─────────────────────────────────────────────────
          "│-v-6 │ __switch_off_and_preserve_relnum_state_autocmds
          "└─────┴─────────────────────────────────────────────────
            au WinLeave * call g:OffRelNumPreserve()
            au WinEnter * call g:RestoreRelNum()

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
          set guifont=Consolas_for_Powerline_FixedD:h14:cDEFAULT
        else
          set guifont=Consolas\ for\ Powerline\ 14
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
        " Mappings (@__toggle_listchars_mode):
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

"│-v-1 │ Transient settings
"└─────┴────────────────────
  " This is meant for sourcing in convenience settings that don't really
  " belong in this file.
  :source ~/Dropbox/code/zigzagdungeon/vimsetup.vim

  " Regarding a list of all the books in Skyrim.
  au BufRead Books_Checklist.txt nnoremap <silent> <leader>sr 0R[R]k<cr>
  au BufRead Books_Checklist.txt nnoremap <silent> <leader>so 0R[O]k<cr>
  au BufRead Books_Checklist.txt nnoremap <silent> <leader>s- 0R - k<cr>
  au BufRead Books_Checklist.txt nnoremap <silent> <leader>s<space> 0R[ ]k<cr>

" vim: set fmr=-v-,-^- fdm=marker cms="%s et ts=2 sw=0 sts=0 :

