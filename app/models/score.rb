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
end