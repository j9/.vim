#!/bin/bash
VIM_CONFIG="${HOME}/.vimrc"

msg()
{
  echo " * $1"
}


run_git()
{
  git submodule update --init
}


create_vimrc()
{
  msg "creating ${VIM_CONFIG}"
  echo "source ~/.vim/rc.vim" > ${VIM_CONFIG}
}


create_config()
{
  if [ -f ${VIM_CONFIG} ]; then
    backup_config=${VIM_CONFIG}_old
    msg "vim config already exists, backing up to '${backup_config}'"
    mv ${VIM_CONFIG} ${backup_config}
    create_vimrc
  else
    msg "vim config does not exist"
    create_vimrc
  fi
}


run_install()
{
  run_git
  create_config
}


run_install
