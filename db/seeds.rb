Photo.destroy_all
EventUser.destroy_all
Event.destroy_all
Category.destroy_all
Ingredient.destroy_all
Poll.destroy_all
Option.destroy_all
Vote.destroy_all
GroupUser.destroy_all
Group.destroy_all
User.destroy_all

#toto = User.create!(email: "toto@gmail.com", password: "123456", first_name: "Toto", last_name: "Tata")

p "crea groupe 1"

Group.create(name: "Les Wagonneurs")

p "crea users"

user_1 = User.create(email: "Romane@wagon.fr", password: "123456", first_name: "Romane", last_name: "Arvois")
file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOW5OQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--d3bf6093484e155f8c5f6047e0e403f39e6680f3/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/RomaneArv.jpg")
user_1.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_2 = User.create(email: "Johanna@wagon.fr", password: "123456", first_name: "Johanna", last_name: "Botquin")
file = URI.open("https://avatars.githubusercontent.com/u/147168485?v=4")
user_2.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_3 = User.create(email: "Laurent@wagon.fr", password: "123456", first_name: "Laurent", last_name: "Liquidato")
file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOWZOQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--9a447186433e663eeb7c2506e5e9494114a85fbd/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/Lorenzolo31.jpg")
user_3.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_4 = User.create(email: "Loana@wagon.fr", password: "123456", first_name: "Loana", last_name: "Bronico")
file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOHpOQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--6ee49d10a68b0aacd16d2347e16ab17659331398/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/loanabronico23.jpg")
user_4.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_5 = User.create(email: "Tom@wagon.fr", password: "123456", first_name: "Tom", last_name: "Gourdon")
file = URI.open("https://avatars.githubusercontent.com/u/168112543?v=4")
user_5.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_6 = User.create(email: "Tia@wagon.fr", password: "123456", first_name: "Tia", last_name: "Garibaldi")
file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOXZOQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--6988dbc07bfa2f65ed05aa1998b94e712330615c/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/tia-garibaldi.jpg")
user_6.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_7 = User.create(email: "Gaulthier@wagon.fr", password: "123456", first_name: "Gaulthier", last_name: "Rémusat")
file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOWpOQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--d76ab5d908c1a0340c9225ccc9a05d2d839a8ba5/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/Gaulthier-rmt.jpg")
user_7.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_8 = User.create(email: "cyril@wagon.fr", password: "123456", first_name: "Cyril", last_name: "D'Angelis")
file = URI.open("https://avatars.githubusercontent.com/u/168377535?v=4")
user_8.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

user_9 = User.create(email: "maeva@wagon.fr", password: "123456", first_name: "Maeva", last_name: "Belleau")
file = URI.open("https://avatars.githubusercontent.com/u/168280842?v=4")
user_9.avatar.attach(io: file, filename: 'pfp.jpg', content_type: 'image/jpg')

p "add users to groups"

User.all.each do |user|
  GroupUser.create(user_id: user.id, group_id: Group.where(name: "Les Wagonneurs").first.id)
end

p "crea events"

Event.create(name: "Pendaison de crémaillère Romane", theme: "soirée disco", description: "Venez célébrer mon emménagement !! Apportez du champ' :)", date: "2024-07-13", time: "20:30", address: "Melun")
Event.create(name: "Jeudi Party", description: "Les Wagonneurs retournent sur le lieu du crime.", date: "2024-07-20", time: "18:00", address: "Marengo")
Event.create(name: "Anniversaire Cyrilou", description: "Cyril a officiellement 14 ans, il est temps de lui offrir un scooter", date: "2025-12-16", time: "19:00", address: "Dijon")
Event.create(name: "Repas de famille Briconico", description: "Marie a fait son fameux couscous !!!!!!!!!!", date: "2025-08-30", time: "20:20", address: "Marseille")
# Event.create(name: "Soirée de l'angoisse", description: "4h du mat', Cyril veut un câble USB-C", date: "2024-06-15", time: "21:00", address: "Verdon")
# Event.create(name: "Mariage Maeva <3", description: "Maeva épouse enfin Randy l'homme de sa vie bravo à eux", date: "2026-08-02", time: "20:00", address: "Cap Vert")

User.all.each do |user|
  EventUser.create(user_id: user.id, event_id: Event.where(name: "Pendaison de crémaillère Romane").first.id, coming: true)
