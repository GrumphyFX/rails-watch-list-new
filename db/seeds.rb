require 'open-uri'
require 'json'

puts "Cleaning database..."
Movie.destroy_all

puts "Fetching movies from API..."

url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts "Creating movies..."

movies['results'].each do |movie_data|
  Movie.create!(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_path: "https://image.tmdb.org/t/p/w500#{movie_data['poster_path']}",
    rating: movie_data['vote_average'],
    tmdb_id: movie_data['id']
  )
end

puts "#{Movie.count} movies created."