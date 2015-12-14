When(/^I visit Wikipedia$/) do
  visit(WikipediaOrgFrontPage)
end

Then(/^The CentralNotice hide banner cookie should be set$/) do
  cookie = "return $.cookie( 'centralnotice_hide_fundraising' ) !== null;"
  expect(browser.execute_script(cookie)).to eq true
end
