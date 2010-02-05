class Post < ActiveRecord::Base
  has_many :comments, :primary_key => 'status_id', :foreign_key => 'post_id'
  named_scope :ordered, :order => 'status_id DESC'
  named_scope :limit, lambda { |num| { :limit => num } }
  named_scope :maximum, lambda { |id| { :conditions => "status_id < #{id || 99999999999}" } }
end