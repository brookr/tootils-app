class Backdraft < Stream

  def new_comments
    r = Twitter::Search.new.
      to('daringfireball').
      per_page(100).
      since(Comment.last.blank? ? 0 : Comment.ordered.last.status_id).
      fetch().
      results
    return r.map{ |toot| client.status(toot.id) }.reject{ |toot| toot['in_reply_to_status_id'].blank? } unless r.blank?
    return nil
  end

  def old_comments(page)
    results = Twitter::Search.new.
      to('daringfireball').
      per_page(100).
      page(page).
      fetch().
      results
    return results.map{ |toot| client.status(toot.id) }.reject{ |toot| toot['in_reply_to_status_id'].blank? } unless results.blank?
    return nil
  end
  
  def new_posts
    Twitter.
    timeline(10760422, 
      :count => 200, 
      :since_id => (Post.last.blank? ? 0 : Post.ordered.last.status_id)
    ).select { |post|
      post['text'].match(/df.ws/)
    }
  end
  
  def old_posts
    Twitter.
    timeline(10760422, 
      :count => 200, 
      :max_id => (Post.last.blank? ? 0 : Post.ordered.first.status_id)
    ).select { |post|
      post['text'].match(/df.ws/)
    }
  end
end
