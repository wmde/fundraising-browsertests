Given(/^I am on the wikipedia\.de frontpage$/) do
  visit(WikipediaDeFrontPage)
end

And(/^The wikipedia\.de lightbox banner shows$/) do
  on(WikipediaDeFrontPage) do |page|
    page.wait_until do
      page.form_donation_element.exists?
    end
  end
end

When(/^I click on the debit button$/) do
  on(WikipediaDeFrontPage).button_debit_element.click
end

When(/^I click on the deposit button$/) do
  on(WikipediaDeFrontPage).button_deposit_element.click
end

When(/^I click on the credit button$/) do
  on(WikipediaDeFrontPage).button_credit_element.click
end

When(/^I click on the paypal button$/) do
  on(WikipediaDeFrontPage).button_paypal_element.click
end

When(/^I click the banner (.*) amount option$/) do |amount|
  on(WikipediaDeFrontPage).click_banner_amount(amount)
end

def generate_random_amount
  random = Random.new
  random.rand(1..99_999)
end

And(/^I enter an random valid amount$/) do
  @amount = generate_random_amount
  on(WikipediaDeFrontPage).input_amount = @amount
end

And(/^The given amount should show$/) do
  expect(on(FrontendFrontPage).donation_amount_element.text).to be == "#{@amount}€"
end

Then(/^The donation lightbox shows$/) do
  on(WikipediaDeFrontPage) do |page|
    page.wait_until do
      page.form_donation_element.visible?
    end
  end
end

And(/^I switch to the new window$/) do
  # TODO: think of a check that window is open
  sleep(1)
  on(WikipediaDeFrontPage).switch_to_popup
end

And(/^I change the lightbox to testmode$/) do
  on(WikipediaDeFrontPage).switch_to_testmode
end
