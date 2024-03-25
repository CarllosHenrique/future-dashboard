# This controller is responsible for rendering the home page.
class HomeController < ApplicationController
  def index
    @portfolio = Portfolio.first
  end
end
