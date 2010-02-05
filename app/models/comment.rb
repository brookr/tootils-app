class Comment < ActiveRecord::Base
  belongs_to :post, :primary_key => 'status_id', :foreign_key => 'post_id'
  named_scope :ordered, :order => 'status_id DESC'
end