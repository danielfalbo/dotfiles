eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1

function parse_git_branch() { git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ [\1]/p' }
setopt PROMPT_SUBST
PROMPT='%F{141}%~%(?.%F{reset}.%F{red}) $ %F{reset}'
RPROMPT='%F{green}$(parse_git_branch)%F{reset}'

homebrew_plugins=(autosuggestions syntax-highlighting)

for plugin in ${homebrew_plugins}
    source ${HOMEBREW_PREFIX}/share/zsh-${plugin}/zsh-${plugin}.zsh

alias rm='trash'
alias c='cursor'

alias gsp='echo $(git status -s --porcelain)'
alias gcp='git pull && git add . && git commit -m "$(gsp)" && git push'

# git journaling
function j() {
    if [ -z "$JOURNAL_DIR" ]; then
        echo "Error: JOURNAL_DIR environment variable is not set"
        return 1
    fi

    cd $JOURNAL_DIR
    TMPFILE=".tmp_entry"

    vim -c ":set nocursorline" -c "Goyo" -c "startinsert" "$TMPFILE"

    if [ -s "$TMPFILE" ]; then
        git add "$TMPFILE"
        git commit -m "$(cat "$TMPFILE")"
    fi

    rm "$TMPFILE"
}

function jlog() {
    if [ -z "$JOURNAL_DIR" ]; then
        echo "Error: JOURNAL_DIR environment variable is not set"
        return 1
    fi

    cd $JOURNAL_DIR
    git log --pretty=format:"%C(240)%ad%Creset%n%s%n%n%b" --date=format:"%Y-%m-%d %I:%M:%S%p"

}
alias jpush='cd $JOURNAL_DIR && git push'

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

autoload -Uz compinit && compinit

