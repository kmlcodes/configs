#aliases
abbr -a cr 'cargo run'
abbr -a nv 'nvim'
abbr -a l 'exa'
abbr -a ls 'exa'
abbr -a ll 'exa -l'
abbr -a lll 'exa -la'
abbr -a lst 'exa -T'
abbr -a pi 'paru -Sy'
abbr -a pr 'paru -Rcns'
abbr -a pu 'paru -Syu'
abbr -a rb 'sudo reboot'
abbr -a sd 'sudo shutdown now'
abbr -a cl 'clear'

# add cargo to PATH
set PATH $PATH ~/.cargo/bin

function fish_greeting
	# neofetch
end

# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
