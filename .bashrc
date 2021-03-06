#!/usr/bin/env bash

# First, make sure we're running interactively:

if [ -n "$PS1" ] ; then
  # Source my preferred environment, aliases and functions.

  [ -r ~/.bash/environment  ] && . ~/.bash/environment 
  [ -r ~/.bash/aliases      ] && . ~/.bash/aliases      
  [ -r ~/.bash/functions    ] && . ~/.bash/functions  

  # Then set my preferred prompts..

  PS1="$(PS1) "  # Command Prompt
  PS2="$(PS2) "  # Secondary Prompt
  PS3="? "       # Select Prompt
  PS4="+ "       # Debugging Prompt

  # ..and the title, in being visible, should be informative.

  tty? || trap 'echo -ne "\e]0;"; echo -n $BASH_COMMAND; echo -ne "\007"' DEBUG

  PROMPT_COMMAND="set_window_title"

  # Source host-specific settings, if any.

  [ -r ~/.bash/local        ] && . ~/.bash/local

fi
