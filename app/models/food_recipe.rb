class FoodRecipe < ActiveRecord::Base

  serialize :ingredients
  serialize :steps
  
  attr_accessible :name, :ingredients, :steps
  
  belongs_to :added_by, :class_name => 'User'
  belongs_to :last_made_by, :class_name => 'User'
end