# @licence GNU GPL v2+
# @author Christoph Fischer

class LoginPage
  include PageObject

  page_url ENV["BACKEND_URL"]

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :value => 'Login')
end
