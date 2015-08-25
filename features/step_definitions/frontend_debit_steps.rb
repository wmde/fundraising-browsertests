# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Then(/^The debit confirmation form shows$/) do
  expect(on(FrontendDebitPage).sepa_confirmation_element.when_present).to be_present
end

And(/^The debit donation amount should show (.*) Euro$/) do |amount|
  expect(on(FrontendDebitPage).donation_amount_element.text).to be == "#{amount}€"
end

# Example data see http://www.iban-bic.com/sample_accounts.html
And(/^I enter valid account data$/) do
  on(FrontendFrontPage).input_account_number_element.when_visible.value = '0648489890'
  on(FrontendFrontPage).input_bank_code_element.when_visible.value = '50010517'
end

And(/^I enter a valid german iban$/) do
  on(FrontendFrontPage).input_iban_element.when_visible.value = 'DE12500105170648489890' # ###Fake
end

# Example data see http://www.unfcu.org/WorkArea/DownloadAsset.aspx?id=1056
And(/^I enter a valid iban and bic$/) do
  on(FrontendFrontPage).input_iban_element.when_visible.value = 'BE68539007547034' # ###Fake
  on(FrontendFrontPage).input_bic_element.when_visible.value = 'CITIBEBXXXX'
end

When(/^I confirm the debit contract$/) do
  on(FrontendDebitReceiptPage).label_element_to_radio('confirm_sepa').click
end

And(/^I confirm the notification contract$/) do
  on(FrontendDebitReceiptPage).label_element_to_radio('confirm_shortterm').click
end

Then(/^The debit receipt shows$/) do
  expect(on(FrontendReceiptPage).div_debit_confirmation_element.when_visible).to be_visible
end
