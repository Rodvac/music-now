require 'faker'
require 'date'
require 'open-uri'

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

puts "destroying all messages"
Message.destroy_all

puts "destroying all users"
User.destroy_all

#DATA BASE

room_pic_url = [
"https://www.spiritofmusic.fr/wp-content/uploads/2018/10/location-espace-studio-musique-aix-en-provence-557x400.jpg",
"https://www.studios7emeciel.com/img/blog/s4-square.jpg",
"https://live-asso.fr/WordPress/wp-content/uploads/2011/12/bar-live-006.jpg",
"https://www.meancatrecords.fr/templates/yootheme/cache/studio2gretsch2-0ed057de.jpeg",
"https://www.morteau.org/wp-content/uploads/2019/09/DSCN8239-1024x768.jpg",
"https://studiotchaman.fr/wp-content/uploads/2017/09/grand-studio-de-repetition-aubagne.jpg",
"https://www.lusineamusique.fr/wp-content/uploads/2018/06/img4019-800x500.png",
"https://media-cdn.tripadvisor.com/media/photo-s/0e/2f/86/86/un-de-nos-local-de-repetition.jpg",
"https://sallediffart.com/wp-content/uploads/2018/08/studiobleu.jpg",
"https://lesmusicales.fr/wp-content/uploads/2019/04/sono.jpeg",
"https://www.studiocandp.com/blog/uploads/images/image_big_14_5cb5e21c70016.jpg",
"https://www.lamaisondelamusique.fr/isens_thumb.php?width=640&height=376&image=images/2018/lamaisondelamusique/DSC04549.JPG",
"https://www.spectable.com/image/image/n/bhr-prod-studio-enregistrement-et-de-repetition_479469.jpg",
"https://www.hfmusicstudio.com/wp-content/uploads/2014/09/HFmusicstudioAbbeyRoad-1500x630.jpg",
"http://www.studiobleu.com/wp-content/uploads/2015/06/St-Bleu-20-%C3%A8me-Salle-6-03-600x360.jpg",
"http://www.studiobleu.com/wp-content/uploads/2015/06/Box-5-02--600x360.jpg",
"http://www.studiobleu.com/wp-content/uploads/2015/06/Count-Basie-2016-01-600x360.jpg",
"http://www.studiobleu.com/wp-content/uploads/2015/06/20-Ray-Charles-01-600x360.jpg"
]

i = 0
prices = (8..30).to_a
capacity = (1..12).to_a
street_numbers = (1..50).to_a
street_types = %w(rue boulevard avenue)
street_names = %w(Jean\ Jaures Carnot Charles\ de\ Gaulle Louis\ Pasteur Victor\ Hugo Jean\ Moulin Général\ Leclerc Jules\ Ferry Maréchal\ Foch)
city = %w(Paris)
key_word_band = %w(Group Solo Trio Quatuors Orchestres Rock\ band Cours Piano\ voix)
key_word_style = %w(éléctrique acoustique amplifié)
#END

puts "create user"
antoine = User.create! :email => 'antoine@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Antoine', :last_name => 'Goeuriot', :nickname => 'AG'
tanguy = User.create! :email => 'tanguy@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Tanguy', :last_name => 'Clarence', :nickname => 'TC'
delphine = User.create! :email => 'delphine@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Delphine', :last_name => 'Habert',:nickname => 'DH'
rodolphe = User.create! :email => 'rodolphe@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Rodolphe', :last_name => 'Vacher',:nickname => 'RV'
matthieu = User.create! :email => 'matthieu@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Matthieu', :last_name => 'Durand',:nickname => 'MD'
julien = User.create! :email => 'julien@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Julien', :last_name => 'Causse',:nickname => 'JC'
elisa = User.create! :email => 'elisa@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Elisa', :last_name => 'Durand',:nickname => 'ED'
mathilde = User.create! :email => 'mathilde@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Mathilde', :last_name => 'Causse',:nickname => 'MC'

