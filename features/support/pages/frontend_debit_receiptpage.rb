# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendDebitReceiptPage
  include PageObject

  checkbox(:checkbox_confirm_sepa,  :id => 'confirm_sepa')
  checkbox(:checkbox_confirm_shortterm,  :id => 'confirm_shortterm')

  def get_label_element_to_radio ( radio_id )
    @browser.element(xpath: compose_label_xpath_for_radio( radio_id ))
  end
end