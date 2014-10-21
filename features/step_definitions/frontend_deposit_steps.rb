# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de> <christoph.fischer@wikimedia.de>

Then(/^The donation sheet shows$/) do
  expect(on(FrontendReceiptPage).div_donation_sheet_element.visible?).to be true
end

And(/^The donation amount should show (.*) Euro$/) do | amount |
  expect(on(FrontendReceiptPage).get_donation_amount_element.text).to be == "#{amount}€"
end