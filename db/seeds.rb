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

puts "destroying all jams-user"
JamsUser.destroy_all

puts "destroying all users"
User.destroy_all

puts "destroying all Jams"
Jam.destroy_all


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
studio_bleu = Studio.create! :name => 'Studio Bleu', :user_id  => mathilde.id,:address => '7 rue des petites ecuries, 75010 Paris', :description => 'Studio bleu: location d espaces artistiques parisiens - 5 sites - 42 studios de répétition de musique : de 120 à 20 m2 - 15 halls de danse et de théatre : de 185 m2 à 40 m2 - une équipe professionnelle à votre écoute - une centrale de réservation pour les pros - du matériel de qualité pour vos répétitions et cours'
hf_music = Studio.create! :name => 'HF Music Studio', :user_id  => mathilde.id, :address => '20-22 rue Richer, 75009 Paris', :description => 'La nouvelle référence pour vos répétitions. En plein cœur de Paris, ces studios de toute dernière génération, insonorisés, climatisés et équipés de matériel haut de gamme à votre disposition 7J/7.'
hbs = Studio.create! :name => 'Studios HBS', :user_id  => mathilde.id, :address => '25 Avenue Corentin Cariou, 75019 Paris', :description => 'HBS Écuries est l un des premiers studios de répétitions musicales à ouvrir dans le centre de Paris et voilà désormais plus de trente ans que groupes et musiciens de tous styles (Jazz, Pop, Rock, Funk, Afro, Punk...), professionnels et amateurs, se succèdent dans nos locaux toujours en expansion.'
luna_rossa = Studio.create! :name => 'Luna Rossa', :user_id  => mathilde.id, :address => '24 rue Primo Levi, 75013 Paris', :description => 'Créé en 1985 et situé dans le 13ème, le Studio Luna Rossa est le plus grand studio de répétitions de Paris. Après 3 déménagements, le studio est depuis 2011 situé au 24 rue Primo Lévi, au cœur d un arrondissement en pleine explosion artistique et culturelle.'
les_studios_de_la_seine = Studio.create! :name => 'Les studios de la Seine', :user_id  => mathilde.id, :address => '80 Rue Traversière, 75012 Paris', :description => 'Dans un cadre professionnel et chaleureux en plein cœur de Paris, les Studios de la Seine vous proposent des studios d’enregistrement et de mixage sur 950m².'
cité_internationale_des_arts = Studio.create! :name => 'Cité internationale des arts', :user_id  => mathilde.id, :address => "18 Rue de l'Hôtel de ville, 75004 Paris", :description => 'La Cité internationale des arts, qui accueille en résidence à Paris plus de 300 artistes de toutes nationalités et de toutes disciplines dans des ateliers-logements, propose à la location 8 studios de répétition et un auditorium ouverts tous les jours de 10h à 20h, pour un large public autour de pratiques confirmées ou amateurs* : professionnels, associations, compagnies, entreprises, individuels, etc.'
studio_de_la_bastille = Studio.create! :name => 'Studio de la Bastille', :user_id  => mathilde.id, :address => "8 passage Saint Sébastien, 75011 Paris", :description => "La société Plan 2 Music, spécialisée dans la production phonographique et la réalisation d'albums, a collaboré pendant des années avec divers artistes, producteurs indépendants ou multinationales. Nous comptons des participations sur des courts métrages tant au niveau musical, qu’en pure prestation."
sparkle_studio = Studio.create! :name => 'Sparkle Studio', :user_id  => mathilde.id, :address => "76 rue de Turenne, 75003 Paris", :description => "Le studio sparkle a été concu et réalisé par David Dahan et Joseph Guigui, tout deux compositeurs-producteurs. Notre volonté est de rassembler le meilleur matériel audio des années 60-70."
translab = Studio.create! :name => 'Translab', :user_id  => mathilde.id, :address => "12-14 Boulevard de l'hopital, 75005 Paris", :description => "Translab appartient au cercle des studios haut de gamme Français dont les prestations correspondent aux meilleurs standards de qualité. Nos studios sont installés à Paris depuis 1976 dans un cadre unique datant de la révolution française. Considéré aujourd’hui comme l’un des meilleurs studios existant, de très nombreux albums de qualité y ont été enregistrés et produits par des majors ainsi que des producteurs indépendants français et internationaux."
scopitone = Studio.create! :name => 'Scopitone', :user_id  => matthieu.id, :address => "22 Rue Saint-Ambroise, 75011 Paris", :description => "Au cœur de Paris, le studio d’enregistrement Scopitone vous accompagne depuis 1991. 4 Studios d’enregistrements et régies conçues spécifiquement pour l’enregistrement de voix-off. Casting de comédiens professionnels : voix françaises et étrangères natives. Enregistrement, montage, mixage, musiques libres de droits ou création musicale et sound-design à votre image."


