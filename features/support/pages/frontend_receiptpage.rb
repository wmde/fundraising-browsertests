# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendReceiptPage
  include PageObject
  include FrontendAddressForm

  div(:div_personal_data_sheet, id: 'personal-data')

  div(:div_debit_confirmation, id: 'debit-donation-confirmation')
  div(:div_normal_confirmation, id: 'normal-donation-confirmation')
  div(:div_deposit_confirmation, id: 'deposit-donation-confirmation')
  div(:div_membership_confirmation, id: 'sepa-membership-confirmation')

  div(:div_send_info, id: 'send-info')

  link(:a_become_member, id: 'become-member-button')
  button(:button_done_member, id: 'memFormSubmit')

  radio(:radio_amount1, id: 'amount-1')
  radio(:radio_amount2, id: 'amount-2')
  radio(:radio_amount3, id: 'amount-3')
  radio(:radio_amount4, id: 'amount-4')
  radio(:radio_amount5, id: 'amount-5')

  hidden_field(:hidden_membership_type, id: 'membership-type')

  text_field(:input_amount, id: 'amount-8')

  span(:span_confirm_name, css: '.confirm-name')
  span(:span_confirm_street, css: '.confirm-street')
  span(:span_confirm_post_code, css: '.confirm-postcode')
  span(:span_confirm_city,  css: '.confirm-city')
  span(:span_confirm_mail,  css: '.confirm-email')

  span(:span_confirm_account, css: '.confirm-account-number')
  span(:span_confirm_bic, css: '.confirm-bic')

  div(:div_error_box, xpath: '//div[contains(@class,\'errorbox\')][1]')

  button(:button_cancel, xpath: '//input[@name=\'go_storno\'][1]')

  h2(:h2_donation_canceled, xpath: '//h2[text()=\'Ihre Spende wurde storniert.\'][1]')

  def donation_amount_element
    element('strong', xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end
end
