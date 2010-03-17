class User < ActiveRecord::Base

  acts_as_authentic

  has_many :commands
  has_many :scores
  has_many :follows
  has_many :twits, :through => :follows
end