file = URI.open('http://www.studiobleu.com/wp-content/uploads/2015/06/20181221-INDIGO-08.jpg')
studio_bleu.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.hfmusicstudio.com/wp-content/uploads/2014/09/HFmusicStudio-Accueil2.jpg')
hf_music.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.studiovasteras.se/wp-content/uploads/studio-tre.jpg')
hbs.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.studiolunarossa.com/wp-content/uploads/2018/02/DSC7994-1-2000x951.jpg')
luna_rossa.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://static1.laseinemusicale.com/articles/6/66/@/3569-studios-riffx-article_content-2.png')
les_studios_de_la_seine.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.citedesartsparis.net/media/cia/183726-maurine_tric-1002-1.jpg')
cité_internationale_des_arts.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.milongamusic.com/wordpress/wp-content/uploads/2019/08/Des-mousses-acoustiques-pour-Studio.jpg')
studio_de_la_bastille.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.montmartrerecording.com/wp-content/uploads/2015/03/cabine-studioenregistrement-paris18-son-750x450.jpg')
sparkle_studio.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.studiocandp.com/blog/uploads/images/image_big_14_5cb5e21c70016.jpg')
translab.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

file = URI.open('https://www.occase-music.com/wp-content/uploads/2019/05/321941.jpg')
scopitone.photo.attach(io:file, filename: 'roompicture.png', content_type: 'image/png')

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

# room_pic_url.length.times {
#   room = Room.create!(name: Faker::Music::RockBand.name, description: "Idéal pour pratiquer votre instrument en toute tranquilité ou répéter en groupe avec tout le matériel nécessaire!", capacity: "#{capacity.sample}", price: "#{prices.sample}", studio: Studio.all.sample)
#   file = URI.open(room_pic_url.sample)
#   room.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
#   i += 1
#   puts "#{i} room"
# }

room_description = [
"Idéal pour pratiquer votre instrument en toute tranquilité ou répéter en groupe avec tout le matériel nécessaire!",
"Pour une simple prise de voix ou bien la production d’un album une équipe d’ingénieurs du son est à votre service.",
"Enregistrement, montage, mixage, musiques libres de droits ou création musicale et sound-design à votre image.",
"Salle réalisée par un acousticien reconnu, pour garantir une qualité de son optimale, peu importe la formation.",
"Salle ouverte à toutes les disciplines. Convient également pour des formats séminaires, cours et formation."
]


room_names = []
100.times do
  room_names << Faker::Music::RockBand.name
end
short_names = room_names.reject { |name| name.length > 20}



Studio.all.each do |studio|
  rand(5..7).times {
  name = short_names.sample
  if Room.where(name: name).count == 0
    room = Room.create!(name: name, description: room_description.sample, capacity: "#{capacity.sample}", price: "#{prices.sample}", studio: studio)
    file = URI.open(room_pic_url.sample)
    room.photo.attach(io: file, filename: 'roompicture.png', content_type: 'image/png')
    i += 1
    puts "#{i} room"
  end
}
end

puts "create bookings"



