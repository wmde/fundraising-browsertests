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