# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

module FrontendAddressForm
	include PageObject

	text_field(:input_company_name,  :id => 'company-name')
	text_field(:input_first_name,  :id => 'first-name')
	text_field(:input_last_name,  :id => 'last-name')
	text_field(:input_street,  :id => 'street')
	text_field(:input_post_code,  :id => 'post-code')
	text_field(:input_city,  :id => 'city')
	text_field(:input_email,  :id => 'email')
end