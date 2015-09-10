# @licence GNU GPL v2+
# @author Leszek Manicki <leszek.manicki@wikimedia.de>

Given(/^I am on the contact form page$/) do
  visit(FrontendContactFormPage)
end

Given(/^I enter valid random contact form data$/) do
  @data = on(FrontendContactFormPage).random_form_data
  on(FrontendContactFormPage).input_first_name = @data['first-name']
  on(FrontendContactFormPage).input_last_name = @data['last-name']
  on(FrontendContactFormPage).input_email = @data['email']
  on(FrontendContactFormPage).input_subject = @data['subject']
  on(FrontendContactFormPage).text_message = @data['message']
end

Given(/^I click the contact form submit button$/) do
  on(FrontendContactFormPage).button_submit_element.click
end

Given(/^I erase contents of the last name field from the contact form$/) do
  on(FrontendContactFormPage).input_last_name_element.clear
end

Given(/^I erase contents of the email field from the contact form$/) do
  on(FrontendContactFormPage).input_email_element.clear
end

Given(/^I erase contents of the subject field from the contact form$/) do
  on(FrontendContactFormPage).input_subject_element.clear
end

Given(/^I erase contents of the message field from the contact form$/) do
  on(FrontendContactFormPage).text_message_element.clear
end

Then(/^The contact message confirmation page shows$/) do
  expect(on(FrontendContactFormReceiptPage).header_element.when_visible).to be_visible
end

Then(/^contains contact form acknowledgement message$/) do
  expect(on(FrontendContactFormReceiptPage).contact_message_sent_element.when_visible).to be_visible
  expect(on(FrontendContactFormReceiptPage).contact_message_sent).to include('Vielen Dank für Ihre Nachricht!')
end

Then(/^The error message shows$/) do
  expect(on(FrontendContactFormPage).error_element.when_visible).to be_visible
end

Then(/^The error message is about the contact form missing value of last name$/) do
  expect(on(FrontendContactFormPage).error).to include('Das Feld Nachname ist ein Pflichtfeld.')
end

Then(/^The error message is about the contact form missing value of email$/) do
  expect(on(FrontendContactFormPage).error).to include('Das Feld E-Mail-Adresse ist ein Pflichtfeld.')
end

Then(/^The error message is about the contact form missing value of subject$/) do
  expect(on(FrontendContactFormPage).error).to include('Das Feld Betreff ist ein Pflichtfeld.')
end

Then(/^The error message is about the contact form missing value of message/) do
  expect(on(FrontendContactFormPage).error).to include('Bitte geben Sie Ihre Anfrage ein.')
end
