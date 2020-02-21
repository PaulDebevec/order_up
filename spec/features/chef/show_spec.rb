# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
require 'rails_helper'

describe "Chefs Show Page" do
  describe "As a visitor" do
    it "Shows the name of that chef, and a link to all ingredients chef has used.
        Clicking this link takes me to the chefs ingredient index page" do
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

      visit "/chefs/#{chef_1.id}"

      expect(page).to have_content("#{chef_1.name}")

      click_link "View All Chefs Ingredients"
      expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")

      expect(page).to have_content("#{ingredient_1.name}")
      expect(page).to have_content("#{ingredient_2.name}")
      expect(page).to have_content("#{ingredient_3.name}")
    end
  end
end
