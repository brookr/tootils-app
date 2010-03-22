class Punctualize < Stream
  def report(score)
    client.update("@#{score.user.name} Got it! I've registered your Punctualness" +
    " of #{score.status}. That gives you a new Punctuality Score of #{score.average} minutes.")
  end
  
  def regexp
    /-?\d+/
  end
end
# == Schema Information
#
# Table name: streams
#
#  id           :integer(4)      not null, primary key
#  type         :string(255)
#  last_mention :integer(8)
#  created_at   :datetime
#  updated_at   :datetime
#  last_comment :integer(8)
#

