# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

module FrontendRadioMap
  include PageObject

  def label_element_to_radio(radio_id)
    element('label', xpath: compose_label_xpath_for_radio(radio_id))
  end

  def lable_element_from_map(radio_name)
    radio_button_map = {
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

      'private donation' => 'address-type-1',
      'business donation' => 'address-type-2',
      'anonymous donation' => 'address-type-3',

      'sustaining membership' => 'membership-type-1',
      'active membership' => 'membership-type-2',

      'send information' => 'send-information',

      'mrs' => 'salutation-1',
      'mr' => 'salutation-1'
    }

    label_element_to_radio(radio_button_map[radio_name])
  end
end
