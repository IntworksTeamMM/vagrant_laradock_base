# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.ssh.insert_key = false

  # settings
  GIT_USER = "hogehoge"
  GIT_EMAIL = "hogehoge"
  MY_GIT_PROJECT_URL = "hogehoge"
  PROJECT_NAME = "hogehoge"

  # 必要ならポートを追加する
  config.vm.network "forwarded_port", guest: 22, host: 10022, id: "ssh"
  config.vm.network "forwarded_port", guest: 80, host: 10080, id: "web"
  config.vm.network "forwarded_port", guest: 443, host: 10443
  config.vm.network "forwarded_port", guest: 8080, host: 18080
  
  ### db用
  #mysql
  config.vm.network "forwarded_port", guest: 3306, host: 13306

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
    git.env = {:GIT_USER => GIT_USER, :GIT_EMAIL => GIT_EMAIL}
    git.path = './provision_root_git.sh'
  end

  #laradockのインストールと設定
  config.vm.provision :shell do |laradock|
    laradock.env = {:PROJECT_NAME => PROJECT_NAME , :MY_GIT_PROJECT_URL => MY_GIT_PROJECT_URL}
    laradock.path =  './provision_root_laradock.sh'
  end

  #laradockのプロセス起動
  config.vm.provision "shell",run: "always" ,path: './docker-run.sh'  
end
