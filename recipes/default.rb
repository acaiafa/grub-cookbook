#
# Cookbook: grub
#
# Copyright (c) 2016 Bloomberg L.P., All Rights Reserved.
#
#
grub node['grub']['service_name'] do
  path node['grub']['config']['path']
  settings node['grub']['config']
end
