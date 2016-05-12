#
# Cookbook: grub-cookbook
# License: Apache 2.0
#
# Copyright (C) 2016 Bloomberg Finance L.P.
#

default['grub']['service_name'] = 'default'
default['grub']['config']['path'] = '/etc/default/grub'
#default['grub']['config']['settings']['timeout'] = 30
#default['grub']['config']['settings']['distributor'] = "$(sed 's, release .*$,,g' /etc/system-release)"
