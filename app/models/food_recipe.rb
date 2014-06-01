class FoodRecipe < ActiveRecord::Base

  #require 'xml'

  fields = 'food_recipes.*, lm_by.name as last_made_by_name, a_by.name as added_by_name'
  joins = 'left outer join users lm_by on lm_by.id=last_made_by_id left outer join users a_by on a_by.id=added_by_id'
  serialize :ingredients, Array
  serialize :steps, Array
  
  attr_accessible :name, :ingredients, :steps
  
  belongs_to :added_by, :class_name => 'User'
  belongs_to :last_made_by, :class_name => 'User'
  
  scope :recently_made,  :select => fields, :joins => joins, :limit => 5, :order => 'last_made desc'
  scope :recently_added, :select => fields, :joins => joins, :limit => 3, :order => 'food_recipes.created_at desc'
  
  def self.search(term)
    select('food_recipes.*, lm_by.name as last_made_by_name, a_by.name as added_by_name' + ", match(food_recipes.name,description,tag_line,recipe_from,ingredients,steps) against ('"+term+"') as score")
      .where("match(food_recipes.name,description,tag_line,recipe_from,ingredients,steps) against ('"+term+"')")
      .order('score desc')
      .joins('left outer join users lm_by on lm_by.id=last_made_by_id left outer join users a_by on a_by.id=added_by_id')
      .limit(10)
  end
  
  #def self.loadFromFile(filename)
  #  doc = XML::Document.file(filename)
  #  
  #  doc.root.each_element do |e| 
  #    r = FoodRecipe.find_or_create_by_name(e.find("Title").first.content)
  #    r.recipe_from = e.find("FromName").first.content
  #    r.servings = e.find("Serves").first.content
  #    r.ingredients = convertToArray(e.find("Ingredients").first.content)
  #    r.steps = convertToArray(e.find("Directions").first.content)
  #    r.save
  #  end
  #  
  #end
  
  def self.convertToArray(string_value)
    string_value.lines.map {|x| x.strip }.reject { |x| x.blank? }
  end
  
  def steps= (value)
    value = FoodRecipe.convertToArray(value) if !value.is_a? Array
    write_attribute(:steps, value)
  end
  
  def ingredients= (value)
    value = FoodRecipe.convertToArray(value) if !value.is_a? Array
    write_attribute(:ingredients, value)
  end
end