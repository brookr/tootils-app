class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :twit
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

