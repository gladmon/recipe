class FoodRecipe < ActiveRecord::Base

  fields = 'food_recipes.*, lm_by.name as last_made_by_name, a_by.name as added_by_name'
  joins = 'left outer join users lm_by on lm_by.id=last_made_by_id left outer join users a_by on a_by.id=added_by_id'
  serialize :ingredients
  serialize :steps
  
  attr_accessible :name, :ingredients, :steps
  
  belongs_to :added_by, :class_name => 'User'
  belongs_to :last_made_by, :class_name => 'User'
  
  scope :recently_made,  :select => fields, :joins => joins, :limit => 5, :order => 'last_made desc'
  scope :recently_added, :select => fields, :joins => joins, :limit => 3, :order => 'food_recipes.created_at desc'
end