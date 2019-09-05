class AttractionsController < ApplicationController
  
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @ride = Ride.new
  end

  def new
    admin_users_only do 
      @attraction = Attraction.new
      render :new
    end
  end

  def create
    admin_users_only do 
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    end
  end

  def edit
    admin_users_only do 
      @attraction = Attraction.find_by_id(params[:id])
      render :edit
    end
  end

  def update
    admin_users_only do 
      @attraction = Attraction.find_by_id(params[:id])
      @attraction.update(attraction_params)
      flash[:notify] = "#{@attraction.name} has been updated"
      redirect_to attraction_path(@attraction)
    end
  end

private 

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end 

  def admin_users_only
    if current_user.admin
      yield
    else
      flash[:notify] = "You do not have permission to do this"
      redirect_to user_path(current_user)
    end
  end
end
