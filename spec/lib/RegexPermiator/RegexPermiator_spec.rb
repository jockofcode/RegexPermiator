require 'spec_helper'

describe RegexPermiator do

  context "#all_matching_chars" do
    describe "When given a posix char class" do
      subject { RegexPermiator.all_matching_chars( "[[:digit:]]" ) }

      it "that is for digits, it should return numbers" do
        subject.should eq(('0'..'9').to_a)
      end
    end
  end

  context "#split_regex_tokens" do
    describe "When there is one character class" do
      subject { RegexPermiator.split_regex_tokens(/[[:digit:]]/) }

      it "returns just the one token" do
        subject.should eq(['[[:digit:]]'])
      end
    end

    describe "When there is one escaped character" do
      subject { RegexPermiator.split_regex_tokens(/\s/) }

      it "returns just the one token" do
        subject.should eq(['\s'])
      end
    end

    describe "When there is a repeat pattern" do
      subject { RegexPermiator.split_regex_tokens(/s{0,1}/) }

      it "returns the whole pattern" do
        subject.should eq(['s', '{0,1}'])
      end
    end

    describe "When there is more than one token" do
      subject { RegexPermiator.split_regex_tokens(/[[:digit:]][[:alnum:]]/) }

      it "returns all the tokens" do
        subject.should eq(['[[:digit:]]','[[:alnum:]]'])
      end
    end

    describe "When there are mixed types of tokens" do
      subject { RegexPermiator.split_regex_tokens(/[[:digit:]][[:alnum:]]\s/) }

      it "returns all the tokens" do
        subject.should eq( [ '[[:digit:]]', '[[:alnum:]]' , '\s' ] )
      end
    end

    describe "When there are mixed types of tokens and text" do
      subject { RegexPermiator.split_regex_tokens(/[[:digit:]][[:alnum:]]\s1T/) }

      it "returns all the tokens" do
        subject.should eq( [ '[[:digit:]]', '[[:alnum:]]' , '\s' , '1' , 'T' ] )
      end
    end

    describe "When there are mixed types of tokens and text and wildcards" do
      subject { RegexPermiator.split_regex_tokens(/[[:digit:]]*\sT/) }

      it "returns all the tokens" do
        subject.should eq( [ '[[:digit:]]', '*', '\s', 'T' ] )
      end
    end
  end
  
  context "#permutations" do
    describe "When given a number character class regex" do
      subject { RegexPermiator.permutations(/[[:digit:]]/) }
      it "returns all the number variations" do
        subject.should include("0","9")
      end
    end
    
    describe "When given two number character class regex" do
      subject { RegexPermiator.permutations(/[[:digit:]][[:alpha:]]/) }
      it "returns all the number variations" do
        subject.should include("0a","0z","9a","9z")
      end
    end

    describe "When given three number character class regex" do
      subject { RegexPermiator.permutations(/[[:digit:]][[:alpha:]][[:space:]]/) }
      it "returns all the character variations" do
        subject.should include("0a\t","0z ","9a\t","9z ")
      end
    end
    
    describe "When given a character between two character classes regex" do
      subject { RegexPermiator.permutations(/[[:digit:]]Y[[:space:]]/) }
      it "returns all the character variations" do
        subject.should include("0Y\t","0Y ","9Y\t","9Y ")
      end
    end

  end

end