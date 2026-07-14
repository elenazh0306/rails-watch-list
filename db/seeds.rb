require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
puts "Cleaning database..."
Movie.destroy_all

data_serialized = URI.parse(url).read
data = JSON.parse(data_serialized)
puts "movies fetched"
movies = data["results"]
puts "creating movie database"
movies.each do |movie|
  Movie.create!(title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500" + movie["poster_path"], rating: movie["vote_average"])
end
puts "db created"
