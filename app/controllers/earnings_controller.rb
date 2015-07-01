class EarningsController < ApplicationController
  def new
    @earning = Earning.new
  end

  def index
    @earnings = current_user.earnings
  end

  def show
  end

  def create
    @earning = Earning.new(earning_params)
    @earning.user = current_user
    if @earning.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @earning = Earning.find(params[:id])
    @earning.destroy
    redirect_to :back
  end

  protected

  def earning_params
    params.require(:earning).permit(:date, :sum, :category, :description)
  end
end
