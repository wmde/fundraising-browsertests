# @licence GNU GPL v2+
# @author Christoph Fischer

class BackendPage
  include PageObject

  a(:username_link, :css => 'div#userInfo > a:nth-child(1)')
  a(:logout_link, :css => 'div#userInfo > a:nth-child(2)')
end
