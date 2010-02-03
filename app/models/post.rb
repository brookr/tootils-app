class Post < ActiveRecord::Base
  has_many :comments
  named_scope :ordered, :order => "status_id"
end