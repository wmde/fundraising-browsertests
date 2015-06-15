# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

When(/^I click on the become member link$/) do
  on(FrontendReceiptPage).a_become_member_element.when_visible.click
end
Then(/^The personal data sheet shows$/) do
  expect(on(FrontendReceiptPage).div_personal_data_sheet_element.when_visible).to be_visible
end

And(/^The (private|business) data on the receipt page should be the same$/) do |address_type|
  if address_type == 'private'
    name =  @address_data['first-name'] + ' ' + @address_data['last-name']
    expect(on(FrontendReceiptPage).span_confirm_name).to be == name
  else
    expect(on(FrontendReceiptPage).span_confirm_name).to be == @address_data['company-name']
  end
  expect(on(FrontendReceiptPage).span_confirm_street).to be == @address_data['street']
  expect(on(FrontendReceiptPage).span_confirm_post_code).to be == "#{@address_data['post-code']}"
  expect(on(FrontendReceiptPage).span_confirm_city).to be == @address_data['city']
  expect(on(FrontendReceiptPage).span_confirm_mail).to be == @address_data['email']
end

And(/^The send information text shows$/) do
  expect(on(FrontendReceiptPage).div_send_info_element.when_visible).to be_visible
end
