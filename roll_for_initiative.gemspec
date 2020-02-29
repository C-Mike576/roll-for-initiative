lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "roll_for_initiative/version"

Gem::Specification.new do |spec|
  spec.name          = "roll_for_initiative"
  spec.version       = RollForInitiative::VERSION
  spec.authors       = ["c-mike576"]
  spec.email         = ["m.calkins576@gmail.com"]
  spec.summary       = "Small little project that scrapes D&D classes"
  spec.description   = "This is just a small project that scrapes the classes from D&D from the site dndbeyond. It then lets you choose a class and gives a short scenario(again sraped from dndbeyond.com).
  You can confirm or choose again. After it gives you a random monster to fight scraped from http://www.chaoticshiny.com/monstergen.php win or lose you can fight another random monster."
  spec.homepage      = "https://github.com/C-Mike576/roll-for-initiative"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/C-Mike576/roll-for-initiative"
  spec.metadata["changelog_uri"] = "https://github.com/C-Mike576/roll-for-initiative/commits/master"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12"
  

  spec.add_dependency "nokogiri", "~> 1.0"
end
