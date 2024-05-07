# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "mintyml-jekyll"
  gem.version       = "0.1.1"
  gem.authors       = ["Spencer Young"]
  gem.email         = ["spencerwyoung@outlook.com"]
  gem.description   = %q{Write pages in MinTyML, a minimalist alternative syntax for HTML.}
  gem.summary       = %q{MinTyML support for Jekyll.}
  gem.homepage      = "https://github.com/youngspe/mintyml-jekyll"

  gem.files         = [
    "lib/mintyml-jekyll.rb",
    "lib/mintyml-jekyll/mintyml-converter.rb",
    "lib/mintyml-jekyll/mintyml-filters.rb",
    "lib/mintyml-jekyll/render-mintyml.rb",
    "convert-mintyml/index.js",
    "convert-mintyml/package.json"
  ]
  gem.require_paths = ["lib"]
  gem.license       = "MIT"

  gem.add_runtime_dependency 'jekyll',     '>= 3.6', '< 5.0'
end
