class CheckinsController < ApplicationController
  def create
    movie = Movie.fromTMDB(params[:api_id])
    movie.save

    checkin = Checkin.new
    checkin.user = current_user
    checkin.movie = movie

    if checkin.save
      comment = params[:comment]
      link = "https://www.themoviedb.org/movie/#{movie.api_id}"

      if params[:share_facebook] == 'true'
        graph = Koala::Facebook::API.new(current_user.facebook_token)
        graph.put_connections('me', 'feed', {
          message: comment,
          link: link,
          picture: @tmdb_configuration[:base_url] + @tmdb_configuration[:poster_sizes].last + movie.poster_path,
          name: movie.title,
          caption: movie.year,
          description: movie.overview
        })
      end

      if params[:share_twitter] == 'true'
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = "IO0mSObd1KnbSOkZXBvGchomD"
          config.consumer_secret     = "JiCrmSCOp0AR2m0zIjoY8Cq1STTbcjEPupMdpOkEihmHViQ5Lh"
          config.access_token        = current_user.twitter_token
          config.access_token_secret = current_user.twitter_secret
        end

        client.update("#{comment} (#{link})")
      end
    end

    render json: checkin
  end
end
