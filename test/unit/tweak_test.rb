require File.dirname(__FILE__) + '/../test_helper'
 
class TweakTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:tweaks)
  end
       
end


# == Schema Information
#
# Table name: tweaks
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  source      :text
#  author_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  amount      :decimal(6, 2)   default(0.0)
#  approved    :boolean(1)
#  link        :text
#  description :text
#

