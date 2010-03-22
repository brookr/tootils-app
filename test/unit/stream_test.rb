require File.dirname(__FILE__) + '/../test_helper'
 
class StreamTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:stream)
  end
 
end

# == Schema Information
#
# Table name: streams
#
#  id           :integer(4)      not null, primary key
#  type         :string(255)
#  last_mention :integer(8)
#  created_at   :datetime
#  updated_at   :datetime
#  last_comment :integer(8)
#

