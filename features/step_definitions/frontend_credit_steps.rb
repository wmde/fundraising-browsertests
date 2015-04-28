# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Then(/^The credit card form shows$/) do
  on(FrontendCreditPage) do |page|
    page.wait_until do
      page.input_holder_element.visible?
    end
  end
end

And(/^The cardholder should be the surname and name$/) do
  name =  @address_data['first-name'] + ' ' + @address_data['last-name']
  expect(on(FrontendCreditPage).input_holder_element.value).to be == name
end
