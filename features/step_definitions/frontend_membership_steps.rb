# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Then(/^The (private|business) membership address data should be the same$/) do |address_type|
  page = FrontendReceiptPage
  if address_type == 'private'
    expect(on(page).input_first_name_element.value).to be == @address_data['first-name']
    expect(on(page).input_last_name_element.value).to be == @address_data['last-name']
  else
    expect(on(page).input_company_name_element.value).to be == @address_data['company-name']
  end
  expect(on(page).input_street_element.value).to be == @address_data['street']
  expect(on(page).input_post_code_element.value).to be == "#{@address_data['post-code']}"
  expect(on(page).input_city_element.value).to be == @address_data['city']
  expect(on(page).input_email_element.value).to be == @address_data['email']
end

And(/^The lower fee rates should be (available|unavailable)$/) do |lower_fee|
  is_disabled = nil

  if lower_fee == 'available'
    on(FrontendReceiptPage) do |page|
      page.wait_until do
        page.radio_amount3_element.attribute('disabled').equal? is_disabled
      end
    end
  end

  if lower_fee == 'unavailable'
    is_disabled = 'true'
    on(FrontendReceiptPage) do |page|
      page.wait_until do
        !page.radio_amount3_element.attribute('disabled').equal? nil
      end
    end
  end

  expect(on(FrontendReceiptPage).radio_amount4_element.attribute('disabled')).equal? is_disabled
  expect(on(FrontendReceiptPage).radio_amount5_element.attribute('disabled')).equal? is_disabled
end

And(/^I click on the done member button$/) do
  on(FrontendMembershipPage).button_done_member_element.click
end

And(/^I click on the continue member button$/) do
  on(FrontendMembershipPage).button_continue_member_element.click
end

Then(/^The membership confirmation shows$/) do
  expect(on(FrontendReceiptPage).div_membership_confirmation_element.wait_until_present)
end

And(/^I enter (\d+) euro in the amount field$/) do |arg|
  on(FrontendReceiptPage).input_amount_element.when_visible.value = arg
end

And(/^I select the (\d+ euro) fee$/) do |arg|
  on(FrontendMembershipPage).lable_element_from_map(arg).when_visible.click
end

Then(/^The error box shows$/) do
  expect(on(FrontendReceiptPage).div_error_box_element.when_visible).to be_visible
end

Given(/^I am on the stand alone membership formpage$/) do
  visit(FrontendMembershipPage)
end

And(/^The membership type should be (sustaining|active)/) do |membership_type|
  expect(on(FrontendReceiptPage).hidden_membership_type_element.value).equal? membership_type
end

And(/^The debit confirmation form for membership shows$/) do
  expect(on(FrontendMembershipPage).sepa_confirmation_element.when_visible).to be_visible
end
