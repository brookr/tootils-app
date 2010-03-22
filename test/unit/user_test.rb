require File.dirname(__FILE__) + '/../test_helper'
 
class UserTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:user)
  end
   
end

# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  last_request_at     :datetime
#  single_access_token :string(255)     not null
#  crypted_password    :string(255)     not null
#  perishable_token    :string(255)     not null
#  current_login_ip    :string(255)
#  failed_login_count  :integer(4)      default(0), not null
#  current_login_at    :datetime
#  password_salt       :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  persistence_token   :string(255)     not null
#  last_login_ip       :string(255)
#  last_login_at       :datetime
#  login               :string(255)     not null
#  email               :string(255)     not null
#

