class BoatsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @boats = Boat.all
  end

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

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    if @boat.destroy
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  # strong params
  def boat_params
    params.require(:boat).permit(:name, :amtcontainers, :location)
  end

end
