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
  " TODO Make “i_Ctrl-R ,” put the “+” yank buffer’s contents.
  "
  " TODO mappings that “Hesitate”:
    " <leader>i
    " <leader>w
  " TODO Look into the conceal setting and this reddit thread:
  "   http://redd.it/okzja
  " TODO Set up some cool Arpeggio mappings.
  "      Simulate touchcursor for vim arrow-key reassignments.
  " TODO Look into the 'comments' setting and gq (to add "/// " and stuff)
  " TODO Extract multi-compatible font changing shpiel to a function, instead
  "      of repetitive if, else block.
  " TODO Make special vim characters into unicode symbols (like the
  "      window-dividers into box characters, and 'no line' characters into
  "      null-set characters.
  " TODO Have timdisplaymode switch display mode switched into!
  " TODO look into changing “__keyword” style ‘links’ herein to actual tag
  "      links
  " TODO Maybe try YouCompleteMe plugin.
  " TODO Evaluate which of the many rainbow parethesis plugins is best.

"│-v-1 │ “precedence” necessaries.
"└─────┴───────────────────────────
  " Expand the runtime path to a global, cloud-based location.
  if has('win32')
    " These probably don’t have to be different, but eh.
    set runtimepath+=$HOME/Dropbox/Vim/GlobalRuntimePath
  else
    set runtimepath+=~/Dropbox/Vim/GlobalRuntimePath
  endif

  "For virtually everything, and sanity in general:
  set nocp
  filetype plugin on

  "For that which __requires_utf_8:
  set encoding=utf8

  " Note: Make sure to link here from _every_ line that has a prerequisite,
  " and from every location in this file where the prerequisite would more
  " naturally be categorized.

