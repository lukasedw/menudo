
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "menudo/version"

Gem::Specification.new do |spec|
  spec.name          = "menudo"
  spec.version       = Menudo::VERSION
  spec.authors       = ["Lucas Eduardo"]
  spec.email         = ["lucas.eduardo@easycredito.me"]

  spec.summary       = "She makes menus."
  spec.description   = "This gem will revolutionize the menus."
  spec.homepage      = "https://github.com/lukasedw/menudo"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/lukasedw/menudo"
    spec.metadata["changelog_uri"] = "https://github.com/lukasedw/menudo/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '~> 5.0', '< 5.3'
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activemodel", "~> 5.0"
  spec.add_development_dependency "actionpack", "~> 5.0"
  spec.add_development_dependency "actionview", "~> 5.0"
  spec.add_development_dependency "rubytree", "~> 1.0"

  spec.add_development_dependency('rake',  '~> 10.1')
  spec.add_development_dependency('byebug')
  spec.add_development_dependency('appraisal')

  spec.add_development_dependency('rspec', '~> 3.6.0')
  spec.add_development_dependency('rspec-rails', '~> 3.6.0')
  spec.add_development_dependency('shoulda-matchers', '2.8.0')
  spec.add_development_dependency('capybara', '~> 2.2.0')
  spec.add_development_dependency('faker', '~> 1.8.7')
  spec.add_development_dependency('poltergeist', '~> 1.9.0')
  spec.add_development_dependency('capybara-screenshot', '~> 1.0.11')
  spec.add_development_dependency('selenium-webdriver', '~> 2.51.0')

  # Required by the test app.
  spec.add_development_dependency('haml', '~> 5.0.4')
  spec.add_development_dependency('coderay', '~> 1.1.0')
  spec.add_development_dependency('jquery-rails', '~> 4.3.3')
  spec.add_development_dependency('jquery-ui-rails', '~> 5.0.5')
  spec.add_development_dependency('jquery-ui-themes', '~> 0.0.11')
  spec.add_development_dependency('sass-rails', '>= 3.2')
  spec.add_development_dependency('bootstrap-sass', '3.1.1.1')
  spec.add_development_dependency('font-awesome-sass', '4.4.0')
  spec.add_development_dependency('turbolinks', '~> 5.1.1')
  spec.add_development_dependency('therubyracer')

  spec.add_development_dependency('bundler',   '~> 1.3')
  spec.add_development_dependency('simplecov', '~> 0.7')
  spec.add_development_dependency('sqlite3',   '~> 1.3')

  spec.add_development_dependency('yard', '~> 0.8')
  spec.add_development_dependency('inch', '~> 0.6.4')
  spec.add_development_dependency('rdoc', '~> 4.2.0')

end
