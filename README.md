# Grub Cookbook
[![License](https://img.shields.io/badge/license-Apache_2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

Cookbook which configures the Grub Bootloader.

## Platforms
The following platforms are tested using Test Kitchen:

- Ubuntu 12.04/14.04/16.04
- CentOS (RHEL) 5/6/7

## Basic Usage
The [default recipe](recipes/default.rb) gives you the ability to pass attributes to tune your grub settings.
There are currently no defaults in this cookbook so your regular distrobution provided grub file will remain intact. 
You can tweak the settings in the Policefile.rb or directly using attributes. All GRUB specific settings
should use underscores like the examples below.

### Recipe
```ruby
node.default['grub']['config']['settings']['timeout'] = 30
node.default['grub']['config']['settings']['distributor'] = "$(sed 's, release .*$,,g' /etc/system-release)"
node.default['grub']['config']['settings']['terminal_output'] = "console"
```

### Policyfile
``` ruby
name 'grub'
default_source :community
cookbook 'grub', git: 'https://github.com/acaiafa/grub-cookbook'
run_list 'grub::default'

override['grub']['config']['settings']['timeout'] = 30
override['grub']['config']['settings']['distributor'] = "$(sed 's, release .*$,,g' /etc/system-release)"
override['grub']['config']['settings']['terminal_output'] = "console"
```

