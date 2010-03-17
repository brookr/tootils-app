require File.dirname(__FILE__) + '/../test_helper'
 
class TweakTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:tweaks)
  end
       
end
