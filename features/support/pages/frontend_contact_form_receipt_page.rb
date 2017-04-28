# @licence GNU GPL v2+
# @author Leszek Manicki <leszek.manicki@wikimedia.de>

class FrontendContactFormReceiptPage
  include PageObject

  span(:header, css: '.box-header span')
  div(:contact_message_sent, css: '.sandboxedcontent.contact_confirmation')
end
