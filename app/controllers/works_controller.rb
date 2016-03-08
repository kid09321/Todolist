class WorksController < ApplicationController
  def index
    @incomplete_works = Work.where(is_complete: 0)
    @completed_works = Work.where(is_complete: 1)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end
  def edit
    @work = Work.find(params[:id])
  end
  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path
    end
  end

  def show
    @work = Work.find(params[:id])
  end
  def to_completed
    @work = Work.find(params[:id])
    @work.to_completed!
    redirect_to works_path
  end

  def to_incomplete
    @work = Work.find(params[:id])
    @work.to_incomplete!
    redirect_to works_path
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path
  end
  private

  def work_params
    params.require(:work).permit(:title, :description)
  end
end
