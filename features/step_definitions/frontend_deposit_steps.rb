# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^The donation amount should show (.*) Euro$/) do |amount|
  expect(on(FrontendReceiptPage).donation_amount_element.text).to be == "#{amount} €"
end

Then(/^The deposit donation confirmation shows$/) do
  expect(on(FrontendReceiptPage).div_deposit_confirmation_element.wait_until_present)
end
