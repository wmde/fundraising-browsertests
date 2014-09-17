


Then(/^The donation sheet shows$/) do
  expect(on(FrontendReceiptPage).div_donation_sheet_element.visible?).to be true
end

And(/^The donation amount should show (.*) Euro$/) do | amount |
  expect(on(FrontendReceiptPage).get_donation_amount_element.text).to be == "#{amount}€"
end

And(/^I enter random valid (private|business) address data$/) do | address_type |
  @address_data = on(FrontendFrontPage).get_random_address_data()

  if address_type == "private"
    on(FrontendFrontPage).input_first_name = @address_data['first-name']
    on(FrontendFrontPage).input_last_name = @address_data['last-name']
  else
    on(FrontendFrontPage).input_company_name = @address_data['company-name']
  end

  on(FrontendFrontPage).input_street = @address_data['street']
  on(FrontendFrontPage).input_post_code = @address_data['post-code']
  on(FrontendFrontPage).input_city = @address_data['city']
  on(FrontendFrontPage).input_email = @address_data['email']
end

Then(/^Address from should be visible$/) do
  expect(on(FrontendFrontPage).input_city_element.visible?).to be true
end

And(/^I enter an invalid postcode$/) do
  on(FrontendFrontPage).input_post_code = '2345'
end

And(/^I erase the city data field$/) do
  on(FrontendFrontPage).input_city_element.clear
end

When(/^I click on the become member link$/) do
  on(FrontendReceiptPage).a_become_member.select
end

Then(/^The personal data sheet shows$/) do
  expect(on(FrontendReceiptPage).div_personal_data_sheet_element.visible?).to be true
end

Then(/^The membership address data should be the same$/) do
  expect(on(FrontendReceiptPage).input_first_name_element.value).to be == @address_data['first-name']
  expect(on(FrontendReceiptPage).input_last_name_element.value).to be == @address_data['last-name']
  expect(on(FrontendReceiptPage).input_street_element.value).to be == @address_data['street']
  expect(on(FrontendReceiptPage).input_post_code_element.value).to be == "#{@address_data['post-code']}"
  expect(on(FrontendReceiptPage).input_city_element.value).to be == @address_data['city']
  expect(on(FrontendReceiptPage).input_email_element.value).to be == @address_data['email']
end