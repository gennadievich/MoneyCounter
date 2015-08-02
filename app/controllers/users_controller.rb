class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to :back
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_path
    else
      render :new
    end

  end

  protected

  def chng_pass_params
    params.require(:user).permit(:old_password, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
