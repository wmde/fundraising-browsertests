# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendReceiptPage
  include PageObject
	include FrontendAddressForm

  #TODO id in template
  paragraph(:div_donation_sheet, :xpath => '//*[@id=\'donation-sheet\']/descendant::p[1]')

  div(:div_personal_data_sheet, :id => 'personal-data')

  link(:a_become_member, :id => 'become-member-button')

  span(:span_confirm_name,  :id => 'confirm-name')
  span(:span_confirm_mail,  :id => 'confirm-mail')

  span(:span_confirm_account,  :id => 'confirm-account-number')
  span(:span_confirm_bic,  :id => 'confirm-bic')

  def get_donation_amount_element ()
    #TODO id in template
    @browser.element(xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end
end


