require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "methods" do
    it "#total_calories" do
      bobby = Chef.create(name: "Bobby Flay")

      tots = bobby.dishes.create(name:"Chili Lime Tots", description: "Spicy and delish")

      potato = Ingredient.create(name: "Potato shreds", calories: 80 )
      chili = Ingredient.create(name: "Chili powder", calories: 20 )
      lime = Ingredient.create(name: "Lime Juice", calories: 10 )

      DishIngredient.create(dish: tots, ingredient: potato)
      DishIngredient.create(dish: tots, ingredient: lime)
      DishIngredient.create(dish: tots, ingredient: chili)

      expect(tots.total_calories).to eq(110)
    end
  end
end
