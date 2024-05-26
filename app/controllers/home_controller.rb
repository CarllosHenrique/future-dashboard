# This controller is responsible for rendering the home page.
class HomeController < ApplicationController
  def index
    @contribution = Contribution.new

    @portfolios = Portfolio.all
    @total_value = Portfolio.sum(:applied_value)
    @target_value =  current_user.contributions.sum(:value)
    @remaining_value = @target_value - @total_value
  end
end
