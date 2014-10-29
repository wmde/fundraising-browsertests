# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>


When(/^I click on the become member link$/) do
  on(FrontendReceiptPage).a_become_member.select
end
Then(/^The personal data sheet shows$/) do
  expect(on(FrontendReceiptPage).div_personal_data_sheet_element.visible?).to be true
end

And(/^The send information text shows$/) do
	expect(on(FrontendReceiptPage).div_send_info_element.visible?).to be true
end