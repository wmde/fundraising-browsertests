# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de> <christoph.fischer@wikimedia.de>

And(/^I finished a debit donation$/) do
	step 'I am on the fundraising frontpage'
	step 'I select the debit donation option'
	step 'I click on the continue button'
	step 'I wait a second'
	step 'I enter a valid german iban'
	step 'I enter random valid private address data'
	step 'I click on the done button'
	step 'I wait a second'
	step 'I confirm the debit contact'
	step 'I confirm the notification contract'
	step 'I click on the done button'
	step 'I wait a second'
end

Given(/^I click on the add comment link$/) do
	on(FrontendCommentPage).a_view_comments_element.click
end

And(/^I enter a harmless comment text$/) do
	on(FrontendCommentPage).text_comment = 'Ich mag Wikimedia!'
end

And(/^I click the submit comment button$/) do
	on(FrontendCommentPage).button_publish_element.click
end

Then(/^a positive feedback should show$/) do
	on(FrontendCommentPage) do | page |
		page.wait_until do
			page.get_element_by_id( 'positive-feedback' )
		end
	end
end