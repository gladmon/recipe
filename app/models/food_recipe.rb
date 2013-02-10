class FoodRecipe < ActiveRecord::Base

  serialize :ingredients
  serialize :steps
  
  attr_accessible :name, :ingredients, :steps
  
  belongs_to :added_by, :class_name => 'User'
  belongs_to :last_made_by, :class_name => 'User'
  
  scope :recently_made,  :select =>"food_recipes.id, food_recipes.name, tag_line, last_made, lm_by.name as last_made_by_name", :joins => "left outer join users lm_by on lm_by.id=last_made_by_id", :limit => 5, :order => 'last_made desc'
  scope :recently_added, :select =>"food_recipes.id, food_recipes.name, tag_line, food_recipes.created_at, a_by.name as added_by_name", :joins => "left outer join users a_by on a_by.id=added_by_id", :limit => 3, :order => 'food_recipes.created_at desc'
end