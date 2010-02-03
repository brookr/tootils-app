namespace :blockaid do
  #
  # Run a test job to make sure data reading is working.
  #
  desc 'Test reading from Rails Production'
  task :test, :needs => :environment do |t|
    puts "Testing read of data stream."
    b = (Blockaid.first || Blockaid.create)
    for str in b.mentions.reverse.map{ |m| m['user']['screen_name'] + ": " + m['text']  }
      puts str
    end
  end
  
  desc 'Read in the latest submissions'
  task :import, :needs => :environment do |t|
    b = (Blockaid.first || Blockaid.create)
    for cmd in b.submissions
      puts "Getting new command from #{cmd['user']['screen_name']}."
      user = (User.find_by_name(cmd['user']['screen_name']) || 
        User.create(:name => cmd['user']['screen_name']))
      user.commands << Command.new(:source => 'Twitter', 
        :text => cmd['text'])
      
      b.update_followers(user)
      
      # Mark it as saved, by advancing our tweet-check counter. This ensures
      # that this status won't be pulled again.
      b.last_mention = score['id']
      b.save
      b.report(user.scores.last)
      puts "Reported back to #{cmd['user']['screen_name']} that command of " +
        "#{user.scores.last.points} was saved."
    end
  end
  
end