
class FrontendFrontPage
  include PageObject

  page_url ENV["FRONTEND_URL"]

  #TODO id in template
  div(:div_period_regularly, :css => 'div.periode-2-list')

  #TODO id in template
  button(:button_continue, :xpath => '//button[contains(@class,\'f-right\')]')
  button(:button_done, :id => 'donFormSubmit')

  label(:label_private, :xpath => compose_label_xpath_for_radio('address-type-1'))
  label(:label_anonymous, :xpath => compose_label_xpath_for_radio('address-type-3'))
  label(:label_iban, :xpath => compose_label_xpath_for_radio('debit-type-1'))

  text_field(:input_amount,  :id => 'amount-8')

  text_field(:input_iban, :id => 'iban')
  text_field(:input_bic, :id => 'bic')
  text_field(:input_account_number, :id => 'account-number')
  text_field(:input_bank_code, :id => 'bank-code')

  text_field(:input_company_name,  :id => 'company-name')
  text_field(:input_first_name,  :id => 'first-name')
  text_field(:input_last_name,  :id => 'last-name')
  text_field(:input_street,  :id => 'street')
  text_field(:input_post_code,  :id => 'post-code')
  text_field(:input_city,  :id => 'city')
  text_field(:input_email,  :id => 'email')

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

      'private donation' => 'address-type-1',
      'business donation' => 'address-type-2',
      'anonymous donation' => 'address-type-3'
  }

  def get_label_element_to_radio ( radio_id )
    @browser.element(xpath: "//input[@id = \'#{radio_id}\']/following::label[1]")
  end

  def get_lable_element_from_map ( radio_name )
    @browser.element(xpath: "//input[@id = \'#{@@radio_button_map[radio_name]}\']/following::label[1]")
  end

  def get_random_address_data ()
    address_data = Hash.new
    address_data['company-name'] = generate_random_string()
    address_data['first-name'] = generate_random_string()
    address_data['last-name'] = generate_random_string()
    address_data['street'] = generate_random_string()
    address_data['post-code'] = generate_random_zipcode()
    address_data['city'] = generate_random_string()
    address_data['email'] = generate_random_string() + "@example.com"

    address_data
  end

  def get_donation_amount_element ()
    @browser.element(xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end
end
