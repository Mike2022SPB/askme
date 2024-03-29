class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)
    @question.author = current_user
    @user = User.find(question_params[:user_id])

    if @question.save
      redirect_to user_path(@question.user), notice: "Your new question has been created."
    else
      redirect_to user_path(@question.user), notice: "The question is not correct."
    end
  end

  def update
    questions_params = params.require(:question).permit(:body, :answer)

    @question.update(questions_params)

    redirect_to user_path(@question.user), notice: "Your new question has been updated."
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: "The question has been deleted."
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).last(10)
    @users = User.order(created_at: :desc).last(10)
    @hashtags = Hashtag.all
  end

  def new
    @user = User.find_by!(nickname: params[:nickname])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.update(hidden: true)

    redirect_to user_path(@question.user), notice: "The question was hid."
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
