# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ______ _____ _   _ ______  _____ 
#|___  //  ___| | | || ___ \/  __ \
#   / / \ `--.| |_| || |_/ /| /  \/
#  / /   `--. \  _  ||    / | |    
#./ /___/\__/ / | | || |\ \ | \__/\
#\_____/\____/\_| |_/\_| \_| \____/

export _JAVA_AWT_WM_NONREPARENTING=1


# PATH
PATH=/home/neeffex/.cargo/bin:/home/neeffex/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/home/neeffex/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$HOME/.cargo/bin:$HOME/.cargo/env

autoload -Uz compinit
compinit -i

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#  ___   _     _____  ___   _____ _____ _____ 
# / _ \ | |   |_   _|/ _ \ /  ___|  ___/  ___|
#/ /_\ \| |     | | / /_\ \\ `--.| |__ \ `--. 
#|  _  || |     | | |  _  | `--. \  __| `--. \
#| | | || |_____| |_| | | |/\__/ / |___/\__/ /
#\_| |_/\_____/\___/\_| |_/\____/\____/\____/ 

alias ls='lsd --group-dirs=first'
alias lss='logo-ls'
alias cat='batcat'
alias kat='/usr/bin/cat'
alias v='nvim'
alias tmux='tmux -u'

#______ _   _ _   _ _____ _____ _____ _____ _   _  _____ 
#|  ___| | | | \ | /  __ \_   _|_   _|  _  | \ | |/  ___|
#| |_  | | | |  \| | /  \/ | |   | | | | | |  \| |\ `--. 
#|  _| | | | | . ` | |     | |   | | | | | | . ` | `--. \
#| |   | |_| | |\  | \__/\ | |  _| |_\ \_/ / |\  |/\__/ /
#\_|    \___/\_| \_/\____/ \_/  \___/ \___/\_| \_/\____/


# Remove
function remove(){
	scrub -p dod $1
	shred -zun 10 -v $1
}

#Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/Environment/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