booking1 = Booking.create! :starts_at => DateTime.strptime("28/11/2020 13:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => antoine, :room => Room.all.sample, :date => "2020-11-28", :time => "13:00"
booking2 = Booking.create! :starts_at => DateTime.strptime("29/11/2020 14:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample, :date => "2020-11-29", :time => "14:00"
booking3 = Booking.create! :starts_at => DateTime.strptime("11/12/2020 15:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "2020-12-11", :time => "15:00"
booking4 = Booking.create! :starts_at => DateTime.strptime("11/12/2020 16:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample, :date => "2020-12-11", :time => "16:00"
booking5 = Booking.create! :starts_at => DateTime.strptime("30/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample, :date => "2020-11-30", :time => "17:00"
booking6 = Booking.create! :starts_at => DateTime.strptime("06/12/2020 15:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample, :date => "2020-12-06", :time => "15:00"
booking7 = Booking.create! :starts_at => DateTime.strptime("05/12/2020 09:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample, :date => "2020-12-05", :time => "09:00"
booking8 = Booking.create! :starts_at => DateTime.strptime("24/12/2020 11:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => rodolphe, :room => Room.all.sample, :date => "2020-12-04", :time => "11:00"
booking9 = Booking.create! :starts_at => DateTime.strptime("08/12/2020 11:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample, :date => "2020-12-08", :time => "11:00"
booking10 = Booking.create! :starts_at => DateTime.strptime("05/12/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample, :date => "2020-12-05", :time => "17:00"
booking11 = Booking.create! :starts_at => DateTime.strptime("04/12/2020 12:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample, :date => "2020-12-04", :time => "12:00"
booking12 = Booking.create! :starts_at => DateTime.strptime("03/12/2020 13:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => tanguy, :room => Room.all.sample, :date => "2020-12-03", :time => "13:00"
booking13 = Booking.create! :starts_at => DateTime.strptime("04/12/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "2020-12-04", :time => "17:00"
booking14 = Booking.create! :starts_at => DateTime.strptime("05/10/2020 13:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "2020-10-05", :time => "13:00"
booking15 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 13:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "2020-11-27", :time => "13:00"
booking16 = Booking.create! :starts_at => DateTime.strptime("15/12/2020 13:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "2020-12-15", :time => "13:00"
booking17 = Booking.create! :starts_at => DateTime.strptime("01/12/2020 18:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => delphine, :room => Room.all.sample, :date => "2020-12-01", :time => "18:00"
booking18 = Booking.create! :starts_at => DateTime.strptime("01/12/2020 10:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => antoine, :room => Room.all.sample, :date => "2020-12-01", :time => "10:00"
booking19 = Booking.create! :starts_at => DateTime.strptime("02/12/2020 18:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => antoine, :room => Room.all.sample, :date => "2020-12-02", :time => "18:00"
booking20 = Booking.create! :starts_at => DateTime.strptime("30/11/2020 10:00", "%d/%m/%Y %H:%M"), :duration => 120, :user => antoine, :room => Room.all.sample, :date => "2020-11-30", :time => "10:00"



puts "create messages"

puts "create reviews"
review1 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => antoine, :booking => booking1
review2 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => tanguy, :booking => booking2
review3 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => delphine, :booking => booking3
review4 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user => rodolphe, :booking => booking4
review5 = Review.create! :title => 'Mauvaise expérience', :content => 'Pas assez de matériel !', :rating => 2, :user => rodolphe, :booking => booking5
review6 = Review.create! :title => 'Mauvaise expérience', :content => 'Salle mal entretenue', :rating => 1, :user => rodolphe, :booking => booking6
review7 = Review.create! :title => 'Génial !', :content => "Super moment entre potes. Très satisfait de l'acceuil." , :rating => 5, :user => rodolphe, :booking => booking7
review8 = Review.create! :title => 'Correct', :content => "Matériel satisfaisant mais le prix est élevé." , :rating => 3, :user => rodolphe, :booking => booking8
review9 = Review.create! :title => 'Correct', :content => "Matériel satisfaisant mais le prix est élevé." , :rating => 3, :user => tanguy, :booking => booking9
review10 = Review.create! :title => 'Mauvaise expérience', :content => 'Salle mal entretenue', :rating => 1, :user => tanguy, :booking => booking10
review11 = Review.create! :title => 'Je reviendrai !', :content => 'Prix abordable, matériel bien entretenu.', :rating => 4, :user => tanguy, :booking => booking11
review12 = Review.create! :title => 'Extraordinaire !', :content => 'Tout était parfait : matériel, acceuil, propreté ! Je recommande.', :rating => 5, :user => tanguy, :booking => booking12
review13 = Review.create! :title => 'Bof bof...', :content => "Matériel satisfaisant mais le prix est élevé.", :rating => 2, :user => delphine, :booking => booking13
review14 = Review.create! :title => 'Génial !', :content => "Super moment entre potes. Très satisfaite de l'acceuil.", :rating => 4, :user => delphine, :booking => booking14
review15 = Review.create! :title => 'Je reviendrai !', :content => 'Tout était parfait : matériel, acceuil, propreté ! Je recommande.', :rating => 5, :user => delphine, :booking => booking15
review16 = Review.create! :title => 'Je reviendrai !', :content => 'Tout était parfait : matériel, acceuil, propreté ! Je recommande.', :rating => 5, :user => delphine, :booking => booking16
review17 = Review.create! :title => 'Super rapport qualité / prix !', :content => 'Tout était parfait : matériel, acceuil, propreté ! Je recommande.', :rating => 4, :user => delphine, :booking => booking17
review18 = Review.create! :title => 'Super rapport qualité / prix !', :content => "Super moment entre potes. Très satisfait de l'acceuil.", :rating => 5, :user => antoine, :booking => booking18
review20 = Review.create! :title => 'Je reviendrai !', :content => "Super moment entre potes. Très satisfait de l'acceuil.", :rating => 4, :user => antoine, :booking => booking20

# puts "create chatrooms"
# chatroom1 = Chatroom


puts "create items"

items = [
  "Batterie",
  "Batterie électronique",
  "Piano droit",
  "Piano à queue",
  "Piano numérique",
  "Guitare acoustique",
  "Guitare électrique",
  "Guitare classique",
  "Harpe",
  "Basse",
  "Table de mixage",
  "Micro SM 58",
  "Contrebasse",
  "Violoncelle",
  "Amplificateur",
  "Djembé",
  "Clavier arrangeur",
  "Trompette",
  "Accordéon",
  "Saxophone"
]


items.each do |item|
  Item.create! :name => item, :description => 'Superbe instrument', :category => 'Instruments'
end
# 20.times do
#   Item.create! :name => item, :description => 'Superbe instrument', :category => 'Instruments'
# end

# puts "assigning items to rooms"
# 70.times do
# ItemsRoom.create! :room => Room.all.sample, :item => Item.all.sample
# end

puts "assigning items to rooms"
Room.all.each do |room|
  rand(3..8).times {
  item_room = Item.all.sample
  if room.items_rooms.where(item: item_room).count == 0
    item = ItemsRoom.create! :room => room, :item => item_room
  end
}
end
