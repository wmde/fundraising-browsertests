Given(/^I am on the fundraising frontpage$/) do
  visit(FrontendFrontPage)
end

And(/^I select the (.*) option$/) do | radio_name |
  on(FrontendFrontPage).get_lable_element_from_map(radio_name).click
end


Then(/^The regularly option bar (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
  expect(on(FrontendFrontPage).div_period_regularly_element.visible?).to be value
end


Then(/^The account details form (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
  expect(on(FrontendFrontPage).label_iban_element.visible?).to be value
end


And(/^The address details form shows$/) do
  expect(on(FrontendFrontPage).label_private_element.visible?).to be true
end


Then(/^The IBAN details form (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
  expect(on(FrontendFrontPage).input_iban_element.visible?).to be value
end

Then(/^The NONIBAN details form (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
  expect(on(FrontendFrontPage).input_noniban_element.visible?).to be value
end


Then(/^The anonymous option hides$/) do
  expect(on(FrontendFrontPage).label_anonymous_element.visible?).to be false
end


And(/^I click on the continue button$/) do
  on(FrontendFrontPage).button_continue_element.click
end

And(/^I click on the done button$/) do
  on(FrontendFrontPage).button_done_element.click
end

And(/^I wait a second$/) do
  sleep(1)
end


Then(/^The amount display should show (.*) Euro$/) do | amount |
  expect(on(FrontendFrontPage).get_donation_amount_element.text).to be == "#{amount}€"
end

When(/^I enter a random amount in the amount field$/) do
  @amount = generate_random_amount()
  on(FrontendFrontPage).input_amount = @amount
end


Then(/^The amount display should show the given amount$/) do
  expect(on(FrontendFrontPage).get_donation_amount_element.text).to be == "#{@amount}€"
end

Then(/^The company field shows$/) do
  expect(on(FrontendFrontPage).input_company_name_element.visible?).to be true
end

Then(/^The company field hides$/) do
  expect(on(FrontendFrontPage).input_company_name_element.visible?).to be false
end

Then(/^The first_name field shows$/) do
  expect(on(FrontendFrontPage).input_first_name_element.visible?).to be true
end

Then(/^The first_name field hides$/) do
  expect(on(FrontendFrontPage).input_first_name_element.visible?).to be false
end