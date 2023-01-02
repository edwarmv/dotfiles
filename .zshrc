# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/edwar/.oh-my-zsh"

ZVM_CURSOR_STYLE_ENABLED=false

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # fd
  git
  # gh
  # ng
  asdf
  npm
  yarn
  tmux
  zsh-autosuggestions
  alias-tips
  fzf
  # ripgrep
  zsh-vi-mode
  autoupdate
  n
)


function
zvm_after_init() {
  zvm_bindkey viins '^@' autosuggest-accept
  source /usr/local/Cellar/fzf/0.34.0/shell/key-bindings.zsh
  source /usr/local/Cellar/fzf/0.34.0/shell/completion.zsh
}

# gruvbox-material
ZVM_VI_HIGHLIGHT_FOREGROUND=#d4be98
ZVM_VI_HIGHLIGHT_BACKGROUND=#504945

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR='nvim'
alias vi='nvim'

# export TERM='xterm-kitty'

# https://minsw.github.io/fzf-color-picker
# gruvbox-material
# --tiebreak=length,end
export FZF_DEFAULT_OPTS='
  --bind='alt-j:preview-down,alt-k:preview-up,alt-d:preview-page-down,alt-u:preview-page-up,change:first,alt-a:select-all,alt-A:deselect-all,alt-p:toggle-preview'
  --preview-window noborder
  --layout=reverse
  --color=fg:#928374,bg:-1,hl:#7daea3
  --color=fg+:#928374,bg+:#3c3836,hl+:#7daea3
  --color=info:#d8a657,prompt:#d3869b,pointer:#d3869b
  --color=marker:#a9b665,spinner:#d3869b,header:#a9b665,preview-bg:-1
  --color=border:#928374
'

bindkey '^ ' autosuggest-accept
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="underline"

export NNN_BMS='h:~;c:~/.config;d:~/Documents;D:~/Downloads'
export NNN_PLUG='p:preview-tui;y:yoink'
export NNN_FIFO='/tmp/nnn.fifo'
#    -material               c1e2272e006033f7c6d6abc4
export NNN_FCOLORS='000004000000000200000000'
# export NO_COLOR=1

# export LS_COLORS="$(vivid generate gruvbox-material)"
# alias ls="gls --color"

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$(yarn global bin):$PATH"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# alias lazygit="lazygit -ucd ~/.config/lazygit"
alias luamake=/Users/edwar/github/lua-language-server/3rd/luamake/luamake

export JAVA_HOME=$(/usr/libexec/java_home)

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$HOME/.local/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# Load Angular CLI autocompletion.
source <(ng completion script)
