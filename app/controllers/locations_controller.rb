class LocationsController < ApplicationController
  
  def index
    # @location1 = Location.last
    # @location2 = Location.find(124)
    @locations = Location.all #[@location1, @location2]

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      if location.latitude != nil && location.longitude != nil
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow location.info_window_link
      end
    end
  end

  def new
    @current_org = params[:org]
    @location = Location.new
    @organisations = Organisation.all 
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to '/users'
    else
      render 'new'
    end
  end

  def all
    locations = Location.all
    render json: locations
  end

  def show
  	@location = Location.find(params[:id])
  end

  def edit
  	@location = Location.find(params[:id])
  end

  def update
  	@location = Location.find(params[:id])
    
    if @location.update(location_params)
      redirect_to '/users'
    else
      render 'edit'
    end
  end

  private
  def location_params
    params.require(:location).permit(:name, :street_address, :city, :state, :zip_code, :phone, :organisation_id)
  end

end