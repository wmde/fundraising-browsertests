# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Then(/^The (private|business) membership address data should be the same$/) do | address_type |
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

And(/^The lower fee rates should be (available|unavailable)$/) do | lower_fee |
  if lower_fee == 'available'
    is_disabled = nil
    on(FrontendReceiptPage) do | page |
      page.wait_until do
        page.radio_amount1_element.attribute('disabled').equal? is_disabled
      end
    end
  end
  if lower_fee == 'unavailable'
    is_disabled = 'true'
    on(FrontendReceiptPage) do | page |
      page.wait_until do
        !page.radio_amount1_element.attribute('disabled').equal? nil
      end
    end
  end

  expect(on(FrontendReceiptPage).radio_amount2_element.attribute('disabled')).equal? is_disabled
  expect(on(FrontendReceiptPage).radio_amount3_element.attribute('disabled')).equal? is_disabled
end

And(/^I click on the done member button$/) do
  on(FrontendReceiptPage).button_done_member_element.click
end

Then(/^The membership confirmation shows$/) do
  on(FrontendReceiptPage) do | page |
    page.wait_until do
      page.div_membership_confirmation_element.visible?
    end
  end
end

And(/^I enter (\d+) euro in the amount field$/) do | arg |
  on(FrontendReceiptPage).input_amount = arg
end

Then(/^The error box shows$/) do
  on(FrontendReceiptPage) do | page |
    page.wait_until do
      page.div_error_box_element.visible?
    end
  end
end

Given(/^I am on the stand alone membership formpage$/) do
  visit(FrontendMembershipPage)
end

And(/^The membership type should be (sustaining|active)/) do  | membership_type |
  expect(on(FrontendReceiptPage).hidden_membership_type_element.value).equal? membership_type
end