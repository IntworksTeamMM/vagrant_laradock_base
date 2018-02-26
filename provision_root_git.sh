git config --global user.name ${GIT_USER}
git config --global user.email ${GIT_EMAIL}
git config --global core.editor 'vim'
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.co checkout

wget https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -P /usr/local/src
wget https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh -P /usr/local/src
mkdir /usr/local/script
cp /usr/local/src/git-completion.bash /usr/local/script && chmod a+x /usr/local/script/git-completion.bash
cp /usr/local/src/git-prompt.sh /usr/local/script && chmod a+x /usr/local/script/git-prompt.sh

cat << EOF
# git
source /usr/local/script/.git-completion.bash
source /usr/local/script/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
EOF >> /etc/bashrc
