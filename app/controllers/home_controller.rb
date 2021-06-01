class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_6ec2e624bf2b4acabb637ff52176e428')
    # StockQuote::Stock.new(api_key: 'pk_6ec2e624bf2b4acabb637ff52176e428')
    
    if params[:ticker] == ""
      @nothing = "Don't forget enter the symbol!"
    elsif params[:ticker]
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
        @logo = StockQuote::Stock.logo(params[:ticker])
      rescue StandardError
        @nothing = "Please check the symbol you enter!"
      end
    end
  end

  def about
  end
end
