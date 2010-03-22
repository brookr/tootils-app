class Score < ActiveRecord::Base
  belongs_to :user
  
  def status
    if points == 0
      "on time"
    elsif points < 0  
      "#{points.abs} minutes early"
    else 
      "#{points} minutes late"
    end
  end
  
  def average
    user.scores.map(&:points).sum / user.scores.length if user.scores.first
  end
  
end
# == Schema Information
#
# Table name: scores
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  points     :integer(4)
#  source     :string(255)
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

