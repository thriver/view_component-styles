# frozen_string_literal: true

require_relative 'lib/view_component/styles/version'

Gem::Specification.new do |spec|
  spec.name          = 'view_component-styles'
  spec.version       = ViewComponent::Styles::VERSION
  spec.authors       = ['Ryan Taylor']
  spec.email         = ['2320507+ryantaylor@users.noreply.github.com']

  spec.summary       = 'Stylesheet aggregation for view components'
  spec.description   = 'Automatically combine component styles in a view into a single stylesheet'
  spec.homepage      = 'https://github.com/thriver/view_component-styles'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 5'
end
