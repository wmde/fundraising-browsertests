# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Then(/^The paypal form shows$/) do
  on(FrontendPaypalPage) do |page|
    page.wait_until do
      page.div_xpt_content_main_element.visible?
    end
  end
end

And(/^The paypal should be the surname and name$/) do
  name =  @address_data['first-name'] + ' ' + @address_data['last-name']
  expect(on(FrontendPaypalPage).input_holder_element.value).to be == name
end

And(/^The paypal donation amount should show (.*) Euro$/) do |amount|
  expect(on(FrontendPaypalPage).span_amount_element.text).to be == "#{amount}"
end

And(/^I login with my paypal credentials$/) do
  on(FrontendPaypalPage).input_login_email_element.when_visible.value = ENV['PAYPAL_USERNAME']
  on(FrontendPaypalPage).input_login_password_element.value = ENV['PAYPAL_PASSWORD']
  on(FrontendPaypalPage).button_login_element.click
end

And(/^I click on the paypal continue button$/) do
  # This page takes a long time to load and the test may fail.
  on(FrontendPaypalPage).button_continue_element.when_visible.click
end

Then(/^The normal donation confirmation shows$/) do
  on(FrontendReceiptPage) do |page|
    page.wait_until do
      page.div_normal_confirmation_element.visible?
    end
  end
end

And(/^I click on the paypal back button$/) do
  on(FrontendPaypalPage).a_back_to_frontend_element.click
end
