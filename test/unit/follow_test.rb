require File.dirname(__FILE__) + '/../test_helper'
 
class FollowTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:follow)
  end
 
end

# == Schema Information
#
# Table name: follows
#
#  id      :integer(4)      not null, primary key
#  user_id :integer(4)
#  twit_id :integer(4)
#  state   :string(255)
#

