# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^The donation amount should show (.*) Euro$/) do |amount|
  expect(on(FrontendReceiptPage).donation_amount_element.text).to be == "#{amount}€"
end

Then(/^The deposit donation confirmation shows$/) do
  on(FrontendReceiptPage) do |page|
    page.wait_until do
      page.div_deposit_confirmation_element.visible?
    end
  end
end
