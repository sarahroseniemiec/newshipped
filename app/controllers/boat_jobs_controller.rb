class BoatJobsController < ApplicationController

  before_action :authenticate_user!

  def create
    @boat = Boat.find(params[:id])
    if BoatJob.exists?(job_id: params[:job_id].to_i, boat_id: params[:id].to_i)
      flash[:notice] = "That boat was already assigned to that job."
      redirect_to job_path(params[:job_id])
    else
      @boat_job = BoatJob.new(
      job_id: params[:job_id].to_i,
      boat_id: params[:id].to_i
      )
      if @boat_job.save
        flash[:notice] = "Boat added to job"
        respond_to do |format|
          format.js
        end
      else
        flash[:alert] = "There was a problem adding the boat"
        redirect_to :back
      end
    end
  end

  def destroy
    @boatjob = BoatJob.where(job_id: params[:job_id].to_i,
    boat_id: params[:id].to_i).first
    @boatjob.destroy
    redirect_to :back
  end

end
