# This controller is responsible for rendering the home page.
class HomeController < ApplicationController
  def index
    @contribution = Contribution.new
  end
end
