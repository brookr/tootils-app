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
  
end