# @licence GNU GPL v2+
# @author Leszek Manicki <leszek.manicki@wikimedia.de>

class FrontendContactFormPage
  include PageObject

  page_url ENV['FRONTEND_URL'] + 'spenden/Kontaktformular'

  text_field(:input_first_name, name: 'Vorname')
  text_field(:input_last_name, name: 'Nachname')
  text_field(:input_email, name: 'email')
  text_field(:input_subject, name: 'Betreff')
  text_area(:text_message, id: 'kommentar')

  button(:button_submit, name: 'go_contact')

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

end
