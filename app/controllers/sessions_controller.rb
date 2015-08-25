class SessionsController < ApplicationController
  def index
  end


  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path, flash: {success: "Welcome back :)"}
    else
      flash.now[:warning] = 'Check your data'
      render :index
    end

  end

  def destroy
    logout
    redirect_to root_path
  end
end
