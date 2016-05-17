#
# Cookbook: grub
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#

require 'poise'

module GrubCookbook
  module Resource
    # Resource for managing the Grub Configuration file.
    class Grub < Chef::Resource
      include Poise(fused: true)
      provides(:grub)

      attribute(:path, kind_of: String, name_attribute: true)
      attribute(:settings, option_collector: true, default: {})

      def to_s
        s = settings.merge({}) do |_k, _o, n|
          if n.is_a?(Array)
            n.flatten.map(&:to_s).join(',')
          else
            n
          end
        end
        s.map { |k,v|
            if v.match(/[\W\s]+/) then
              g = "=\"#{v}\""
            else
              g = "=#{v}"
            end
            ["GRUB", k.upcase].join("_") << g}.join("\n")
      end

      action(:create) do
        notifying_block do
          # Write out grub config file
          unless new_resource.to_s.empty?
            file new_resource.path do
              content new_resource.to_s
            end
          end
        end
      end
    end
  end
end
