#from http://gist.github.com/484787
When /^I close my browser$/ do
  delete_cookie session_cookie_name
end

When /^I come back next time$/ do
  When "I go to the home page"
end

Then /^show me the cookies!$/ do
  driver = Capybara.current_session.driver
  case driver
  when Capybara::Driver::Selenium
    announce_selenium_cookies(Capybara.current_session.driver.browser)
  when Capybara::Driver::RackTest
    announce_rack_test_cookies(get_rack_test_cookie_jar)
  else
    raise "unsupported driver, use rack::test or selenium/webdriver"
  end
end

Then /^a cookie should be set$/ do
  driver=Capybara.current_session.driver
  case driver
  when Capybara::Driver::Selenium
    selenium_cookies(Capybara.current_session.driver.browser).include?("#{session_cookie_name}").should be_true
  when Capybara::Driver::RackTest
    rack_test_cookies(get_rack_test_cookie_jar).include?("#{session_cookie_name}").should be_true
  end
end

Then /^a cookie named "([^\"]*)" should be set$/ do |cookie_name|
  driver=Capybara.current_session.driver
  case driver
  when Capybara::Driver::Selenium
    selenium_cookies(Capybara.current_session.driver.browser).include?("#{cookie_name}").should be_true
  when Capybara::Driver::RackTest
    rack_test_cookies(get_rack_test_cookie_jar).include?("#{cookie_name}").should be_true
  end
end

Then /^the cookie should disappear$/ do
  driver=Capybara.current_session.driver
  case driver
  when Capybara::Driver::Selenium
    selenium_cookies(Capybara.current_session.driver.browser).include?("#{session_cookie_name}").should be_false
  when Capybara::Driver::RackTest
    rack_test_cookies(get_rack_test_cookie_jar).include?("#{session_cookie_name}").should be_false
  end
end

module CookieStepHelper
  def session_cookie_name
    '_stashnshare_session'
  end

  def delete_cookie(cookie_name)
    driver = Capybara.current_session.driver
    case driver
    when Capybara::Driver::Selenium
      browser = Capybara.current_session.driver.browser
      announce_selenium_cookies(browser) if @announce
      browser.manage.delete_cookie(cookie_name)
      announce "Deleted cookie: #{cookie_name}" if @announce
      announce_selenium_cookies(browser) if @announce
    when Capybara::Driver::RackTest
      announce_rack_test_cookies(get_rack_test_cookie_jar) if @announce
      delete_rack_test_cookie(get_rack_test_cookie_jar, cookie_name)
      announce "Deleted cookie: #{cookie_name}" if @announce
      announce_rack_test_cookies(get_rack_test_cookie_jar) if @announce
    else
      raise "unsupported driver, use rack::test or selenium/webdriver"
    end
  end

  def add_cookie(cookie_name)
    driver = Capybara.current_session.driver
    case driver
    when Capybara::Driver::Selenium
      browser = Capybara.current_session.driver.browser
      announce_selenium_cookies(browser) if @announce
      browser.manage.add_cookie(cookie_name)
      announce "Deleted cookie: #{cookie_name}" if @announce
      announce_selenium_cookies(browser) if @announce
    when Capybara::Driver::RackTest
      announce_rack_test_cookies(get_rack_test_cookie_jar) if @announce
      add_rack_test_cookie(get_rack_test_cookie_jar, cookie_name)
      announce "Deleted cookie: #{cookie_name}" if @announce
      announce_rack_test_cookies(get_rack_test_cookie_jar) if @announce
    else
      raise "unsupported driver, use rack::test or selenium/webdriver"
    end
  end

  def announce_rack_test_cookies(cookie_jar)
    announce "Current cookies: #{cookie_jar.instance_variable_get(:@cookies).map(&:inspect).join("\n")}"
  end

  def rack_test_cookies(cookie_jar)
    "#{cookie_jar.instance_variable_get(:@cookies).map(&:inspect).join("\n")}"
  end

  def announce_selenium_cookies(browser)
    announce "Current cookies: #{browser.manage.all_cookies.map(&:inspect).join("\n")}"
  end

  def selenium_cookies(browser)
    "#{browser.manage.all_cookies.map(&:inspect).join("\n")}"
  end

  def get_rack_test_cookie_jar
    rack_test_driver = Capybara.current_session.driver
    cookie_jar = rack_test_driver.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  end

  def delete_rack_test_cookie(cookie_jar, cookie_name)
    cookie_jar.instance_variable_get(:@cookies).reject! do |existing_cookie|
      existing_cookie.name.downcase == cookie_name
    end
  end

  def add_rack_test_cookie(cookie_jar, cookie_name)
    cookie_jar.instance_variable_get(:@cookies) << cookie_name
  end
end

World(CookieStepHelper)
Before('@announce') do
  @announce = true
end