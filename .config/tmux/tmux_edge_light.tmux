#!/usr/bin/env bash

# One Dark colors for Tmux

set -g mode-style "fg=#4b505b,bg=#e8ebf0"

set -g message-style "fg=#4b505b,bg=#e8ebf0"
set -g message-command-style "fg=#4b505b,bg=#dde2e7"

set -g pane-border-style "fg=#cacdd2,bg=#e8ebf0"
set -g pane-active-border-style "fg=#4b505b,bg=#e8ebf0"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#4b505b,bg=#e8ebf0"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#fafafa,bg=#bf75d6,bold] #S "
set -g status-right "#{prefix_highlight}#[fg=#4b505b,bg=#dde2e7] %d-%b %H:%M #[fg=#fafafa,bg=#bf75d6,bold] #h "

setw -g window-status-activity-style "underscore,fg=#4b505b,bg=#e8ebf0"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#4b505b,bg=#e8ebf0"
setw -g window-status-format "#[default] #I:#W#F"
setw -g window-status-current-format " #I:#W#F"

set -g @prefix_highlight_fg '#fafafa' # default is 'colour231' 00
set -g @prefix_highlight_bg '#3a8b84'  # default is 'colour04' 03
