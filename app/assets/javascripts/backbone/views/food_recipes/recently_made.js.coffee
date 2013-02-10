class Recipe.Views.FoodRecipeRecentlyMadeView extends Backbone.View
  template: JST["backbone/templates/food_recipes/recently_made"]

  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    @$el.html(@template(@model))
    return this