"│-v-1 │ Plug-in Settings
"└─┬───┴─┬────────────────
  "│-v-2 │ plug-in manager
  "└─┬───┴─┬───────────────
    "│-v-3 │ neobundle
    "└─────┴───────────
      " TODO Evaluate using VAM or vim-flavor instead.
      if has('vim_starting')
        set nocompatible               " Be iMproved

        " Required:
        set runtimepath+=~/.vim/neobundle/neobundle.vim/
      endif

      " Required:
      call neobundle#rc(expand('~/.vim/neobundle/'))

      " Let NeoBundle manage NeoBundle
      " Required:
      NeoBundleFetch 'Shougo/neobundle.vim'

      NeoBundle 'tpope/vim-pathogen'
      NeoBundle 'a.vim'
      NeoBundle 'sjl/badwolf'
      NeoBundle 'git://git.wincent.com/command-t.git'
      NeoBundle 'kien/ctrlp.vim'
      NeoBundle 'sjl/gundo.vim'
      NeoBundle 'noahfrederick/vim-hemisu'
      NeoBundle 'roman/rainbow'
      NeoBundle 'tpope/vim-repeat'
      NeoBundle 'tpope/vim-surround'
      NeoBundle 'bpstahlman/txtfmt'
      NeoBundle 'SirVer/ultisnips'
      NeoBundle 'kana/vim-arpeggio'
      NeoBundle 'OmniCppComplete'
      NeoBundle 'vimwiki/vimwiki'
      NeoBundle 'scrooloose/nerdcommenter'
      NeoBundle 'PProvost/vim-ps1'

      NeoBundle 'bling/vim-airline'
      NeoBundle 'ludovicchabant/vim-lawrencium'
      NeoBundle 'tpope/vim-fugitive'

      "" Plugins to try:

      " Bundle 'git://repo.or.cz/vcscommand'

      " replaces gundo:
      " Bundle 'mbbill/undotree'

      " Show marks:
      NeoBundle 'kshenoy/vim-signature'
      "NeoBundle 'jeetsukumaran/vim-markology'

      " My own plugins:
      NeoBundle 'bitbucket:atimholt/ArrowKeyRepurpose', {'type': 'hg'}
      NeoBundle 'bitbucket:atimholt/my_vimrc_extended', {'type': 'hg'}

      filetype plugin indent on

      NeoBundleCheck

    "│-v-3 │ Pathogen
    "└─────┴──────────
    " This is still here for edge-case ‘plugins’, like minor custom plugins I
    " don’t yet want to bother with putting into a public repository.
      filetype off
      call pathogen#infect()
      call pathogen#helptags()
      filetype plugin on

  "│-v-2 │ Individual plug-ins
  "└─┬───┴─┬───────────────────
    "│-v-3 │ Gundo Settings
    "└─────┴────────────────
      nnoremap <silent> <leader>u :GundoToggle<cr>
      let g:gundo_help=1
      let g:gundo_right=0
      let g:gundo_preview_bottom=0

      " Mappings (@__gundo_mappings):
        " toggle Gundo

    "│-v-3 │ vimwiki Settings
    "└─────┴──────────────────
      let g:vimwiki_camel_case = 0

      let wiki_1 = {}
      let wiki_1.path = '~/Dropbox/Vim/vimwiki/'
      let wiki_1.nested_syntaxes = {'c++': 'cpp', 'asm': 'asm', 'sh': 'sh'}

      let wiki_2 = {}
      let wiki_2.path = '~/Dropbox/timwrite/vimfriendly/Inhuman_Universe/wiki/'

      let wiki_3 = {}
      let wiki_3.path = '~/Dropbox/code/zigzagdungeon/productionwiki/'

      let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

    "│-v-3 │ Full-Screen Mode Settings
    "└─────┴───────────────────────────
      " Mappings (@__full_screen_mappings):
      function! ToggleFullScreen()
        if has('win32')
          :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
        endif
      endfunction

    "│-v-3 │ 'a' settings
    "└─────┴──────────────
      " Mappings (@__a_mappings):

      "Hopefully, changing the default when associated source doesn't yet exist.
      let g:alternateExtensions_h = "cpp,c,cxx,cc,CC"

    "│-v-3 │ OmniCppComplete Settings
    "└─────┴──────────────────────────
      au BufNewFile,BufRead,BufEnter *.cpp,*.h set omnifunc=omni#cpp#complete#Main
      let OmniCpp_ShowPrototypeInAbbr = 1

    "│-v-3 │ PowerShell syntaxy-stuff settings
    "└─────┴───────────────────────────────────
      au BufNewFile,BufRead,BufEnter *.ps1 set filetype=ps1

    "│-v-3 │ Rainbow Parentheses Settings
    "└─────┴──────────────────────────────
      " (Steve Losh’s modified version, cleaned up and jazz)

      " Mappings (@__rainbow_parentheses_mappings):
      autocmd BufEnter * RainbowParenthesesLoadRound
      autocmd BufEnter * RainbowParenthesesLoadBraces
      "autocmd BufEnter * RainbowParenthesesLoadChevrons

    "│-v-3 │ Powerline Settings
    "└─────┴────────────────────
      let Powerline_cache_file = ""
      let Powerline_symbols = "fancy"

    "│-v-3 │ UltiSnips Settings
    "└─────┴────────────────────
      let g:UltiSnipsSnippetsDir = "~/Dropbox/Vim/GlobalRuntimePath/UltiSnipsSnippets/"
      let g:UltiSnipsSnippetDirectories=["UltiSnips", "UltiSnipsSnippets"]
      let g:UltiSnipsEditSplit = "horizontal"
      let g:UltiSnipsUsePythonVersion = 2

      " Wasn't compatible with digraphs, so I thought I'd try a remap.
      " Also wasn't compatible with my custom use of <s-tab>, even though it
      " is after a reestablishment of said custom use, so there you go.
      let g:UltiSnipsExpandTrigger="<c-t>"
      let g:UltiSnipsJumpForwardTrigger="<c-n>"
      let g:UltiSnipsJumpBackwardTrigger="<c-h>"

      " Enable importing of custom modules for python interpolation.
      if has('win32')
        py import sys; sys.path.append("C:\\Users\\atimh_000\\Dropbox\\Vim\\GlobalRuntimePath\\UltiSnipsSnippets\\pymodules\\")
      else
        " This should work, but test it out.
        py import sys; sys.path.append("/home/tim/Dropbox/Vim/GlobalRuntimePath/UltiSnipsSnippets/pymodules/")
      endif

    "│-v-3 │ Arpeggio Settings
    "└─────┴───────────────────
      call arpeggio#load()

    "│-v-3 │ Indent Guides
    "└─────┴───────────────
      let g:indent_guides_space_guides = 0

    "│-v-3 │ Showmarks
    "└─────┴───────────
      let showmarks_enable = 0
      "let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'`^<>[]{}()\""
      let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'`^"
      let g:showmarks_ignore_type = "q"

      let showmarks_textlower = "\t:"
      let showmarks_textupper = "\t:"
      let showmarks_textother = "\t:"

    "│-v-3 │ latex-suite
    "└─────┴─────────────
      set grepprg=grep\ -nH\ $*

    "│-v-3 │ Surround
    "└─────┴──────────
      " lenticular brackets
      let g:surround_{char2nr("l")} = "〖\r〗"
      " directional quotes
      let g:surround_{char2nr("q")} = "“\r”"
      " txtfmt italics delimiters
      let g:surround_{char2nr("i")} = "\r"
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

    "│-v-3 │ vim-signature
    "└─────┴───────────────
      nnoremap <silent> <leader>m :SignatureToggleSigns<cr>

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
          set expandtab
          set shiftwidth=2
          set softtabstop=2
          set tabstop=2
          set backspace=indent,eol,start
          set ruler
          :syntax enable
          :set cindent

          " Stopped using this when I started using Powershell more.
          ":set shellslash

          :set switchbuf=useopen,usetab,newtab

          " Allows the closing of buffers without saving.
          set hidden

          " allows cursor position past true end of line
          set virtualedit=all

          " Whether jumping to another line (like with "G") goes to the start
          " of the line, or tries to stay in the same column.
          set nostartofline

        "│-v-5 │ vimdiff settings
        "└─────┴──────────────────
          set diffopt=filler,vertical,context:3

        "│-v-5 │ Spelling
        "└─────┴──────────
          set spelllang=en_us,es,eo

        "│-v-5 │ Status Line
        "└─────┴─────────────
          ":set statusline=%F%m%r%h%w\ (%{&ff})\ typ:%Y\ ASCII=\%04.8b\ HEX=\%04.4B\ %l,%v %p%%\ LEN=%L
          "set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]
          " This is the one I was using, but I’m using vim-airline now.
          " set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%02B]

          set laststatus=2
            " “The value of this option influences when the
            " last window will have a status line…”

        "│-v-5 │ Folds
        "└─────┴──────────
          :set foldmethod=marker
          :set foldmarker=//v,//^
          :set commentstring=%s

        "│-v-5 │ WildMenu
        "└─────┴──────────
          set wildmode=longest,list,full
          :set wildmenu

        "│-v-5 │ persistent undo
        "└─────┴─────────────────
          set undofile
          set undodir=~/vim_undo_files

        "│-v-5 │ search settings
        "└─────┴─────────────────
          set ignorecase
          set smartcase
          set gdefault
          set incsearch
          set showmatch
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

        "│-v-5 │ mkview settings
        "└─────┴─────────────────
          set viewdir=~/Dropbox/Vim/GlobalRuntimePath/view/

        "│-v-5 │ Custom Digraph Settings
        "└─────┴─────────────────────────
        " Esperanto:
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

        " Graphical, dark diamond suit and dark heart suit.
          :digraph cD 9830
          :digraph cH 9829

        " Some assorted punctuation
          "ellipsis
          :digraph .. 8230

          "small bullet
          :digraph ** 8729

          "Directional quotes
          :digraph \", 8220
          :digraph \". 8221
          :digraph ', 8216
          :digraph '. 8217

        " Some math stuff
          "funcapply, for immediately after a function name and before its
          "arguments
          :digraph fa 8289
        " Bullet
          :digraph .b 8226
        " Interrobang
          :digraph ?! 8253

        " lower case superscript letters
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


      "│-v-4 │ Customized behavior
      "└─┬───┴─┬───────────────────
        "│-v-5 │ (function) Toggle Spell Checking.
        "└─────┴───────────────────────────────────
          " (mapping @__spell_check_mapping)
          function! g:ToggleSpellMode()
            :set spell!
            if &l:spell
              echo "Spell check ON"
            else
              echo "Spell check OFF"
            endif
          endfunction

        "│-v-5 │ (function) Toggle Fixed Window Width.
        "└─────┴───────────────────────────────────────
          " (mapping @__fixed_window_width)

          function! g:TimToggleWindowFixedWidth()
            :set winfixwidth!
            if &l:winfixwidth
              echo "Fixed Window Width ON"
            else
              echo "Fixed Window Width OFF"
            endif
          endfunction

        "│-v-5 │ (function) Toggle Fixed Window Height.
        "└─────┴───────────────────────────────────────
          " (mapping @__fixed_window_height)

          function! g:TimToggleWindowFixedHeight()
            :set winfixheight!
            if &l:winfixheight
              echo "Fixed Window Height ON"
            else
              echo "Fixed Window Height OFF"
            endif
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
            :s'r'┌'e
            gv
            :s','┐'e
            gv
            :s'’'┘'e
            gv
            :s/'/┘/e
            gv
            :s'L'└'e

            gv
            :s'|'│'e
            gv
            :s'-'─'e
            gv
            :s'—'─'e
            gv
            :s'+'┼'e

            gv
            :s'\^'┴'e
            gv
            :s'>'├'e
            gv
            :s'v'┬'e
            gv
            :s'T'┬'e
            gv
            :s'<'┤'e
          endfunction

        "│-v-5 │ (functions) Multi-Window automatic stuff
        "└─────┴──────────────────────────────────────────
          " These settings rely heavily on the specific ways I personally use Vim.
          " (auto-commands @__multi_window_autocmds)

          function! TimWinLeaveWithGundo()
            if !GundoInTab() && g:timdisplaymode == 'code'
              ":vertical resize
              :set nowrap
              ":set norelativenumber
              ":set nonumber
            endif
          endfunction

          function! TimWinEnterWithGundo()
            if !GundoInTab() && g:timdisplaymode == 'code'
              if g:tim_number_mode == 0
                ":vertical resize 81
              else
                ":vertical resize 85
              endif
              :set wrap
              :call g:TimDisplayNumbers()
            endif
          endfunction

          function! GundoInTab()
            let s:current_tabpagebuflist = tabpagebuflist()
            for i in s:current_tabpagebuflist
              if bufname(i) == "__Gundo__"
                return 1
              endif
            endfor
            return 0
          endfunction

        "│-v-5 │ (functions) Line-number Mode switching
        "└─────┴────────────────────────────────────────
          " (mappings @__line_number_modes_mappings)

          let g:tim_number_mode = 1

          function! g:ToggleNuMode(...)
            if a:0
              if(a:1 != -1)
                let g:tim_number_mode = a:1
              else
                let g:tim_number_mode -= 1
              endif
            else
              let g:tim_number_mode += 1
            endif

            if g:tim_number_mode > 2
              let g:tim_number_mode = 0
            endif
            if g:tim_number_mode < 0
              let g:tim_number_mode = 2
            endif

            call g:TimDisplayNumbers()
          endfunc

          function! g:TimDisplayNumbers()
            if(g:tim_number_mode == 1)
              if g:timdisplaymode == 'code'
                ":vertical resize 85
              endif
              set number
            elseif(g:tim_number_mode == 2)
              if g:timdisplaymode == 'code'
                ":vertical resize 85
              endif
              set relativenumber
            else
              if g:timdisplaymode == 'code'
                ":vertical resize 81
              endif
              set nonumber
              set norelativenumber
            endif
          endfunc

        "│-v-5 │ (functions) View and Folds saving
        "└─────┴───────────────────────────────────
          " (mappings @__viewdir_mappings)
          " TODO: for realsy, this needs to be its own script in the
          " repository
          " TODO: echo the current mode on toggle
          " TODO: loadview automatically in zigzagproj mode on file loading

          function! g:toggleviewdir()
            if g:viewdirmode == "normal"
              let g:viewdirmode = "zigzagproj"
            else
              let g:viewdirmode = "normal"
            endif

            call g:applyviewdir()
          endfunction

          function! g:applyviewdir()
            if g:viewdirmode == "normal"
              set viewdir=~/Dropbox/Vim/GlobalRuntimePath/view/
            else
              set viewdir=~/Dropbox/code/ZigZagDungeon/vimview/
            endif
            "echo "
          endfunction

          let g:viewdirmode = "normal"
          call g:applyviewdir()

        "│-v-5 │ (function) open writing project
        "└─────┴─────────────────────────────────
          " (mappings @__open_writing_project)
          function! g:open_writing_project()
            normal 2,ww
            call g:ToggleNuMode(2)

            cd ~/Dropbox/timwrite/vimfriendly/Inhuman_Universe

            tabedit ~/Dropbox/timwrite/vimfriendly/Inhuman_Universe/NovelOld.txtfmt
            call g:ToggleNuMode(2)

            vsplit ~/Dropbox/timwrite/vimfriendly/Inhuman_Universe/New_2011-07-09.txtfmt
            call g:ToggleNuMode(2)
            set nospell

            "if has('win32')
              "set guifont=Consolas_for_Powerline_FixedD:h18:cDEFAULT
            "else
              "set guifont=Consolas\ for\ Powerline\ 16
            "endif
            call ToggleFullScreen()

            normal <c-w>=
          endfunction

    "│-v-3 │ Mappings, Auto-Commands & Abbreviations.
    "└─┬───┴─┬────────────────────────────────────────
      "│-v-4 │ Mappings
      "└─┬───┴─┬────────
        "│-v-5 │ Leader Key Settings
        "└─────┴─────────────────────
          let mapleader = ","
                " doesn't work?:
          nnoremap <C-,> ,
          vnoremap <C-,> ,

          " Still want this functionality!
          map \u <Nop>
          nnoremap \ ,

        "│-v-5 │ navigation remaps
        "└─────┴─────────────────────
          "nnoremap <tab> %
          "vnoremap <tab> %

          nnoremap <silent> <leader>t :tabs<cr>

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

        "│-v-5 │ display remaps
        "└─────┴────────────────
          nnoremap <leader>b :set linebreak!<cr>

        "│-v-5 │ Normal-Mode alternative access.
        "└─────┴─────────────────────────────────
          " TODO: Change the windows mapping to changing caps lock to esc.
          "if has('win32')
          "  inoremap hh <esc>
          "  cnoremap hh <esc>
          "endif
          "Arpeggio inoremap tn <esc>
          "Arpeggio cnoremap tn <esc>

        "│-v-5 │ toggle showing of invisible characters
        "└─────┴────────────────────────────────────────
          nnoremap <silent> <leader>I :call g:ToggleList()<cr>
          " TODO finish this indicator and stick it in the right place.
          function! g:ToggleList()
            :set list!
            if &l:list
              echo "List Invisible Characters ON"
            else
              echo "List Invisible Characters OFF"
            endif
          endfunction

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
          nnoremap <silent> <leader><space> :noh<cr>

        "│-v-5 │ Quick window-width reset
        "└─────┴──────────────────────────
          nnoremap <leader><Bar>    :vertical resize 85<cr>
          nnoremap <leader><Bslash> :vertical resize 85<cr>

        "│-v-5 │ Generate Tag files
        "└─────┴────────────────────
          "map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
          "map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *.h *.cpp<CR>
          map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR>

        "│-v-5 │ Arpeggio shortcuts experiment
        "└─────┴───────────────────────────────
          "Arpeggio inoremap s, /
          "Arpeggio inoremap s. \

          "Arpeggio cnoremap s, /
          "Arpeggio cnoremap s. \

        "│-v-5 │ Digraph
        "└─────┴─────────
          Arpeggio inoremap jk <c-k>

        "│-v-5 │ mappings to customized-behavior & functions.
        "└─┬───┴─┬────────────────────────────────────────────
          "│-v-6 │ __spell_check_mapping:
          "└─────┴────────────────────────
            nnoremap <F5> :call g:ToggleSpellMode()<cr>

          "│-v-6 │ __fixed_window_width:
          "└─────┴───────────────────────
            nnoremap <leader>W :call g:TimToggleWindowFixedWidth()<cr>

          "│-v-6 │ __fixed_window_height:
          "└─────┴───────────────────────
            nnoremap <leader>H :call g:TimToggleWindowFixedHeight()<cr>

          "│-v-6 │ __box_characters_mapping:
          "└─────┴───────────────────────────
            vnoremap <silent> <leader>x :call g:BoxCharacters()<cr>

          "│-v-6 │ __line_number_modes_mappings:
          "└─────┴───────────────────────────────
            if v:version < 704
            "nnoremap <silent> <leader>n :call g:ToggleNuMode()<cr>

              nnoremap <silent> <leader>NN :call g:ToggleNuMode(-1)<cr>
             
             
              nnoremap <silent> <leader>n0 :call g:ToggleNuMode(0)<cr>
              nnoremap <silent> <leader>no :call g:ToggleNuMode(0)<cr>
              nnoremap <silent> <leader>nO :call g:ToggleNuMode(0)<cr>
             
              nnoremap <silent> <leader>na :call g:ToggleNuMode(1)<cr>
              nnoremap <silent> <leader>nA :call g:ToggleNuMode(1)<cr>
             
              nnoremap <silent> <leader>nr :call g:ToggleNuMode(2)<cr>
              nnoremap <silent> <leader>nR :call g:ToggleNuMode(2)<cr>
            else
              nnoremap <silent> <leader>nr :set relativenumber!<cr>
              nnoremap <silent> <leader>na :set number!<cr>
            endif

          "│-v-6 │ __display_mode_mappings:
          "└─────┴──────────────────────────
            nnoremap <silent> <leader>d :call ToggleDisplayMode()<cr>

          "│-v-6 │ __viewdir_mappings
          "└─────┴─────────────────────
            nnoremap <silent> <f6> :call g:toggleviewdir()<cr>

          "│-v-6 │ Insert literal tab character
          "└─────┴──────────────────────────────
            inoremap <silent> <s-tab> <c-v><tab>

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
            nnoremap <silent> <f7> :call g:open_writing_project()<cr>

        "│-v-5 │ mappings to Plug-ins
        "└─┬───┴─┬────────────────────
          "│-v-6 │ __gundo_mappings:
          "└─────┴───────────────────
            " toggle Gundo:
            nnoremap <silent> <leader>u :GundoToggle<cr>

          "│-v-6 │ __full_screen_mappings:
          "└─────┴─────────────────────────
            map <silent> <F11> <Esc>:call ToggleFullScreen()<CR>

          "│-v-6 │ __a_mappings:
          "└─────┴───────────────
            nnoremap <silent> <leader>a :AV<cr>
            nnoremap <silent> <leader>s :AV<cr>

            " TODO: move this somewhere more sensible:
            nnoremap <silent> <leader>v :vs<cr>

          "│-v-6 │ __rainbow_parentheses_mappings:
          "└─────┴─────────────────────────────────
            nnoremap <silent> <leader>r :RainbowParenthesesToggle<cr>

      "│-v-4 │ Auto-commands
      "└─┬───┴─┬─────────────
        "│-v-5 │ Independent auto-commands
        "└─────┴───────────────────────────
          autocmd BufRead,BufNewFile *.txtfmt setfiletype txtfmt
        "│-v-5 │ function auto-commands
        "└─┬───┴─┬──────────────────────
          "│-v-6 │ __multi_window_autocmds
          "└─────┴─────────────────────────
            autocmd WinLeave * :call TimWinLeaveWithGundo()
            autocmd WinEnter * :call TimWinEnterWithGundo()

      "│-v-4 │ Abbreviations
      "└─┬───┴─┬─────────────
        "│-v-5 │ Shortcuts
        "└─────┴───────────
          ab ?! ‽
          ab !? ‽

          :ab ,.0 ⁰
          :ab ,.1 ¹
          :ab ,.2 ²
          :ab ,.3 ³
          :ab ,.4 ⁴
          :ab ,.5 ⁵
          :ab ,.6 ⁶
          :ab ,.7 ⁷
          :ab ,.8 ⁸
          :ab ,.9 ⁹

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
        "autocmd WinLeave * set nocursorline nocursorcolumn
        "autocmd WinEnter * set cursorline cursorcolumn
        "set cursorline cursorcolumn

        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
        set cursorline

      "│-v-4 │ Window Width & Such
      "└─────┴─────────────────────
        set winminwidth=5

      "│-v-4 │ Invisible characters depiction.
      "└─────┴─────────────────────────────────
        " __requires_utf_8:
        set listchars=tab:│·,trail:·,extends:→

        au BufNewFile,BufRead *.cpp,*.h,*.vim,*.rb,*.java,*.snippets,*.py set list

      "│-v-4 │ Miscellaneous
      "└─────┴───────────────
        set showcmd
        setglobal display=lastline,uhex

      "│-v-4 │ Color Column
      "└─────┴──────────────
        set colorcolumn=81,101,121

      "│-v-4 │ Fold line
      "└─────┴───────────────
        function! NeatFoldText()
          let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{{\d*\s*', '', 'g') . ' '
          let lines_count = v:foldend - v:foldstart + 1
          "let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
          let lines_count_text = '╡ ' . printf("%10s", lines_count . ' lines') . ' ╞'
          "let foldchar = '·'
          let foldchar = '═'
          let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
          let foldtextend = lines_count_text . repeat(foldchar, 8)
          let length = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g'))
          return foldtextstart . repeat(foldchar, winwidth(0)-length) . foldtextend
        endfunction
        set foldtext=NeatFoldText()

    "│-v-3 │ Custom Functions
    "└─┬───┴─┬────────────────
      "│-v-4 │ Display Mode Stuff
      "└─────┴────────────────────
        " Mappings (@__display_mode_mappings):
        function! g:ApplyDisplayMode(...)
          if a:0
            let g:timdisplaymode = a:1
          endif

          if g:timdisplaymode == 'code'
            "set cursorcolumn
            set nospell                                    " -v-

            if &filetype=='vimwiki'
              setlocal linebreak
            else
              set nolinebreak
            endif

            if has('win32')
              set guifont=Consolas_for_Powerline_FixedD:h18:cDEFAULT
            else
              set guifont=Consolas\ for\ Powerline\ 18
            endif

            colorscheme badwolf
            set display-=lastline
            let &showbreak = ''
            set foldmarker=-v-,-^-
            "au WinEnter * set cursorcolumn
                                                           " -^-
          elseif g:timdisplaymode == 'composition'
            set nocursorcolumn
            setlocal spell                                 " -v-
            "inoremap <C-BS> <Esc>b1z=wi
            inoremap <C-BS> <Esc>mp[s1z=`pi

            setlocal linebreak

            if has('win32')                                          
              set guifont=Consolas_for_Powerline_FixedD:h20:cDEFAULT 
            else                                                     
              set guifont=Consolas\ for\ Powerline\ 18               
            endif                                                    

            colorscheme timatrix
            setlocal display+=lastline
            let &showbreak = '  '
            " setlocal foldmarker={{{,}}}
            set foldmarker=-v-,-^-
            au BufEnter * set nocursorcolumn
          endif                                            " -^-
        endfunction

        let g:timdisplaymode = ''
        call g:ApplyDisplayMode('code')

        function! ToggleDisplayMode()
          if g:timdisplaymode == 'code'
            let g:timdisplaymode = 'composition'
          else
            let g:timdisplaymode = 'code'
          endif

          call g:ApplyDisplayMode()
        endfunction

"│-v-1 │ Transient settings
"└─────┴────────────────────
  " This is meant for sourcing in convenience settings that don't really
  " belong in this file.
  :source ~/Dropbox/code/zigzagdungeon/vimsetup.vim

" vim: set fmr=-v-,-^- fdm=marker cms=//%s et ts=2 sw=2 sts=2 :

