class GenresController < ApplicationController

  def show
    genre = Genre.find(params[:id]) 
    @posts = genre.posts
    @genres = Genre.all
    @name = genre.name
  end

end
