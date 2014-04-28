require 'spec_helper.rb'

describe ::ArrayBuilder do

  context "#deep_pack" do
    describe "When given a string of empty parenthesis" do
      subject { ArrayBuilder.deep_pack( "()" ) }
      it "returns an array with an empty array" do
        subject.should eq([[]])
      end
    end

    describe "When given a string with characters on both sides of parenthisis" do
      subject { ArrayBuilder.deep_pack( "A()Z" ) }
      it "returns an empty array in the middle of the characters" do
        subject.should eq( ["A",[],"Z"] )
      end
    end

    describe "When given a string with a character on both sides and inside of parenthisis" do
      subject { ArrayBuilder.deep_pack( "A(M)Z" ) }
      it "returns an empty array in the middle of the characters" do
        subject.should eq( ["A",["M"],"Z"] )
      end
    end

    describe "When given a string with a character on both sides and inside of parenthisis" do
      subject { ArrayBuilder.deep_pack( "A(M(NO))Z" ) }
      it "returns an array representing the deep parentisis segmented string" do
        subject.should eq( ["A",["M",["N","O"]],"Z"] )
      end
    end

    describe "When given a string with a character on both sides and inside of parenthisis" do
      subject { ArrayBuilder.deep_pack( ["A","(","M","(","NO",")",")","Z"]) }
      it "returns an array representing the deep parentisis segmented string" do
        subject.should eq( ["A",["M",["NO"]],"Z"] )
      end
    end
  end
end
