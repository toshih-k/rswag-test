class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(params.require(:user).permit(User.column_names))
    if user.save
      render json: {success: true, user: user}
    else
      render json: {success: false, errors: user.errors.full_messages}
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(params.require(:user).permit(User.column_names))
      render json: {success: true, user: user}
    else
      render json: {success: false, errors: user.errors.full_messages}
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {success: true, user: user}
    else
      render json: {success: false, errors: user.errors.full_messages}
    end
  end
end
