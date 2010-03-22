class User < ActiveRecord::Base

  acts_as_authentic
  
  has_many :tweak_settings
  has_many :tweaks, :through => :tweak_settings
  
  has_many :commands
  has_many :scores
  has_many :follows
  has_many :twits, :through => :follows
    
  def tweak_ids=(list)
    # Remove deselected options
    for ts in tweak_settings.reject{ |t| list.include? t.tweak_id }
      ts.destroy
    end
    
    # Build newly selected options
    for id in (list - tweak_ids)
      self.tweak_settings.create(:tweak_id => id)
    end
  end
  
  def tweak_ids
    tweaks.map(&:id)
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

