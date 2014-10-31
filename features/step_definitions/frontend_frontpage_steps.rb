# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Given(/^I am on the fundraising frontpage$/) do
  visit(FrontendFrontPage)
end

And(/^I select the (.*) option$/) do | radio_name |
  on(FrontendFrontPage).get_lable_element_from_map(radio_name).click
end

Then(/^The regularly option bar (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
  expect(on(FrontendFrontPage).div_period_regularly_element.visible?).to be value
end

Then(/^The account details form (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
	 on(FrontendFrontPage) do | page |
 		page.wait_until do
 			page.input_bank_code_element.visible? == value
 		end
 	end
end

And(/^The address details form shows$/) do
	on(FrontendFrontPage) do | page |
		page.wait_until do
			page.label_private_element.visible?
		end
	end
end

Then(/^The company field (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
	 on(FrontendFrontPage) do | page |
 		page.wait_until do
 			page.input_company_name_element.visible? == value
 		end
 	end
end

Then(/^The first_name field (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
	 on(FrontendFrontPage) do | page |
 		page.wait_until do
 			page.input_first_name_element.visible? == value
 		end
 	end
end

Then(/^The IBAN details form (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
	 on(FrontendFrontPage) do | page |
 		page.wait_until do
 			page.input_iban_element.visible? == value
 		end
 	end
end

Then(/^The NONIBAN details form (shows|hides)$/) do | visibility |
  value = visibility_to_boolean( visibility )
	 on(FrontendFrontPage) do | page |
 		page.wait_until do
 			page.input_bank_code_element.visible? == value
 		end
 	end
end

Then(/^The anonymous option hides$/) do
	on(FrontendFrontPage) do | page |
		page.wait_until do
			!page.label_anonymous_element.visible?
		end
	end
end

And(/^I click on the continue button$/) do
  on(FrontendFrontPage).button_continue_element.click
end

And(/^I click on the done button$/) do
  on(FrontendFrontPage).button_done_element.click
end

And(/^I wait a second$/) do
  sleep(1)
end

Then(/^The amount display should show (.*) Euro$/) do | amount |
  expect(on(FrontendFrontPage).get_donation_amount_element.text).to be == "#{amount}€"
end

When(/^I enter a valid random amount in the amount field$/) do
  @amount = generate_random_amount
  on(FrontendFrontPage).input_amount = @amount
end

Then(/^The amount display should show the given amount$/) do
  expect(on(FrontendFrontPage).get_donation_amount_element.text).to be == "#{@amount},00€"
end