require File.dirname(__FILE__) + '/../test_helper'
 
class FollowTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:follow)
  end
 
end
