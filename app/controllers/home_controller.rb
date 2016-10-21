class HomeController < ApplicationController
  def history
    @versions = PaperTrail::Version.where(whodunnit: current_user.id).order('created_at DESC') if user_signed_in?
  end
end
