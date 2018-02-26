
VM for moving Laradoc

### Install

<code>
git clone https://github.com/gdgd/vagrant_laradock_base.git
cd {clone dir}
</code>


Add git setting to Vagrantfile
<code>
vi Vagrantfile
</code>


<code>
  config.vm.provision :shell do |git|
    git.env = {:GIT_USER => "hogehoge", :GIT_EMAIL => "hogehoge@sakura.co.jp"}
    git.path = './provision_root_git.sh'
  end
</code>

<code>
vagrant up  
</code>
  