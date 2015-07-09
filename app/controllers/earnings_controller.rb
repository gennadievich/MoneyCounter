class EarningsController < ApplicationController
  def new
    @earning = Earning.new
  end

  def index
    @earnings = current_user.earnings.order('date desc')
  end

  def edit
    @earning = Earning.find(params[:id])
  end

  def update
    @earning = Earning.find(params[:id])

    if @earning.update(earning_params)
      redirect_to user_earnings_path(current_user)
    else
      render :edit
    end

  end

  def show
    @earning = Earning.find(params[:id])
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
    redirect_to user_earnings_path
  end

  protected

  def earning_params
    params.require(:earning).permit(:date, :sum, :category, :description)
  end
end
