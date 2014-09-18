# @licence GNU GPL v2+
# @author Christoph Fischer


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

And(/^The (private|business) name on the become member from should be the same$/) do | address_type |
  if address_type == "private"
    expect(on(FrontendReceiptPage).input_first_name_element.value).to be == @address_data['first-name']
  else
    expect(on(FrontendReceiptPage).input_company_name_element.value).to be == @address_data['company-name']
  end
end