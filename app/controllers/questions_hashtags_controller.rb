class QuestionsHashtagsController < ApplicationController
  before_action :set_hashtag

  def show
    @questions = @hashtag.questions
  end

  def index
    @hashtags = Hashtag.all
  end

  private

  def set_hashtag
    @hashtag = Hashtag.find_by(name: params[:name])
  end
end
