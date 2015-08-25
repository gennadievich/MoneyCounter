class SessionsController < ApplicationController
  def index
  end


  def create
    @user = User.find_by_email(params[:email])

    respond_to do |format|

      if @user && @user.authenticate(params[:password])
        login(@user)
        format.json do
          render json: {message: 'Welcome back :)'}.to_json
        end
        format.html do
          redirect_to root_path, flash: {success: "Welcome back :)"}
        end
      else
        format.json { render text: 'Check your data', status: 500}
        format.html do
          flash.now[:warning] = 'Check your data'
          render :index
        end
      end
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
