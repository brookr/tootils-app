require File.dirname(__FILE__) + '/../test_helper'
 
class CommandTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:command)
  end
 
end
