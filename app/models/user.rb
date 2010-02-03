class User < ActiveRecord::Base
  has_many :commands
  has_many :scores
  has_many :follows
  has_many :twits, :through => :follows
end