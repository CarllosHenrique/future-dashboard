# The ContributionsController is responsible for handling the creation of new contributions and displaying all conttr
class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.all
  end

  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:value).merge(portfolio_id: Portfolio.first.id)
  end
end
