# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendCommentPage
  include PageObject

	link(:a_view_comments, :id => 'view-comments-link')

  div(:div_your_story, :id => 'wlightbox-your-story')

  text_area(:text_comment,  :id => 'feedback-message')
  button(:button_publish,  :id => 'publishComment')

	def get_element_by_id ( id )
		@browser.element( id: id )
	end

end


