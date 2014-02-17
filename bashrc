#!/bin/bash

#│-v-1 │ To-Do's
#└─────┴─────────
  # (not actually settings, just settings todo's)
  # TODO Make a neat PS1

#│-v-1 │ Set-up
#└─┬───┴─┬──────
  #│-v-2 │ Behavior
  #└─────┴──────────
    # vi input mode for the command line
    set -o vi
  #│-v-2 │ Appearance
  #└─┬───┴─┬──────────
    #│-v-3 │ Built-in Settings
    #└─┬───┴─┬─────────────────
      #│-v-4 │ Prompt Appearance
      #└─────┴───────────────────

        # text colors -v-
        TXTBLK='\[\e[0;30m\]'           # Black - Regular
        TXTRED='\[\e[0;31m\]'           # Red
        TXTGRN='\[\e[0;32m\]'           # Green
        TXTYLW='\[\e[0;33m\]'           # Yellow
        TXTBLU='\[\e[0;34m\]'           # Blue
        TXTPUR='\[\e[0;35m\]'           # Purple
        TXTCYN='\[\e[0;36m\]'           # Cyan
        TXTWHT='\[\e[0;37m\]'           # White
        BLDBLK='\[\e[1;30m\]'           # Black - Bold
        BLDRED='\[\e[1;31m\]'           # Red
        BLDGRN='\[\e[1;32m\]'           # Green
        BLDYLW='\[\e[1;33m\]'           # Yellow
        BLDBLU='\[\e[1;34m\]'           # Blue
        BLDPUR='\[\e[1;35m\]'           # Purple
        BLDCYN='\[\e[1;36m\]'           # Cyan
        BLDWHT='\[\e[1;37m\]'           # White
        UNDBLK='\[\e[4;30m\]'           # Black - Underline
        UNDRED='\[\e[4;31m\]'           # Red
        UNDGRN='\[\e[4;32m\]'           # Green
        UNDYLW='\[\e[4;33m\]'           # Yellow
        UNDBLU='\[\e[4;34m\]'           # Blue
        UNDPUR='\[\e[4;35m\]'           # Purple
        UNDCYN='\[\e[4;36m\]'           # Cyan
        UNDWHT='\[\e[4;37m\]'           # White
        BAKBLK='\[\e[40m\]'             # Black - Background
        BAKRED='\[\e[41m\]'             # Red
        BAKGRN='\[\e[42m\]'             # Green
        BAKYLW='\[\e[43m\]'             # Yellow
        BAKBLU='\[\e[44m\]'             # Blue
        BAKPUR='\[\e[45m\]'             # Purple
        BAKCYN='\[\e[46m\]'             # Cyan
        BAKWHT='\[\e[47m\]'             # White
        TXTRST='\[\e[0m\]'              # Text Reset

        TXT236='\[\e[38;5;236m\]'       # Darkest Grey - Regular
        TXT238='\[\e[38;5;238m\]'       # Darker Grey
        TXTDGY='\[\e[38;5;000m\]'       # Dark Grey
        TXT232='\[\e[38;5;232m\]'       # Black
        TXTBRD='\[\e[38;5;088m\]'       # Bright Red
        TXTBBR='\[\e[38;5;196m\]'       # Brightest Red

        BAK233='\[\e[48;5;233m\]'       # Darkest Grey - Background
        BAK241='\[\e[48;5;241m\]'       # Darker Grey
        BAK000='\[\e[48;5;000m\]'       # Dark Grey
        BAKBRD='\[\e[48;5;130m\]'       # Bright Red
        BAKBBR='\[\e[48;5;166m\]'       # Brightest Red
        #-^-

        terminal_is_new=1

        function change_ps1
        {
          prev_exit=$?
          the_ps1=""
          if [ $terminal_is_new = 1 ] ; then
            terminal_is_new=0
          else
            if [ $prev_exit = 0 ] ; then
              the_ps1+="${TXTGRN}✓\n\n"
            else
              the_ps1+="${TXTRED}✗ (exit code ${prev_exit})\n\n"
            fi
          fi

          the_ps1+="${TXTBLU}\w\n"

          the_ps1+="${TXTBLU} ⇒ ${TXTRST}"
          export PS1=${the_ps1}
        }
        PROMPT_COMMAND=change_ps1
        export PS2="${TXTCYN}…⇒ ${TXTRST}"

        # Notes:
        # ===-v-
        #
        # For detailed info on customizing the bash prompt, see:
        # http://www.gilesorr.com/bashprompt/howto/ 
        #
        # For some good ideas, see:
        # http://www.reddit.com/r/commandline/comments/1do8cb/alright_echo_your_ps1s_lets_see_your_colourful/
        # http://www.reddit.com/r/programming/comments/697cu/bash_users_what_do_you_have_for_your_ps1/
        #
        # echo -n <value> will supress trailing newline
        # -^-

# vim: set fmr=-v-,-^- fdm=marker cms=#%s et ts=2 sw=2 sts=2 :
