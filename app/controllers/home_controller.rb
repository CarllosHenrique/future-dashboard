# This controller is responsible for rendering the home page.
class HomeController < ApplicationController
  def index
    authorize :home, :index?

    @contribution = Contribution.new
  end
end
