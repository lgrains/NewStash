# include the factories
Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}

namespace :db do

  desc "Create demo data"
  task :demo_data => [:environment, :seed] do
    num_users = 10

    #create user accounts
    puts "making #{num_users} user accounts"
    num_users.times do |i|
      Factory(:user)
    end
  end

end