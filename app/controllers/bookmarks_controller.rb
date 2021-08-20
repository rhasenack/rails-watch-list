class BookmarksController < ApplicationController



  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    bookmark = Bookmark.new(bookmark_params)
    bookmark.list_id = params[:list_id]
    @list = List.find(params[:list_id])
    if bookmark.save
      redirect_to controller: 'lists', action: 'show', id: params[:list_id]
    else
      redirect_to controller: 'lists', action: 'show', id: params[:list_id]
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
