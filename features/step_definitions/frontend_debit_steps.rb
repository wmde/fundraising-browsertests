# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de> <christoph.fischer@wikimedia.de>

Then(/^The debit form shows$/) do
  expect(on(FrontendDebitPage).get_donation_sepa_confirmation_element.exists?).to be true
end


And(/^The debit donation amount should show (.*) Euro$/) do | amount |
  expect(on(FrontendDebitPage).get_donation_amount_element.text).to be == "#{amount}€"
end

#Example data see http://www.iban-bic.com/sample_accounts.html
And(/^I enter valid account data$/) do
  on(FrontendFrontPage).input_account_number = '0648489890'
  on(FrontendFrontPage).input_bank_code = '50010517'
end


And(/^I enter a valid iban$/) do
  on(FrontendFrontPage).input_iban = 'DE12500105170648489890'  ####Fake
  #on(FrontendFrontPage).input_bic = 'INGDDEFFXXX'
end

When(/^I confirm the debit contact$/) do
  on(FrontendDebitReceiptPage).get_label_element_to_radio('confirm_sepa').click
end

And(/^I confirm the notification contract$/) do
  on(FrontendDebitReceiptPage).get_label_element_to_radio('confirm_shortterm').click
end

Then(/^The debit receipt shows$/) do
  expect(on(FrontendReceiptPage).a_become_member_element.visible?).to be true
end