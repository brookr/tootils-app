class Tweak < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :tweak_settings
  has_many :users, :through => :tweak_settings
end
# == Schema Information
#
# Table name: tweaks
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  source     :text
#  author_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
  #  amount     :decimal(6, 2)   default(0.0)
#  approved   :boolean(1)
#


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

