task :cron => :environment do
  Rake::Task["backdrafts:import:posts"].invoke
  Rake::Task["backdrafts:import:comments"].invoke
end