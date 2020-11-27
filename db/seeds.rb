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

room_pic_url = [
"https://lh3.googleusercontent.com/proxy/tcapG32QZw5zwekblSTvYhIt7g9JAIW96fZhT5cdaB3w-mmOG5R8Wu0ORxqDH5hbtNemOBSRjxuNMfuDQRJNbE-V0Mx3tqJr5cSi6hFz9wtkYjqSofa3BKk",
"https://www.spiritofmusic.fr/wp-content/uploads/2018/10/location-espace-studio-musique-aix-en-provence-557x400.jpg",
"https://www.studios7emeciel.com/img/blog/s4-square.jpg",
"https://lh3.googleusercontent.com/proxy/vnLQuc0p_EMPf5m6fgOdvMttP7mOpmuirGwvFG59BCeCkE5vs5TVZ_dnlKn9Pt8joryCxWQXTLz-jH1-nkjoF6cRgeeP8J8djHxdHQ",
"https://img.audiofanzine.com/image.php?lang=fr&identifier=id&size=normal&module=studioClassified&classified_id=9377",
"https://live-asso.fr/WordPress/wp-content/uploads/2011/12/bar-live-006.jpg",
"https://www.meancatrecords.fr/templates/yootheme/cache/studio2gretsch2-0ed057de.jpeg",
"https://www.morteau.org/wp-content/uploads/2019/09/DSCN8239-1024x768.jpg",
"https://studiotchaman.fr/wp-content/uploads/2017/09/grand-studio-de-repetition-aubagne.jpg",
"https://www.lusineamusique.fr/wp-content/uploads/2018/06/img4019-800x500.png",
"https://media-cdn.tripadvisor.com/media/photo-s/0e/2f/86/86/un-de-nos-local-de-repetition.jpg",
"https://sallediffart.com/wp-content/uploads/2018/08/studiobleu.jpg",
"https://lesmusicales.fr/wp-content/uploads/2019/04/sono.jpeg",
"https://www.studiocandp.com/blog/uploads/images/image_big_14_5cb5e21c70016.jpg",
"https://lh3.googleusercontent.com/p/AF1QipNA0k57Y6yf8XPbKlBzLzSLDHOZ7aSq-tJf0y-Z=w600-h0",
"https://www.lamaisondelamusique.fr/isens_thumb.php?width=640&height=376&image=images/2018/lamaisondelamusique/DSC04549.JPG",
"https://lh3.googleusercontent.com/proxy/6T4rIc9b5yxs5fE_RLHV4aEpnFaUJkdmu1drhGg6qlMjIFdpTgv2ytRQRcegNe3xIYbEXM-zLIfKc3ck53Y-99RxdEZxvvyzHPFbQSBbISLTo6-N4aUASqddI1p1eRj9z2px",
"https://static.wixstatic.com/media/242dce_5b9df68ec01d41ac955dd94c9c3d5129.jpg/v1/fill/w_864,h_576,al_c,lg_1,q_90/242dce_5b9df68ec01d41ac955dd94c9c3d5129.webp",
"https://www.spectable.com/image/image/n/bhr-prod-studio-enregistrement-et-de-repetition_479469.jpg",
"https://www.hfmusicstudio.com/wp-content/uploads/2014/09/HFmusicstudioAbbeyRoad-1500x630.jpg",
"https://lh3.googleusercontent.com/p/AF1QipOfJ6jrnDYyWaWNvItdRoPRH7rMrbVlzOJ2JEAG=w600-h0",
"https://lh3.googleusercontent.com/p/AF1QipO53idNasegrIQ125Kg9DHg66SIroLB86h31yNh=w600-h0",
"https://lh3.googleusercontent.com/p/AF1QipMg5Nbt0sO8mR-3N_G6eA1EFM3o_5ftfz328bfF=w600-h0",
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
1.times {
  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} France ", description: Faker::Quote.most_interesting_man_in_the_world)
  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
}
puts "in ile-de-france"
1.times {
  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} ile-de-france", description: Faker::Quote.most_interesting_man_in_the_world)
  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
}
puts "in Paris"
10.times {
  studio = Studio.create!(name: Faker::Music.album, address: "#{street_numbers.sample} #{street_types.sample} #{street_names.sample} Paris", description: Faker::Quote.most_interesting_man_in_the_world)
  file = URI.open('https://source.unsplash.com/1600x900/?room,music')
  studio.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
}


puts "create rooms"

25.times {
  room =Room.create!(name: "#{key_word_band.sample} #{key_word_style.sample}", description: "Idéal pour pratiquer votre instrument en toute tranquilité ou répéter en groupe avec tout le matériel nécessaire!", capacity: "#{capacity.sample}", price: "#{prices.sample}", studio: Studio.all.sample)
  file = URI.open(room_pic_url[i])
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

booking1 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => antoine, :room => Room.all.sample, :date => "Mardi", :time => "20h"
booking2 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample, :date => "jeudi", :time => "20h"
booking3 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "jeudi", :time => "20h"
booking4 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample, :date => "vendredi", :time => "20h"


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
