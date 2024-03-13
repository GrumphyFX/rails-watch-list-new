# app/controllers/bookmarks_controller.rb
class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movie = Movie.find_or_initialize_by(tmdb_id: params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find_or_initialize_by(tmdb_id: params[:movie_id])
    @movie.update(movie_params)
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  # ...

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_path, :vote_average)
  end
end