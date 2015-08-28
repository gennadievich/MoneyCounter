class SearchController < ApplicationController

  def searchspendings
    input = params[:input]

    @spendings = current_user.spendings.where('category like :term or description like :term', {term: "%#{input}%"})

    respond_to do |format|
      format.json do
        result = []

        @spendings.each do |spending|
          result << {date: spending.date, category: spending.category, sum: spending.sum, description: spending.description, user_id: spending.user.id, id: spending.id}
        end

        render json: result.to_json
      end
    end
  end

end
