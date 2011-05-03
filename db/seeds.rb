# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


# create roles
if Role.count < 2
  Role.create(:name => "admin",    :description => "this is the role for BCM users")
  Role.create(:name => "consumer", :description => "this is the role for consumer users")
end

# create a BCM admin user
unless User.exists?(["email = ?", "admin@stash.org"])
  stash_admin = User.new(:full_name => "Stash Admin", :email => "admin@stash.org", :password => "quilter")
  stash_admin.role = Role.find_by_name("admin")
  stash_admin.save!
end