require 'open-uri'
class CurrencyController < ApplicationController
  def getcurrency
    site = Nokogiri::HTML(open("http://www.nbrb.by/statistics/Rates/RatesDaily.asp"))
    @dollar_str = site.css('tr:nth-child(6) > td:nth-child(3)').to_s
    @dollar = @dollar_str.gsub!(/\D/, "")[0..@dollar_str.length-3].to_i

    respond_to do |format|
      format.json do
        render json: {message: "#{@dollar}"}.to_json
      end

      format.html do

      end
    end
  end
end
