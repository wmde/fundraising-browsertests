# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Then(/^The paypal form shows$/) do
  expect(on(FrontendPaypalPage).div_xpt_content_main_element.wait_until_present)
end

And(/^The paypal should be the surname and name$/) do
  name =  @address_data['first-name'] + ' ' + @address_data['last-name']
  expect(on(FrontendPaypalPage).input_holder_element.value).to be == name
end

And(/^The paypal donation amount should show (.*) Euro$/) do |amount|
  expect(on(FrontendPaypalPage).span_amount_element.text).to be == "#{amount}"
end

And(/^I login with my paypal credentials$/) do
  step('The paypal form shows')
  on(FrontendPaypalPage).input_login_email_element.when_visible.value = ENV['PAYPAL_USERNAME']
  on(FrontendPaypalPage).input_login_password_element.value = ENV['PAYPAL_PASSWORD']
  on(FrontendPaypalPage).button_login_element.click
end

And(/^I click on the paypal continue button$/) do
  # paypal sandbox contains a tracking pixel that does not load, i.e. the DOM is never ready
  # we need to submit the form despite this fact, w/o using the page object
  sleep(10)
  button_id = FrontendPaypalPage.class_variable_get(:@@continue_button_id)
  browser.execute_script("document.getElementById('" + button_id + "').click()")
end

Then(/^The normal donation confirmation shows$/) do
  on(FrontendReceiptPage).div_normal_confirmation_element.wait_until_present
end

And(/^I click on the paypal back button$/) do
  on(FrontendPaypalPage).a_back_to_frontend_element.click
end
