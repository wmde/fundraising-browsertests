# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendCreditPage
  include PageObject

  in_iframe({ id: 'micropayment-portal' }) do |mcp_frame|
    text_field(:input_holder, id: 'holder', frame: mcp_frame)
    text_field(:input_card_number, id: 'card-number', frame: mcp_frame)
    text_field(:input_cvc_code, id: 'cvc-code', frame: mcp_frame)
  end
end
