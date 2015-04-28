# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendDebitPage
  include PageObject

  def get_donation_amount_element
    @browser.element(xpath: '//p[contains(@class,\'title\')]/child::strong[1]')
  end

  def get_donation_sepa_confirmation_element
    @browser.element(id: 'donation-sepa-confirmation')
  end
end
