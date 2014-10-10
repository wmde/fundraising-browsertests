# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendPaypalPage
  include PageObject

  div(:div_xpt_content_main, :id => 'xptContentMain')
  span(:span_amount, :id => 'mainTotalAmount')

  text_field(:input_login_email, :id => 'login_email')
  text_field(:input_login_password, :id => 'login_password')
  button(:button_login, :id => 'login.x')

  button(:button_continue, :id => 'continue')

end


