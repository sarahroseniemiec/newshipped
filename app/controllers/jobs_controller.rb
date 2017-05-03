class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end



  private
  # strong params
  def job_params
    params.require(:job).permit(:description, :origin, :destination, :cost, :amtcontainers, :name)
  end

end
