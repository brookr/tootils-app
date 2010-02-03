class Blockaid < Stream
  
  def update_followers(user)
    for twit in (follower_ids - user.twits.map(:twit_id))
      user.twits << Twit.create(:twit_id => twit, :name => client.user(twit)[:screen_name])
    end
  end
end