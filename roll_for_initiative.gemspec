lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "roll_for_initiative/version"

Gem::Specification.new do |spec|
  spec.name          = "roll_for_initiative"
  spec.version       = RollForInitiative::VERSION
  spec.authors       = ["c-mike576"]
  spec.email         = ["m.calkins576@gmail.com"]

  spec.summary       = "Small little project that scrapes D&D classes from dndbeyond.com, then lets you choose a class for and get short description.
   You can either confirm that class or choose another."
  
  spec.homepage      = "https://github.com/C-Mike576/roll-for-initiative"
  spec.license       = "MIT"

  spec.metadata["https://github.com/C-Mike576/roll-for-initiative"]

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["https://github.com/C-Mike576/roll-for-initiative"]
  spec.metadata["https://github.com/C-Mike576/roll-for-initiative/commits/master"]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12"
  

  spec.add_dependency "nokogiri", "~> 1.0"
end
