require File.dirname(__FILE__) + '/../test_helper'
 
class ScoreTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:score)
  end
       
end
