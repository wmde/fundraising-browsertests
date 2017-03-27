# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendMembershipPage
  include PageObject
  include FrontendAddressForm
  include FrontendRadioMap

  page_url ENV['FRONTEND_URL'] + 'page/Membership_Application'

  div(:div_personal_data_sheet, id: 'personal-data')

  div(:div_normal_confirmation, id: 'normal-donation-confirmation')
  div(:div_deposit_confirmation, id: 'deposit-donation-confirmation')

  div(:div_send_info, id: 'send-info')

  link(:a_become_member, id: 'become-member-button')
  button(:button_continue_member, id: 'continueFormSubmit')
  # TODO: implement as methods with dynamic selectors, depending on payment type.
  button(:button_done_member, id: 'finishFormSubmit2')

  radio(:radio_amount1, id: 'amount-1')
  radio(:radio_amount2, id: 'amount-2')
  radio(:radio_amount3, id: 'amount-3')
  radio(:radio_amount4, id: 'amount-4')
  radio(:radio_amount5, id: 'amount-5')

  text_field(:input_amount, id: 'amount-8')

  span(:span_confirm_account, id: 'confirm-account-number')
  span(:span_confirm_bic, id: 'confirm-bic')

  div(:div_error_box, xpath: '//div[contains(@class,\'errorbox\')][1]')

  def sepa_confirmation_element
    element('section', id: 'membership-sepa-confirmation')
  end

  def donation_amount_element
    element('strong', xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end

end
