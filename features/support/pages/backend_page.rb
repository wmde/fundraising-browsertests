
class BackendPage
  include PageObject

  a(:username_link, :css => 'div#userInfo > a:nth-child(1)')
  a(:logout_link, :css => 'div#userInfo > a:nth-child(2)')
end
