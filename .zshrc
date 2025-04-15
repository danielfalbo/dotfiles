eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1

function parse_git_branch() { git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ [\1]/p' }
setopt PROMPT_SUBST
PROMPT='%F{141}%~%(?.%F{reset}.%F{red})%F{green}$(parse_git_branch)%F{reset} $ %F{reset}'

homebrew_plugins=(autosuggestions syntax-highlighting)

for plugin in ${homebrew_plugins}
    source ${HOMEBREW_PREFIX}/share/zsh-${plugin}/zsh-${plugin}.zsh

alias rm='trash'

function empty_commit() {
    TMPFILE=".tmp"
    vim -c "set nocursorline" -c "Goyo" -c "startinsert" "$TMPFILE"
    [ -s "$TMPFILE" ] && git commit --allow-empty -m "$(cat "$TMPFILE")"
    rm "$TMPFILE"
}

alias cdj='[ -z "$JOURNAL_DIR" ] && echo "export JOURNAL_DIR first" && return 1 || cd $JOURNAL_DIR'
alias j='cdj && empty_commit'

alias glg='git log --pretty=format:"%C(240)%ad%Creset%s%n%b" --date=format:"%Y-%m-%d %I:%M%p%n"'

alias gsp='echo $(git status -s --porcelain)'
alias gcp='git pull && git add . && git commit -m "$(gsp)" && git push'

alias gd='git diff'
alias gp='git push'

alias vt='vim $(date -u +%Y-%m-%d).md'

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
