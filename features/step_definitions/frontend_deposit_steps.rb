# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de> <christoph.fischer@wikimedia.de>

Then(/^The donation sheet shows$/) do
	on(FrontendReceiptPage) do | page |
		page.wait_until do
			page.div_donation_sheet_element.visible?
		end
	end
end

And(/^The donation amount should show (.*) Euro$/) do | amount |
  expect(on(FrontendReceiptPage).get_donation_amount_element.text).to be == "#{amount}€"
end