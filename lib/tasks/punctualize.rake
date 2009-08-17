namespace :punctualize do
  #
  # Run a test job to make sure data reading is working.
  #
  desc 'Test reading from Rails Production'
  task :test, :needs => :environment do |t|
    puts "Testing read of data stream."
    p = (Punctualize.first || Punctualize.create)
    for str in p.mentions.reverse.map{ |m| m['user']['screen_name'] + ": " + m['text']  }
      puts str
    end
  end
  
  desc 'Read in the latest submissions'
  task :import, :needs => :environment do |t|
    p = (Punctualize.first || Punctualize.create)
    for score in p.submissions
      puts "Saving score report from #{score['user']['screen_name']}."
      user = (User.find_by_name(score['user']['screen_name']) || 
        User.create(:name => score['user']['screen_name']))
      user.scores << Score.new(:source => 'Twitter', 
        :points => score['text'].match(p.regexp).to_s.to_i,
        :text => score['text'])
      # Mark it as saved, by advancing our tweet-check counter. This ensures
      # that this status won't be pulled again.
      p.last_mention = score['id']
      p.save
      p.report(user.scores.last)
      puts "Reported back to #{score['user']['screen_name']} that score of " +
        "#{user.scores.last.points} was saved."
    end
  end
  
end