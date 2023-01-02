#!/usr/bin/env bash

# One Dark colors for Tmux

# guifg=#d4be98 guibg=#3c3836
set -g mode-style "fg=#d4be98,bg=#504945"

set -g message-style "fg=#d4be98,bg=#3c3836"
set -g message-command-style "fg=#d4be98,bg=#504945"

set -g pane-border-style "fg=#5b534d,bg=#3c3836"
set -g pane-active-border-style "fg=#928374,bg=#3c3836"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#d4be98,bg=#3c3836"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#32302f,bg=#a89984,bold] #S "
set -g status-right "#{prefix_highlight}#[fg=#d4be98,bg=#5b534d] %d-%b %H:%M #[fg=#32302f,bg=#a89984,bold] #h "

setw -g window-status-activity-style "underscore,fg=#d4be98,bg=#3c3836"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#d4be98,bg=#3c3836"
setw -g window-status-format "#[default] #I:#W#F"
setw -g window-status-current-format " #I:#W#F"

set -g @prefix_highlight_fg '#32302f' # default is 'colour231' 00
set -g @prefix_highlight_bg '#7daea3'  # default is 'colour04' 03
