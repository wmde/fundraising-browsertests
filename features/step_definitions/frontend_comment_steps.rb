# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

And(/^I finished a (private|business) debit donation with iban$/) do | address_type |
  step 'I am on the fundraising frontpage'
  step 'I select the debit donation option'
  step 'I click on the continue button'
  step 'The address details form shows'
  step 'I enter a valid german iban'
  step "I select the #{address_type} donation option"
  step "I enter random valid #{address_type} address data"
  step 'I click on the done button'
  step 'The debit confirmation form shows'
  step 'I confirm the debit contract'
  step 'I confirm the notification contract'
  step 'I click on the done button'
  step 'The debit receipt shows'
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
      page.get_element_by_id('positive-feedback')
    end
  end
end
