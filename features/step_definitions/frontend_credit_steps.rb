# @licence GNU GPL v2+
# @author Christoph Fischer

Then(/^The credit card form shows$/) do
  expect(on(FrontendCreditPage).input_holder_element.visible?).to be true
end

And(/^The cardholder should be the surname and name$/) do
  name =  @address_data['first-name'] + " " + @address_data['last-name']
  expect(on(FrontendCreditPage).input_holder_element.value).to be == name
end