export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"

red=$'\e[31m' # Red
green=$'\e[32m' # Green
white=$'\e[37m' # White

# display git status
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\u@\[$green\]\w\[$red\]\[$white\]> "
