# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the name of the chef that made that dish
# And I see a list of ingredients for that dish

require 'rails_helper'

describe "Dish Show Page" do
  describe "As a visitor" do
    it "Shows the name of the chef that made the dish, and a list of ingredients for that dish" do
      chef_1 = Chef.create!(name: "Charles Vhaun")
      chef_2 = Chef.create(name: "James Charles")
      ingredient_1 = Ingredient.create!(name: "Eggs", calories: 32)
      ingredient_2 = Ingredient.create!(name: "Bacon", calories: 32)
      ingredient_3 = Ingredient.create!(name: "Cheese", calories: 32)
      ingredient_4 = Ingredient.create!(name: "Sausage", calories: 32)
      dish_1 = chef_1.dishes.create!(name: "Bacon Burrito", description: "Delicious")
      dish_2 = chef_2.dishes.create!(name: "Sausage Burrito", description: "Less Delicious Than Bacon")
      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      dish_1.ingredients << ingredient_3

      dish_2.ingredients << ingredient_1
      dish_2.ingredients << ingredient_4
      dish_2.ingredients << ingredient_3

      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content("Chef: #{chef_1.name}")
      expect(page).to have_content("Dish: #{dish_1.name}")
      expect(page).to have_content("Description: #{dish_1.description}")
      expect(page).to have_content("Eggs, 32 calories. Bacon, 32 calories. Cheese, 32 calories.")
    end

    it "Shows the total calorie count for that dish" do
      chef_1 = Chef.create!(name: "Charles Vhaun")
      chef_2 = Chef.create(name: "James Charles")
      ingredient_1 = Ingredient.create!(name: "Eggs", calories: 32)
      ingredient_2 = Ingredient.create!(name: "Bacon", calories: 23)
      ingredient_3 = Ingredient.create!(name: "Cheese", calories: 42)
      ingredient_4 = Ingredient.create!(name: "Sausage", calories: 28)
      dish_1 = chef_1.dishes.create!(name: "Bacon Burrito", description: "Delicious")
      dish_2 = chef_2.dishes.create!(name: "Sausage Burrito", description: "Less Delicious Than Bacon")
      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      dish_1.ingredients << ingredient_3

      dish_2.ingredients << ingredient_1
      dish_2.ingredients << ingredient_4
      dish_2.ingredients << ingredient_3

      visit "/dishes/#{dish_1.id}"
      expect(page).to have_content("Dish Total Calories: 97")

      visit "/dishes/#{dish_2.id}"
      expect(page).to have_content("Dish Total Calories: 102")
    end
  end
end
