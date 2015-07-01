class SpendingsController < ApplicationController
  def new
    @spending = Spending.new
  end

  def index
    @spendings = current_user.spendings
  end

  def show
  end

  def create
    @spending = Spending.new(spending_params)
    @spending.user = current_user
    if @spending.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @spending = Spending.find(params[:id])
    @spending.destroy
    redirect_to :back
  end

  protected

  def spending_params
    params.require(:spending).permit(:date, :sum, :category, :description)
  end
end
