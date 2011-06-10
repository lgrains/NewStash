# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.sequence(:email)      {|n| n.to_s + Faker::Internet.email }
  f.full_name             Faker::Name.name
  f.street_address        Faker::Address.street_address
  f.city                  Faker::Address.city
  f.state                 Faker::Address.us_state_abbr
  f.zip                   Faker::Address.zip_code
  f.phone                 Faker::PhoneNumber.phone_number
  f.password              'password'
  f.password_confirmation 'password'
  f.role                  { |role| role.association(:role, :name => 'consumer') }
end

Factory.define :admin, :parent => :user do |f|
  f.role { |role| role.association(:role) }
end
