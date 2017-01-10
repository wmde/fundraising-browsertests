# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^I enter random valid (private|business) address data$/) do |address_type|
  @address_data = on(FrontendFrontPage).random_address_data

  if address_type == 'private'
    on(FrontendFrontPage).lable_element_from_map('mrs').click
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
  expect(on(FrontendFrontPage).personal_data_page_element).to be_visible
end

And(/^I erase the city data field$/) do
  on(FrontendFrontPage).input_city_element.clear
end

And(/^I erase the street data field$/) do
  on(FrontendFrontPage).input_street_element.clear
end

And(/^I erase the first name data field$/) do
  on(FrontendFrontPage).input_first_name_element.clear
end

And(/^I erase the email data field$/) do
  on(FrontendFrontPage).input_email_element.clear
end

And(/^I enter an invalid email/) do
  on(FrontendFrontPage).input_email = 'tdafsf'
end

And(/^I erase the postcode data field$/) do
  on(FrontendFrontPage).input_post_code_element.clear
end

And(/^I enter an invalid postcode$/) do
  on(FrontendFrontPage).input_post_code = '2345'
end
