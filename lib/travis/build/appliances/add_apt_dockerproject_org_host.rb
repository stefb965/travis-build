require 'travis/build/appliances/base'

module Travis
  module Build
    module Appliances
      class AddAptDockerprojectOrgHost < Base
        NUMERIC_IP = '54.230.142.136'
        MSG = "Adding numeric IP address for apt.dockerproject.org to /etc/hosts"
        CMD = "echo \"#{NUMERIC_IP} apt.dockerproject.org\" | sudo tee -a /etc/hosts"

        def apply
          sh.if "\"$(lsb_release -cs 2>/dev/null)\" = trusty" do
            sh.echo MSG, ansi: :yellow
            sh.cmd CMD
          end
        end

        def apply?
          ! data.disable_sudo?
        end
      end
    end
  end
end
