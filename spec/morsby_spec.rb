# frozen_string_literal: true

require "spec_helper"

RSpec.describe Morsby do
  it "has a version number" do
    expect(Morsby::VERSION).not_to be_nil
  end

  it "can access Morse table" do
    expect(Morsby::MORSE_TABLE['A']).to eq('.-')
  end
end
