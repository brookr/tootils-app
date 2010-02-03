require File.dirname(__FILE__) + '/../test_helper'
 
class TwitTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:twit)
  end
 
end
