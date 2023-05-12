# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)puts “Cleaning up database...”
List.destroy_all
Movie.destroy_all
puts "Database cleaned"
url = "http://tmdb.lewagon.com/movie/top_rated?api_key=344f0f780755bea2b31e065cd88c6cc0"

50.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}&page=#{i+1}").read)["results"]
  movies.each do |movie|
    puts "Creating #{movie["title"]}"
    base_poster_url = "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}.jpg"
    Movie.create(
      title: movie["original_title"],
      overview: movie["overview"],
      poster_url: base_poster_url,
      rating: movie["vote_average"]
    )
  end
end
puts "Movies created"
