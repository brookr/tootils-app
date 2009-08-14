class Stream < ActiveRecord::Base
  def client
    @client ||= begin
      httpauth = Twitter::HTTPAuth.new(AuthConfig['username'], AuthConfig['password'])
      Twitter::Base.new(httpauth)
    end
  end
  
  def mentions
    client.replies
  end
  
  def submissions
    client.replies(:since_id => (last_mention || 1))
  end
  
  def friends
    client.friends.map(&:screen_name)
  end
  
  def report(score)
    client.update("@#{score.user.name} Got it! I've registered your Punctualness" +
    " of #{score.status}. That gives you a new Punctuality Score of #{score.user.average} minutes.")
  end
end