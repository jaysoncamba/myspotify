class RootController < ApplicationController

  def home
    response = ArtistFinder.find(artist_params.fetch(:name))
    render json: response
  end

  private
  def artist_params
    params.permit(:name)
  end

end
