class QuestionnairesController < ApplicationController
  before_filter :load_questionnaire, only: [:show, :edit, :update, :destroy]

  def index
    @questionnaires = Survey::Survey.where(survey_type: 'quiz').order(created_at: :desc)
  end

  def new
    @questionnaire = Survey::Survey.new(survey_type: 'quiz')
  end

  def create
    @questionnnaire = Survey::Survey.new(params_whitelist)
      if @questionnnaire.valid? && @questionnnaire.save
      default_redirect
    else
      build_flash(@questionnnaire)
      render :new
    end
  end

  def edit
  end

  def update
    if @questionnaire.update_attributes(params_whitelist)
      default_redirect
    else
      build_flash(@questionnaire)
      render :edit
    end
  end

  def show

  end

  def destroy
    @questionnaire.destroy
    default_redirect
  end

  private

  def default_redirect
    redirect_to questionnaires_list_path, notice: I18n.t("questionnaires_controller.#{action_name}")
  end

  def load_questionnaire
    @questionnaire = Survey::Survey.find(params[:id])
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes << :survey_type)
  end
end
