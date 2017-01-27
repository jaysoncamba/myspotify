class RootController < ApplicationController

  def home
    ArtistFinder.find(artist_params.fetch(:name))
  end

  private
  def artist_params
    params.permit(:name)
  end

end
