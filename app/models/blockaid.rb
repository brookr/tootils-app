class Blockaid < Stream
  
  def update_followers(user)
    for twit in (follower_ids - user.twits.map(:twit_id))
      user.twits << Twit.create(:twit_id => twit, :name => client.user(twit)[:screen_name])
    end
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

