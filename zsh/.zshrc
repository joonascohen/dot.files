# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:~/.emacs.d/emacs/bin"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="lukerandall"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
alias l='eza -G --icons'
alias la='eza -a'
alias ll='eza -lah'
alias ls='eza'
alias clock='tty-clock -cst -C1 -S'
alias nfzf="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n1 nvim"
alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
alias fzf-tmux="fzf-tmux --preview 'bat --style=numbers --color=always {}' | xargs -n1 nvim"
alias eza="eza --icons -o --git -a"
# alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"

# fzf
eval "$(fzf --zsh)"
source /usr/share/fzf/key-bindings.zsh

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--border=bold --border=rounded --margin=3% --preview 'bat --color=always {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# bat theme
# export BAT_THEME=gruvbox-dark

# zoxide (cd)
eval "$(zoxide init zsh)"
alias cd="z"

# fastfetch
alias fastfetch="fastfetch -l arch_small --logo-color-1 blue -s OS:Kernel:Packages:Shell:WM:Terminal:Memory:Ram:Colors"

# Weather with wttr.in
alias localwx="curl wttr.in/Azusa\?0qp"
alias weather="curl wttr.in/"
alias weatheradv="curl v2d.wttr.in/"

# suffix alias
alias -s pdf=zathura

# xclip alias
alias copy="xclip -selection clipboard"

# pacman alias
alias upgrade="sudo pacman -Syu"
alias clear-cache="sudo pacman -Scc"

# weather
alias ryan="mpv https://youtube.com/@ryanhallyall/live"
alias max="mpv https://youtube.com/@maxvelocitywx/live"

# chill beats
alias lofi="mpv https://www.youtube.com/watch?v=jfKfPfyJRdk"

# carl
alias gcarl="carl && carl -a | grep $(date +%F)"

# radar
alias radar="curl -sSL https://radar.weather.gov/ridge/standard/CONUS-LARGE_loop.gif | feh -"

# restart dunst
alias redunst="pkill dunst && dunst &"

# alias for boox stuff
alias palma="/home/joonas/Documents/Boox/Sync/BooxPalma/"
alias booxgo="~/Documents/Boox/Sync/BooxGo/"

# alias for arttime
alias work="~/.scripts/pomo"
