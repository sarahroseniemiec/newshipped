class JobsController < ApplicationController
  # Only logged in users can do things relating to jobs ie. make jobs, edit jobs, delete jobs, see jobs.
  before_action :authenticate_user!

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @boats = Boat.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Job was created."
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Job was updated."
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      flash[:notice] = "Job was deleted."
      redirect_to jobs_path
    else
      render :edit
    end
  end

  private
  # strong params
  def job_params
    params.require(:job).permit(:description, :origin, :destination, :cost, :amtcontainers, :name)
  end

end
