class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, notice: 'Not your account! 😠'
    end
  end
end
