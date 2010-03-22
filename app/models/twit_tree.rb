class TwitTree < Stream
  def report(graph)
    client.update("@#{user.name} Got it! You are #{degrees} degrees from #{end_user}." +
    " You are linked by: #{user.name} -> ... -> #{end_user.name}")
  end
  
  def regexp
    /@\w+/
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

