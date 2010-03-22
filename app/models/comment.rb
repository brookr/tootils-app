class Comment < ActiveRecord::Base
  belongs_to :post, :primary_key => 'status_id', :foreign_key => 'post_id'
  named_scope :ordered, :order => 'status_id DESC'
end
# == Schema Information
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  post_id    :integer(8)
#  name       :string(255)
#  text       :string(255)
#  status_id  :integer(8)
#  created_at :datetime
#  updated_at :datetime
#

