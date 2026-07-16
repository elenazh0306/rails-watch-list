class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :edit, :update]

  def index
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :edit, status: 422
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end


  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
