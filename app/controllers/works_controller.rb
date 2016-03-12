class WorksController < ApplicationController

  before_action :authenticate_user!
  def index
    @incomplete_works = current_user.works.where(is_complete: false).order("deadline DESC")
    @completed_works = current_user.works.where(is_complete: true)
  end

  def new
    @work = Work.new
  end

  def create
    @work = current_user.works.build(work_params)

    if @work.save
      redirect_to work_path(@work), notice: "新增事項成功"
    else
      redirect_to works_path, alert: "請輸入事項"
    end
  end
  def edit
    @work = current_user.works.find(params[:id])
  end
  def update
    @work = current_user.works.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path, notice: "修改事項成功"
    end
  end

  def show
    @work = current_user.works.find(params[:id])
    @incomplete_lists = @work.lists.where(is_complete: false)
    @completed_lists = @work.lists.where(is_complete: true)
  end
  def to_completed
    @work = current_user.works.find(params[:id])
    @work.to_completed!
    redirect_to works_path
  end

  def to_incomplete
    @work = current_user.works.find(params[:id])
    @work.to_incomplete!
    redirect_to works_path
  end

  def destroy
    @work = current_user.works.find(params[:id])
    @work.destroy
    redirect_to works_path, alert: "刪除事項成功"
  end
  private

  def work_params
    params.require(:work).permit(:title, :description, :deadline)
  end
end
