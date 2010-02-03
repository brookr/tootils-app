class Backdraft < Stream

  def new_comments
    results = Twitter::Search.new.to('daringfireball').from('brookr').fetch().results
    results.map{ |toot| client.status(toot.id) }.reject{ |toot| toot['in_reply_to_status_id'].blank? }
  end
  
  def new_posts
    Twitter.timeline(10760422, :count => 200, :since => (Post.last.blank? ? 0 : Post.ordered.last.status_id))
  end
end
