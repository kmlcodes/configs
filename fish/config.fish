#==============================================
# Fish Shell config
#==============================================
#  Written by Kamal C. Upreti
#  (github.com/kml96)
#==============================================
# custom aliases
abbr -a cr 'cargo run'
abbr -a nv 'nvim'
abbr -a cl 'clear'

abbr -a l 'exa'
abbr -a ls 'exa'
abbr -a ll 'exa -l'
abbr -a lll 'exa -la'
abbr -a lt 'exa -T'

abbr -a pi 'paru -Sy'
abbr -a pr 'paru -Rcns'
abbr -a pu 'paru -Syu'

abbr -a gs 'git status'
abbr -a ga 'git add'
abbr -a gc 'git commit -m'
abbr -a gp 'git push'

# append to PATH
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/.local/bin

function fish_greeting
	# neofetch
end

# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
