# The ContributionsController is responsible for handling the creation of new contributions and displaying all conttr
class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.all
  end

  def new
    @contribution = Contribution.new
  end

  def approve
    @contribution = Contribution.find(params[:id])
    @contribution.update(status: true)
    @contribution.user.update(participation: @contribution.user.user_participation)
    redirect_to contributions_path
  end

  def approve_all
    Contribution.all.each do |contribution|
      contribution.update(status: true)
      contribution.user.update(participation: contribution.user.user_participation)
    end
    redirect_to contributions_path
  end

  def create
    @contribution = current_user.contributions.build(contribution_params)
    @contribution.portfolio_id = current_user.portfolio_id

    if @contribution.save
      if @contribution.status.eql?(true)
        @contribution.update_portfolio_applied_value
        redirect_to contributions_path
      else
        flash[:notice] = t('contribution.successfully_created')
        flash[:alert] = t('contribution.waiting_approval')
        redirect_to root_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:value, :user_id, :portfolio_id, :status)
  end
end
