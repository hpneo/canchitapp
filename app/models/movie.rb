class Movie < ActiveRecord::Base
  has_many :checkins

  def self.fromTMDB(api_id)
    movie = Movie.where(api_id: api_id.to_s).first

    if movie.nil?
      tmdb_movie = Tmdb::Movie.detail(api_id.to_i)
      movie = Movie.new

      crew = Tmdb::Movie.crew(tmdb_movie.id)
      cast = Tmdb::Movie.casts(tmdb_movie.id)

      movie.title = tmdb_movie.original_title
      movie.year = tmdb_movie.release_date.to_s.split('-').first
      movie.poster_path = tmdb_movie.poster_path
      movie.api_id = tmdb_movie.id
      movie.overview = tmdb_movie.overview
      movie.director = crew.first.name if crew.first
      movie.cast = cast.map(&:name).join("\n")
    end

    movie
  end
end
