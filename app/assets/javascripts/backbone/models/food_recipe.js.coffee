class Recipe.Models.FoodRecipe extends Backbone.Model
  paramRoot: 'food_recipe'
  urlRoot: '/food_recipes'

class Recipe.Collections.FoodRecipesCollection extends Backbone.Collection
  model: Recipe.Models.FoodRecipe
  url: '/food_recipes'
