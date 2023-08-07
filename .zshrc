# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"

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
plugins=(git
         zsh-autosuggestions
         zsh-syntax-highlighting
        )

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

vim_mode="-- INSERT --"
function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode="-- INSERT --"
}
zle -N zle-line-finish

TMP=$PROMPT
PROMPT='${vim_mode}'$'\n'$PROMPT

bindkey -v
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias la="ls -lah"
alias ll="ls -ll" 
extra_ssh_args="-v $HOME/.ssh/id_rsa:/home/vscode/.ssh/id_rsa -v $HOME/.ssh/id_rsa.pub:/home/vscode/.ssh/id_rsa.pub -v $HOME/.ssh/known_hosts:/home/vscode/.ssh/known_hosts"
extra_yocto_args="-v devcontainer_home:/home ${extra_ssh_args}"
alias cthardknott="run_docker ${extra_yocto_args} yocto/hardknott"
alias git_authors="git for-each-ref --format='%(objecttype);%(refname);%(committername);%(committerdate)' --sort=committer refs/remotes/origin/"
run_docker() {
    if [ $# -lt 1 ]; then
	    echo "Not enough arguments, usage: run_docker [options] <image>[:<tag>]"
    else
	    dcmd="docker run -ti --rm -v $HOME/fw:/workspaces -w /workspaces $@"
	    echo ${dcmd}
	    eval ${dcmd}
    fi
}
bmap_copy() {
	local disc_by_id="/dev/disk/by-id"
	local dest_disk=$(ls /dev/disk/by-id | egrep '^usb-Linux_UMS_disk_0_[0-9a-z]{,18}-0:0$')
	local dest_path="/dev/disk/by-id/${dest_disk}"
	sudo bmaptool copy "$1" "${dest_path}"
}
alias devsh="sudo picocom -b 115200 /dev/ttyUSB0"
alias lv="lvim"
alias v="nvim"
alias cdf="cd /home/ebdemir/fw/codec_firmware_root/sources/firmware/"
alias cgca="/home/ebdemir/fw/codec_firmware_root/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gca/1.0+git999-r0/recipe-sysroot-native/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/10.2.0/aarch64-poky-linux-strip /home/ebdemir/fw/codec_firmware_root/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gca/1.0+git999-r0/gca-1.0+git999/opt/bin/gca; scp -O /home/ebdemir/fw/codec_firmware_root/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gca/1.0+git999-r0/gca-1.0+git999/opt/bin/gca root@172.25.253.90:/usr/bin"

# opam configuration
[[ ! -r /home/ebdemir/.opam/opam-init/init.zsh ]] || source /home/ebdemir/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
