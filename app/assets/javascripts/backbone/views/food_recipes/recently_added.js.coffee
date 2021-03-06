class Recipe.Views.FoodRecipeRecentlyAddedView extends Backbone.View
  template: JST["backbone/templates/food_recipes/recently_added"]

  className: "span4"
#  events:
#    "click .btn" : "view"

  view: () ->
    @view = new Recipe.Views.FoodRecipesShowView({model:@model})

  render: ->
    @$el.html(@template(@model))
    return this