end
p "attach image to events"

banner_file = URI.open("https://cache.cosmopolitan.fr/data/photo/w1200_h630_ci/1pg/astuce-etre-en-forme-avant-soiree.jpg")
Event.all.each do |event|
  event.photo.attach(io: banner_file, filename: 'banner.jpg', content_type: 'image/jpg')
end

p "crea photo pour event 1"

photo = Photo.create(group: Group.first, event_id: Event.where(name: "Pendaison de crémaillère Romane").first.id, user_id: User.where(first_name: "Romane").first.id)
photo_soirée = URI.open("https://france-effect.com/le-blog/wp-content/uploads/2023/09/cocktail.jpg")
photo.photo.attach(io: photo_soirée, filename: 'soirée.jpg', content_type: 'image/jpg')

p "add Romane to all events"

Event.all.each do |event|
  EventUser.create(user_id: User.where(first_name: "Romane").first.id, event_id: event.id, coming: true)
end

p "crea categories"

Category.create(name: "Admin", description: "Créateur de l'évènement")
Category.create(name: "Participant", description: "Participant à l'évènement")
Category.create(name: "DJ", description: "S'occuppe de la playlist de l'évènement")
Category.create(name: "Photographe", description: "Prend des photos de l'évènement")
Category.create(name: "Cuistot", description: "Supervise les plats de l'évènement")
Category.create(name: "Barman", description: "S'occupe des boissons de l'évènement")
Category.create(name: "Décorateur", description: "Décore l'évènement")
Category.create(name: "Vidéaste", description: "Filme l'évènement")
Category.create(name: "Animateur", description: "Anime l'évènement")
Category.create(name: "Sam", description: "Celui qui ne boit pas et ramène tout le monde")

# Ingredient.create!(name: "Fromage", price: 7.99, category: "nourriture", event_id: Event.first.id, user_id: toto.id)
# Ingredient.create!(name: "Charcuterie", price: 5.99, category: "nourriture", event_id: Event.first.id, user_id: toto.id)
# Ingredient.create!(name: "Pomme de terre", price: 2.99, category: "nourriture", event_id: Event.first.id, user_id: toto.id)
# Ingredient.create!(name: "Menthe", price: 1.99, category: "boisson", event_id: Event.first.id, user_id: toto.id)
# Ingredient.create!(name: "Citron vert", price: 1.99, category: "boisson", event_id: Event.first.id, user_id: toto.id)
# Ingredient.create!(name: "Bières", price: 10.99, category: "boisson", event_id: Event.first.id, user_id: toto.id)

p "crea polls"

Poll.create(question: "Quelle musique voulez-vous écouter ?", event_id: Event.first.id)
Poll.create(question: "Qui mange de la viande ?", event_id: Event.first.id)

p "crea options"

Option.create(title: "Rap", poll_id: Poll.where(question: "Quelle musique voulez-vous écouter ?").first.id)
Option.create(title: "Rock", poll_id: Poll.where(question: "Quelle musique voulez-vous écouter ?").first.id)
Option.create(title: "Pop", poll_id: Poll.where(question: "Quelle musique voulez-vous écouter ?").first.id)

Option.create(title: "Moi !", poll_id: Poll.where(question: "Qui mange de la viande ?").first.id)
Option.create(title: "Pas moi !", poll_id: Poll.where(question: "Qui mange de la viande ?").first.id)

p "crea autres groupes"

Group.create(name: "Les Briconico")
Group.create(name: "Les Copains de la Fac")
Group.create(name: "Les Copains de Marseille")
Group.create(name: "Les Copains de Dijon")

# Group.all.each do |group|
#   GroupUser.create(user_id: toto.id, group_id: group.id)
# end

# 10.times do |i|
#   i = User.create!(
#     email: "user#{i}@gmail.com",
#     password: "123456",
#     first_name: "User",
#     last_name: "Number#{i}",
#     avatar: File.open(Rails.root.join("app/assets/images/default.jpg"))
#   )
#   EventUser.create!(user_id: i.id, event_id: Event.where(name: "Pendaison de crémaillère Romane").first.id, coming: true)
#   # GroupUser.create(user_id: i.id, group_id: Group.where(name: "Les Wagonneurs").first.id)
# end
