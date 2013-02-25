class Recipe.Views.FoodRecipesSearchResultView extends Backbone.View
  template: JST["backbone/templates/food_recipes/search_result"]

  
#  events:
#    "click .btn" : "view"

  view: () ->
    @view = new Recipe.Views.FoodRecipesShowView({model:@model})

  render: ->
    @$el.html(@template(@model))
    return this
