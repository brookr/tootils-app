class User < ActiveRecord::Base
  has_many :scores
  
  def average
    scores.map(&:points).sum / scores.length if scores.first
  end
end