puts "create studios"
studio_bleu = Studio.create! :name => 'Studio Bleu', :user_id  => matthieu.id,:address => '7 rue des petites ecuries, 75010 Paris', :description => 'Studio bleu: location d espaces artistiques parisiens / 5 sites / 42 studios de répétition de musique : de 120 à 20 m2 / 15 halls de danse et de théatre : de 185 m2 à 40 m2 / une équipe professionnelle à votre écoute / une centrale de réservation pour les pros / du matériel de qualité pour vos répétitions et cours'
hf_music = Studio.create! :name => 'HF Music Studio', :user_id  => julien.id, :address => '20-22 rue Richer, 75009 Paris', :description => 'La nouvelle référence pour vos répétitions. En plein cœur de Paris, ces studios de toute dernière génération, insonorisés, climatisés et équipés de matériel haut de gamme à votre disposition 7J/7.'
hbs = Studio.create! :name => 'Studios HBS', :user_id  => elisa.id, :address => '25 Avenue Corentin Cariou, 75019 Paris', :description => 'HBS Écuries est l un des premiers studios de répétitions musicales à ouvrir dans le centre de Paris et voilà désormais plus de trente ans que groupes et musiciens de tous styles (Jazz, Pop, Rock, Funk, Afro, Punk...), professionnels et amateurs, se succèdent dans nos locaux toujours en expansion.'
luna_rossa = Studio.create! :name => 'Luna Rossa', :user_id  => mathilde.id, :address => '24 rue Primo Levi, 75013 Paris', :description => 'Créé en 1985 et situé dans le 13ème, le Studio Luna Rossa est le plus grand studio de répétitions de Paris. Après 3 déménagements, le studio est depuis 2011 situé au 24 rue Primo Lévi, au cœur d un arrondissement en pleine explosion artistique et culturelle.'

file = URI.open('http://www.studiobleu.com/wp-content/uploads/2015/06/20181221-INDIGO-08.jpg')
studio_bleu.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.hfmusicstudio.com/wp-content/uploads/2014/09/HFmusicStudio-Accueil2.jpg')
hf_music.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.studiovasteras.se/wp-content/uploads/studio-tre.jpg')
hbs.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.studiolunarossa.com/wp-content/uploads/2018/02/DSC7994-1-2000x951.jpg')
luna_rossa.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')


# puts "in france"
# 1.times {
#  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} France ", description: Faker::Quote.most_interesting_man_in_the_world)
#  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
#  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
# }
# puts "in ile-de-france"
# 1.times {
#  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} ile-de-france", description: Faker::Quote.most_interesting_man_in_the_world)
#  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
#  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
# }
# puts "in Paris"
# 10.times {
#  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} Paris", description: Faker::Quote.most_interesting_man_in_the_world)
#  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
#  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
# }


puts "create rooms"

room_pic_url.length.times {
  room = Room.create!(name: "#{key_word_band.sample}/#{key_word_style.sample}", description: "Idéal pour pratiquer votre instrument en toute tranquilité ou répéter en groupe avec tout le matériel nécessaire!", capacity: "#{capacity.sample}", price: "#{prices.sample}", studio: Studio.all.sample)
  file = URI.open(room_pic_url.sample)
  room.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
  i += 1
  puts "#{i} room"
}


# Studio.all.each do |studio|
#   rand(2..7).times {
#   room = Room.create!(name: "#{key_word_band.sample} #{key_word_style.sample}", description: "Idéal pour pratiquer votre instrument en toute tranquilité ou répéter en groupe avec tout le matériel nécessaire!", capacity: "#{capacity.sample}", price: "#{prices.sample}", studio: studio)
#   file = URI.open(room_pic_url.sample)
#   room.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
#   }
# end

puts "create bookings"

booking1 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => antoine, :room => Room.all.sample, :date => "2020-11-28", :time => "13:00"
booking2 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample, :date => "2020-11-29", :time => "14:00"
booking3 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "2020-12-11", :time => "15:00"
booking4 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample, :date => "2020-12-11", :time => "16:00"

puts "create messages"

puts "create reviews"
review1 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => antoine, :booking => booking1
review2 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => tanguy, :booking => booking2
review3 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => delphine, :booking => booking3
review4 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => rodolphe, :booking => booking4

# puts "create chatrooms"
# chatroom1 = Chatroom


puts "create items"
30.times do
  Item.create! :name => Faker::Music.instrument, :description => 'Superbe instrument', :category => 'Instruments'
end

puts "assigning items to rooms"
50.times do
ItemsRoom.create! :room => Room.all.sample, :item => Item.all.sample
end
