

Then(/^The debit form shows$/) do
  expect(on(FrontendDebitPage).get_donation_sepa_confirmation_element.exists?).to be true
end


And(/^The debit donation amount should show (.*) Euro$/) do | amount |
  expect(on(FrontendDebitPage).get_donation_amount_element.text).to be == "#{amount}€"
end

And(/^I enter valid account data$/) do
  #TODO Fake this
  on(FrontendFrontPage).input_account_number = 4114652841 ####Fake
  on(FrontendFrontPage).input_bank_code = 10050000
end