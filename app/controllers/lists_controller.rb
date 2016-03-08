class ListsController < ApplicationController


  def new
    @work = Work.find(params[:work_id])
    @list = @work.lists.new
  end

  def create
    @work = Work.find(params[:work_id])
    @list = @work.lists.build(list_params)

    if @list.save
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def destroy
    @work = Work.find(params[:work_id])
    @list = @work.lists.find(params[:id])
    @list.destroy
    redirect_to work_path(@work)
  end
  private

  def list_params
    params.require(:list).permit(:thing)
  end
end
