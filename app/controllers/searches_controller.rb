class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      @results = @search.yelp_check
      respond_to do |format|
        format.js
      end
    else
      render 'new_location_path'
    end
  end

private
  def search_params
    params.require(:search).permit(:name)
  end

end
