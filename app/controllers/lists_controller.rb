class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.includes(bookmarks: :movie).all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
    @bookmark = @list.bookmarks.build
  end

  def create
    @list = List.new(list_params)
    if @list.save
      params[:list][:movie_ids].each do |movie_id|
        @list.bookmarks.create(movie_id: movie_id)
      end
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    if @list.update(list_params)
      @list.bookmarks.where.not(movie_id: params[:list][:movie_ids]).destroy_all
      params[:list][:movie_ids].each do |movie_id|
        @list.bookmarks.find_or_create_by(movie_id: movie_id)
      end
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end
  

  def destroy
    @list = List.find(params[:id])
    @list.bookmarks.destroy_all
    @list.destroy
    redirect_to lists_path, notice: 'List and associated bookmarks were successfully deleted.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end


  def list_params
    params.require(:list).permit(:name, movie_ids: [])
  end
  
end