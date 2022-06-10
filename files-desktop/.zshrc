# Oh my zsh
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="rkj-repos"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History file
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# Zsh basic settings
setopt autocd nomatch
unsetopt beep notify

# Vi keybinds
#bindkey -v
#export KEYTIMEOUT=1

# Compinit
autoload -Uz compinit
compinit

# Preferred editor
export EDITOR='vim'

# Supress wine warnings
WINEDEBUG="fixme-all"

#Hide '%'
#unsetopt PROMPT_SP

# Alias
alias pss="yay -Ss"
alias pqs="yay -Qs"
alias fss="yay -Slq | fzf -m --preview 'yay -Si {1}'| xargs -ro yay -S"
alias mkdir="mkdir -pv"
alias la="ls -lA"
alias l="ls -lAh"
alias v="vim"
alias vv="vim ~/vimwiki/index.wiki"
alias rcp="rsync --progress --size-only --inplace --recursive --verbose"
alias drepl="dub run drepl -q"
alias weather="curl wttr.in/brugge --silent | head -n37"
alias wallpaper="wal -i"
alias proton="STEAM_COMPAT_DATA_PATH=/home/jonas/Games/Steam/steamapps/compatdata/default/ /home/jonas/.steam/steam/compatibilitytools.d/Proton-*-GE*/proton"

# Functions

function loop() {
    while true; do
        $@
    done
}

function vnc() {
    zsh -c "export DISPLAY=:1 && Xvfb :1 -screen 0 1920x1080x16 & (x11vnc -passwd walrus -q && killall -9 Xvfb) & $1" &>/dev/null & disown %zsh
}
