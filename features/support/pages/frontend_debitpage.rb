# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendDebitPage
  include PageObject

  def donation_amount_element
    element('span', css: '#donation-sepa-confirmation .amount-formatted')
  end

  def sepa_confirmation_element
    element('section', id: 'donation-sepa-confirmation')
  end
end
