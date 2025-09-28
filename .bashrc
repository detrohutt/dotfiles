#
# ~/.bashrc for WSL archlinux
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=/usr/sbin/nvim
export GALLIUM_DRIVER=d3d12
export LIBVA_DRIVER_NAME=d3d12

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gcm='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'

alias cde='cd /mnt/c/git/entremanure'
alias re='/mnt/c/git/entremanure/build/entremanure.exe'

# build entremanure
be() {
  # The Windows batch file path
  local script_path="C:\\git\\entremanure\\build.bat"
  
  # The "$@" will be expanded to include all arguments passed to this function.
  cmd.exe /c "${script_path}" "$@"
}
