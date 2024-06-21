Recipe.destroy_all
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

toto = User.create!(email: "toto@gmail.com", password: "123456", first_name: "Toto", last_name: "Tata")

Event.create(name: "Pendaison de crémaillère Romane", theme: "soirée disco", description: "Venez célébrer mon emménagement !! Apportez du champ' :)", date: "2024-07-13", time: "20:30", address: "Melun")
Event.create(name: "Jeudi Party", description: "Les Wagonneurs retournent sur le lieu du crime.", date: "2024-07-20", time: "18:00", address: "Marengo")
Event.create(name: "Anniversaire Cyrilou", description: "Cyril a officiellement 14 ans, il est temps de lui offrir un scooter", date: "2025-12-16", time: "19:00", address: "Dijon")
Event.create(name: "Repas de famille Briconico", description: "Marie a fait son fameux couscous !!!!!!!!!!", date: "2025-08-30", time: "20:20", address: "Marseille")
Event.create(name: "Soirée de l'angoisse", description: "4h du mat', Cyril veut un câble USB-C", date: "2024-06-15", time: "21:00", address: "Verdon")
Event.create(name: "Mariage Maeva <3", description: "Maeva épouse enfin Randy l'homme de sa vie bravo à eux", date: "2026-08-02", time: "20:00", address: "Cap Vert")


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

Ingredient.create(name: "Fromage", price: 7.99)
Ingredient.create(name: "Charcuterie", price: 5.99)
Ingredient.create(name: "Pomme de terre", price: 2.99)
Ingredient.create(name: "Menthe", price: 1.99)
Ingredient.create(name: "Citron vert", price: 1.99)

Ingredient.create(name: "Bières", price: 10.99)

Poll.create(question: "Quelle musique voulez-vous écouter ?", event_id: Event.first.id)
Poll.create(question: "Qui mange de la viande ?", event_id: Event.first.id)

Option.create(title: "Rap", poll_id: Poll.where(question: "Quelle musique voulez-vous écouter ?").first.id)
Option.create(title: "Rock", poll_id: Poll.where(question: "Quelle musique voulez-vous écouter ?").first.id)
Option.create(title: "Pop", poll_id: Poll.where(question: "Quelle musique voulez-vous écouter ?").first.id)

Option.create(title: "Moi !", poll_id: Poll.where(question: "Qui mange de la viande ?").first.id)
Option.create(title: "Pas moi !", poll_id: Poll.where(question: "Qui mange de la viande ?").first.id)

if User.any?
  EventUser.create!(user_id: toto.id, event_id: Event.where(name: "Pendaison de crémaillère Romane").first.id, coming: true)
  EventUser.create!(user_id: toto.id, event_id: Event.where(name: "Repas de famille Briconico").first.id, coming: true)
end


Group.create(name: "Les Wagonneurs")
Group.create(name: "Les Briconico")
Group.create(name: "Les Copains de la Fac")
Group.create(name: "Les Copains de Marseille")
Group.create(name: "Les Copains de Dijon")

Group.all.each do |group|
  GroupUser.create(user_id: toto.id, group_id: group.id)
end

10.times do |i|
  i = User.create!(
    email: "user#{i}@gmail.com",
    password: "123456",
    first_name: "User",
    last_name: "Number#{i}"
  )
  EventUser.create!(user_id: i.id, event_id: Event.where(name: "Pendaison de crémaillère Romane").first.id, coming: true)
  GroupUser.create(user_id: i.id, group_id: Group.where(name: "Les Wagonneurs").first.id)
end
