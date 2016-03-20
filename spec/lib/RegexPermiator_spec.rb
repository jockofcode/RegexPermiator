require 'spec_helper'

describe RegexPermiator do
  context "When given a posix char class" do
    let(:instance) { RegexPermiator.all_matching_chars( /[[:digit:]]/ ) }

    it "that is for digits, it should return numbers" do
      instance.should eq(('0'..'9').to_a)
    end
  end
end
