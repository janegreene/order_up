require 'rails_helper'

RSpec.describe "the chef's show page" do
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

    visit "/chefs/#{cat.id}"

  expect(page).to have_content(cat.name)

  click_link 'All Ingredients'

  expect(current_path).to eq("/")
  
  # expect(page).to have_content("Cat Cora")
  # expect(page).to have_content(lime.name)
  # expect(page).to have_content(wrap.name)
  # expect(page).to have_content(chili.name)
  # expect(page).to have_content(potato.name)
  # expect(page).not_to have_content(pastry.name)
  end
end
# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
