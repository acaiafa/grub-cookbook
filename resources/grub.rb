#  Resource to manage the Grub configuration file
#
provides :grub

property :path, String, name_property: true
property :settings, Hash, default: {}

def stringify
  grub_config = ''
  s = settings
  s['settings'].each do |k,v|
    if v =~ /[\W\s]+/
      g = "=\"#{v}\""
    else
      g = "=#{v}"
    end
  grub_config << "GRUB_#{k.upcase}#{g}\n"
  end
  grub_config
end

action :create do
  notifying_block do
    unless new_resource.stringify.empty?
      file new_resource.path do
        path new_resource.path
        content new_resource.stringify
      end
    end
  end
end
