# include the factories
Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}

namespace :db do

  desc "Create demo data"
  task :demo_data => [:environment, :seed] do

  end

end