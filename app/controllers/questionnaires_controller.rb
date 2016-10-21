class QuestionnairesController < ApplicationController
  include QuestionnairesHelper
  def index
    @questionnnaires = Survey::Survey.where(survey_type: 'quiz').order(created_at: :desc)
  end

  def new
    @questionnnaire = Survey::Survey.new(survey_type: 'quiz')
  end
end
