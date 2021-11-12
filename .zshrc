# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/trung/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"
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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

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

COMPLETION_WAITING_DOTS="true"

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

source ~/.zplug/init.zsh

# Enhanccd
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_FILTER=fzf:fzy:fzf-tmux:peco:percol:gof:pick:icepick:sentaku:selecta
export ENHANCD_COMMAND=ecd


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

plugins=( 
    colored-man-pages
    colorize
    copyfile
    fd
    git
    z
    web-search
    zsh-interactive-cd
    zsh-autosuggestions
    zsh-syntax-highlighting # must be last
)
source $ZSH/oh-my-zsh.sh

# colorize setting
export ZSH_COLORIZE_TOOL=chroma
export ZSH_COLORIZE_STLYE="monokai"
# out of chroma: --style must be one of "abap","algol","algol_nu","arduino","autumn","borland","bw","colorful","dracula","emacs","friendly","fruity","github","igor","lovelace","manni","monokai","monokailight","murphy","native","paraiso-dark","paraiso-light","pastie","perldoc","pygments","rainbow_dash","rrt","solarized-dark","solarized-dark256","solarized-light","swapoff","tango","trac","vim","vs","xcode" but got "default"

# fzf config, run ~/.fzf/install to reset config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bindkey -v
bindkey -M viins '^R' fzf-history-widget # r for reverse history search
# bindkey -M viins '^x^f' fzf-file-widget # f for file
# bindkey -M viins '^x^j' fzf-cd-widget # j for jump
# bindkey -M viins '^t' transpose-chars # t for transpose
# bindkey -M viins '\ec' capitalize-word # c for capitalizae
bindkey -r "^T" # was for fzf-file-widget
bindkey -r "^[c" # was for fzf-cd-widget


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

# Aliases
## config
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"
alias vimconfig='vim ~/.vimrc'
## ls, exa
alias ls='exa --icons --classify'
alias l2='exa --icons --classify --tree --level=2'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias dud='du -d 1 -h'
alias duf='du -sh'
alias t='tail -f'
## fd-find
alias fd='fdfind'
## Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'
## cless, ccat
alias cat='colorize_cat'
alias less='colorize_less'
## Git
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all -20"
alias gpl='git pull'
## cd, enhancd
alias c='ecd'
alias cdd='cd /mnt/d/'
alias cdc='cd /mnt/c/'
alias cdw='cd /mnt/d/Workspace/'
alias cdo='cd /mnt/d/OneDrive/'
## explorer
alias explorer='explorer.exe'
alias x.='explorer .'
alias x='explorer'
alias x~='explorer \\\\wsl$\\Ubuntu-20.04\\home\\trung'
## vim
alias vi='vim'

# Turn off Bell
unsetopt BEEP

# Default Vim editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Put this on the bottom of file
# SPACESHIP_PROMPT_ADD_NEWLINE="true" 
# SPACESHIP_CHAR_SYMBOL=" \uf0e7" 
# SPACESHIP_CHAR_PREFIX="\uf296" 
# SPACESHIP_CHAR_SUFFIX=(" ") 
# SPACESHIP_CHAR_COLOR_SUCCESS="yellow" 
# SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER" 
# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true" 
# SPACESHIP_USER_SHOW="true"

# No need for the next 2 lines because I am using exa 
# export LS_COLORS="di=34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;33;40:cd=1;33;40:su=0;41:sg=0;43:tw=0;42:ow=34;40:"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir dir_writeable vcs ssh newline prompt_char)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_inidicator command_execution_time background_jobs direnv asdf virtualenv anaconda pyenv goenv nodenv nvm nodeenv rbenv rvm fvm luaenv jenv plenv phpenv scalaenv haskell_stack kubecontext terraform aws aws_eb_env azure gcloud google_app_cred toolbox context nordvpn ranger nnn xplr vim_shell midnight_commander nix_shell vi_mode todo timewarrior taskwarrior time ram battery newline)




