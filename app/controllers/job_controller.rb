class JobController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(post_params)
    if @job.save
      flash[:notice] = "Job has been created."
      redirect_to @job
    else
      flash[:alert] = "Job has not been created."
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
