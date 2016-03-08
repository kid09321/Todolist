class ListsController < ApplicationController

  before_action :find_work

  def new
    @list = @work.lists.new
  end

  def create
    @list = @work.lists.build(list_params)

    if @list.save
      redirect_to work_path(@work), notice: "新增細節成功"
    else
      redirect_to work_path(@work), alert: "請輸入事項"
    end
  end

  def edit
    @list = @work.lists.find(params[:id])
  end

  def update
    @list = @work.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to work_path(@work), warning: "修改細節成功"
    else
      redirect_to work_path(@work), alert: "請輸入細節"
    end
  end

  def destroy
    @list = @work.lists.find(params[:id])
    @list.destroy
    redirect_to work_path(@work), alert: "刪除細節成功"
  end

  def to_completed
    @list = @work.lists.find(params[:id])
    @list.to_completed!
    redirect_to work_path(@work)
  end

  def to_incomplete
    @list = @work.lists.find(params[:id])
    @list.to_incomplete!
    redirect_to work_path(@work)
  end
  private

  def list_params
    params.require(:list).permit(:thing)
  end

  def find_work
    @work = Work.find(params[:work_id])
  end
end
