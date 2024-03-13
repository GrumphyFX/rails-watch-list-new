class MoviesController < ApplicationController
#   def index
#     url = URI('http://tmdb.lewagon.com/movie/top_rated')
#     http = Net::HTTP.new(url.host, url.port)
#     request = Net::HTTP::Get.new(url)
#     response = http.request(request)
#     puts response.body
#     if response.code == '200'
#       @movies = JSON.parse(response.body)['results']
#     else
#       flash[:alert] = 'Failed to fetch movies from the API.'
#       @movies = []
#     end
#   end
# end
  
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