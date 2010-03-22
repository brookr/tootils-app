class TweakSetting < ActiveRecord::Base
  
  belongs_to :tweak
  belongs_to :user
end
# == Schema Information
#
# Table name: tweak_settings
#
#  id         :integer(4)      not null, primary key
#  tweak_id   :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  config     :integer(4)
#  updated_at :datetime
#

