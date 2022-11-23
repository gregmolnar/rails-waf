require "test_helper"

class WafTest < ActionDispatch::IntegrationTest
  test "it returns 200" do
    get root_path
    assert_equal 200, status
  end

  test "it blocks scanner user agents" do
    [
      '(hydra)', '.nasl', 'absinthe', 'advanced email extractor', 'arachni/', 'BFAC', 'brutus', 'bsqlbf', 'burpcollaborator', 'cisco-torch', 'commix', 'Detectify', 'dirbuster', 'domino hunter', 'dotdotpwn', 'F-Secure Radar', 'gobuster', 'havij', 'masscan', 'nessus', 'netsparker', 'nikto', 'nmap', 'nsauditor', 'Nuclei', 'openvas', 'pangolin', 'qualys', 'sqlmap', 'whatweb', 'WPScan', 'xmlrpc exploit'
    ].each do |user_agent|
      get root_path, headers: { 'User-Agent' => user_agent }
      assert_equal 403, status
    end
  end
end
