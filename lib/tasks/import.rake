namespace :import do
  #
  # Run a test job to make sure data reading is working.
  #
  desc 'Test reading from Rails Production'
  task :test, :needs => :environment do |t|
    puts "Testing read of data stream."
    s = (Stream.first || Stream.new)
    for str in s.submissions.reverse.map{ |m| m['user']['screen_name'] + ": " + m['text']  }
      puts str
    end
  end
  
  desc 'Read in the latest submissions'
  task :scores, :needs => :environment do |t|
    s = (Stream.first || Stream.new)
    for score in s.submissions.reverse
      if (min = score['text'].match(/-?\d+/))
        puts "Saving score report from #{score['user']['screen_name']}."
        user = (User.find_by_name(score['user']['screen_name']) || 
          User.create(:name => score['user']['screen_name']))
        user.scores << Score.new(:source => 'Twitter', 
          :points => min.to_s.to_i,
          :text => score['text'])
        # Mark it as saved, by advancing our tweet-check counter. This ensures
        # that this status won't be pulled again.
        s.last_mention = score['id']
        s.save
        s.report(user.scores.last)
        puts "Reported back to #{score['user']['screen_name']} that score of " +
          "#{min} was saved."
      end
    end
  end
  
end