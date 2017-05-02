class BoatsController < ApplicationController

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to root_path
    else
      render :new
    end
  end




  private
  # strong params
  def boat_params
    params.require(:boat).permit(:name, :amtcontainers, :location)
  end

end
