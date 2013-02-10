class FoodRecipe < ActiveRecord::Base

  has_many :ingredients
  has_many :steps
  
end