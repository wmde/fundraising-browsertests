# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendReceiptPage
  include PageObject
	include FrontendAddressForm

  #TODO id in template
  paragraph(:div_donation_sheet, :xpath => '//*[@id=\'donation-sheet\']/descendant::p[1]')

  div(:div_personal_data_sheet, :id => 'personal-data')

	div(:div_debit_confirmation, :id => 'debit-donation-confirmation')
	div(:div_normal_confirmation, :id => 'normal-donation-confirmation')
	div(:div_deposit_confirmation, :id => 'deposit-donation-confirmation')
	div(:div_membership_confirmation, :id => 'sepa-membership-confirmation')

	div(:div_send_info, :id => 'send-info')

  link(:a_become_member, :id => 'become-member-button')
  button(:button_done_member, :id => 'memFormSubmit')

	radio(:radio_amount1, :id => 'amount-1')
	radio(:radio_amount2, :id => 'amount-1')
	radio(:radio_amount3, :id => 'amount-1')

  span(:span_confirm_name,  :id => 'confirm-name')
  span(:span_confirm_mail,  :id => 'confirm-mail')

  span(:span_confirm_account,  :id => 'confirm-account-number')
  span(:span_confirm_bic,  :id => 'confirm-bic')

	def get_element_by_id ( id )
		@browser.element( id: id )
	end

  def get_donation_amount_element ()
    #TODO id in template
    @browser.element(xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end
end


