module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(Hashtag::HASHTAG_REGEX) { |word| link_to word.downcase, "/hashtags/#{word.downcase.delete('#')}" }.html_safe
  end
end
