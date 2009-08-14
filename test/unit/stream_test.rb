require File.dirname(__FILE__) + '/../test_helper'
 
class StreamTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:stream)
  end
 
end
