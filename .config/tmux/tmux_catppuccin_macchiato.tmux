#!/usr/bin/env bash

set -g mode-style "fg=#cad3f5,bg=#494d64"

set -g message-style "fg=#cad3f5,bg=#1e2030"
set -g message-command-style "fg=#cad3f5,bg=#494d64"

set -g pane-border-style "fg=#494d64,bg=#1e2030"
set -g pane-active-border-style "fg=#5b6078,bg=#1e2030"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#cad3f5,bg=#1e2030"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1e2030,bg=#8aadf4,bold] #S "
set -g status-right "#{prefix_highlight}#[fg=#cad3f5,bg=#494d64] %d-%b %H:%M #[fg=#1e2030,bg=#8aadf4,bold] #h "

set -g window-status-activity-style "underscore,fg=#cad3f5,bg=#1e2030"
set -g window-status-separator ""
set -g window-status-style "NONE,fg=#5b6078,bg=#1e2030"
set -g window-status-format " #I:#W#F"
set -g window-status-current-format " #I:#W#F"
set -g window-status-current-style fg=#cad3f5
set -g window-status-last-style fg=#5b6078,italics

set -g popup-border-style fg=#5b6078

set -g @prefix_highlight_fg '#1e2030' # default is 'colour231' 00
set -g @prefix_highlight_bg '#a6da95'  # default is 'colour04' 03

