
Then(/^The paypal form shows$/) do
  expect(on(FrontendPaypalPage).div_xpt_content_main_element.visible?).to be true
end

And(/^The paypal should be the surname and name$/) do
  name =  @address_data['first-name'] + " " + @address_data['last-name']
  expect(on(FrontendPaypalPage).input_holder_element.value).to be == name
end

And(/^The paypal donation amount should show (.*) Euro$/) do | amount |
  expect(on(FrontendPaypalPage).span_amount_element.text).to be == "#{amount}"
end