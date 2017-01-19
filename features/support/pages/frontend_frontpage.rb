# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendFrontPage
  include PageObject
  include FrontendAddressForm
  include FrontendRadioMap

  page_url ENV['FRONTEND_URL']

  div(:div_period_regularly, css: 'div.periode-2-list')

  div(:personal_data_page, id: 'personalDataPage')
  div(:payment_page, id: 'paymentPage')

  label(:label_private, xpath: compose_label_xpath_for_radio('address-type-1'))
  label(:label_anonymous, xpath: compose_label_xpath_for_radio('address-type-3'))
  label(:label_iban, xpath: compose_label_xpath_for_radio('debit-type-1'))

  text_field(:input_amount, id: 'form1-amount-8')

  text_field(:input_iban, id: 'iban')
  text_field(:input_bic, id: 'bic')
  text_field(:input_account_number, id: 'account-number')
  text_field(:input_bank_code, id: 'bank-code')

  div(:div_error_box, xpath: '//div[contains(@class,\'errorbox\')][1]')

  def random_address_data
    address_data = {}
    address_data['company-name'] = generate_random_string
    address_data['first-name'] = generate_random_string
    address_data['last-name'] = generate_random_string
    address_data['street'] = generate_random_string
    address_data['post-code'] = generate_random_zipcode
    address_data['city'] = generate_random_string
    address_data['email'] = generate_random_string + '@example.com'

    address_data
  end

  def button_continue_element
    if payment_page_element.visible?
      element('button', css: '#continueFormSubmit1')
    else
      element('button', css: '#continueFormSubmit2')
    end
  end

  def button_done_element
    if personal_data_page_element.visible?
      element('button', css: '#finishFormSubmit2')
    else
      element('button', css: '#finishFormSubmit3')
    end
  end

  def donation_amount_element
    element('span', css: '#donation-amount .amount-formatted')
  end

  def label_element_from_map(radio_name)
    prefix = ''
    radio_id = label_description_to_id(radio_name)
    if radio_id =~ /(amount|payment-type|periode)/
      if payment_page_element.visible?
        prefix = 'form1-'
      else
        prefix = 'form2-'
      end
    end
    label_element_to_radio(prefix + radio_id)
  end
end
