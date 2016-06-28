require 'travis/build/appliances/base'

module Travis
  module Build
    module Appliances
      class NpmRegistry < Base
        def apply
          if config[:npm_registry]
            sh.fold "npm_registry" do
              sh.cmd "echo registry=#{config[:npm_registry]} > ~/.npmrc"
            end
          end
        end
      end
    end
  end
end
