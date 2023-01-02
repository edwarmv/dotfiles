#!/usr/bin/env bash

# One Dark colors for Tmux

set -g mode-style "fg=#abb2bf,bg=#393f4a"

set -g message-style "fg=#abb2bf,bg=#21252b"
set -g message-command-style "fg=#abb2bf,bg=#393f4a"

set -g pane-border-style "fg=#5c6370,bg=#393f4a"
set -g pane-active-border-style "fg=#abb2bf,bg=#393f4a"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#abb2bf,bg=#21252b"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#abb2bf,bg=#21252b,bold] #S #[fg=#abb2bf,bg=#21252b,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#21252b,bg=#21252b,nobold,nounderscore,noitalics] #{prefix_highlight}#[fg=#21252b,bg=#5c6370] %Y-%m-%d %I:%M %p #[fg=#abb2bf,bg=#21252b,nobold,nounderscore,noitalics]#[fg=#abb2bf,bg=#21252b,bold] #h "

setw -g window-status-activity-style "underscore,fg=#abb2bf,bg=#21252b"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#798294,bg=#21252b"
setw -g window-status-format "#[default] #I:#W#F"
setw -g window-status-current-format " #I:#W#F"

set -g @prefix_highlight_fg '#21252b' # default is 'colour231' 00
set -g @prefix_highlight_bg '#98c379'  # default is 'colour04' 03
