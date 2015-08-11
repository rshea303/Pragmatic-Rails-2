class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_movie

  def create
    @movie.favorites.create!(user: current_user) 
    #or @movie.fans << current_user
    
    redirect_to @movie, notice: "Thanks for fav'ing!"
  end

  def destroy
    fave = current_user.favorites.find(params[:id])
    fave.destroy

    redirect_to @movie, notice: "Sorry you unfaved it!"
  end
 
  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id])
  end
end
