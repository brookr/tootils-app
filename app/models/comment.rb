class Comment < ActiveRecord::Base
  belongs_to :post
  named_scope :ordered, :order => "created_at"
end