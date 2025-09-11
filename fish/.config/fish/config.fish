if status is-interactive
    # Commands to run in interactive sessions can go here
end
# aliases
alias l='eza -G --icons'
alias la='eza -a'
alias ll='eza -lah --icons'
alias ls='eza --color=auto'
# git aliases
alias git?='clear; git status; git log --oneline -5'
alias gl='git log -p '

# pacman alias
alias install='sudo pacman -S'
alias search='sudo pacman -Ss'
alias info='sudo pacman -Si'
alias delete='sudo pacman -R'

# tmux alias
alias mon='~/.scripts/tmuxmonitoring'
alias topen='~/.scripts/tmuxopen'
alias tk='tmux kill-session'
alias bkup='~/.scripts/backups/runbackup'
alias tbkup='~/.scripts/backups/tbackup'
alias tman='~/.scripts/hyprland/tsplain'
alias tssh='~/.scripts/tmuxssh'
alias tnssh='~/.scripts/tmuxnewssh'
alias tnotes='~/.scripts/notes/stats'
alias ts='tmux new-session -s fish'
alias ns='~/.scripts/notes/gptstats'
# tree alias
alias t='eza -T --icons'
alias fkill='ps -eo pid,comm | fzf -m --nth=2 | awk "{print \$2}" | xargs kill -9'
function yts
    set query (string join " " $argv)
    yt-dlp "ytsearch10:$query" --flat-playlist --print "%(title)s | %(id)s" \
    | fzf --ansi \
    | awk -F'|' '{print $2}' \
    | xargs -I {} mpv "https://www.youtube.com/watch?v={}"
end
# sourcing
zoxide init fish | source
function fish_greeting
    pokemon-colorscripts -r
end
set fish_cursor_default block
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
fzf --fish | source
starship init fish | source
set -gx PATH $HOME/.scripts $PATH
cat /home/joonas/.cache/wal/sequences
set BAT_THEME "base16-256"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT "-c"
set -x FZF_DEFAULT_COMMAND "fd . --hidden --exclude '.git' --exclude '.local' --exclude '.steam' --exclude '.cache'"
set -x FZF_DEFAULT_OPTS "--layout=reverse --border=bold --border=rounded"
set -x FZF_ALT_C_COMMAND "fd . --type d --hidden --exclude '.git' --exclude '.local' --exclude '.steam' --exclude '.cache' --exclude '.wine' --exclude '.java' --exclude '.oh-my-zsh' --exclude 'grlevel3'"
set -x FZF_ALT_C_OPTS "--preview 'eza -T --icons --color=auto {} | head -50' --height=40% --border"
set -x FZF_ALT_C_OPTS "--preview 'eza -T --icons --color=auto {} | head -50' --height=40% --border"
set -x FZF_CTRL_T_OPTS "--preview='bat --style=numbers --color=always {}' --height=100% --bind shift-up:preview-page-up,shift-down:preview-page-down --bind 'ctrl-u:preview-up,ctrl-d:preview-down'"

set -x EDITOR "emacsclient -c"
