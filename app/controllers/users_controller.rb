# Description: Controller for User model
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
    authorize @users
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)

    authorize @user
    if @user.save
      redirect_to users_path, notice: t('action.success.created', model: @user.name)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params.except(:role))
      @user.role_add(user_params[:role])
      redirect_to users_path, notice: t('action.success.updated', model: @user.name)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, notice: t('action.success.deleted', model: @user.name)
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to users_path
  end

  def user_params
    return unless params && params[:user]

    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end

    params.require(:user).permit(:name, :slug, :email, :password, :birthdate, :phone, :role)
  end
end
