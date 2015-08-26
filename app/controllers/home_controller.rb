class HomeController < ApplicationController
  def index
    if current_user
    @total_earnings = current_user.earnings.sum(:sum)
    @total_spendings = current_user.spendings.sum(:sum)
    @balance = @total_earnings - @total_spendings
    end
  end

  def homepartial
    if current_user
      @total_earnings = current_user.earnings.sum(:sum)
      @total_spendings = current_user.spendings.sum(:sum)
      @balance = @total_earnings - @total_spendings
    end

    render partial: 'home/homepage'
  end
end
