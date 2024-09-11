### Start TMUX
if [[ "$TMUX" = "" ]]; then;
    TMUX="tmux new-session -d -s WEODIMENSION"
    eval "$TMUX"
    tmux attach-session -d -t WEODIMENSION
    tmux source ~/.tmux.conf
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi




### SHELL INTEGRATIONS ###
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias fk)"
export PATH="~/.config/bin:$PATH"
export PATH="~/.local/bin:$PATH"

# Defaults
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="st"

# Setup previews with fzf
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

### END OF INTEGRATIONS ###


### ------------- PLUG-INS --------------- ###
source /home/weoweo/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/fzf-tab/fzf-tab.zsh

#### -------------- END OF PLUG-INS ---------###

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)EZA_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview 'ls $realpath'

### ---------- ALIASES ----------- ###
alias ..="cd ../"
alias ...="cd ../; cd ../;"
alias ....="cd ../; cd ../; cd ../;"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user"
alias fishrc="nvim ~/.config/fish/config.fish"
alias zshrc="source ~/.zshrc"
alias q="exit"
alias zyp="sudo zypper"
alias zypse="zypper se"
alias sysUpt="sudo zypper dup"
alias qwerty="xmodmap ~/keymaps/qwerty/.Xmodmap"
alias colemak="xmodmap ~/keymaps/.Xmodmap"
alias TAMUDrive='cd /run/user/1000/gvfs/smb-share:server=storage.continu      um.tamu.edu,share=web/S-1-5-21-1167378736-2199707310-2242153877-1032325/      public_html'

# Nifty for school
alias googVM 'ssh -i ~/.ssh/google_vm lfexp35@35.223.84.22'
alias discord 'flatpak run com.discordapp.Discord'


alias zig='~/zig/./zig'


#----------------- FUNCTIONS ----------------#

vi() {
    if [[ -z "$argv" ]]; then
        nvim
        echo "!Closed WEOVIM!"
        return
    elif [[ "$argv[1]" = "." ]]; then
        nvim .
        echo "!Closed WEOVIM!"
        return
    else 
        nvim $argv[1]
        echo "!Closed WEOVIM!"
        return
    fi
}

vc() {
    if [[ -z "$argv" ]]; then
        NVIM_APPNAME=nvchad nvim
        echo "!Closed NvChad!"
        return
    elif [[ "$argv[1]" = "." ]]; then
        NVIM_APPNAME=nvchad nvim .
        echo "!Closed NvChad!"
        return
    else 
        NVIM_APPNAME=nvchad nvim $argv[1]
        echo "!Closed NvChad!"
        return
    fi
}

vl() {
    if [[ -z "$argv" ]]; then
        NVIM_APPNAME=nvimlazy nvim
        echo "!Closed LazyVim!"
        return
    elif [[ "$argv[1]" = "." ]]; then
        NVIM_APPNAME=nvimlazy nvim .
        echo "!Closed LazyVim!"
        return
    else 
        NVIM_APPNAME=nvimlazy nvim $argv[1]
        echo "!Closed LazyVim!"
        return
    fi
}
##--------------END OF ALIASES/FUNCTIONS----------------##
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


HISTSIZE=5000
HISTFILE=~/.config/.zsh_hist
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
