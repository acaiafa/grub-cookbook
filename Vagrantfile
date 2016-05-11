Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.cache.scope = :box

  config.vm.box = ENV.fetch('VAGRANT_VM_BOX', 'bento/centos-6.7')

  config.vm.define :instance, primary: true do |guest|
    guest.vm.provision :chef_zero do |chef|
      chef.run_list = %w{grub::default}
    end
  end
end
