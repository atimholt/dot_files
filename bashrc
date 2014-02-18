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

    # default editors
    export EDITOR="vim"
    export VISUAL="vim"

  #│-v-2 │ Appearance
  #└─┬───┴─┬──────────
    #│-v-3 │ Built-in Settings
    #└─┬───┴─┬─────────────────
      #│-v-4 │ Prompt Appearance
      #└─────┴───────────────────
        # TODO add lines for current hg / git branch, color depending on whether
        #      current

        # text colors -v-
        # Taken from (then fixed proper):
        # http://www.reddit.com/r/commandline/comments/1do8cb/A/c9sdp29
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
        TXTRST='\[\e[0m\]'              # Text Reset
        #-^-

        terminal_is_new=1

        function change_ps1
        {
          local prev_exit=$?
          local the_ps1=""
          if [ $terminal_is_new = 1 ] ; then
            terminal_is_new=0
          else
            if [ $prev_exit = 0 ] ; then
              the_ps1+="${TXTGRN}✓"
            else
              the_ps1+="${TXTRED}✗ (${prev_exit})"
            fi
            the_ps1+="${TXTRST}\n\n"
          fi

          the_ps1+="${BLDGRN}\u${BLDBLU}@${BLDGRN}\H "
          the_ps1+="${BLDBLU}\w"

          # repo branch and status by color
          # git code adapted from http://thepugautomatic.com/2008/12/git-dirty-prompt/
          current_branch="$(git branch --no-color 2> /dev/null | sed -e \
                         '/^[^*]/d' -e "s/* \(.*\)/\1/")"
          if [ -n "${current_branch}" ] ; then
            if [ -n "$(git status -s -u no 2> /dev/null)" ] ; then
              the_ps1+="${TXTYLW}"
            else
              the_ps1+="${TXTGRN}"
            fi
            the_ps1+=" [git:${current_branch}]"
          else # Only necessary if it’s not already another kind of repo.
            current_branch="$(hg branch 2> /dev/null)"
            if [ -n "${current_branch}" ] ; then
              if [ -n "$(hg stat -q 2> /dev/null)" ] ; then
                the_ps1+="${TXTYLW}"
              else
                the_ps1+="${TXTGRN}"
              fi
              the_ps1+=" [hg:${current_branch}]"
            fi
          fi

          the_ps1+="\n${TXTGRN}[${BLDBLU}!\!${TXTGRN}] 〉${TXTRST}"
          export PS1=${the_ps1}
        }
        PROMPT_COMMAND=change_ps1
        export PS2="${BLDBLU}    … ${TXTGRN}〉${TXTRST}"

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

# vim: set nowrap fmr=-v-,-^- fdm=marker cms=#%s et ts=2 sw=2 sts=2 :
