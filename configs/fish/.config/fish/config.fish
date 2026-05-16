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
alias search="pacman -Slq | fzf --preview 'pacman -Si {}'"
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
alias fkill='ps -eo pid,comm | fzf -m --nth=4 | awk "{print \$2}" | xargs kill -9'
alias transcribe='~/Documents/transcribe.py'
alias archive='~/Documents/archive_ux570.py'
alias wormon='hyprctl eval "hl.monitor({ output = \"DP-2\", mode = \"1720x1440@100.00\", position = \"auto\", scale = \"auto\" })"'
alias permon='hyprctl eval "hl.monitor({ output = \"DP-2\", mode = \"3440x1440@100.00\", position = \"auto\", scale = \"auto\" })"'
function yts
    set query (string join " " $argv)
    yt-dlp "ytsearch10:$query" --flat-playlist --print "%(title)s | %(id)s" \
    | fzf --ansi \
    | awk -F'|' '{print $2}' \
    | xargs -I {} mpv "https://www.youtube.com/watch?v={}"
end
function ytsi
    set query (string join " " $argv)

    yt-dlp "ytsearch10:$query" \
        --print "%(title)s | %(id)s | %(thumbnail)s" \
    | fzf --ansi --with-nth=1 \
        --preview='echo {} | awk -F"|" "{print \$3}" | xargs -I {} viu -w 40 -h 20 {}' \
        --preview-window=right:50%:wrap \
    | awk -F'|' '{print $2}' \
    | xargs -I {} mpv "https://www.youtube.com/watch?v={}"
end
function kokuscan
    set folder ~/scans/kokuyo/(date +%Y-%m-%d)
    mkdir -p $folder
    scanimage -d pixma:04A91912_51AC2E --batch="$folder/scan_%03d.png" --format=png --resolution 600 --batch-prompt -x 148 -y 115
end

function ccscan
    set folder ~/scans/cc/(date +%Y-%m-%d)
    mkdir -p $folder
    scanimage -d pixma:04A91912_51AC2E --batch="$folder/scan_%03d.png" --format=png --resolution 600 --batch-prompt -x 110 -y 85
end

function kokuscan-clip
    scanimage -d pixma:04A91912_51AC2E --format=png --resolution 600 -x 148 -y 115 | wl-copy --type image/png
end

function ccscan-clip
    scanimage -d pixma:04A91912_51AC2E --format=png --resolution 600 -x 110 -y 85 | wl-copy --type image/png
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

set -x LD_LIBRARY_PATH /home/joonas/whisper-venv/lib/python3.14/site-packages/nvidia/cublas/lib $LD_LIBRARY_PATH
