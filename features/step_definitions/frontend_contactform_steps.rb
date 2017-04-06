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
  on(FrontendContactFormReceiptPage) do |page|
    page.wait_until do
      page.contact_message_sent_element.text.include?('Vielen Dank für Ihre Nachricht!')
    end
  end
end

Then(/^The field (.*) has an error message/) do |field|
  expect(on(FrontendContactFormPage).error_for_field(field).wait_until_present)
end
