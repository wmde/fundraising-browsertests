# @licence GNU GPL v2+
# @author Christoph Fischer

When(/^User enters valid credentials$/) do
  on(LoginPage) do | page |
      page.username = ENV["BACKEND_USERNAME"]
      page.password = ENV["BACKEND_PASSWORD"]
  end

end

Given(/^I am on the login page$/) do
  visit(LoginPage)
end

And(/^User clicks on login button$/) do
  on(LoginPage).login
end

Then(/^Username-Link should be shown$/) do
  on(BackendPage) do | page |
    page.wait_until do
      page.username_link?
    end
  end
end

Then(/^Logout-Link should be shown$/) do
  on(BackendPage) do | page |
    page.wait_until do
      page.logout_link?
    end
  end
end