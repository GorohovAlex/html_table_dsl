lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'html_table_dsl'
  spec.version       = '0.0.1'
  spec.authors       = ['GorohovAlex']
  spec.email         = ['gorochov.as@gmail.com']

  spec.summary       = 'HTML-table DSL'
  spec.description   = 'DLS for working with HTML tables. Easy creation and population of tables in Ruby.'
  spec.homepage      = 'https://github.com/GorohovAlex/html_table_dsl'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'fasterer', '~> 0.10.1'
  spec.add_development_dependency 'pry', '~> 0.14.2'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.23.2'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
end
