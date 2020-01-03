# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# user specific aliases and functions
alias l='ls -la'

# using xdebug on php development
CLIENTIP=$(netstat -tn 2>/dev/null | grep :22 | awk '{print $5}' | grep -v :22 | cut -d: -f1 | sort | uniq | sort -nr | head)
alias xphp="XDEBUG_CONFIG=\"idekey=PHPSTORM\" PHP_IDE_CONFIG=serverName=\"$HOSTNAME\" php -d \"xdebug.remote_host=$CLIENTIP\" -d \"xdebug.remote_connect_back=0\" -d \"xdebug.remote_port=9000\" -d \"xdebug e_enable=1\""

# extending git on cmd-lines
git_branch() {
	GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null) || return
	[ -n "$GIT_BRANCH" ] && echo "($GIT_BRANCH)"
}
PS1='\[\033[01;32m\]\u@\h \W\033[01;31m\]$(git_branch)\[\033[01;34m\]\$\[\033[00m\]\ '
