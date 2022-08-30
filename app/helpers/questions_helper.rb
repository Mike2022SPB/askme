module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(Hashtag::HASHTAG_REGEX) { |hashtag| link_to hashtag, hashtag_path(hashtag.delete('#').downcase) }.html_safe
  end
end
