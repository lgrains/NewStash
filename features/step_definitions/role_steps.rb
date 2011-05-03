Given /^a role named "([^\"]*)" exists?$/ do |role_name|
  Factory(:role, :name => role_name)
end
