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

  describe "instance methods" do
    it "total_calorie_count" do
      chef_1 = Chef.create!(name: "Charles Vhaun")

      ingredient_1 = Ingredient.create!(name: "Eggs", calories: 32)
      ingredient_2 = Ingredient.create!(name: "Bacon", calories: 23)
      ingredient_3 = Ingredient.create!(name: "Cheese", calories: 42)

      dish_1 = chef_1.dishes.create!(name: "Bacon Burrito", description: "Delicious")

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      dish_1.ingredients << ingredient_3

      expect(dish_1.total_calorie_count).to eq(97)
    end
  end
end
