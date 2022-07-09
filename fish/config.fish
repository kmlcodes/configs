# aliases
abbr -a nv 'nvim'
abbr -a l 'exa'
abbr -a ls 'exa'
abbr -a ll 'exa -l'
abbr -a lll 'exa -la'
abbr -a lt 'exa -T'
abbr -a pi 'paru -S'
abbr -a pr 'paru -R'

# append to PATH
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/.local/bin

# initial greeting
function fish_greeting
	# neofetch
end

# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
