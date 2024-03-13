class MoviesController < ApplicationController
  def index
    url = "https://api.themoviedb.org/3/movie/popular?api_key=#{TMDB_API_KEY}"
    response = HTTParty.get(url)
    if response.code == 200
      @movies = JSON.parse(response.body)['results']
    else
      flash[:alert] = 'Failed to fetch movies from the API.'
      @movies = []
    end
  end
end
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
end