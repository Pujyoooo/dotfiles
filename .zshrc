typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)
alias change_profile='(){echo -e "\033]1337;SetProfile=$1\a"}'
if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
	[[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
	switch-arch() {
		if  [[ "$(uname -m)" == arm64 ]]; then
			arch=x86_64
			change_profile Intel
		elif [[ "$(uname -m)" == x86_64 ]]; then
			arch=arm64e
			change_profile ARM
		fi
		exec arch -arch $arch /bin/zsh
	}
	x64() {
		change_profile Intel
		exec arch -x86_64 /bin/zsh
	}
	a64() {
		change_profile ARM
		exec arch -arm64e /bin/zsh
	}
fi

setopt magic_equal_subst

alias ibrew="arch -x86_64 brew"
alias mbrew="arch -arm64e /opt/homebrew/bin/brew"
alias be="bundle exec"
alias dce="docker compose exec"
alias gldbd="git branch | grep -v 'develop' | grep -v 'master' | xargs git branch -D"
alias ../='cd ../'
alias ll='ls -al'
alias grs='git rebase skip'
alias grc='git rebase continue'
alias gst='git status'
alias derived="rm -rf ~/Library/Developer/Xcode/DerivedData/*"
alias gaa="git add --all"
alias gd="git diff"
alias gb="git branch"
alias gis="git switch"

export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(starship init zsh)"
eval "$(goenv init -)"

