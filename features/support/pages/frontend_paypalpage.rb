
class FrontendPaypalPage
  include PageObject

  div(:div_xpt_content_main, :id => 'xptContentMain')
  span(:span_amount, :id => 'mainTotalAmount')

  in_iframe(:id => 'spenden-portal') do | outer_frame |
    in_iframe({:id => 'micropayment-portal'}, outer_frame) do | inner_frame |
      text_field(:input_holder,  :id => 'holder', frame: inner_frame)
      text_field(:input_card_number,  :id => 'card-number', frame: inner_frame)
      text_field(:input_cvc_code,  :id => 'cvc-code', frame: inner_frame)
    end
  end

end


