class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @user = current_user
    unless @user == current_user
      redirect_to root_path, notice: 'Not your account! 😠'
    end
  end
end
