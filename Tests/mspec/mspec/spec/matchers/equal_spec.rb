require File.dirname(__FILE__) + '/../spec_helper'
require 'mspec/expectations/expectations'
require 'mspec/matchers/equal'

describe EqualMatcher do
  it "matches when actual is equal? to expected" do
    EqualMatcher.new(1).matches?(1).should == true
    EqualMatcher.new(:blue).matches?(:blue).should == true
    EqualMatcher.new(Object).matches?(Object).should == true

    o = Object.new
    EqualMatcher.new(o).matches?(o).should == true
  end

  it "does not match when actual is not a equal? to expected" do
    EqualMatcher.new(1).matches?(1.0).should == false
    EqualMatcher.new(1.5).matches?(1.5).should == false
    EqualMatcher.new("blue").matches?("blue").should == false
    EqualMatcher.new(Hash).matches?(Object).should == false
  end

  it "provides a useful failure message" do
    matcher = EqualMatcher.new("red")
    matcher.matches?("red")
    matcher.failure_message.should == ["Expected \"red\"\n", "to be identical to \"red\"\n"]
  end

  it "provides a useful negative failure message" do
    matcher = EqualMatcher.new(1)
    matcher.matches?(1)
    matcher.negative_failure_message.should == ["Expected 1\n", "not to be identical to 1\n"]
  end
end
