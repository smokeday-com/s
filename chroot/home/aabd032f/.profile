# 2026-10-26 Dmitrii Fediuk https://github.com/dmitrii-fediuk
if [ -z "$_ENV_SETUP_COMPLETE" ]; then
	# 2026-05-01 https://gemini.google.com/share/31fb0625eede
	o=(
		'/opt/remi/php82/enable'
	)
	for f in "${o[@]}"; do
		source "$f"
	done
	o=(
		"$HOME/.local/bin"
		"$HOME/bin"
		'/opt/remi/php82/root/usr/bin'
		'/opt/remi/php82/root/usr/sbin'
		'/opt/rh/rh-ruby23/root/usr/local/bin'
		'/opt/rh/rh-ruby23/root/usr/bin'
		'/opt/rh/rh-nodejs14/root/usr/bin'
		'/usr/local/sbin'
		'/usr/local/bin'
		'/sbin'
		'/bin'
		'/usr/sbin'
		'/usr/bin'
		'/opt/puppetlabs/bin'
	)
	export PATH="$(IFS=:; echo "${o[*]}")"
	unset o	f
	# 2017-06-09 For mage2pro/core
	export DF_DEVELOPER=1
	export EDITOR="vim"
	export VISUAL="vim"
	export TERM=xterm-256color
	export _ENV_SETUP_COMPLETE=1
fi
case $- in
	*i*) ;;
	  *) return;;
esac
. /etc/bashrc
export PS1='\[\e[01;33m\]\w\n\[\e[38;5;028m\]\$ \[\e[00m\]'
eval "$(dircolors)"
export LS_OPTIONS='--color=auto -h'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ..='cd ..'
alias ...='cd ../..'
alias composer="$HOME/.local/bin/composer"
