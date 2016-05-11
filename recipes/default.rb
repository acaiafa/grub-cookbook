#
# Cookbook: grub
#
# Copyright (c) 2016 Bloomberg L.P., All Rights Reserved.
#
#
grub node['grub']['service_name'] do |r|
  node['grub']['config'].each_pair { |k, v| r.send(k, v) }
end
