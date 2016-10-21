module ExamsHelper

  def attempt_scope(resource)
    if action_name =~ /new|create/
     create_exam_path(resource)
    elsif action_name =~ /edit|update/
      update_exam_path(resource)
    end
  end

  def get_answer_fields attempt
    attempt.survey.questions.map { |q| Survey::Answer.new(question_id: q.id) }
  end

  def the_chosen_one? answer, option
    if answer.option_id == option.id then 'chosen' else nil end
  end

  def get_color_of_option answer, option
    if is_quiz?(answer.question.survey.survey_type)
      if option.correct
        'bg-success'
      elsif the_chosen_one?(answer, option)
        'bg-danger'
      end
    elsif is_score?(answer.question.survey.survey_type)
      get_weight_html_class option
    end
  end

  def is_quiz? something
    something == 0 || something == 'quiz'
  end

  def get_weight option
    return unless is_score?(option.question.survey.survey_type)
    option.weight > 0 ? "(+#{option.weight})" : "(#{option.weight})"
  end

  def number_of_people_who_also_answered option_id
    count = number_of_people_who_also_answered_count(option_id)
    "<span class='number'> #{count} </span> #{'answer'.pluralize}".html_safe
  end
end
