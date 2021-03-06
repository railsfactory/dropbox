module QuestionnairesHelper

  def questionnaire_path(resource)
    if action_name =~ /new|create/
      create_questionnaire_path(resource)
    elsif action_name =~ /edit|update/
      update_questionnaire_path(resource)
    end
  end

  def is_score? something
    something == 1 || something == 'score'
  end

  def number_of_questions survey
    survey.questions.count
  end

  def number_of_attempts survey
    survey.attempts.count
  end

  def link_to_remove_field(name, f)
    f.hidden_field(:_destroy) +
    __link_to_function(raw(name), "removeField(this)", :id =>"remove-attach", class: 'btn btn-default')
  end

  def link_to_add_field(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,:child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    __link_to_function(name, "addField(this, \"#{association}\", \"#{escape_javascript(fields)}\")",
    :id=>"add-attach",
    :class=>"btn btn-default")
  end

  private

  def __link_to_function(name, on_click_event, opts={})
    link_to(name, 'javascript:;', opts.merge(onclick: on_click_event))
  end

  def has_weights? survey
    survey.questions.map(&:options).flatten.any? { |o| o.weight != 0 }
  end
end
