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

    if @user.authenticate(params[:user][:old_password])

      if @user.update(user_params)
        redirect_to user_path(current_user)
      else
        redirect_to :back
      end
    end

  end

  def create
    respond_to do |format|
      @user = User.new(user_params)

      if @user.save
        login(@user)

        format.json do
          render json: {message: 'You successfully registered!'}.to_json
        end
        format.html do
          redirect_to root_path, flash: { success: "You successfully registered!" }
        end

      else
        user_errors = ""
        format.json do
          @user.errors.full_messages.each do |msg|
            user_errors << (msg + '<br>')
          end
          render text: "#{user_errors}"
        end
        format.html { render :new }
      end
    end
  end





  def become_an_admin
    @user = current_user
    @user.role = 'admin'
    @user.save
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
