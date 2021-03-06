# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

class FrontendCommentPage
  include PageObject

  link(:a_view_comments, id: 'view-comments-link')

  div(:div_your_story, id: 'wlightbox-your-story')
  div(:div_positiv_feedback, css: '#feedback .message.success')

  text_area(:text_comment, id: 'feedback-message')
  button(:button_publish, id: 'publishComment')
end
