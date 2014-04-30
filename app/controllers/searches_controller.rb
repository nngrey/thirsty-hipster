class SearchesController < ApplicationController

  def index
    @search = Search.new
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      @results = Search.yelp_check
      redirect_to searches_path
    else
      render 'new'
    end
  end

private
  def search_params
    params.require(:search).permit(:address, :city, :state, :zip)
  end

end
