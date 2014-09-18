
class FrontendDebitReceiptPage
  include PageObject

  #page_url "#{ENV["FRONTEND_URL"]}"

  checkbox(:checkbox_confirm_sepa,  :id => 'confirm_sepa')
  checkbox(:checkbox_confirm_shortterm,  :id => 'confirm_shortterm')

  def get_label_element_to_radio ( radio_id )
    @browser.element(xpath: "//input[@id = \'#{radio_id}\']/following::label[1]")
  end

end