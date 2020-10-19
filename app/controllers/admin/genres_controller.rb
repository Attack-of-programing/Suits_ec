class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(params[:id])

  end

end
