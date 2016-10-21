class HomeController < ApplicationController
  def history
    @versions = PaperTrail::Version.order('created_at DESC')
  end
end