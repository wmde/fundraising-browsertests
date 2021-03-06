# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class WikipediaDeFrontPage
  include PageObject
  include FrontendAddressForm
  include FrontendRadioMap
  include BannerForm

  page_url ENV['WPDE_URL']

  form(:form_donation, id: 'donationForm')

  button(:button_continue, id: 'continueFormSubmit')
  button(:button_done, id: 'donFormSubmit')

  label(:label_private, xpath: compose_label_xpath_for_radio('address-type-1'))
  label(:label_anonymous, xpath: compose_label_xpath_for_radio('address-type-3'))
  label(:label_iban, xpath: compose_label_xpath_for_radio('debit-type-1'))

  text_field(:input_iban, id: 'iban')
  text_field(:input_bic, id: 'bic')
  text_field(:input_account_number, id: 'account-number')
  text_field(:input_bank_code, id: 'bank-code')

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

  def donation_amount_element
    element('strong', xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end

  def switch_to_popup
    browser.wd.switch_to.window browser.wd.window_handles.last
  end

  def switch_to_testmode
    execute_script("$('#donForm').attr('action', 'fundraising/proxy.php?page=L10h16&skin=10h16&piwik_campaign=wpde_141118&piwik_kwd=wpde-141118-ffb&browsertest=true')")
  end
end
