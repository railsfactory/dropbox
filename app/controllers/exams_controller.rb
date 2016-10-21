class ExamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_questionnaire, only: [:new, :create]

  def index
    @questionnaire = Survey::Survey.active
  end

  def show
    @attempt = Survey::Attempt.find_by(id: params[:id])
    render :access_error if current_user.id != @attempt.participant_id
  end

  def new
    @participant = current_user

    unless @questionnaire.nil?
      @attempt = @questionnaire.attempts.new
      @attempt.answers.build
    end
  end

  def create
    @attempt = @questionnaire.attempts.new(params_whitelist)
    @attempt.participant = current_user
    if @attempt.valid? && @attempt.save
      correct_options_text = @questionnaire.correct_options.present? ? 'Bellow are the correct answers marked in green' : ''
      redirect_to exam_show_path(@attempt.id), notice: "Thank you for answering #{@questionnaire.name}! #{correct_options_text}"
    else
      helpers.build_flash(@attempt)
      @participant = current_user
      render :new
    end
  end

  def delete_user_attempts
    Survey::Attempt.where(participant_id: params[:user_id], survey_id: params[:questionnaire_id]).destroy_all
    redirect_to new_exams_path(questionnaire_id: params[:questionnaire_id])
  end

  private

  def load_questionnaire
    @questionnaire = Survey::Survey.find_by(id: params[:questionnaire_id])
  end

  def params_whitelist
    if params[:survey_attempt]
      params[:survey_attempt][:answers_attributes] = params[:survey_attempt][:answers_attributes].map { |attrs| { question_id: attrs.first, option_id: attrs.last } }
      params.require(:survey_attempt).permit(Survey::Attempt::AccessibleAttributes)
    end
  end
end
