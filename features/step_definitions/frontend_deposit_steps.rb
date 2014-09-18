# @licence GNU GPL v2+
# @author Christoph Fischer

Then(/^The donation sheet shows$/) do
  expect(on(FrontendReceiptPage).div_donation_sheet_element.visible?).to be true
end

And(/^The donation amount should show (.*) Euro$/) do | amount |
  expect(on(FrontendReceiptPage).get_donation_amount_element.text).to be == "#{amount}€"
end

And(/^I enter an invalid postcode$/) do
  on(FrontendFrontPage).input_post_code = '2345'
end

And(/^I erase the city data field$/) do
  on(FrontendFrontPage).input_city_element.clear
end