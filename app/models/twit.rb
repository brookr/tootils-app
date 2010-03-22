class Twit < ActiveRecord::Base
  has_many :follows
  has_many :users, :through => :follows
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

