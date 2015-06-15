# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendDebitPage
  include PageObject

  def donation_amount_element
    element('strong', xpath: '//p[contains(@class,\'title\')]/child::strong[1]')
  end

  def donation_sepa_confirmation_element
    element('section', id: 'donation-sepa-confirmation')
  end
end
