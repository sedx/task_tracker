namespace :admin do
  desc "Create admin"
  task :create_admin => :environment do
    User.first.update_attribute(:admin,true)
  end
end
