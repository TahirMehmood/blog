# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
# if we use include with require than we do faker.name not faker::name
include Faker
formates = %w{Beta VHS IMAX HD SuperHD 4X DVD BlueRay}
images   = %w{skies.jpg bonfire.jpg cowboyup.jpg}

Movie.destroy_all

100.times do
    movie = Movie.create!(:name => "#{Company.bs}",
                         :director => "#{Name.name}",
                         :description => Lorem.paragraphs.join("<br/>"),
                         :year => rand(1940..2015),
                         :length => rand(20..240),
                         :format => formates[rand(formates.length)],
                         :image  => "movies/"+images[rand(images.length)],
                         :thumbnail => "movies/"+images[rand(images.length)]
                         )
    movie.save
    if( !movie.nil? )
      (rand(0..10)).times do
        movie.comments.create!(:author => "#{Name.name}",
                              :title  => "#{Company.bs}",
                              :content => Lorem.sentence(3),#.join("<br/>"),
                              :rating  => rand(1..5)
                             )
      end
    end
    puts movie.inspect
end