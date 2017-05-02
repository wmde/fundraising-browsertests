# @licence GNU GPL v2+
# @author Leszek Manicki <leszek.manicki@wikimedia.de>

class FrontendContactFormPage
  include PageObject

  page_url ENV['FRONTEND_URL'] + 'contact/get-in-touch'

  text_field(:input_first_name, id: 'first-name')
  text_field(:input_last_name, id: 'last-name')
  text_field(:input_email, id: 'email')
  text_field(:input_subject, id: 'subject')
  text_area(:text_message, id: 'messageBody')

  button(:button_submit, id: 'contactFormSubmit')

  div(:error, class: 'errorbox')

  def random_form_data
    form_data = {}
    form_data['first-name'] = generate_random_string
    form_data['last-name'] = generate_random_string
    form_data['email'] = generate_random_string + '@example.com'
    form_data['subject'] = generate_random_string
    form_data['message'] = generate_random_string(100)

    form_data
  end

  def error_for_field(field_id)
    field_id = 'messageBody' if field_id == 'message'
    element(:span, css: '#' + field_id + ' ~ .form-error')
  end

end
