class SearchesController < ApplicationController

  def index
    @search = Search.new
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new
    if params[:name] == "" || params[:zip] == "" 
      flash[:alert] = "Please enter a valid name and city or zip."
    end
    @response = @search.yelp_check(params[:name], params[:zip])
    render 'index'
  end

  def show
    @search = Search.find(params[:id])
  end

private
  def search_params
    params.require(:search).permit(:address, :city, :state, :zip, :phone, :display_address)
  end

end
