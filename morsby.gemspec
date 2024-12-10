# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)
require "morsby/version"

Gem::Specification.new do |spec|
  spec.name          = "morsby"
  spec.version       = Morsby::VERSION
  spec.authors       = ["oguressive"]
  spec.email         = ["oguressive.dev@gmail.com"]
  spec.summary       = %q{Morse code learning and practice tool}
  spec.description   = %q{A tool to learn Morse code, including alphabets, digits, punctuation, Q-codes, CW abbreviations, and Wabun Morse. Provides quizzes and bilingual messages.}
  spec.homepage      = "https://github.com/oguressive/morsby"
  spec.license       = "MIT"

  spec.metadata = {
    'changelog_uri' => 'https://github.com/oguressive/morsby/blob/master/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/oguressive/morsby/',
    'rubygems_mfa_required' => 'true'
  }

  spec.required_ruby_version = Gem::Requirement.new(">= 3.1")

  spec.files         = Dir["lib/**/*", "bin/*", "README.md", "CHANGELOG.md"]
  spec.bindir        = "bin"
  spec.executables   = ["morsby"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'nkf' # For Ruby3.4
end
