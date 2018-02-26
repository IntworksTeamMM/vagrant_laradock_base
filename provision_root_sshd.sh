#権限確認
whoami

#sshのログインログインで公開鍵を使わない設定に変更（ターミナルでログインするときめんどくさいので設定）
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
