class TmdbController < ApplicationController
  respond_to :json

  def search
    @search = Tmdb::Search.new
    @search.resource('movie')
    @search.query(params[:query])
    results = @search.fetch.map do |result|
      movie = Movie.fromTMDB(result.id)
      movie
    end

    render json: results
  end
end