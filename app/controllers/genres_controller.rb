class GenresController < ApplicationController
  
  def show
    @genre=Genre.find(params[:id])
    @posts=@genre.posts.order("created_at DESC")
  end
  
  def index
    @new_genre=Genre.new
    @genres=Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    flash[:notice] ="You have created book successfully."
    redirect_to genres_path
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
