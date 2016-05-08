# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do 
  User.create(
    firstname: Faker::Name.first_name, 
    lastname: Faker::Name.last_name, 
    email: Faker::Internet.email, 
    password: Faker::Internet.password
  )
end


 j = Imdb::Top250.new




 j.movies.each do |movie|
  movie_title = movie.title.split(" ").join(" ").gsub(/^\d+\./,'')

 #  pluralize(movie.errors.count, "error")
   # movie.errors   
   #      movie.errors.full_messages.each do |msg| 
  #         msg
    #     end 

  p k = Movie.create(title: movie_title, 
    director: movie.director[0], 
    image: movie.poster, 
    remote_image_url: movie.poster, 
   description: movie.plot_summary, 
    runtime_in_minutes: movie.length, 
        release_date: movie.release_date)
  

  end
#movie.poster_image_url

 # Movie.all.each do |movie|
 # #poster_real = "http://ia.media-imdb.com/images/M/MV5BMTc2MTQ3MDA1Nl5BMl5BanBnXkFtZTgwODA3OTI4NjE@.jpg"
  
 # puts movie.poster_image_url
 # puts movie.id
 #  poster =  movie.poster_image_url.gsub(/http:\/\/ia\.media\-imdb\.com\/images\/M\//, '')
 
 #  movie.poster_image_url = poster
 #  movie.save

 #  # puts poster
 #  # system 'mkdir', '-p', "/home/rahmanzr/Copy/image/#{movie.id}"

 #  #  system "wget -O /home/rahmanzr/Copy/image/#{movie.id}/#{poster} #{movie.poster_image_url}"
  
 #  #{}`wget #{poster_real}` 



 #  #wget -O /home/rahmanzr/Copy/images/ http://ia.media-imdb.com/images/M/MV5BMTc2MTQ3MDA1Nl5BMl5BanBnXkFtZTgwODA3OTI4NjE@.jpg
 #  end




 # p kl = Movie.create(title: "some", 
 #  director: "dum", 
 #  poster_image_url: "hum", 
 #  description: "him", 
 #  runtime_in_minutes: '22', 
 #  release_date: '1984-01-01')
 # p kl.errors.add(:release_date, "cannot contain the characters !@#%*()_-+=")
 #p kl.create.errors.valid?
