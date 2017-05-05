class BoatsController < ApplicationController
  # Only logged in users can do things relating to boats ie. make boats, edit boats, delete boats, see boats.
  before_action :authenticate_user!

  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      flash[:notice] = "Boat was created."
      redirect_to boats_path
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
      flash[:notice] = "Boat was updated."
      redirect_to boats_path
    else
      render :edit
    end
  end


  def destroy
    @boat = Boat.find(params[:id])
    if @boat.destroy
      flash[:notice] = "Boat was deleted."
      redirect_to boats_path
    else
      render :edit
    end
  end


  private
  # strong params
  def boat_params
    params.require(:boat).permit(:name, :amtcontainers, :location, :avatar)
  end

end
