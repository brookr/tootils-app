class Stream < ActiveRecord::Base
  def client
    @client ||= begin
      httpauth = Twitter::HTTPAuth.new(
        AuthConfig[self.class.to_s]['username'], 
        AuthConfig[self.class.to_s]['password']
      )
      Twitter::Base.new(httpauth)
    end
  end
  
  def mentions
    client.replies
  end
  
  def submissions
    client.replies(:since_id => (last_mention || 1)).reverse.
      select{ |t| t['text'].match(regexp) }
  end
  
  def friends
    client.friends.map(&:screen_name)
  end
  
  def followers(user = nil)
    if user.nil?
      client.followers
    else
      client.followers(:user => user.name)
    end
  end

  def follower_ids(user = nil)
    if user.nil?
      client.follower_ids
    else
      client.follower_ids(:user => user.name)
    end
  end
end