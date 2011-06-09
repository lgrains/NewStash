When /^I open a new browser$/ do
  driver=Capybara.current_session.driver
  case driver
  when Capybara::Driver::Selenium
    selenium_cookies(Capybara.current_session.driver.browser).clearCookies()
  when Capybara::Driver::RackTest
    driver.clear_cookies
  end
end

When /^I visit the site as a new person$/ do
  When %{I close my browser}
  And %{I open a new browser}
end

When /^I fill in the form with the following "([^\"]*)"$/ do |data|
  params = {}
  data.split(",").each do |x|
    field_value = x.split(':')
    params[field_value[0].strip] = field_value[1].strip
  end
  debugger

  user_form = find("#user_form")

  #with_scope(user_form) do
    params.each do |key, value|
      When %{I fill in "#{key}" with "#{value}" within "#{user_form}"}
    end
  #end
end

Then /^I fill in "([^"]*)" with "([^"]*)" within "([^"]*)"$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end


When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

When(/^I go back$/) do
  page.evaluate_script('window.history.back()')
end

Then /^I should see a flash notice with "([^\"]*)"$/ do |text|
  Then %{I should see "#{text}" within ".notice"}
end

Then /^I should see error "([^\"]*)"$/ do |message|
  Then %{I should see "#{message}" within "#errorExplanation"}
end

Then /^I should be logged in$/ do
  Then %{I should see "log out"}
end

Then /^I should not be logged in$/ do
  Then %{I should see "Login"}
end

Then /^I should see the following "([^\"]*)"$/ do |strings|
  strings.split(",").map{|s| s.strip }.each do |x|
    Then %{I should see "#{x}"}
  end
end

Then /^I should see the "([^\"]*)" field in the form$/ do |field_name|
  with_scope("form") do
    find_field(field_name).should_not be_nil
  end
end

Then /^I should see the id "([^\"]*)" field in the form$/ do |field_id|
  string = "#"+ field_id
  find(string).should_not be_nil
end

# from TVLM
Then /^I should see the correct order of "([^\"]*)"$/ do |list|
  items = list.split(",").map{ |x| x.strip }
  items[0...-1].each_with_index do |item, i|
    Then %{I should see "#{item}" before "#{items[i+1]}"}
  end
end

# from TVLM
Then /^I should see "([^\"]*)" before "([^\"]*)"$/ do |first, second|
  first.gsub!(/\$/, "\\\\$")
  second.gsub!(/\$/, "\\\\$")
  page.body.should match(/(#{first})(.*)(#{second})/m)
end

Then /^I should see the correct order of "([^"]*)" in the "([^"]*)" column$/ do |list, column_name|
  items = list.split(',').map{ |x| x.strip }
  column_selector = '.' + column_name.gsub(/ /, '_').downcase
  selection = page.all(column_selector)
  values = selection.map{|e| e.text}.join

  items[0..-2].each_with_index do |item, i|
    next_item = items[i+1]
    (values.index(item) < values.index(next_item)).should be_true
  end

end


