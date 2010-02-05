class Post < ActiveRecord::Base
  has_many :comments, :primary_key => 'status_id', :foreign_key => 'post_id'
  named_scope :ordered, :order => 'status_id DESC'
  named_scope :limit, lambda { |num| { :limit => num } }
end