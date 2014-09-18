# @licence GNU GPL v2+
# @author Christoph Fischer

class FrontendReceiptPage
  include PageObject

  #page_url "#{ENV["FRONTEND_URL"]}"

  #TODO id in template
  paragraph(:div_donation_sheet, :xpath => '//*[@id=\'donation-sheet\']/descendant::p[1]')

  div(:div_personal_data_sheet, :id => 'personal-data')

  link(:a_become_member, :id => 'become-member-button')

  text_field(:input_company_name,  :id => 'company-name')

  text_field(:input_first_name,  :id => 'first-name')
  text_field(:input_last_name,  :id => 'last-name')
  text_field(:input_street,  :id => 'street')
  text_field(:input_post_code,  :id => 'post-code')
  text_field(:input_city,  :id => 'city')
  text_field(:input_email,  :id => 'email')

  span(:span_confirm_name,  :id => 'confirm-name')
  span(:span_confirm_mail,  :id => 'confirm-mail')

  span(:span_confirm_account,  :id => 'confirm-account-number')
  span(:span_confirm_bic,  :id => 'confirm-bic')

  def get_donation_amount_element ()
    #TODO id in template
    @browser.element(xpath: '//span[contains(@class,\'icon-ok-sign\')]/child::strong[1]')
  end
end


