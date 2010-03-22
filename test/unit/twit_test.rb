require File.dirname(__FILE__) + '/../test_helper'
 
class TwitTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:twit)
  end
 
end

# == Schema Information
#
# Table name: twits
#
#  id         :integer(4)      not null, primary key
#  twit_id    :integer(8)
#  name       :string(255)
#  score      :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

