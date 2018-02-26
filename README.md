
VM for moving Laradoc

### Install

<pre>
  git clone https://github.com/gdgd/vagrant_laradock_base.git
  cd {clone dir}
</pre>


Add git setting to Vagrantfile
<pre>
  vi Vagrantfile
</pre>

Please change "hogehoge" and "hogehoge@sakura.co.jp" to your Git account.
<pre>
  config.vm.provision :shell do |git|
    git.env = {:GIT_USER => "hogehoge", :GIT_EMAIL => "hogehoge@sakura.co.jp"}
    git.path = './provision_root_git.sh'
  end
</pre>

<pre>
  vagrant up  
</pre>
  
