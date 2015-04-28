# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>
#
# page object for the wikipedia.de banner with form

module BannerForm
  include PageObject

  text_field(:input_amount, xpath: "//input[@id = 'amount_other']/following::input[1]")

  button(:button_debit, id: 'btnDirectDebit')
  button(:button_deposit, id: 'btnTransfer')
  button(:button_credit, id: 'btnCreditCard')
  button(:button_paypal, id: 'btnPayPal')

  def click_banner_amount(amount)
    @browser.element(xpath: "//input[@id = \'#{amount}\']").click
  end
end
