module ApplicationHelper

  def build_flash model
    if model.errors.count > 0
      flash.now[:alert] = model.errors.full_messages.join('<br/>').html_safe
    end
  end

  private

  def number_of_people_who_also_answered_count option_id
    Survey::Answer.where(option_id: option_id).count
  end
end
