class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
    @bookmark = Bookmark.new
  end

  def create
    list = List.new(list_params)

    if list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    @movies = @list.movies
    @bookmark = Bookmark.new
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :show
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
