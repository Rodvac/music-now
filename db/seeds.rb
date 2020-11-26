require 'faker'
require 'date'

puts "destroying all items-rooms"
ItemsRoom.destroy_all

puts "destroying all items"
Item.destroy_all

puts "destroying all Studios"
Studio.destroy_all

puts "destroying all Rooms"
Room.destroy_all

puts "destroying all bookings"
Booking.destroy_all

puts "destroying all reviews"
Review.destroy_all

puts "destroying all users"
User.destroy_all

#DATA BASE
prices = (8..30).to_a
capacity = (1..12).to_a
street_numbers = (1..50).to_a
street_types = %w(rue boulevard avenue)
street_names = %w(Jean\ Jaures Carnot Charles\ de\ Gaulle Louis\ Pasteur Victor\ Hugo Jean\ Moulin Général\ Leclerc Jules\ Ferry Maréchal\ Foch)
city = %w(Paris)
key_word_band = %w(group, solo, trio, quatuors, orchestres, rock\ band, cours, piano\ voix)
key_word_style = %w(electrique accoustique amplifié)
#END

puts "create user"
antoine = User.create! :email => 'antoine@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Antoine', :last_name => 'Goeuriot'
tanguy = User.create! :email => 'tanguy@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Tanguy', :last_name => 'Clarence'
delphine = User.create! :email => 'delphine@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Delphine', :last_name => 'Ha1bert'
rodolphe = User.create! :email => 'rodolphe@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Rodolphe', :last_name => 'Vacher'

puts "create studios"
studio_bleu = Studio.create! :name => 'Studio Bleu', :address => '7 rue des petites ecuries, 75010 Paris', :description => 'Studio bleu: location d espaces artistiques parisiens / 5 sites / 42 studios de répétition de musique : de 120 à 20 m2 / 15 halls de danse et de théatre : de 185 m2 à 40 m2 / une équipe professionnelle à votre écoute / une centrale de réservation pour les pros / du matériel de qualité pour vos répétitions et cours'
hf_music = Studio.create! :name => 'HF Music Studio', :address => '20-22 rue Richer, 75009 Paris', :description => 'La nouvelle référence pour vos répétitions. En plein cœur de Paris, ces studios de toute dernière génération, insonorisés, climatisés et équipés de matériel haut de gamme à votre disposition 7J/7.'
hbs = Studio.create! :name => 'Studios HBS', :address => '25 Avenue Corentin Cariou, 75019 Paris', :description => 'HBS Écuries est l un des premiers studios de répétitions musicales à ouvrir dans le centre de Paris et voilà désormais plus de trente ans que groupes et musiciens de tous styles (Jazz, Pop, Rock, Funk, Afro, Punk...), professionnels et amateurs, se succèdent dans nos locaux toujours en expansion.'
luna_rossa = Studio.create! :name => 'Luna Rossa', :address => '24 rue Primo Levi, 75013 Paris', :description => 'Créé en 1985 et situé dans le 13ème, le Studio Luna Rossa est le plus grand studio de répétitions de Paris. Après 3 déménagements, le studio est depuis 2011 situé au 24 rue Primo Lévi, au cœur d un arrondissement en pleine explosion artistique et culturelle.'

# puts "in france"
15.times {
  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} France ", description: Faker::Quote.most_interesting_man_in_the_world)
  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
}
puts "in ile-de-france"
10.times {
  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} ile-de-france", description: Faker::Quote.most_interesting_man_in_the_world)
  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
}
puts "in Paris"
20.times {
  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} Paris", description: Faker::Quote.most_interesting_man_in_the_world)
  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
}


puts "create rooms"

Studio.all.each do |studio|
  rand(4..14).times {
  Room.create!(name: "#{key_word_band.sample} #{key_word_style.sample}", description: "Idéal pour pratiquer votre instrument en toute tranquilité ou répéter en groupe avec tout le matériel nécessaire!", capacity: "#{capacity.sample}", price: "#{prices.sample}", studio: studio)
  }
end

puts "create bookings"

booking1 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => antoine, :room => Room.all.sample
booking2 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample
booking3 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample
booking4 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample


puts "create reviews"
review1 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => antoine, :booking => booking1
review2 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => tanguy, :booking => booking2
review3 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => delphine, :booking => booking3
review4 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => rodolphe, :booking => booking4

puts "create items"
30.times do
  Item.create! :name => Faker::Music.instrument, :description => 'Superbe instrument', :category => 'Instruments'
end

puts "assigning items to rooms"
50.times do
ItemsRoom.create! :room => Room.all.sample, :item => Item.all.sample
end
