# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendFrontPage
  include PageObject
	 include FrontendAddressForm
	 include FrontendRadioMap

  page_url ENV["FRONTEND_URL"]

  #TODO id in template
  div(:div_period_regularly, css: 'div.periode-2-list')

  button(:button_continue, id: 'continueFormSubmit')
  button(:button_done, id: 'donFormSubmit')

  label(:label_private, xpath: compose_label_xpath_for_radio('address-type-1'))
  label(:label_anonymous, xpath: compose_label_xpath_for_radio('address-type-3'))
  label(:label_iban, xpath: compose_label_xpath_for_radio('debit-type-1'))

  text_field(:input_amount,  id: 'amount-8')

  text_field(:input_iban, id: 'iban')
  text_field(:input_bic, id: 'bic')
  text_field(:input_account_number, id: 'account-number')
  text_field(:input_bank_code, id: 'bank-code')

  def get_random_address_data
    address_data = {}
    address_data['company-name'] = generate_random_string
    address_data['first-name'] = generate_random_string
    address_data['last-name'] = generate_random_string
    address_data['street'] = generate_random_string
    address_data['post-code'] = generate_random_zipcode
    address_data['city'] = generate_random_string
    address_data['email'] = generate_random_string + "@example.com"

    address_data
  end

  def get_donation_amount_element
    @browser.element(xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end
end
