# @licence GNU GPL v2+
# @author Leszek Manicki <leszek.manicki@wikimedia.de>

class FrontendContactFormReceiptPage
  include PageObject

  h2(:header, xpath: '//h2[./span[text()=\'Kontakt\']][1]')
  paragraph(:contact_message_sent, xpath: '//main/div[contains(@class, \'container\')]/div[@id=\'greenBox\']/p[1]')
end
