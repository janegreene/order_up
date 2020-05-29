require 'rails_helper'

RSpec.describe "the dish show page" do
  it "I see list of ingredients and chef name" do
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

    visit "/dishes/#{spring_roll.id}"

  expect(page).to have_content(spring_roll.name)
  expect(page).to have_content("Cat Cora")
  expect(page).to have_content(lime.name)
  expect(page).to have_content(wrap.name)
  expect(page).to have_content(chili.name)
  expect(page).to have_content(potato.name)
  expect(page).not_to have_content(pastry.name)
  end

  it "see the total calorie count for that dish" do
    bobby = Chef.create(name: "Bobby Flay")

    tots = bobby.dishes.create(name:"Chili Lime Tots", description: "Spicy and delish")

    potato = Ingredient.create(name: "Potato shreds", calories: 80 )
    chili = Ingredient.create(name: "Chili powder", calories: 20 )
    lime = Ingredient.create(name: "Lime Juice", calories: 10 )

    DishIngredient.create(dish: tots, ingredient: potato)
    DishIngredient.create(dish: tots, ingredient: lime)
    DishIngredient.create(dish: tots, ingredient: chili)

    visit "/dishes/#{tots.id}"

  expect(page).to have_content("Total calories: 110")
  end
end


# Story 2 of 3
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
#
#     # Story 1 of 3
#     # As a visitor
#     # When I visit a dish's show page
    # I see a list of ingredients for that dish
    # and the chef's name
