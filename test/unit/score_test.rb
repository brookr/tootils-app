require File.dirname(__FILE__) + '/../test_helper'
 
class ScoreTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:score)
  end
       
end

# == Schema Information
#
# Table name: scores
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  points     :integer(4)
#  source     :string(255)
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

