if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias l='eza -G --icons'
alias la='eza -a'
alias ll='eza -lah --icons'
alias ls='eza --color=auto'
alias git?='clear; git status; git log --oneline -5'
alias install='sudo pacman -S'
alias search='sudo pacman -Ss'
alias info='sudo pacman -Si'
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
starship init fish | source
set -gx PATH $HOME/.scripts $PATH
cat /home/joonas/.cache/wal/sequences
set BAT_THEME "base16-256"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT "-c"
