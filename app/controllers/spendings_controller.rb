class SpendingsController < ApplicationController
  def new
    @spending = Spending.new
  end

  def index
    @spendings = current_user.spendings.order('date desc')
  end

  def show
    @spending = Spending.find(params[:id])
  end

  def edit
    @spending = Spending.find(params[:id])
  end

  def update
    @spending = Spending.find(params[:id])

    if @spending.update(spending_params)
      redirect_to user_spendings_path(current_user)
    else
      render :edit
    end

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
    redirect_to user_spendings_path
  end

  protected

  def spending_params
    params.require(:spending).permit(:date, :sum, :category, :description)
  end
end
