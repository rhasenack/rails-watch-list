# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


APIKEY = '027895346180bd116c3283d701264b11'

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=027895346180bd116c3283d701264b11&language=en-US&page=1'
base_poster_url = 'https://image.tmdb.org/t/p/original'
data = URI.open(url).read
parsed_data = JSON.parse(data)

movies = parsed_data['results']

list1 = List.new(name: 'Top 10 Movies')
list1.save

movies.each do |movie|
  movie = Movie.new(title: movie['title'], overview: movie['overview'], poster_url: base_poster_url + movie['poster_path'], rating: movie['vote_average'].to_f )
  unless movie.save!
    p movie.errors.full_messages
  end
  bookmark = Bookmark.new(comment: 'Testing Bookmarks', movie_id: movie.id, list_id: List.first.id)
  unless bookmark.save!
    p bookmark.errors.full_messages
  end
end


# UPCOMING

url_upcoming = 'https://api.themoviedb.org/3/movie/upcoming?api_key=027895346180bd116c3283d701264b11&language=en-US&page=1'
data = URI.open(url_upcoming).read
parsed_data = JSON.parse(data)
movies = parsed_data['results']

list2 = List.new(name: '10 Upcoming Movies')
list2.save

movies.each do |movie|
  movie = Movie.new(title: movie['title'], overview: movie['overview'], poster_url: base_poster_url + movie['poster_path'], rating: movie['vote_average'].to_f )
  unless movie.save!
    p movie.errors.full_messages
  end
  bookmark = Bookmark.new(comment: 'Testing Bookmarks', movie_id: movie.id, list_id: List.last.id)
  unless bookmark.save!
    p bookmark.errors.full_messages
  end
end
