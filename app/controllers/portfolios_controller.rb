# The controller for the portfolio page
class PortfoliosController < ApplicationController
  def show
    @portfolio = Portfolio.first
  end
end
