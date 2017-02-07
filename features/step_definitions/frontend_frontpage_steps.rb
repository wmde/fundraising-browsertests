# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Given(/^I am on the fundraising frontpage$/) do
  visit(FrontendFrontPage)
end

And(/^I select the (.*) option$/) do |radio_name|
  on(FrontendFrontPage).label_element_from_map(radio_name).when_visible.click
end

Then(/^The regularly option bar (shows|hides)$/) do |visibility|
  value = visibility_to_boolean(visibility)
  expect(on(FrontendFrontPage).div_period_regularly_element.visible?).to be value
end

Then(/^The account details form (shows|hides)$/) do |visibility|
  value = visibility_to_boolean(visibility)
  on(FrontendFrontPage) do |page|
    page.wait_until do
      page.input_bank_code_element.visible? == value
    end
  end
end

And(/^The address details form shows$/) do
  expect(on(FrontendFrontPage).personal_data_page_element).to be_visible
end

Then(/^The payment data form shows$/) do
  expect(on(FrontendFrontPage).payment_page_element).to be_visible
end

Then(/^The company field (shows|hides)$/) do |visibility|
  value = visibility_to_boolean(visibility)
  on(FrontendFrontPage) do |page|
    page.wait_until do
      page.input_company_name_element.visible? == value
    end
  end
end

Then(/^The first_name field (shows|hides)$/) do |visibility|
  value = visibility_to_boolean(visibility)
  on(FrontendFrontPage) do |page|
    page.wait_until do
      page.input_first_name_element.visible? == value
    end
  end
end

Then(/^The IBAN details form (shows|hides)$/) do |visibility|
  value = visibility_to_boolean(visibility)
  on(FrontendFrontPage) do |page|
    page.wait_until do
      page.input_iban_element.visible? == value
    end
  end
end

Then(/^The NONIBAN details form (shows|hides)$/) do |visibility|
  value = visibility_to_boolean(visibility)
  on(FrontendFrontPage) do |page|
    page.wait_until do
      page.input_bank_code_element.visible? == value
    end
  end
end

Then(/^The anonymous option hides$/) do
  expect(on(FrontendFrontPage).label_anonymous_element.when_not_visible).to_not be_visible
end

And(/^I click on the continue button$/) do
  sleep(1) # TODO: find out how to get by without sleeping, at the moment this is a hack to allow for background validation until the continue button works
  on(FrontendFrontPage).button_continue_element.click
end

And(/^I click on the done button$/) do
  on(FrontendFrontPage).button_done_element.click
end

And(/^I wait a second$/) do
  sleep(1)
end

Then(/^The amount display should show (.*) Euro$/) do |amount|
  expect(on(FrontendFrontPage).donation_amount_element.when_visible.text).to be == "#{amount} €"
end

When(/^I enter a valid random amount in the amount field$/) do
  @amount = generate_random_amount
  on(FrontendFrontPage).input_amount = @amount
  # onChange event is not fired when Selenium "enters" the value, so we have to fire it ourselves
  on(FrontendFrontPage).execute_script("$('#form1-amount-8').change()")
end

Then(/^The amount display should show the given amount$/) do
  expect(on(FrontendFrontPage).donation_amount_element.when_visible.text).to be == "#{@amount},00 €"
end
