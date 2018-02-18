namespace :initial do
  desc "Setup for Quiz Application"
  task :setup => :environment do
    Setup.call
  end 
end