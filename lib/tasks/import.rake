namespace :import do
  #
  # Run a test job to make sure data reading is working.
  #
  desc 'Test reading from Rails Production'
  task :test, :needs => :environment do |t|
    puts "Testing read of data stream."
    s = (Stream.first || Stream.new)
    pp s.mentions.map{ |m| m['user']['screen_name'] + ": " + m['text']  }
  end
  
  desc 'Read in the latest submissions'
  task :scores, :needs => :environment do |t|
    s = (Stream.first || Stream.new)
    for score in s.submissions
      if (min = score['text'].match(/-?\d+/))
        user = User.find_by_name(score['user']['screen_name']) || 
          User.new(:name => score['user']['screen_name'])
        user.scores << Score.new(:source => 'Twitter', :points => min.to_s.to_i)
        # Mark it as saved, by advancing our tweet-check counter. This ensures
        # that this status won't be pulled again.
        s.last_mention = score['id']
        s.save
        s.report(user.scores.last)
      end
    end
  end
  
end