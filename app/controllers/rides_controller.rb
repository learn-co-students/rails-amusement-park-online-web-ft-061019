class RidesController < ApplicationController
  
  def create
    @ride = Ride.create(ride_params)
    @attraction = Attraction.find_by_id(params[:ride][:attraction_id])
    result = @ride.take_ride

    if result.class == String
      #This means there were errors and the ride was not taken
      flash[:notify] = result
      redirect_to user_path(@ride.user_id)
    else
      flash[:notify] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@ride.user_id)
    end
  end

private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
