namespace :backdraft do
  #
  # Run a test job to make sure data reading is working.
  #
  desc 'Test reading from Rails Production'
  task :test, :needs => :environment do |t|
    puts "Testing read of data stream."
    for comment in (Backdraft.first || Backdraft.create).comments.reverse #map{ |m| m['user']['screen_name'] + ": " + m['text']  }
      pp comment
    end
  end
  
  namespace :import do
    desc 'Read in the latest posts'
    task :posts, :needs => :environment do |t|
      for post in (Backdraft.first || Backdraft.create).new_posts
        Post.create!( 
          :status_id => post['id'],
          :name => post['text'].split(': http://')[0],
          :link => post['text'].split(': http://')[1],
          :created_at => post['created_at']
        ) if Post.find_by_status_id(post['id']).blank?
      end
    end
    
    desc 'Read in the latest comments'
    task :comments, :needs => :environment do |t|
      backdraft = (Backdraft.first || Backdraft.create)
      for comment in backdraft.new_comments
        puts "Saving comment from #{comment['user']['screen_name']}."
        Comment.create!(
          :post_id => Post.find_by_status_id(comment['in_reply_to_status_id']).id,
          :status_id => comment['id'],
          :name => comment['user']['screen_name'],
          :text => comment['text'].gsub(/^@daringfireball */, ''),
          :created_at => comment['created_at']
        ) unless comment['text'].gsub(/^@daringfireball */, '').blank?
        # Mark it as saved, by advancing our tweet-check counter. This ensures
        # that this status won't be pulled again.
        backdraft.last_comment = comment['id']
        backdraft.save
        puts "Logged comment from #{comment['user']['screen_name']} of #{comment['text']}."
      end
    end
  end
end