require 'serverspec'
set :backend, :exec


describe file('/etc/default/grub') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its(:content) { should contain 'GRUB_TIMEOUT' }
end

