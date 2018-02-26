# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.ssh.insert_key = false

  # 必要ならポートを追加する
  config.vm.network "forwarded_port", guest: 22, host: 10022, id: "ssh"
  config.vm.network "forwarded_port", guest: 80, host: 10080, id: "web"
  config.vm.network "forwarded_port", guest: 8080, host: 18080

  # db用
  config.vm.network "forwarded_port", guest: 3306, host: 13306
  config.vm.network "forwarded_port", guest: 1521, host: 11521

  #初期設定
  config.vm.provision "shell", path: './provision_root.sh'
  config.vm.provision "shell", path: './provision_root_sshd.sh'
  
  # swapの設定はメモリが足りない場合などにやる
  #config.vm.provision "shell", path: './provision_root_swap.sh'

  #ローカルとファイル同期
  config.vm.synced_folder "./workspace", "/workspace" ,create: true
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "5120"
  end
  
  config.vm.provision :shell do |git|
    git.env = {:GIT_USER => "hogehoge", :GIT_EMAIL => "hogehoge@sakura.co.jp"}
    git.path = './provision_root_git.sh'
  end
end
