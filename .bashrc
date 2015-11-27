eval "$(rbenv init -)"

export EDITOR="vim"
export GIT_EDITOR="vim"
export GEM_EDITOR="vim"

export PATH="$HOME/dev/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/dev/tools:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

eval "$(direnv hook bash)"
