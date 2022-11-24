require "rack/attack"
require "rails/waf/version"
require "rails/waf/railtie"

module Rails
  module Waf
    # Your code goes here...
    def self.enable!
      ::Rack::Attack.enabled = true
      ::Rack::Attack.class_eval do
          blocklist("block scanners") do |request|
            [
              '(hydra)', '.nasl', 'absinthe', 'advanced email extractor', 'arachni', 'BFAC', 'brutus', 'bsqlbf', 'burpcollaborator', 'cisco-torch', 'commix', 'Detectify', 'dirbuster', 'domino hunter', 'dotdotpwn', 'F-Secure Radar', 'gobuster', 'havij', 'masscan', 'nessus', 'netsparker', 'nikto', 'nmap', 'nsauditor', 'Nuclei', 'openvas', 'pangolin', 'qualys', 'sqlmap', 'whatweb', 'WPScan', 'xmlrpc exploit'
            ].any?{ |user_agent| request.user_agent =~ Regexp.new(user_agent)  }
          end
      end
    end
  end
end
