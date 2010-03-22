class Post < ActiveRecord::Base
  has_many :comments, :primary_key => 'status_id', :foreign_key => 'post_id'
  named_scope :ordered, :order => 'status_id DESC'
  named_scope :limit, lambda { |num| { :limit => num } }
  named_scope :maximum, lambda { |id| { :conditions => "status_id < #{id || 99999999999}" } }
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  status_id  :integer(8)      default(0), not null
#  name       :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

