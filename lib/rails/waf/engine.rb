module Rails
  module Waf
    class Engine < ::Rails::Engine
      initializer "enable rails_waf" do
        ::Rack::Attack.enabled = true
      end

      initializer "block scanner user agents" do
        class ::Rack::Attack
          blocklist("block scanners") do |request|
            [
              '(hydra)', '.nasl', 'absinthe', 'advanced email extractor', 'arachni/', 'BFAC', 'brutus', 'bsqlbf', 'burpcollaborator', 'cisco-torch', 'commix', 'Detectify', 'dirbuster', 'domino hunter', 'dotdotpwn', 'F-Secure Radar', 'gobuster', 'havij', 'masscan', 'nessus', 'netsparker', 'nikto', 'nmap', 'nsauditor', 'Nuclei', 'openvas', 'pangolin', 'qualys', 'sqlmap', 'whatweb', 'WPScan', 'xmlrpc exploit'
            ].any?{ |user_agent| request.user_agent&.match? user_agent  }
          end
        end
      end
    end
  end
end
