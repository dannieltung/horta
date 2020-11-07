class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, notice: 'Not your account! 😠'
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, notice: 'Not your account! 😠'
    end
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Info updated!👍'
    else
      render :show
    end
  end

  def reset_password
    @user = User.find(params[:id]).reset_password(password, password)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :delivery_address, :photo)
  end
end
