# frozen_string_literal: true

require_relative "morsby/version"
require_relative "morsby/cli"

module Morsby
  def self.version
    Morsby::VERSION
  end

  def self.run(argv)
    CLI.new.run(argv)
  end
end
