require_relative "lib/rails/waf/version"

Gem::Specification.new do |spec|
  spec.name        = "rails-waf"
  spec.version     = Rails::Waf::VERSION
  spec.authors     = ["Greg Molnar"]
  spec.email       = ["molnargerg@gmail.com"]
  spec.homepage    = "https://github.com/gregmolnar/rails-waf"
  spec.summary     = "Rack::Attack configured as a WAF"
  spec.description = "Rack::Attack configured as a WAF"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gregmolnar/rails-waf"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 5.0.4"
  spec.add_dependency "rack-attack"
  spec.add_development_dependency 'minitest', '~> 5.0'
end
