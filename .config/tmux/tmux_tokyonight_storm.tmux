#!/usr/bin/env bash

# TokyoNight colors for Tmux

set -g mode-style "fg=#7aa2f7,bg=#3b4261"

set -g message-style "fg=#7aa2f7,bg=#1f2335"
set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

set -g pane-border-style "fg=#3b4261,bg=#1f2335"
set -g pane-active-border-style "fg=#7aa2f7,bg=#1f2335"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#7aa2f7,bg=#1f2335"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1f2335,bg=#7aa2f7,nobold] #S "
set -g status-right "#{prefix_highlight}#[fg=#7aa2f7,bg=#3b4261] %d-%b %H:%M #[fg=#1f2335,bg=#7aa2f7,nobold] #h "

set -g window-status-activity-style "underscore,fg=#c0caf5,bg=#1f2335"
set -g window-status-separator ""
set -g window-status-style "NONE,fg=#c0caf5,bg=#1f2335"
set -g window-status-format " #I:#W#F"
set -g window-status-current-format " #I:#W#F"
set -g window-status-last-style fg=#565f89,italics
set -g window-status-current-style fg=#7aa2f7

set -g popup-border-style fg=#29a4bd

set -g @prefix_highlight_fg '#1f2335' # default is 'colour231' 00
set -g @prefix_highlight_bg '#e0af68'  # default is 'colour04' 03
