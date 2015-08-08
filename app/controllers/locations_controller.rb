class LocationsController < ApplicationController

  def index
    # @ip = request.ip
    @ip = '97201'
    @zip = params[:zip] ? params[:zip] : @ip
    @locations = Location.all
    @results = @locations.where(:zip => @zip)
    @pins = @results.map{|r| [r.name, r['latitude'], r['longitude']]}
  end

  def new
    @location = Location.new
  end

  def create

    params[:location].parse_time_select! :start_time
    params[:location].parse_time_select! :end_time

    @location = Location.new(location_params)
    # WIP: geocode!(params[:display_address])
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
    @sequence = @location.day_sequence(@location)
    respond_to do |format|
      format.html
      format.js { render 'show.html.erb' }
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    params[:location].parse_time_select! :start_time
    params[:location].parse_time_select! :end_time

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
    params.require(:location).permit(
      :name, :address, :city, :state, :zip, :phone, :display_address,
      :start_time, :end_time, :description, :url,
      :sunday, :monday, :tuesday, :wednesday,
      :thursday, :friday, :saturday, :latitude, :longitude
    )
  end
end
