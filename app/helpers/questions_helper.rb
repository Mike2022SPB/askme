module QuestionsHelper

  def render_with_hashtags(body)
    body.gsub(Tag::HASHTAG_REGEX) { |word| link_to word.downcase, "/questions/hashtag/#{word.delete('#')}" }.html_safe
  end
end
