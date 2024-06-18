Event.destroy_all
Category.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

Event.create(name: "Pendaison de crémaillère Romane", description: "Venez célébrer mon emménagement !! Apportez du champ' :)", date: "2024-07-13", time: "20:30", address: "Melun")
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


Recipe.create(name: "Raclette", category: "nourriture", event_id: Event.first.id)
Recipe.create(name: "Mojito", category: "boisson", event_id: Event.first.id)


Ingredient.create(name: "Fromage", price: 7.99, recipe_id: Recipe.where(name: "Raclette").first.id)
Ingredient.create(name: "Charcuterie", price: 5.99, recipe_id: Recipe.where(name: "Raclette").first.id)
Ingredient.create(name: "Pomme de terre", price: 2.99, recipe_id: Recipe.where(name: "Raclette").first.id)
Ingredient.create(name: "Menthe", price: 1.99, recipe_id: Recipe.where(name: "Mojito").first.id)
Ingredient.create(name: "Citron vert", price: 1.99, recipe_id: Recipe.where(name: "Mojito").first.id)

Ingredient.create(name: "Bières", price: 10.99)
