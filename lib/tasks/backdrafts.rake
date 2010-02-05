namespace :backdrafts do
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
    task :posts, :old, :needs => :environment do |t, args|
      args.with_defaults(:old => false)
      for post in (Backdraft.first || Backdraft.create).send (args.old ? "old_posts" : "new_posts")
        text = post['text'].split('http://')
        puts "Logging #{args.old ? 'old' : 'new'} post: #{text[1]}. Exists? " + Post.find_by_status_id(post['id']).blank?.to_s
        Post.create!( 
          :status_id => post['id'],
          :name => text[0].gsub(/: *$/,''),
          :link => (text[1] && text[1].match(/df.ws/) ? text[1] : nil),
          :created_at => post['created_at']
        ) if Post.find_by_status_id(post['id']).blank?
      end
    end
    
    desc 'Read in the latest comments'
    task :comments, :old, :needs => :environment do |t, args|
      args.with_defaults(:old => false)
      backdraft = (Backdraft.first || Backdraft.create)
      if args.old
        results = backdraft.old_comments(args.old)
      else
        results = backdraft.new_comments
      end
      for comment in results
        if Comment.find_by_status_id(comment['id']).blank? 
          Comment.create!(
            :post_id => comment['in_reply_to_status_id'],
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
end