# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bobby = Chef.create(name: "Bobby Flay")
cat = Chef.create(name: "Cat Cora")

tots = bobby.dishes.create(name:"Chili Lime Tots", description: "Spicy and delish")
hot_pocket = bobby.dishes.create(name:"Hot Pocket 2.0", description: "Spicy and delish, flaming hot.")
spring_roll = cat.dishes.create(name:"Spicy Spring Rolls", description: "Spicy and delish, great summer dish.")

potato = Ingredient.create(name: "Potato shreds", calories: 80 )
chili = Ingredient.create(name: "Chili powder", calories: 20 )
lime = Ingredient.create(name: "Lime Juice", calories: 10 )
pastry = Ingredient.create(name: "Puff Pastry", calories: 220 )
wrap = Ingredient.create(name: "Spring Roll Wrapper", calories: 60 )

DishIngredient.create(dish: tots, ingredient: potato)
DishIngredient.create(dish: tots, ingredient: lime)
DishIngredient.create(dish: tots, ingredient: chili)
DishIngredient.create(dish: hot_pocket, ingredient: potato)
DishIngredient.create(dish: hot_pocket, ingredient: pastry)
DishIngredient.create(dish: hot_pocket, ingredient: chili)
DishIngredient.create(dish: spring_roll, ingredient: wrap)
DishIngredient.create(dish: spring_roll, ingredient: lime)
DishIngredient.create(dish: spring_roll, ingredient: chili)
DishIngredient.create(dish: spring_roll, ingredient: potato)
