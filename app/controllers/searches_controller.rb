class SearchesController < ApplicationController

  def index
    @search = Search.new
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new
    @response = @search.yelp_check(eval(params[:zip]))
    render 'index'
  end

  def show
    @search = Search.find(params[:id])
  end

private
  def search_params
    params.require(:search).permit(:address, :city, :state, :zip)
  end

end
