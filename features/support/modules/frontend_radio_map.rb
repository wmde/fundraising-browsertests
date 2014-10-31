# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

module FrontendRadioMap
  include PageObject

  @@radio_button_map = {
    'deposit donation' => 'payment-type-1',
    'credit donation' => 'payment-type-2',
    'debit donation' => 'payment-type-3',
    'paypal donation' => 'payment-type-4',

    'single donation' => 'periode-1',
    'regularly donation' => 'periode-2',

    'iban' => 'debit-type-1',
    'noiban' => 'debit-type-2',

    '5 euro' => 'amount-1',
    '15 euro' => 'amount-2',
    '25 euro' => 'amount-3',
    '50 euro' => 'amount-4',
    '75 euro' => 'amount-5',
    '100 euro' => 'amount-6',
    '250 euro' => 'amount-7',

    '24 euro fee' => 'amount-1',
    '50 euro fee' => 'amount-2',
    '75 euro fee' => 'amount-3',
    '100 euro fee' => 'amount-4',
    '150 euro fee' => 'amount-5',

    'private donation' => 'address-type-1',
    'business donation' => 'address-type-2',
    'anonymous donation' => 'address-type-3',

    'send information' => 'send-information'
  }

  def get_label_element_to_radio(radio_id)
    @browser.element(xpath: compose_label_xpath_for_radio(radio_id))
  end

  def get_lable_element_from_map(radio_name)
    get_label_element_to_radio(@@radio_button_map[radio_name])
  end
end
