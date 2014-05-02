class LocationsController < ApplicationController

  def index

    @locations = Location.all
    @results = @locations.where(:zip => params[:zip])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice]="New location created."
      redirect_to location_path(@location)
    else
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js { render 'show.html.erb' }
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      flash[:notice]="Location updated."
      redirect_to location_path(@location)
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:notice] = "Location has been removed."
    redirect_to locations_path
  end

private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :zip,
                                    :start_time, :end_time, :description, :url)
  end
end
