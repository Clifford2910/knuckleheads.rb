# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name         = 'knuckleheads'
  s.version      = '1.0.0'
  s.author       = 'Alex Clifford'
  s.summary      = 'A fun, and entirely random, text-based game'
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files         = Dir['{bin,lib,spec}/**/*'] + %w[README]
  s.test_files    = Dir['spec/**/*']
  s.executables   = ['knuckleheads']

  s.required_ruby_version = '>=2.3'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end
